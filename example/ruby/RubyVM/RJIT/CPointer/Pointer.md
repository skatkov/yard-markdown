# Class: RubyVM::RJIT::CPointer::Pointer
**Inherits:** Object
    



# Attributes
## type[RW] [](#attribute-i-type)
Returns the value of attribute type.


#Instance Methods
## *() [](#method-i-*)
Dereference

## +(index) [](#method-i-+)
Move addr to addess this pointer like an array

**@raise** [ArgumentError] 

## [](index) [](#method-i-[])
Array access

## []=(index, value) [](#method-i-[]=)
Array set

**@param** [Integer] 

**@param** [Integer, RubyVM::RJIT::CPointer::Struct] an address itself or an object that return an address with to_i

## initialize(addr, type) [](#method-i-initialize)

**@param** [Integer] 

**@param** [Class] RubyVM::RJIT::CType::*

**@return** [Pointer] a new instance of Pointer

## to_i() [](#method-i-to_i)
Get a raw address

