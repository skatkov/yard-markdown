# Class: RDoc::Markup::Parser
**Inherits:** Object
    
**Includes:** RDoc::Text
  

A recursive-descent parser for RDoc markup.

The parser tokenizes an input string then parses the tokens into a Document.
Documents can be converted into output formats by writing a visitor like
RDoc::Markup::ToHTML.

The parser only handles the block-level constructs Paragraph, List, ListItem,
Heading, Verbatim, BlankLine, Rule and BlockQuote. Inline markup such as
`+blah+` is handled separately by RDoc::Markup::AttributeManager.

To see what markup the Parser implements read RDoc.  To see how to use RDoc
markup to format text in your program read RDoc::Markup.


# Class Methods
## parse(str ) [](#method-c-parse)
Parses `str` into a Document.

Use RDoc::Markup#parse instead of this method.
## tokenize(str ) [](#method-c-tokenize)
Returns a token stream for `str`, for testing
# Attributes
## debug[RW] [](#attribute-i-debug)
Enables display of debugging information

## tokens[RW] [](#attribute-i-tokens)
Token accessor


#Instance Methods
## build_heading(level) [](#method-i-build_heading)
Builds a Heading of `level`

## build_list(margin) [](#method-i-build_list)
Builds a List flush to `margin`

## build_paragraph(margin) [](#method-i-build_paragraph)
Builds a Paragraph that is flush to `margin`

## build_verbatim(margin) [](#method-i-build_verbatim)
Builds a Verbatim that is indented from `margin`.

The verbatim block is shifted left (the least indented lines start in column
0).  Each part of the verbatim is one line of text, always terminated by a
newline.  Blank lines always consist of a single newline character, and there
is never a single newline at the end of the verbatim.

## expand_tabs(text) [](#method-i-expand_tabs)
Expands tab characters in `text` to eight spaces

## flush_left(text) [](#method-i-flush_left)
Flush `text` left based on the shortest line

## get() [](#method-i-get)
Pulls the next token from the stream.

## initialize() [](#method-i-initialize)
Creates a new Parser.  See also ::parse

**@return** [Parser] a new instance of Parser

## markup(text) [](#method-i-markup)
Convert a string in markup format into HTML.

Requires the including class to implement #formatter

## normalize_comment(text) [](#method-i-normalize_comment)
Strips hashes, expands tabs then flushes `text` to the left

## parse(parent, indent0) [](#method-i-parse)
Parses the tokens into an array of RDoc::Markup::XXX objects, and appends them
to the passed `parent` RDoc::Markup::YYY object.

Exits at the end of the token stream, or when it encounters a token in a
column less than `indent` (unless it is a NEWLINE).

Returns `parent`.

## parse_text(parent, indent) [](#method-i-parse_text)
Small hook that is overridden by RDoc::TomDoc

## peek_token() [](#method-i-peek_token)
Returns the next token on the stream without modifying the stream

## setup_scanner(input) [](#method-i-setup_scanner)
Creates the StringScanner

## skip(token_type, errortrue) [](#method-i-skip)
Skips the next token if its type is `token_type`.

Optionally raises an error if the next token is not of the expected type.

**@raise** [ParseError] 

## snippet(text, limit100) [](#method-i-snippet)
The first `limit` characters of `text` as HTML

## strip_hashes(text) [](#method-i-strip_hashes)
Strips leading # characters from `text`

## strip_newlines(text) [](#method-i-strip_newlines)
Strips leading and trailing n characters from `text`

## strip_stars(text) [](#method-i-strip_stars)
Strips /* */ style comments

## to_html(text) [](#method-i-to_html)
Converts ampersand, dashes, ellipsis, quotes, copyright and registered
trademark symbols in `text` to properly encoded characters.

## tokenize(input) [](#method-i-tokenize)
Turns text `input` into a stream of tokens

## unget() [](#method-i-unget)
Returns the current token to the token stream

**@raise** [Error] 

## wrap(txt, line_len76) [](#method-i-wrap)
Wraps `txt` to `line_len`

