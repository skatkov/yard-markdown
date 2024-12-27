# Class: RDoc::Markup::Verbatim
**Inherits:** RDoc::Markup::Raw
    

A section of verbatim text


# Attributes
## format[RW] [](#attribute-i-format)
Format of this verbatim section


#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## accept(visitor) [](#method-i-accept)
Calls #accept_verbatim on `visitor`

## initialize(*parts) [](#method-i-initialize)
:nodoc:

**@return** [Verbatim] a new instance of Verbatim

## normalize() [](#method-i-normalize)
Collapses 3+ newlines into two newlines

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## ruby?() [](#method-i-ruby?)
Is this verbatim section Ruby code?

**@return** [Boolean] 

## text() [](#method-i-text)
The text of the section

