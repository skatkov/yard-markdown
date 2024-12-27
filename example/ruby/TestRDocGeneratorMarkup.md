# Class: TestRDocGeneratorMarkup
**Inherits:** RDoc::TestCase
    
**Includes:** RDoc::Generator::Markup, RDoc::Text
  



# Attributes
## path[RW] [](#attribute-i-path)
Returns the value of attribute path.

## store[RW] [](#attribute-i-store)
Returns the value of attribute store.


#Instance Methods
## aref_to(target_path) [](#method-i-aref_to)
Generates a relative URL from this object's path to `target_path`

## as_href(from_path) [](#method-i-as_href)
Generates a relative URL from `from_path` to this object's path

## cvs_url(url, full_path) [](#method-i-cvs_url)
Build a webcvs URL starting for the given `url` with `full_path` appended as
the destination path.  If `url` contains '%s' `full_path` will be will replace
the %s using sprintf on the `url`.

## description() [](#method-i-description)
Handy wrapper for marking up this object's comment

## expand_tabs(text) [](#method-i-expand_tabs)
Expands tab characters in `text` to eight spaces

## find_symbol(name) [](#method-i-find_symbol)

## flush_left(text) [](#method-i-flush_left)
Flush `text` left based on the shortest line

## formatter() [](#method-i-formatter)
Creates an RDoc::Markup::ToHtmlCrossref formatter

## markup(text) [](#method-i-markup)
Convert a string in markup format into HTML.

Requires the including class to implement #formatter

## normalize_comment(text) [](#method-i-normalize_comment)
Strips hashes, expands tabs then flushes `text` to the left

## parse(text, format'rdoc') [](#method-i-parse)
Normalizes `text` then builds a RDoc::Markup::Document from it

## setup() [](#method-i-setup)

## snippet(text, limit100) [](#method-i-snippet)
The first `limit` characters of `text` as HTML

## strip_hashes(text) [](#method-i-strip_hashes)
Strips leading # characters from `text`

## strip_newlines(text) [](#method-i-strip_newlines)
Strips leading and trailing n characters from `text`

## strip_stars(text) [](#method-i-strip_stars)
Strips /* */ style comments

## test_aref_to() [](#method-i-test_aref_to)

## test_as_href() [](#method-i-test_as_href)

## test_cvs_url() [](#method-i-test_cvs_url)

## test_description() [](#method-i-test_description)

## test_formatter() [](#method-i-test_formatter)

## to_html(text) [](#method-i-to_html)
Converts ampersand, dashes, ellipsis, quotes, copyright and registered
trademark symbols in `text` to properly encoded characters.

## wrap(txt, line_len76) [](#method-i-wrap)
Wraps `txt` to `line_len`

