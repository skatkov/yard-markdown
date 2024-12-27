# Class: Fiddle::CStructEntity
**Inherits:** Fiddle::Pointer
    
**Includes:** Fiddle::PackInfo, Fiddle::ValueUtil
  

A pointer to a C structure


# Class Methods
## alignment(types ) [](#method-c-alignment)
## malloc(types , func nil, size size(types)) [](#method-c-malloc)
Allocates a C struct with the `types` provided.

See Fiddle::Pointer.malloc for memory management issues.
## size(types ) [](#method-c-size)
Returns the offset for the packed sizes for the given `types`.

    Fiddle::CStructEntity.size(
      [ Fiddle::TYPE_DOUBLE,
        Fiddle::TYPE_INT,
        Fiddle::TYPE_CHAR,
        Fiddle::TYPE_VOIDP ]) #=> 24

#Instance Methods
## +(delta) [](#method-i-+)

## -(delta) [](#method-i--)

## [](*args) [](#method-i-[])
Fetch struct member `name` if only one argument is specified. If two arguments
are specified, the first is an offset and the second is a length and this
method returns the string of `length` bytes beginning at `offset`.

Examples:

    my_struct = struct(['int id']).malloc
    my_struct.id = 1
    my_struct['id'] # => 1
    my_struct[0, 4] # => "\x01\x00\x00\x00".b

## []=(*args) [](#method-i-[]=)
Set struct member `name`, to value `val`. If more arguments are specified,
writes the string of bytes to the memory at the given `offset` and `length`.

Examples:

    my_struct = struct(['int id']).malloc
    my_struct['id'] = 1
    my_struct[0, 4] = "\x01\x00\x00\x00".b
    my_struct.id # => 1

## assign_names(members) [](#method-i-assign_names)
Set the names of the `members` in this C struct

## initialize(addr, types, funcnil) [](#method-i-initialize)
Wraps the C pointer `addr` as a C struct with the given `types`.

When the instance is garbage collected, the C function `func` is called.

See also Fiddle::Pointer.new

**@return** [CStructEntity] a new instance of CStructEntity

## set_ctypes(types) [](#method-i-set_ctypes)
Calculates the offsets and sizes for the given `types` in the struct.

## signed_value(val, ty) [](#method-i-signed_value)

## to_s() [](#method-i-to_s)
:nodoc:

## unsigned_value(val, ty) [](#method-i-unsigned_value)

## wrap_arg(arg, ty, funcs[], &block) [](#method-i-wrap_arg)

## wrap_args(args, tys, funcs, &block) [](#method-i-wrap_args)

