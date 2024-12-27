# Class: RDoc::Markup::Raw
**Inherits:** Object
    

A section of text that is added to the output document as-is


# Attributes
## parts[RW] [](#attribute-i-parts)
The component parts of the list


#Instance Methods
## <<(text) [](#method-i-<<)
Appends `text`

## ==(other) [](#method-i-==)
:nodoc:

## accept(visitor) [](#method-i-accept)
Calls #accept_raw+ on `visitor`

## initialize(*parts) [](#method-i-initialize)
Creates a new Raw containing `parts`

**@return** [Raw] a new instance of Raw

## merge(other) [](#method-i-merge)
Appends `other`'s parts

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## push(*texts) [](#method-i-push)
Appends `texts` onto this Paragraph

## text() [](#method-i-text)
The raw text

