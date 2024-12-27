# Class: RDoc::Markup::ToHtmlSnippet
**Inherits:** RDoc::Markup::ToHtml
    

Outputs RDoc markup as paragraphs with inline markup only.


# Attributes
## character_limit[RW] [](#attribute-i-character_limit)
After this many characters the input will be cut off.

## characters[RW] [](#attribute-i-characters)
The number of characters seen so far.

## mask[RW] [](#attribute-i-mask)
The attribute bitmask

## paragraph_limit[RW] [](#attribute-i-paragraph_limit)
After this many paragraphs the input will be cut off.

## paragraphs[RW] [](#attribute-i-paragraphs)
Count of paragraphs found


#Instance Methods
## accept_heading(heading) [](#method-i-accept_heading)
Adds `heading` to the output as a paragraph

## accept_list_item_end(list_item) [](#method-i-accept_list_item_end)
Finishes consumption of `list_item`

## accept_list_item_start(list_item) [](#method-i-accept_list_item_start)
Prepares the visitor for consuming `list_item`

## accept_list_start(list) [](#method-i-accept_list_start)
Prepares the visitor for consuming `list`

## accept_paragraph(paragraph) [](#method-i-accept_paragraph)
Adds `paragraph` to the output

## accept_verbatim(verbatim) [](#method-i-accept_verbatim)
Adds `verbatim` to the output

## add_paragraph() [](#method-i-add_paragraph)
Throws `:done` when paragraph_limit paragraphs have been encountered

## convert(content) [](#method-i-convert)
Marks up `content`

## convert_flow(flow) [](#method-i-convert_flow)
Converts flow items `flow`

## gen_url(url, text) [](#method-i-gen_url)
Returns just the text of `link`, `url` is only used to determine the link
type.

## handle_regexp_CROSSREF(target) [](#method-i-handle_regexp_CROSSREF)
Removes escaping from the cross-references in `target`

## handle_regexp_HARD_BREAK(target) [](#method-i-handle_regexp_HARD_BREAK)
`target` is a `<br>`

## html_list_name(list_type, open_tag) [](#method-i-html_list_name)
In snippets, there are no lists

## initialize(options, characters100, paragraphs3, markupnil) [](#method-i-initialize)
Creates a new ToHtmlSnippet formatter that will cut off the input on the next
word boundary after the given number of `characters` or `paragraphs` of text
have been encountered.

**@return** [ToHtmlSnippet] a new instance of ToHtmlSnippet

## list_item_start(list_item, list_type) [](#method-i-list_item_start)
Lists are paragraphs, but notes and labels have a separator

## off_tags(res, item) [](#method-i-off_tags)
Maintains a bitmask to allow HTML elements to be closed properly.  See
RDoc::Markup::Formatter.

## on_tags(res, item) [](#method-i-on_tags)
Maintains a bitmask to allow HTML elements to be closed properly.  See
RDoc::Markup::Formatter.

## start_accepting() [](#method-i-start_accepting)
Prepares the visitor for HTML snippet generation

## truncate(text) [](#method-i-truncate)
Truncates `text` at the end of the first word after the character_limit.

