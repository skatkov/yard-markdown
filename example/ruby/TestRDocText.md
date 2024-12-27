# Class: TestRDocText
**Inherits:** RDoc::TestCase
    
**Includes:** RDoc::Text
  




#Instance Methods
## expand_tabs(text) [](#method-i-expand_tabs)
Expands tab characters in `text` to eight spaces

## flush_left(text) [](#method-i-flush_left)
Flush `text` left based on the shortest line

## formatter() [](#method-i-formatter)

## markup(text) [](#method-i-markup)
Convert a string in markup format into HTML.

Requires the including class to implement #formatter

## normalize_comment(text) [](#method-i-normalize_comment)
Strips hashes, expands tabs then flushes `text` to the left

## options() [](#method-i-options)

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

## test_expand_tabs() [](#method-i-test_expand_tabs)

## test_expand_tabs_encoding() [](#method-i-test_expand_tabs_encoding)

## test_flush_left() [](#method-i-test_flush_left)

## test_flush_left_encoding() [](#method-i-test_flush_left_encoding)

## test_markup_comment() [](#method-i-test_markup_comment)

## test_markup_string() [](#method-i-test_markup_string)

## test_normalize_comment_hash() [](#method-i-test_normalize_comment_hash)

## test_normalize_comment_stars_single_double_space() [](#method-i-test_normalize_comment_stars_single_double_space)

## test_normalize_comment_stars_single_space() [](#method-i-test_normalize_comment_stars_single_space)

## test_parse() [](#method-i-test_parse)

## test_parse_comment() [](#method-i-test_parse_comment)

## test_parse_document() [](#method-i-test_parse_document)

## test_parse_empty() [](#method-i-test_parse_empty)

## test_parse_empty_newline() [](#method-i-test_parse_empty_newline)

## test_parse_format_markdown() [](#method-i-test_parse_format_markdown)

## test_parse_format_rd() [](#method-i-test_parse_format_rd)

## test_parse_format_tomdoc() [](#method-i-test_parse_format_tomdoc)

## test_parse_newline() [](#method-i-test_parse_newline)

## test_self_encode_fallback() [](#method-i-test_self_encode_fallback)

## test_snippet() [](#method-i-test_snippet)

## test_snippet_comment() [](#method-i-test_snippet_comment)

## test_snippet_short() [](#method-i-test_snippet_short)

## test_strip_hashes() [](#method-i-test_strip_hashes)

## test_strip_hashes_encoding() [](#method-i-test_strip_hashes_encoding)

## test_strip_newlines() [](#method-i-test_strip_newlines)

## test_strip_newlines_encoding() [](#method-i-test_strip_newlines_encoding)

## test_strip_stars() [](#method-i-test_strip_stars)

## test_strip_stars_document_method() [](#method-i-test_strip_stars_document_method)

## test_strip_stars_document_method_special() [](#method-i-test_strip_stars_document_method_special)

## test_strip_stars_encoding() [](#method-i-test_strip_stars_encoding)

## test_strip_stars_encoding2() [](#method-i-test_strip_stars_encoding2)

## test_strip_stars_no_stars() [](#method-i-test_strip_stars_no_stars)

## test_to_html_apostrophe() [](#method-i-test_to_html_apostrophe)

## test_to_html_apostrophe_entity() [](#method-i-test_to_html_apostrophe_entity)

## test_to_html_backslash() [](#method-i-test_to_html_backslash)

## test_to_html_br() [](#method-i-test_to_html_br)

## test_to_html_copyright() [](#method-i-test_to_html_copyright)

## test_to_html_dash() [](#method-i-test_to_html_dash)

## test_to_html_double_backtick() [](#method-i-test_to_html_double_backtick)

## test_to_html_double_quote() [](#method-i-test_to_html_double_quote)

## test_to_html_double_quote_quot() [](#method-i-test_to_html_double_quote_quot)

## test_to_html_double_tick() [](#method-i-test_to_html_double_tick)

## test_to_html_ellipsis() [](#method-i-test_to_html_ellipsis)

## test_to_html_encoding() [](#method-i-test_to_html_encoding)

## test_to_html_html_tag() [](#method-i-test_to_html_html_tag)

## test_to_html_registered_trademark() [](#method-i-test_to_html_registered_trademark)

## test_to_html_tt_tag() [](#method-i-test_to_html_tt_tag)

## test_to_html_tt_tag_mismatch() [](#method-i-test_to_html_tt_tag_mismatch)

## to_html(text) [](#method-i-to_html)
Converts ampersand, dashes, ellipsis, quotes, copyright and registered
trademark symbols in `text` to properly encoded characters.

## wrap(txt, line_len76) [](#method-i-wrap)
Wraps `txt` to `line_len`

