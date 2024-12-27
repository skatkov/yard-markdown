# Class: Prism::MagicComment
**Inherits:** Object
    

This represents a magic comment that was encountered during parsing.


# Attributes
## key_loc[RW] [](#attribute-i-key_loc)
A Location object representing the location of the key in the source.

## value_loc[RW] [](#attribute-i-value_loc)
A Location object representing the location of the value in the source.


#Instance Methods
## deconstruct_keys(keys) [](#method-i-deconstruct_keys)
Implement the hash pattern matching interface for MagicComment.

## initialize(key_loc, value_loc) [](#method-i-initialize)
Create a new magic comment object with the given key and value locations.

**@return** [MagicComment] a new instance of MagicComment

## inspect() [](#method-i-inspect)
Returns a string representation of this magic comment.

## key() [](#method-i-key)
Returns the key of the magic comment by slicing it from the source code.

## value() [](#method-i-value)
Returns the value of the magic comment by slicing it from the source code.

