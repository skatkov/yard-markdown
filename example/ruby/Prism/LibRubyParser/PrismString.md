# Class: Prism::LibRubyParser::PrismString
**Inherits:** Object
    

This object represents a pm_string_t. We only use it as an opaque pointer, so
it doesn't have to be an FFI::Struct.


# Class Methods
## with_file(filepath ) [](#method-c-with_file)
Yields a pm_string_t pointer to the given block.
**@raise** [TypeError] 

## with_string(string ) [](#method-c-with_string)
Yields a pm_string_t pointer to the given block.
**@raise** [TypeError] 

# Attributes
## length[RW] [](#attribute-i-length)
Returns the value of attribute length.

## pointer[RW] [](#attribute-i-pointer)
Returns the value of attribute pointer.


#Instance Methods
## initialize(pointer, length, from_string) [](#method-i-initialize)

**@return** [PrismString] a new instance of PrismString

## read() [](#method-i-read)

