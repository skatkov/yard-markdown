# Class: Psych::Coder
**Inherits:** Object
    

If an object defines `encode_with`, then an instance of Psych::Coder will be
passed to the method when the object is being serialized.  The Coder
automatically assumes a Psych::Nodes::Mapping is being emitted.  Other objects
like Sequence and Scalar may be emitted if `seq=` or `scalar=` are called,
respectively.


# Attributes
## implicit[RW] [](#attribute-i-implicit)
Returns the value of attribute implicit.

## object[RW] [](#attribute-i-object)
Returns the value of attribute object.

## seq[RW] [](#attribute-i-seq)
Returns the value of attribute seq.

## style[RW] [](#attribute-i-style)
Returns the value of attribute style.

## tag[RW] [](#attribute-i-tag)
Returns the value of attribute tag.

## type[RW] [](#attribute-i-type)
Returns the value of attribute type.


#Instance Methods
## [](k) [](#method-i-[])

## []=(k, v) [](#method-i-[]=)

## initialize(tag) [](#method-i-initialize)

**@return** [Coder] a new instance of Coder

## map(tag@tag, style@style) [](#method-i-map)
Emit a map.  The coder will be yielded to the block.

**@yield** [_self] 

**@yieldparam** [Psych::Coder] the object that the method was called on

## map=(map) [](#method-i-map=)
Emit a map with `value`

## represent_map(tag, map) [](#method-i-represent_map)
Emit a sequence with `map` and `tag`

## represent_object(tag, obj) [](#method-i-represent_object)
Emit an arbitrary object `obj` and `tag`

## represent_scalar(tag, value) [](#method-i-represent_scalar)
Emit a scalar with `value` and `tag`

## represent_seq(tag, list) [](#method-i-represent_seq)
Emit a sequence with `list` and `tag`

## scalar(*args) [](#method-i-scalar)

## scalar=(value) [](#method-i-scalar=)
Emit a scalar with `value`

