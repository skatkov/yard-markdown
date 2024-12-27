# Class: SyntaxSuggest::CleanDocument
**Inherits:** Object
    

Parses and sanitizes source into a lexically aware document

Internally the document is represented by an array with each index containing
a CodeLine correlating to a line from the source code.

There are three main phases in the algorithm:

1.  Sanitize/format input source
2.  Search for invalid blocks
3.  Format invalid blocks into something meaningful

This class handles the first part.

The reason this class exists is to format input source for
better/easier/cleaner exploration.

The CodeSearch class operates at the line level so we must be careful to not
introduce lines that look valid by themselves, but when removed will trigger
syntax errors or strange behavior.

## Join Trailing slashes

Code with a trailing slash is logically treated as a single line:

    1 it "code can be split" \
    2    "across multiple lines" do

In this case removing line 2 would add a syntax error. We get around this by
internally joining the two lines into a single "line" object

## Logically Consecutive lines

Code that can be broken over multiple lines such as method calls are on
different lines:

    1 User.
    2   where(name: "schneems").
    3   first

Removing line 2 can introduce a syntax error. To fix this, all lines are
joined into one.

## Heredocs

A heredoc is an way of defining a multi-line string. They can cause many
problems. If left as a single line, the parser would try to parse the contents
as ruby code rather than as a string. Even without this problem, we still hit
an issue with indentation:

    1 foo = <<~HEREDOC
    2  "Be yourself; everyone else is already taken.""
    3    ― Oscar Wilde
    4      puts "I look like ruby code" # but i'm still a heredoc
    5 HEREDOC

If we didn't join these lines then our algorithm would think that line 4 is
separate from the rest, has a higher indentation, then look at it first and
remove it.

If the code evaluates line 5 by itself it will think line 5 is a constant,
remove it, and introduce a syntax errror.

All of these problems are fixed by joining the whole heredoc into a single
line.

## Comments and whitespace

Comments can throw off the way the lexer tells us that the line logically
belongs with the next line. This is valid ruby but results in a different lex
output than before:

    1 User.
    2   where(name: "schneems").
    3   # Comment here
    4   first

To handle this we can replace comment lines with empty lines and then re-lex
the source. This removal and re-lexing preserves line index and document size,
but generates an easier to work with document.



#Instance Methods
## call() [](#method-i-call)
Call all of the document "cleaners" and return self

## clean_sweep(source:) [](#method-i-clean_sweep)
Remove comments

replace with empty newlines

    source = <<~'EOM'
      # Comment 1
      puts "hello"
      # Comment 2
      puts "world"
    EOM

    lines = CleanDocument.new(source: source).lines
    expect(lines[0].to_s).to eq("\n")
    expect(lines[1].to_s).to eq("puts "hello")
    expect(lines[2].to_s).to eq("\n")
    expect(lines[3].to_s).to eq("puts "world")

Important: This must be done before lexing.

After this change is made, we lex the document because removing comments can
change how the doc is parsed.

For example:

    values = LexAll.new(source: <<~EOM))
      User.
        # comment
        where(name: 'schneems')
    EOM
    expect(
      values.count {|v| v.type == :on_ignored_nl}
    ).to eq(1)

After the comment is removed:

     values = LexAll.new(source: <<~EOM))
       User.

         where(name: 'schneems')
     EOM
     expect(
      values.count {|v| v.type == :on_ignored_nl}
    ).to eq(2)

## initialize(source:) [](#method-i-initialize)

**@return** [CleanDocument] a new instance of CleanDocument

## join_consecutive!() [](#method-i-join_consecutive!)
Smushes logically "consecutive" lines

    source = <<~'EOM'
      User.
        where(name: 'schneems').
        first
    EOM

    lines = CleanDocument.new(source: source).join_consecutive!.lines
    expect(lines[0].to_s).to eq(source)
    expect(lines[1].to_s).to eq("")

The one known case this doesn't handle is:

    Ripper.lex <<~EOM
      a &&
       b ||
       c
    EOM

For some reason this introduces `on_ignore_newline` but with BEG type

## join_groups(groups) [](#method-i-join_groups)
Helper method for joining "groups" of lines

Input is expected to be type Array<Array<CodeLine>>

The outer array holds the various "groups" while the inner array holds code
lines.

All code lines are "joined" into the first line in their group.

To preserve document size, empty lines are placed in the place of the lines
that were "joined"

## join_heredoc!() [](#method-i-join_heredoc!)
Smushes all heredoc lines into one line

    source = <<~'EOM'
      foo = <<~HEREDOC
         lol
         hehehe
      HEREDOC
    EOM

    lines = CleanDocument.new(source: source).join_heredoc!.lines
    expect(lines[0].to_s).to eq(source)
    expect(lines[1].to_s).to eq("")

## join_trailing_slash!() [](#method-i-join_trailing_slash!)
Join lines with a trailing slash

    source = <<~'EOM'
      it "code can be split" \
         "across multiple lines" do
    EOM

    lines = CleanDocument.new(source: source).join_consecutive!.lines
    expect(lines[0].to_s).to eq(source)
    expect(lines[1].to_s).to eq("")

## lines() [](#method-i-lines)
Return an array of CodeLines in the document

## take_while_including(range0) [](#method-i-take_while_including)
Helper method for grabbing elements from document

Like `take_while` except when it stops iterating, it also returns the line
that caused it to stop

## to_s() [](#method-i-to_s)
Renders the document back to a string

