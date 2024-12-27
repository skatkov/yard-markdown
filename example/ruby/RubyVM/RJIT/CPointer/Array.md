# Class: RubyVM::RJIT::CPointer::Array
**Inherits:** Object
    

Basically Immediate but without #* to skip auto-dereference of structs.


# Attributes
## type[RW] [](#attribute-i-type)
Returns the value of attribute type.


#Instance Methods
## [](index) [](#method-i-[])
Array access

## []=(index, value) [](#method-i-[]=)
Array set

**@param** [Integer] 

**@param** [Integer, RubyVM::RJIT::CPointer::Struct] an address itself or an object that return an address with to_i

## initialize(addr, type) [](#method-i-initialize)

**@param** [Integer] 

**@param** [Class] RubyVM::RJIT::CType::*

**@return** [Array] a new instance of Array

