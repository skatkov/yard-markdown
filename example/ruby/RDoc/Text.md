# Module: RDoc::Text
    

Methods for manipulating comment text


# Class Methods
## encode_fallback(character , encoding , fallback ) [](#method-c-encode_fallback)
Transcodes `character` to `encoding` with a `fallback` character.
# Attributes
## language[RW] [](#attribute-i-language)
The language for this text.  This affects stripping comments markers.


#Instance Methods
## expand_tabs(text) [](#method-i-expand_tabs)
Expands tab characters in `text` to eight spaces

## flush_left(text) [](#method-i-flush_left)
Flush `text` left based on the shortest line

## markup(text) [](#method-i-markup)
Convert a string in markup format into HTML.

Requires the including class to implement #formatter

## normalize_comment(text) [](#method-i-normalize_comment)
Strips hashes, expands tabs then flushes `text` to the left

## parse(text, format'rdoc') [](#method-i-parse)
Normalizes `text` then builds a RDoc::Markup::Document from it

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

## wrap(txt, line_len76) [](#method-i-wrap)
Wraps `txt` to `line_len`

