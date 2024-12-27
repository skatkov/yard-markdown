# Class: Fiddle::Function
**Inherits:** Object
    

## Description

A representation of a C function

## Examples

### 'strcpy'

    @libc = Fiddle.dlopen "/lib/libc.so.6"
      #=> #<Fiddle::Handle:0x00000001d7a8d8>
    f = Fiddle::Function.new(
      @libc['strcpy'],
      [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP],
      Fiddle::TYPE_VOIDP)
      #=> #<Fiddle::Function:0x00000001d8ee00>
    buff = "000"
      #=> "000"
    str = f.call(buff, "123")
      #=> #<Fiddle::Pointer:0x00000001d0c380 ptr=0x000000018a21b8 size=0 free=0x00000000000000>
    str.to_s
    => "123"

### ABI check

    @libc = Fiddle.dlopen "/lib/libc.so.6"
      #=> #<Fiddle::Handle:0x00000001d7a8d8>
    f = Fiddle::Function.new(@libc['strcpy'], [TYPE_VOIDP, TYPE_VOIDP], TYPE_VOIDP)
      #=> #<Fiddle::Function:0x00000001d8ee00>
    f.abi == Fiddle::Function::DEFAULT
      #=> true


# Attributes
## abi[RW] [](#attribute-i-abi)
The ABI of the Function.

## name[RW] [](#attribute-i-name)
The name of this function

## ptr[RW] [](#attribute-i-ptr)
The address of this function


#Instance Methods
## call(*args, &block) [](#method-i-call)
Calls the constructed Function, with `args`. Caller must ensure the underlying
function is called in a thread-safe manner if running in a multi-threaded
process.

Note that it is not thread-safe to use this method to directly or indirectly
call many Ruby C-extension APIs unless you don't pass +need_gvl: true+ to
Fiddle::Function#new.

For an example see Fiddle::Function

## initialize(ptr, args, return_type, abiDEFAULT, kwargsnil) [](#method-i-initialize)
Constructs a Function object.
*   `ptr` is a referenced function, of a Fiddle::Handle
*   `args` is an Array of arguments, passed to the `ptr` function
*   `ret_type` is the return type of the function
*   `abi` is the ABI of the function
*   `name` is the name of the function
*   `need_gvl` is whether GVL is needed to call the function

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@return** [Function] a new instance of Function

## need_gvl?() [](#method-i-need_gvl?)
Whether GVL is needed to call this function

**@return** [Boolean] 

## to_i() [](#method-i-to_i)
The integer memory location of this function

## to_proc() [](#method-i-to_proc)
Turn this function in to a proc

