# Class: RDoc::Parser
**Inherits:** Object
    

A parser is simple a class that subclasses RDoc::Parser and implements #scan
to fill in an RDoc::TopLevel with parsed data.

The initialize method takes an RDoc::TopLevel to fill with parsed content, the
name of the file to be parsed, the content of the file, an RDoc::Options
object and an RDoc::Stats object to inform the user of parsed items.  The scan
method is then called to parse the file and must return the RDoc::TopLevel
object.  By calling super these items will be set for you.

In order to be used by RDoc the parser needs to register the file extensions
it can parse.  Use ::parse_files_matching to register extensions.

    require 'rdoc'

    class RDoc::Parser::Xyz < RDoc::Parser
      parse_files_matching /\.xyz$/

      def initialize top_level, file_name, content, options, stats
        super

        # extra initialization if needed
      end

      def scan
        # parse file and fill in @top_level
      end
    end


# Class Methods
## alias_extension(old_ext , new_ext ) [](#method-c-alias_extension)
Alias an extension to another extension. After this call, files ending
"new_ext" will be parsed using the same parser as "old_ext"
## binary?(file ) [](#method-c-binary?)
Determines if the file is a "binary" file which basically means it has content
that an RDoc parser shouldn't try to consume.
**@return** [Boolean] 

## can_parse(file_name ) [](#method-c-can_parse)
Return a parser that can handle a particular extension
## can_parse_by_name(file_name ) [](#method-c-can_parse_by_name)
Returns a parser that can handle the extension for `file_name`.  This does not
depend upon the file being readable.
## check_modeline(file_name ) [](#method-c-check_modeline)
Returns the file type from the modeline in `file_name`
## for(top_level , content , options , stats ) [](#method-c-for)
Finds and instantiates the correct parser for the given `file_name` and
`content`.
## parse_files_matching(regexp ) [](#method-c-parse_files_matching)
Record which file types this parser can understand.

It is ok to call this multiple times.
## remove_modeline(content ) [](#method-c-remove_modeline)
Removes an emacs-style modeline from the first line of the document
## use_markup(content ) [](#method-c-use_markup)
If there is a `markup: parser_name` comment at the front of the file, use it
to determine the parser.  For example:

    # markup: rdoc
    # Class comment can go here

    class C
    end

The comment should appear as the first line of the `content`.

If the content contains a shebang or editor modeline the comment may appear on
the second or third line.

Any comment style may be used to hide the markup comment.
## zip?(file ) [](#method-c-zip?)
Checks if `file` is a zip file in disguise.  Signatures from
http://www.garykessler.net/library/file_sigs.html
**@return** [Boolean] 

# Attributes
## parsers[RW] [](#attribute-c-parsers)
An Array of arrays that maps file extension (or name) regular expressions to
parser classes that will parse matching filenames.

Use parse_files_matching to register a parser's file extensions.

## file_name[RW] [](#attribute-i-file_name)
The name of the file being parsed


#Instance Methods
## handle_tab_width(body) [](#method-i-handle_tab_width)
Normalizes tabs in `body`

## initialize(top_level, file_name, content, options, stats) [](#method-i-initialize)
Creates a new Parser storing `top_level`, `file_name`, `content`, `options`
and `stats` in instance variables.  In +@preprocess+ an
RDoc::Markup::PreProcess object is created which allows processing of
directives.

**@return** [Parser] a new instance of Parser

