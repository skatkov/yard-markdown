# Class: RDoc::Markup::ToRdoc
**Inherits:** RDoc::Markup::Formatter
    

Outputs RDoc markup as RDoc markup! (mostly)


# Attributes
## indent[RW] [](#attribute-i-indent)
Current indent amount for output in characters

## list_index[RW] [](#attribute-i-list_index)
Stack of current list indexes for alphabetic and numeric lists

## list_type[RW] [](#attribute-i-list_type)
Stack of list types

## list_width[RW] [](#attribute-i-list_width)
Stack of list widths for indentation

## prefix[RW] [](#attribute-i-prefix)
Prefix for the next list item.  See #use_prefix

## res[RW] [](#attribute-i-res)
Output accumulator

## width[RW] [](#attribute-i-width)
Output width in characters


#Instance Methods
## accept_blank_line(blank_line) [](#method-i-accept_blank_line)
Adds `blank_line` to the output

## accept_block_quote(block_quote) [](#method-i-accept_block_quote)
Adds `paragraph` to the output

## accept_heading(heading) [](#method-i-accept_heading)
Adds `heading` to the output

## accept_indented_paragraph(paragraph) [](#method-i-accept_indented_paragraph)
Adds `paragraph` to the output

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
Outputs `verbatim` indented 2 columns

## attributes(text) [](#method-i-attributes)
Applies attribute-specific markup to `text` using RDoc::AttributeManager

## end_accepting() [](#method-i-end_accepting)
Returns the generated output

## handle_regexp_HARD_BREAK(target) [](#method-i-handle_regexp_HARD_BREAK)
Adds a newline to the output

## handle_regexp_SUPPRESSED_CROSSREF(target) [](#method-i-handle_regexp_SUPPRESSED_CROSSREF)
Removes preceding \ from the suppressed crossref `target`

## init_tags() [](#method-i-init_tags)
Maps attributes to HTML sequences

## initialize(markupnil) [](#method-i-initialize)
Creates a new formatter that will output (mostly) RDoc markup

**@return** [ToRdoc] a new instance of ToRdoc

## start_accepting() [](#method-i-start_accepting)
Prepares the visitor for text generation

## use_prefix() [](#method-i-use_prefix)
Adds the stored #prefix to the output and clears it.  Lists generate a prefix
for later consumption.

## wrap(text) [](#method-i-wrap)
Wraps `text` to #width

