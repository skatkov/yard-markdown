# Class: Fiddle::Closure::BlockCaller
**Inherits:** Fiddle::Closure
    

Extends Fiddle::Closure to allow for building the closure in a block



#Instance Methods
## call(*args) [](#method-i-call)
Calls the constructed BlockCaller, with `args`

For an example see Fiddle::Closure::BlockCaller.new

## initialize(ctype, args, abiFiddle::Function::DEFAULT, &block) [](#method-i-initialize)
## Description

Construct a new BlockCaller object.

*   `ctype` is the C type to be returned
*   `args` are passed the callback
*   `abi` is the abi of the closure

If there is an error in preparing the `ffi_cif` or `ffi_prep_closure`, then a
RuntimeError will be raised.

## Example

    include Fiddle

    cb = Closure::BlockCaller.new(TYPE_INT, [TYPE_INT]) do |one|
      one
    end

    func = Function.new(cb, [TYPE_INT], TYPE_INT)

**@return** [BlockCaller] a new instance of BlockCaller

