# Class: RDoc::Markup::List
**Inherits:** Object
    

A List is a homogeneous set of ListItems.

The supported list types include:

:BULLET
:   An unordered list

:LABEL
:   An unordered definition list, but using an alternate RDoc::Markup syntax

:LALPHA
:   An ordered list using increasing lowercase English letters

:NOTE
:   An unordered definition list

:NUMBER
:   An ordered list using increasing Arabic numerals

:UALPHA
:   An ordered list using increasing uppercase English letters


Definition lists behave like HTML definition lists.  Each list item can
describe multiple terms.  See RDoc::Markup::ListItem for how labels and
definition are stored as list items.


# Attributes
## items[RW] [](#attribute-i-items)
Items in the list

## type[RW] [](#attribute-i-type)
The list's type


#Instance Methods
## <<(item) [](#method-i-<<)
Appends `item` to the list

## ==(other) [](#method-i-==)
:nodoc:

## accept(visitor) [](#method-i-accept)
Runs this list and all its #items through `visitor`

## empty?() [](#method-i-empty?)
Is the list empty?

**@return** [Boolean] 

## initialize(typenil, *items) [](#method-i-initialize)
Creates a new list of `type` with `items`.  Valid list types are: `:BULLET`,
`:LABEL`, `:LALPHA`, `:NOTE`, `:NUMBER`, `:UALPHA`

**@return** [List] a new instance of List

## last() [](#method-i-last)
Returns the last item in the list

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## push(*items) [](#method-i-push)
Appends `items` to the list

