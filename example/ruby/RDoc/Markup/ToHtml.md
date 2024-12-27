# Class: RDoc::Markup::ToHtml
**Inherits:** RDoc::Markup::Formatter
    
**Includes:** RDoc::Text
  

Outputs RDoc markup as HTML.


# Attributes
## code_object[RW] [](#attribute-i-code_object)
The RDoc::CodeObject HTML is being generated for.  This is used to generate
namespaced URI fragments

## from_path[RW] [](#attribute-i-from_path)
Path to this document for relative links

## in_list_entry[RW] [](#attribute-i-in_list_entry)
:nodoc:

## list[RW] [](#attribute-i-list)
:nodoc:

## res[RW] [](#attribute-i-res)
:nodoc:


#Instance Methods
## accept_blank_line(blank_line) [](#method-i-accept_blank_line)
Adds `blank_line` to the output

## accept_block_quote(block_quote) [](#method-i-accept_block_quote)
Adds `block_quote` to the output

## accept_heading(heading) [](#method-i-accept_heading)
Adds `heading` to the output.  The headings greater than 6 are trimmed to
level 6.

## accept_list_end(list) [](#method-i-accept_list_end)
Finishes consumption of `list`

## accept_list_item_end(list_item) [](#method-i-accept_list_item_end)
Finishes consumption of `list_item`

## accept_list_item_start(list_item) [](#method-i-accept_list_item_start)
Prepares the visitor for consuming `list_item`

## accept_list_start(list) [](#method-i-accept_list_start)
Prepares the visitor for consuming `list`

## accept_paragraph(paragraph) [](#method-i-accept_paragraph)
Adds `paragraph` to the output

## accept_raw(raw) [](#method-i-accept_raw)
Adds `raw` to the output

## accept_rule(rule) [](#method-i-accept_rule)
Adds `rule` to the output

## accept_table(header, body, aligns) [](#method-i-accept_table)
Adds `table` to the output

## accept_verbatim(verbatim) [](#method-i-accept_verbatim)
Adds `verbatim` to the output

## convert_string(text) [](#method-i-convert_string)
CGI-escapes `text`

## end_accepting() [](#method-i-end_accepting)
Returns the generated output

## expand_tabs(text) [](#method-i-expand_tabs)
Expands tab characters in `text` to eight spaces

## flush_left(text) [](#method-i-flush_left)
Flush `text` left based on the shortest line

## gen_url(url, text) [](#method-i-gen_url)
Generate a link to `url` with content `text`.  Handles the special cases for
img: and link: described under handle_regexp_HYPERLINK

## handle_RDOCLINK(url) [](#method-i-handle_RDOCLINK)
:nodoc:

## handle_regexp_HARD_BREAK(target) [](#method-i-handle_regexp_HARD_BREAK)
`target` is a `<br>`

## handle_regexp_HYPERLINK(target) [](#method-i-handle_regexp_HYPERLINK)
`target` is a potential link.  The following schemes are handled:

`mailto:`
:   Inserted as-is.

`http:`
:   Links are checked to see if they reference an image. If so, that image
    gets inserted using an `<img>` tag. Otherwise a conventional `<a href>` is
    used.

`link:`
:   Reference to a local file relative to the output directory.


## handle_regexp_RDOCLINK(target) [](#method-i-handle_regexp_RDOCLINK)
`target` is an rdoc-schemed link that will be converted into a hyperlink.

For the `rdoc-ref` scheme the named reference will be returned without
creating a link.

For the `rdoc-label` scheme the footnote and label prefixes are stripped when
creating a link.  All other contents will be linked verbatim.

## handle_regexp_TIDYLINK(target) [](#method-i-handle_regexp_TIDYLINK)
This `target` is a link where the label is different from the URL `label[url]`
or `{long label}[url]`

## html_list_name(list_type, open_tag) [](#method-i-html_list_name)
Determines the HTML list element for `list_type` and `open_tag`

**@raise** [RDoc::Error] 

## init_link_notation_regexp_handlings() [](#method-i-init_link_notation_regexp_handlings)
Adds regexp handlings about link notations.

## init_regexp_handlings() [](#method-i-init_regexp_handlings)
Adds regexp handlings.

## init_tags() [](#method-i-init_tags)
Maps attributes to HTML tags

## initialize(options, markupnil) [](#method-i-initialize)
Creates a new formatter that will output HTML

**@return** [ToHtml] a new instance of ToHtml

## list_end_for(list_type) [](#method-i-list_end_for)
Returns the HTML end-tag for `list_type`

## list_item_start(list_item, list_type) [](#method-i-list_item_start)
Returns the HTML tag for `list_type`, possible using a label from `list_item`

## markup(text) [](#method-i-markup)
Convert a string in markup format into HTML.

Requires the including class to implement #formatter

## normalize_comment(text) [](#method-i-normalize_comment)
Strips hashes, expands tabs then flushes `text` to the left

## parse(text, format'rdoc') [](#method-i-parse)
Normalizes `text` then builds a RDoc::Markup::Document from it

## parseable?(text) [](#method-i-parseable?)
Returns true if text is valid ruby syntax

**@return** [Boolean] 

## snippet(text, limit100) [](#method-i-snippet)
The first `limit` characters of `text` as HTML

## start_accepting() [](#method-i-start_accepting)
Prepares the visitor for HTML generation

## strip_hashes(text) [](#method-i-strip_hashes)
Strips leading # characters from `text`

## strip_newlines(text) [](#method-i-strip_newlines)
Strips leading and trailing n characters from `text`

## strip_stars(text) [](#method-i-strip_stars)
Strips /* */ style comments

## to_html(item) [](#method-i-to_html)
Converts `item` to HTML using RDoc::Text#to_html

## wrap(txt, line_len76) [](#method-i-wrap)
Wraps `txt` to `line_len`

