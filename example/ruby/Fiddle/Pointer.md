# Class: Fiddle::Pointer
**Inherits:** Object
  
**Extended by:** FFI::DataConverter
    

Fiddle::Pointer is a class to handle C pointers


# Class Methods
## [](val ) [](#method-c-[])
Get the underlying pointer for ruby object `val` and return it as a
Fiddle::Pointer object.
**@overload** [] 

**@overload** [] 

## from_native(value , ctx ) [](#method-c-from_native)
## malloc(size , free nil) [](#method-c-malloc)
## Examples

    # Automatically freeing the pointer when the block is exited - recommended
    Fiddle::Pointer.malloc(size, Fiddle::RUBY_FREE) do |pointer|
      ...
    end

    # Manually freeing but relying on the garbage collector otherwise
    pointer = Fiddle::Pointer.malloc(size, Fiddle::RUBY_FREE)
    ...
    pointer.call_free

    # Relying on the garbage collector - may lead to unlimited memory allocated before freeing any, but safe
    pointer = Fiddle::Pointer.malloc(size, Fiddle::RUBY_FREE)
    ...

    # Only manually freeing
    pointer = Fiddle::Pointer.malloc(size)
    begin
      ...
    ensure
      Fiddle.free pointer
    end

    # No free function and no call to free - the native memory will leak if the pointer is garbage collected
    pointer = Fiddle::Pointer.malloc(size)
    ...

Allocate `size` bytes of memory and associate it with an optional `freefunc`.

If a block is supplied, the pointer will be yielded to the block instead of
being returned, and the return value of the block will be returned. A
`freefunc` must be supplied if a block is.

If a `freefunc` is supplied it will be called once, when the pointer is
garbage collected or when the block is left if a block is supplied or when the
user calls `call_free`, whichever happens first. `freefunc` must be an address
pointing to a function or an instance of `Fiddle::Function`.
**@overload** [] 

**@overload** [] 

## read(addr , len ) [](#method-c-read)
Or read the memory at address `address` with length `len` and return a string
with that memory
**@overload** [] 

## to_native(value , ctx ) [](#method-c-to_native)
## to_ptr(value ) [](#method-c-to_ptr)
Get the underlying pointer for ruby object `val` and return it as a
Fiddle::Pointer object.
**@overload** [] 

**@overload** [] 

## write(addr , bytes ) [](#method-c-write)
Write bytes in `str` to the location pointed to by `address`.
**@overload** [] 

# Attributes
## ffi_ptr[RW] [](#attribute-i-ffi_ptr)
Returns the value of attribute ffi_ptr.


#Instance Methods
## +(delta) [](#method-i-+)
Returns a new pointer instance that has been advanced `n` bytes.

**@overload** [] 

## +@() [](#method-i-+@)
Returns a new Fiddle::Pointer instance that is a dereferenced pointer for this
pointer.

Analogous to the star operator in C.

**@overload** [] 

## -(delta) [](#method-i--)
Returns a new pointer instance that has been moved back `n` bytes.

**@overload** [] 

## -@() [](#method-i--@)
Returns a new Fiddle::Pointer instance that is a reference pointer for this
pointer.

Analogous to the ampersand operator in C.

**@overload** [] 

## <=>(other) [](#method-i-<=>)
Returns -1 if less than, 0 if equal to, 1 if greater than `other`.

Returns nil if `ptr` cannot be compared to `other`.

**@overload** [] 

## ==(other) [](#method-i-==)
Returns true if `other` wraps the same pointer, otherwise returns false.

**@overload** [] 

**@overload** [] 

## [](index, lengthnil) [](#method-i-[])
Returns integer stored at *index*.

If *start* and *length* are given, a string containing the bytes from *start*
of *length* will be returned.

**@overload** [] 

**@overload** [] 

## []=(*args, value) [](#method-i-[]=)
Set the value at `index` to `int`.

Or, set the memory at `start` until `length` with the contents of `string`,
the memory from `dl_cptr`, or the memory pointed at by the memory address
`addr`.

**@overload** [] 

**@overload** [] 

## call_free() [](#method-i-call_free)
Call the free function for this pointer. Calling more than once will do
nothing. Does nothing if there is no free function attached.

**@overload** [] 

## eql?(other) [](#method-i-eql?)
Returns true if `other` wraps the same pointer, otherwise returns false.

**@overload** [] 

**@overload** [] 

## free() [](#method-i-free)
Get the free function for this pointer.

Returns a new instance of Fiddle::Function.

See Fiddle::Function.new

**@overload** [] 

## free=(free) [](#method-i-free=)
Set the free function for this pointer to `function` in the given
Fiddle::Function.

**@overload** [] 

## freed?() [](#method-i-freed?)
Returns if the free function for this pointer has been called.

**@overload** [] 

## initialize(addr, sizenil, freenil) [](#method-i-initialize)
Create a new pointer to `address` with an optional `size` and `freefunc`.

`freefunc` will be called when the instance is garbage collected.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@return** [Pointer] a new instance of Pointer

## inspect() [](#method-i-inspect)
Returns a string formatted with an easily readable representation of the
internal state of the pointer.

**@overload** [] 

## null?() [](#method-i-null?)
Returns `true` if this is a null pointer.

**@overload** [] 

**@return** [Boolean] 

## ptr() [](#method-i-ptr)
Returns a new Fiddle::Pointer instance that is a dereferenced pointer for this
pointer.

Analogous to the star operator in C.

**@overload** [] 

## ref() [](#method-i-ref)
Returns a new Fiddle::Pointer instance that is a reference pointer for this
pointer.

Analogous to the ampersand operator in C.

**@overload** [] 

## size() [](#method-i-size)
Get the size of this pointer.

**@overload** [] 

## size=(size) [](#method-i-size=)
Set the size of this pointer to `size`

**@overload** [] 

## to_i() [](#method-i-to_i)
Returns the integer memory location of this pointer.

**@overload** [] 

## to_ptr() [](#method-i-to_ptr)

## to_s(lennil) [](#method-i-to_s)
without 0

## to_str(lennil) [](#method-i-to_str)
Returns the pointer contents as a string.

When called with no arguments, this method will return the contents with the
length of this pointer's `size`.

When called with `len`, a string of `len` bytes will be returned.

See to_s

**@overload** [] 

**@overload** [] 

## to_value() [](#method-i-to_value)
Cast this pointer to a ruby object.

**@overload** [] 

**@raise** [NotImplementedError] 

