# Class: RDoc::Markup::ToTtOnly
**Inherits:** RDoc::Markup::Formatter
    

Extracts sections of text enclosed in plus, tt or code.  Used to discover
undocumented parameters.


# Attributes
## list_type[RW] [](#attribute-i-list_type)
Stack of list types

## res[RW] [](#attribute-i-res)
Output accumulator


#Instance Methods
## accept_block_quote(block_quote) [](#method-i-accept_block_quote)
Adds tts from `block_quote` to the output

## accept_list_end(list) [](#method-i-accept_list_end)
Pops the list type for `list` from #list_type

## accept_list_item_start(list_item) [](#method-i-accept_list_item_start)
Prepares the visitor for consuming `list_item`

## accept_list_start(list) [](#method-i-accept_list_start)
Pushes the list type for `list` onto #list_type

## accept_paragraph(paragraph) [](#method-i-accept_paragraph)
Adds `paragraph` to the output

## do_nothing(markup_item) [](#method-i-do_nothing)
Does nothing to `markup_item` because it doesn't have any user-built content

## end_accepting() [](#method-i-end_accepting)
Returns an Array of items that were wrapped in plus, tt or code.

## initialize(markupnil) [](#method-i-initialize)
Creates a new tt-only formatter.

**@return** [ToTtOnly] a new instance of ToTtOnly

## start_accepting() [](#method-i-start_accepting)
Prepares the visitor for gathering tt sections

## tt_sections(text) [](#method-i-tt_sections)
Extracts tt sections from `text`

