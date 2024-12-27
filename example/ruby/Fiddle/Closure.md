# Class: Fiddle::Closure
**Inherits:** Object
    

## Description

An FFI closure wrapper, for handling callbacks.

## Example

    closure = Class.new(Fiddle::Closure) {
      def call
        10
      end
    }.new(Fiddle::TYPE_INT, [])
      #=> #<#<Class:0x0000000150d308>:0x0000000150d240>
    func = Fiddle::Function.new(closure, [], Fiddle::TYPE_INT)
      #=> #<Fiddle::Function:0x00000001516e58>
    func.call
      #=> 10


# Class Methods
## create(*args ) [](#method-c-create)
Create a new closure. If a block is given, the created closure is
automatically freed after the given block is executed.

The all given arguments are passed to Fiddle::Closure.new. So using this
method without block equals to Fiddle::Closure.new.

## Example

    Fiddle::Closure.create(TYPE_INT, [TYPE_INT]) do |closure|
      # closure is freed automatically when this block is finished.
    end
# Attributes
## args[RW] [](#attribute-i-args)
arguments of the FFI closure

## ctype[RW] [](#attribute-i-ctype)
the C type of the return of the FFI closure


#Instance Methods
## free() [](#method-i-free)
Free this closure explicitly. You can't use this closure anymore.

If this closure is already freed, this does nothing.

## freed?() [](#method-i-freed?)
Whether this closure was freed explicitly.

**@return** [Boolean] 

## initialize(ret, args, abiFunction::DEFAULT) [](#method-i-initialize)
call-seq: new(ret, args, abi = Fiddle::DEFAULT)

Construct a new Closure object.

*   `ret` is the C type to be returned
*   `args` is an Array of arguments, passed to the callback function
*   `abi` is the abi of the closure

If there is an error in preparing the ffi_cif or ffi_prep_closure, then a
RuntimeError will be raised.

**@return** [Closure] a new instance of Closure

## to_i() [](#method-i-to_i)
Returns the memory address for this closure.

## to_ptr() [](#method-i-to_ptr)

