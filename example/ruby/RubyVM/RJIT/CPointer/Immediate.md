# Class: RubyVM::RJIT::CPointer::Immediate
**Inherits:** Object
    



# Class Methods
## define(fiddle_type ) [](#method-c-define)
**@param** [Integer] Fiddle::TYPE_*


#Instance Methods
## *() [](#method-i-*)
Dereference

## +(index) [](#method-i-+)
Move addr to addess this pointer like an array

## [](index) [](#method-i-[])
Array access

## []=(index, value) [](#method-i-[]=)
Array set

## initialize(addr, size, pack) [](#method-i-initialize)

**@param** [Integer] 

**@param** [Integer] 

**@param** [String] 

**@return** [Immediate] a new instance of Immediate

## to_i() [](#method-i-to_i)
Get a raw address

## to_s() [](#method-i-to_s)
Serialized address for generated code. Used for embedding things like
body->iseq_encoded.

