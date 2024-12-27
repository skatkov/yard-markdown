# Class: RDoc::Comment
**Inherits:** Object
    
**Includes:** RDoc::Text
  



# Attributes
## document=[R] [](#attribute-i-document=)
Overrides the content returned by #parse.  Use when there is no #text source
for this comment

## format[RW] [](#attribute-i-format)
The format of this comment.  Defaults to RDoc::Markup

## line[RW] [](#attribute-i-line)
Line where this Comment was written

## location[RW] [](#attribute-i-location)
The RDoc::TopLevel this comment was found in

## text[RW] [](#attribute-i-text)
The text for this comment


#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## empty?() [](#method-i-empty?)
A comment is empty if its text String is empty.

**@return** [Boolean] 

## encode!(encoding) [](#method-i-encode!)
HACK dubious

## expand_tabs(text) [](#method-i-expand_tabs)
Expands tab characters in `text` to eight spaces

## extract_call_seq(method) [](#method-i-extract_call_seq)
Look for a 'call-seq' in the comment to override the normal parameter
handling.  The :call-seq: is indented from the baseline.  All lines of the
same indentation level and prefix are consumed.

For example, all of the following will be used as the :call-seq:

    # :call-seq:
    #   ARGF.readlines(sep=$/)     -> array
    #   ARGF.readlines(limit)      -> array
    #   ARGF.readlines(sep, limit) -> array
    #
    #   ARGF.to_a(sep=$/)     -> array
    #   ARGF.to_a(limit)      -> array
    #   ARGF.to_a(sep, limit) -> array

## flush_left(text) [](#method-i-flush_left)
Flush `text` left based on the shortest line

## initialize(textnil, locationnil, languagenil) [](#method-i-initialize)
Creates a new comment with `text` that is found in the RDoc::TopLevel
`location`.

**@return** [Comment] a new instance of Comment

## initialize_copy(copy) [](#method-i-initialize_copy)
-- TODO deep copy @document

## inspect() [](#method-i-inspect)
:nodoc:

## markup(text) [](#method-i-markup)
Convert a string in markup format into HTML.

Requires the including class to implement #formatter

## normalize() [](#method-i-normalize)
Normalizes the text.  See RDoc::Text#normalize_comment for details

## normalize_comment(text) [](#method-i-normalize_comment)
Strips hashes, expands tabs then flushes `text` to the left

## normalized?() [](#method-i-normalized?)
Was this text normalized?

**@return** [Boolean] 

## parse() [](#method-i-parse)
Parses the comment into an RDoc::Markup::Document.  The parsed document is
cached until the text is changed.

## remove_private() [](#method-i-remove_private)
Removes private sections from this comment.  Private sections are flush to the
comment marker and start with `--` and end with `++`. For C-style comments, a
private marker may not start at the opening of the comment.

    /*
     *--
     * private
     *++
     * public
     */

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

## tomdoc?() [](#method-i-tomdoc?)
Returns true if this comment is in TomDoc format.

**@return** [Boolean] 

## wrap(txt, line_len76) [](#method-i-wrap)
Wraps `txt` to `line_len`

