# Class: RDoc::Markup::ToMarkdown
**Inherits:** RDoc::Markup::ToRdoc
    

Outputs parsed markup as Markdown



#Instance Methods
## accept_list_end(list) [](#method-i-accept_list_end)
Finishes consumption of `list`

## accept_list_item_end(list_item) [](#method-i-accept_list_item_end)
Finishes consumption of `list_item`

## accept_list_item_start(list_item) [](#method-i-accept_list_item_start)
Prepares the visitor for consuming `list_item`

## accept_list_start(list) [](#method-i-accept_list_start)
Prepares the visitor for consuming `list`

## accept_rule(rule) [](#method-i-accept_rule)
Adds `rule` to the output

## accept_verbatim(verbatim) [](#method-i-accept_verbatim)
Outputs `verbatim` indented 4 columns

## gen_url(url, text) [](#method-i-gen_url)
Creates a Markdown-style URL from `url` with `text`.

## handle_rdoc_link(url) [](#method-i-handle_rdoc_link)
Handles `rdoc-` type links for footnotes.

## handle_regexp_HARD_BREAK(target) [](#method-i-handle_regexp_HARD_BREAK)
Adds a newline to the output

## handle_regexp_RDOCLINK(target) [](#method-i-handle_regexp_RDOCLINK)
Converts the rdoc-...: links into a Markdown.style links.

## handle_regexp_TIDYLINK(target) [](#method-i-handle_regexp_TIDYLINK)
Converts the RDoc markup tidylink into a Markdown.style link.

## init_tags() [](#method-i-init_tags)
Maps attributes to HTML sequences

## initialize(markupnil) [](#method-i-initialize)
Creates a new formatter that will output Markdown format text

**@return** [ToMarkdown] a new instance of ToMarkdown

