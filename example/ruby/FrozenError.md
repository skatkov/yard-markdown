# Exception: FrozenError
**Inherits:** RuntimeError
    

Raised when there is an attempt to modify a frozen object.

    [1, 2, 3].freeze << 4

*raises the exception:*

    FrozenError: can't modify frozen Array



#Instance Methods
## initialize(*args) [](#method-i-initialize)
Construct a new FrozenError exception. If given the *receiver* parameter may
subsequently be examined using the FrozenError#receiver method.

    a = [].freeze
    raise FrozenError.new("can't modify frozen array", receiver: a)

**@overload** [] 

## receiver() [](#method-i-receiver)
Return the receiver associated with this FrozenError exception.

**@overload** [] 

