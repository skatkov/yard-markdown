# Class: RDoc::Markup::ListItem
**Inherits:** Object
    

An item within a List that contains paragraphs, headings, etc.

For BULLET, NUMBER, LALPHA and UALPHA lists, the label will always be nil. For
NOTE and LABEL lists, the list label may contain:

*   a single String for a single label
*   an Array of Strings for a list item with multiple terms
*   nil for an extra description attached to a previously labeled list item


# Attributes
## label[RW] [](#attribute-i-label)
The label for the ListItem

## parts[RW] [](#attribute-i-parts)
Parts of the ListItem


#Instance Methods
## <<(part) [](#method-i-<<)
Appends `part` to the ListItem

## ==(other) [](#method-i-==)
:nodoc:

## accept(visitor) [](#method-i-accept)
Runs this list item and all its #parts through `visitor`

## empty?() [](#method-i-empty?)
Is the ListItem empty?

**@return** [Boolean] 

## initialize(labelnil, *parts) [](#method-i-initialize)
Creates a new ListItem with an optional `label` containing `parts`

**@return** [ListItem] a new instance of ListItem

## length() [](#method-i-length)
Length of parts in the ListItem

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## push(*parts) [](#method-i-push)
Adds `parts` to the ListItem

