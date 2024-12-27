# Class: RubyVM::RJIT::CPointer::Union
**Inherits:** Object
    

Note: We'd like to avoid alphabetic method names to avoid a conflict with
member methods. to_i is considered an exception.


# Class Methods
## define(sizeof , members ) [](#method-c-define)
**@param** [Integer] 

**@param** [Hash{ Symbol => RubyVM::RJIT::CType::* }] 


#Instance Methods
## +(index) [](#method-i-+)
Move addr to access this pointer like an array

**@raise** [ArgumentError] 

## -(union) [](#method-i--)
Pointer diff

**@raise** [ArgumentError] 

## initialize(addr, sizeof, members) [](#method-i-initialize)

**@param** [String] To be used when it starts defining a union pointer class

**@param** [Integer] 

**@param** [Hash{ Symbol => RubyVM::RJIT::CType::* }] 

**@return** [Union] a new instance of Union

## to_i() [](#method-i-to_i)
Get a raw address

