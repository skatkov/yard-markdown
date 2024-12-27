# Class: Fiddle::Handle
**Inherits:** Object
    

The Fiddle::Handle is the manner to access the dynamic library

## Example

### Setup

    libc_so = "/lib64/libc.so.6"
    => "/lib64/libc.so.6"
    @handle = Fiddle::Handle.new(libc_so)
    => #<Fiddle::Handle:0x00000000d69ef8>

### Setup, with flags

    libc_so = "/lib64/libc.so.6"
    => "/lib64/libc.so.6"
    @handle = Fiddle::Handle.new(libc_so, Fiddle::RTLD_LAZY | Fiddle::RTLD_GLOBAL)
    => #<Fiddle::Handle:0x00000000d69ef8>

See RTLD_LAZY and RTLD_GLOBAL

### Addresses to symbols

    strcpy_addr = @handle['strcpy']
    => 140062278451968

or

    strcpy_addr = @handle.sym('strcpy')
    => 140062278451968


# Class Methods
## [](func ) [](#method-c-[])
call-seq: sym(name)

Get the address as an Integer for the function named `name`.  The function is
searched via dlsym on RTLD_NEXT.

See man(3) dlsym() for more info.
## sym(func ) [](#method-c-sym)
call-seq: sym(name)

Get the address as an Integer for the function named `name`.  The function is
searched via dlsym on RTLD_NEXT.

See man(3) dlsym() for more info.
## sym_defined?(func ) [](#method-c-sym_defined?)
**@return** [Boolean] 


#Instance Methods
## [](func) [](#method-i-[])
call-seq: sym(name)

Get the address as an Integer for the function named `name`.

## close() [](#method-i-close)
Close this handle.

Calling close more than once will raise a Fiddle::DLError exception.

**@overload** [] 

**@raise** [DLError] 

## close_enabled?() [](#method-i-close_enabled?)
Returns `true` if dlclose() will be called when this handle is garbage
collected.

See man(3) dlclose() for more info.

**@overload** [] 

**@return** [Boolean] 

## disable_close() [](#method-i-disable_close)
Disable a call to dlclose() when this handle is garbage collected.

**@overload** [] 

## enable_close() [](#method-i-enable_close)
Enable a call to dlclose() when this handle is garbage collected.

**@overload** [] 

## file_name() [](#method-i-file_name)
Returns the file name of this handle.

**@overload** [] 

## initialize(libnamenil, flagsRTLD_LAZY | RTLD_GLOBAL) [](#method-i-initialize)
Create a new handler that opens `library` with `flags`.

If no `library` is specified or `nil` is given, DEFAULT is used, which is the
equivalent to RTLD_DEFAULT. See `man 3 dlopen` for more.

lib = Fiddle::Handle.new

The default is dependent on OS, and provide a handle for all libraries already
loaded. For example, in most cases you can use this to access `libc`
functions, or ruby functions like `rb_str_new`.

**@overload** [] 

**@return** [Handle] a new instance of Handle

## sym(func) [](#method-i-sym)
call-seq: sym(name)

Get the address as an Integer for the function named `name`.

**@raise** [TypeError] 

## sym_defined?(func) [](#method-i-sym_defined?)

**@raise** [TypeError] 

**@return** [Boolean] 

## to_i() [](#method-i-to_i)
Returns the memory address for this handle.

**@overload** [] 

## to_ptr() [](#method-i-to_ptr)
Returns the Fiddle::Pointer of this handle.

**@overload** [] 

