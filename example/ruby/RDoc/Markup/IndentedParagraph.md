# Class: RDoc::Markup::IndentedParagraph
**Inherits:** RDoc::Markup::Raw
    

An Indented Paragraph of text


# Attributes
## indent[RW] [](#attribute-i-indent)
The indent in number of spaces


#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## accept(visitor) [](#method-i-accept)
Calls #accept_indented_paragraph on `visitor`

## initialize(indent, *parts) [](#method-i-initialize)
Creates a new IndentedParagraph containing `parts` indented with `indent`
spaces

**@return** [IndentedParagraph] a new instance of IndentedParagraph

## text(hard_breaknil) [](#method-i-text)
Joins the raw paragraph text and converts inline HardBreaks to the
`hard_break` text followed by the indent.

