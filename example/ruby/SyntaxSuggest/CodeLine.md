# Class: SyntaxSuggest::CodeLine
**Inherits:** Object
    

Represents a single line of code of a given source file

This object contains metadata about the line such as amount of indentation, if
it is empty or not, and lexical data, such as if it has an `end` or a keyword
in it.

Visibility of lines can be toggled off. Marking a line as invisible indicates
that it should not be used for syntax checks. It's functionally the same as
commenting it out.

Example:

    line = CodeLine.from_source("def foo\n").first
    line.number => 1
    line.empty? # => false
    line.visible? # => true
    line.mark_invisible
    line.visible? # => false


# Class Methods
## from_source(source , lines: nil) [](#method-c-from_source)
Returns an array of CodeLine objects from the source string
# Attributes
## indent[RW] [](#attribute-i-indent)
Returns the value of attribute indent.

## index[RW] [](#attribute-i-index)
Returns the value of attribute index.

## lex[RW] [](#attribute-i-lex)
Returns the value of attribute lex.

## line[RW] [](#attribute-i-line)
Returns the value of attribute line.

## line_number[RW] [](#attribute-i-line_number)
Returns the value of attribute line_number.

## original[RW] [](#attribute-i-original)
When the code line is marked invisible we retain the original value of it's
line this is useful for debugging and for showing extra context

DisplayCodeWithLineNumbers will render all lines given to it, not just visible
lines, it uses the original method to obtain them.


#Instance Methods
## <=>(other) [](#method-i-<=>)
Comparison operator, needed for equality and sorting

## empty?() [](#method-i-empty?)
An `empty?` line is one that was originally left empty in the source code,
while a "hidden" line is one that we've since marked as "invisible"

**@return** [Boolean] 

## hidden?() [](#method-i-hidden?)
Opposite or `visible?` (note: different than `empty?`)

**@return** [Boolean] 

## ignore_newline_not_beg?() [](#method-i-ignore_newline_not_beg?)
Not stable API
:   Lines that have a `on_ignored_nl` type token and NOT a `BEG` type seem to
    be a good proxy for the ability to join multiple lines into one.

    This predicate method is used to determine when those two criteria have
    been met.

    The one known case this doesn't handle is:

        Ripper.lex <<~EOM
          a &&
           b ||
           c
        EOM

    For some reason this introduces `on_ignore_newline` but with BEG type


**@return** [Boolean] 

## indent_index() [](#method-i-indent_index)
Used for stable sort via indentation level

Ruby's sort is not "stable" meaning that when multiple elements have the same
value, they are not guaranteed to return in the same order they were put in.

So when multiple code lines have the same indentation level, they're sorted by
their index value which is unique and consistent.

This is mostly needed for consistency of the test suite

## initialize(line:, index:, lex:) [](#method-i-initialize)

**@return** [CodeLine] a new instance of CodeLine

## is_end?() [](#method-i-is_end?)
Returns true if the code line is determined to contain an `end` keyword

**@return** [Boolean] 

## is_kw?() [](#method-i-is_kw?)
Returns true if the code line is determined to contain a keyword that matches
with an `end`

For example: `def`, `do`, `begin`, `ensure`, etc.

**@return** [Boolean] 

## mark_invisible() [](#method-i-mark_invisible)
Used to hide lines

The search alorithm will group lines into blocks then if those blocks are
determined to represent valid code they will be hidden

## not_empty?() [](#method-i-not_empty?)
Opposite of `empty?` (note: different than `visible?`)

**@return** [Boolean] 

## to_s() [](#method-i-to_s)
Renders the given line

Also allows us to represent source code as an array of code lines.

When we have an array of code line elements calling `join` on the array will
call `to_s` on each element, which essentially converts it back into it's
original source string.

## trailing_slash?() [](#method-i-trailing_slash?)

**@return** [Boolean] 

## visible?() [](#method-i-visible?)
Means the line was marked as "invisible" Confusingly, "empty" lines are
visible...they just don't contain any source code other than a newline ("n").

**@return** [Boolean] 

