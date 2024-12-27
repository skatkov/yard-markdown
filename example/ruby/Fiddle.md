# Module: Fiddle
    

A libffi wrapper for Ruby.

## Description

Fiddle is an extension to translate a foreign function interface (FFI) with
ruby.

It wraps [libffi](http://sourceware.org/libffi/), a popular C library which
provides a portable interface that allows code written in one language to call
code written in another language.

## Example

Here we will use Fiddle::Function to wrap [floor(3) from
libm](http://linux.die.net/man/3/floor)

    require 'fiddle'

    libm = Fiddle.dlopen('/lib/libm.so.6')

    floor = Fiddle::Function.new(
      libm['floor'],
      [Fiddle::TYPE_DOUBLE],
      Fiddle::TYPE_DOUBLE
    )

    puts floor.call(3.14159) #=> 3.0


# Class Methods
## dlopen(library ) [](#method-c-dlopen)
call-seq: dlopen(library) => Fiddle::Handle

Creates a new handler that opens `library`, and returns an instance of
Fiddle::Handle.

If `nil` is given for the `library`, Fiddle::Handle::DEFAULT is used, which is
the equivalent to RTLD_DEFAULT. See `man 3 dlopen` for more.

    lib = Fiddle.dlopen(nil)

The default is dependent on OS, and provide a handle for all libraries already
loaded. For example, in most cases you can use this to access `libc`
functions, or ruby functions like `rb_str_new`.

See Fiddle::Handle.new for more.
## dlunwrap(addr ) [](#method-c-dlunwrap)
Returns the Ruby object stored at the memory address `addr`

Example:

    x = Object.new
    # => #<Object:0x0000000107c7d870>
    Fiddle.dlwrap(x)
    # => 4425504880
    Fiddle.dlunwrap(_)
    # => #<Object:0x0000000107c7d870>
**@overload** [] 

## dlwrap(val ) [](#method-c-dlwrap)
Returns the memory address of the Ruby object stored at `val`

Example:

    x = Object.new
    # => #<Object:0x0000000107c7d870>
    Fiddle.dlwrap(x)
    # => 4425504880

In the case `val` is not a heap allocated object, this method will return the
tagged pointer value.

Example:

    Fiddle.dlwrap(123)
    # => 247
**@overload** [] 

## free(ptr ) [](#method-c-free)
Free the memory at address `addr`
**@overload** [] 

## last_error() [](#method-c-last_error)
Returns the last `Error` of the current executing `Thread` or nil if none
## last_error=(error ) [](#method-c-last_error=)
Sets the last `Error` of the current executing `Thread` to `error`
## malloc(size ) [](#method-c-malloc)
Allocate `size` bytes of memory and return the integer memory address for the
allocated memory.
**@overload** [] 

## realloc(addr , size ) [](#method-c-realloc)
Change the size of the memory allocated at the memory location `addr` to
`size` bytes.  Returns the memory address of the reallocated memory, which may
be different than the address passed in.
**@overload** [] 

## win32_last_error() [](#method-c-win32_last_error)
Returns the last win32 `Error` of the current executing `Thread` or nil if
none
## win32_last_error=(error ) [](#method-c-win32_last_error=)
Sets the last win32 `Error` of the current executing `Thread` to `error`
## win32_last_socket_error() [](#method-c-win32_last_socket_error)
Returns the last win32 socket `Error` of the current executing `Thread` or nil
if none
## win32_last_socket_error=(error ) [](#method-c-win32_last_socket_error=)
Sets the last win32 socket `Error` of the current executing `Thread` to
`error`

