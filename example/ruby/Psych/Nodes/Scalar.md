# Class: Psych::Nodes::Scalar
**Inherits:** Psych::Nodes::Node
    

This class represents a [YAML Scalar](http://yaml.org/spec/1.1/#id858081).

This node type is a terminal node and should not have any children.


# Attributes
## anchor[RW] [](#attribute-i-anchor)
The anchor value (if there is one)

## plain[RW] [](#attribute-i-plain)
Is this a plain scalar?

## quoted[RW] [](#attribute-i-quoted)
Is this scalar quoted?

## style[RW] [](#attribute-i-style)
The style of this scalar

## tag[RW] [](#attribute-i-tag)
The tag value (if there is one)

## value[RW] [](#attribute-i-value)
The scalar value


#Instance Methods
## initialize(value, anchornil, tagnil, plaintrue, quotedfalse, styleANY) [](#method-i-initialize)
Create a new Psych::Nodes::Scalar object.

`value` is the string value of the scalar `anchor` is an associated anchor or
nil `tag` is an associated tag or nil `plain` is a boolean value `quoted` is a
boolean value `style` is an integer indicating the string style

## See Also

See also Psych::Handler#scalar

**@return** [Scalar] a new instance of Scalar

## scalar?() [](#method-i-scalar?)

**@return** [Boolean] 

