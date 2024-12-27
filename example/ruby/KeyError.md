# Exception: KeyError
**Inherits:** IndexError
    

Raised when the specified key is not found. It is a subclass of IndexError.

    h = {"foo" => :bar}
    h.fetch("foo") #=> :bar
    h.fetch("baz") #=> KeyError: key not found: "baz"



#Instance Methods
## initialize(*args) [](#method-i-initialize)
Construct a new `KeyError` exception with the given message, receiver and key.

**@overload** [] 

## key() [](#method-i-key)
Return the key caused this KeyError exception.

**@overload** [] 

## receiver() [](#method-i-receiver)
Return the receiver associated with this KeyError exception.

**@overload** [] 

