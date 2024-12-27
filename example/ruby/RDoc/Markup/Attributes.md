# Class: RDoc::Markup::Attributes
**Inherits:** Object
    

We manage a set of attributes.  Each attribute has a symbol name and a bit
value.


# Attributes
## regexp_handling[RW] [](#attribute-i-regexp_handling)
The regexp handling attribute type. See RDoc::Markup#add_regexp_handling


#Instance Methods
## as_string(bitmap) [](#method-i-as_string)
Returns a string representation of `bitmap`

## bitmap_for(name) [](#method-i-bitmap_for)
Returns a unique bit for `name`

## each_name_of(bitmap) [](#method-i-each_name_of)
yields each attribute name in `bitmap`

## initialize() [](#method-i-initialize)
Creates a new attributes set.

**@return** [Attributes] a new instance of Attributes

