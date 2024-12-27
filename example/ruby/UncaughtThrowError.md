# Exception: UncaughtThrowError
**Inherits:** ArgumentError
    

Raised when `throw` is called with a *tag* which does not have corresponding
`catch` block.

    throw "foo", "bar"

*raises the exception:*

    UncaughtThrowError: uncaught throw "foo"



#Instance Methods
## initialize(*args) [](#method-i-initialize)
Raised when `throw` is called with a *tag* which does not have corresponding
`catch` block.

    throw "foo", "bar"

*raises the exception:*

    UncaughtThrowError: uncaught throw "foo"

## tag() [](#method-i-tag)
Return the tag object which was called for.

**@overload** [] 

## to_s() [](#method-i-to_s)
Returns formatted message with the inspected tag.

**@overload** [] 

## value() [](#method-i-value)
Return the return value which was called for.

**@overload** [] 

