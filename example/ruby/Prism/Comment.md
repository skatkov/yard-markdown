# Class: Prism::Comment
**Inherits:** Object
    

This represents a comment that was encountered during parsing. It is the base
class for all comment types.


# Attributes
## location[RW] [](#attribute-i-location)
The location of this comment in the source.


#Instance Methods
## deconstruct_keys(keys) [](#method-i-deconstruct_keys)
Implement the hash pattern matching interface for Comment.

## initialize(location) [](#method-i-initialize)
Create a new comment object with the given location.

**@return** [Comment] a new instance of Comment

## slice() [](#method-i-slice)
Returns the content of the comment by slicing it from the source code.

