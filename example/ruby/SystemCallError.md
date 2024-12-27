# Exception: SystemCallError
**Inherits:** StandardError
    

SystemCallError is the base class for all low-level platform-dependent errors.

The errors available on the current platform are subclasses of SystemCallError
and are defined in the Errno module.

    File.open("does/not/exist")

*raises the exception:*

    Errno::ENOENT: No such file or directory - does/not/exist


# Class Methods
## ===(exc ) [](#method-c-===)
Return `true` if the receiver is a generic `SystemCallError`, or if the error
numbers `self` and *other* are the same.
**@overload** [] 


#Instance Methods
## errno() [](#method-i-errno)
Return this SystemCallError's error number.

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
If *errno* corresponds to a known system error code, constructs the
appropriate Errno class for that error, otherwise constructs a generic
SystemCallError object. The error number is subsequently available via the
#errno method.

**@overload** [] 

