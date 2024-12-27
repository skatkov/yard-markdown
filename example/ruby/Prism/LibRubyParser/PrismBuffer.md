# Class: Prism::LibRubyParser::PrismBuffer
**Inherits:** Object
    

This object represents a pm_buffer_t. We only use it as an opaque pointer, so
it doesn't need to know the fields of pm_buffer_t.


# Class Methods
## with() [](#method-c-with)
Initialize a new buffer and yield it to the block. The buffer will be
automatically freed when the block returns.
# Attributes
## pointer[RW] [](#attribute-i-pointer)
Returns the value of attribute pointer.


#Instance Methods
## initialize(pointer) [](#method-i-initialize)

**@return** [PrismBuffer] a new instance of PrismBuffer

## length() [](#method-i-length)

## read() [](#method-i-read)

## value() [](#method-i-value)

