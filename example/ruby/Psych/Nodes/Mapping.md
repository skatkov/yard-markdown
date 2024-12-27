# Class: Psych::Nodes::Mapping
**Inherits:** Psych::Nodes::Node
    

This class represents a [YAML Mapping](http://yaml.org/spec/1.1/#mapping).

A Psych::Nodes::Mapping node may have 0 or more children, but must have an
even number of children.  Here are the valid children a Psych::Nodes::Mapping
node may have:

*   Psych::Nodes::Sequence
*   Psych::Nodes::Mapping
*   Psych::Nodes::Scalar
*   Psych::Nodes::Alias


# Attributes
## anchor[RW] [](#attribute-i-anchor)
The optional anchor for this mapping

## implicit[RW] [](#attribute-i-implicit)
Is this an implicit mapping?

## style[RW] [](#attribute-i-style)
The style of this mapping

## tag[RW] [](#attribute-i-tag)
The optional tag for this mapping


#Instance Methods
## initialize(anchornil, tagnil, implicittrue, styleBLOCK) [](#method-i-initialize)
Create a new Psych::Nodes::Mapping object.

`anchor` is the anchor associated with the map or `nil`. `tag` is the tag
associated with the map or `nil`. `implicit` is a boolean indicating whether
or not the map was implicitly started. `style` is an integer indicating the
mapping style.

## See Also
See also Psych::Handler#start_mapping

**@return** [Mapping] a new instance of Mapping

## mapping?() [](#method-i-mapping?)

**@return** [Boolean] 

