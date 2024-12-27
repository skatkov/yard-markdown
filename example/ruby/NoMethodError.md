# Exception: NoMethodError
**Inherits:** NameError
    

Raised when a method is called on a receiver which doesn't have it defined and
also fails to respond with `method_missing`.

    "hello".to_ary

*raises the exception:*

    NoMethodError: undefined method `to_ary' for an instance of String



#Instance Methods
## args() [](#method-i-args)
Return the arguments passed in as the third parameter to the constructor.

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Construct a NoMethodError exception for a method of the given name called with
the given arguments. The name may be accessed using the `#name` method on the
resulting object, and the arguments using the `#args` method.

If *private* argument were passed, it designates method was attempted to call
in private context, and can be accessed with `#private_call?` method.

*receiver* argument stores an object whose method was called.

**@overload** [] 

## private_call?() [](#method-i-private_call?)
Return true if the caused method was called as private.

**@overload** [] 

