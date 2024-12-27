# Class: RubyVM::RJIT::CPointer::Struct
**Inherits:** Object
    

Note: We'd like to avoid alphabetic method names to avoid a conflict with
member methods. to_i and to_s are considered an exception.



#Instance Methods
## -(struct) [](#method-i--)
Pointer diff

**@raise** [ArgumentError] 

## [](member) [](#method-i-[])
Primitive API that does no automatic dereference TODO: remove this?

**@param** [Symbol] 

## initialize(addr, sizeof, members) [](#method-i-initialize)

**@param** [String] 

**@param** [Integer] 

**@param** [Hash{ Symbol => [RubyVM::RJIT::CType::*, Integer, TrueClass] }] 

**@return** [Struct] a new instance of Struct

## to_i() [](#method-i-to_i)
Get a raw address

## to_s() [](#method-i-to_s)
Serialized address for generated code

