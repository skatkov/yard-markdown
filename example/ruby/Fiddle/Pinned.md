# Class: Fiddle::Pinned
**Inherits:** Object
    




#Instance Methods
## clear() [](#method-i-clear)
Clear the reference to the object this is pinning.

**@overload** [] 

## cleared?() [](#method-i-cleared?)
Returns true if the reference has been cleared, otherwise returns false.

**@overload** [] 

**@return** [Boolean] 

## initialize(object) [](#method-i-initialize)
Create a new pinned object reference.  The Fiddle::Pinned instance will
prevent the GC from moving `object`.

**@overload** [] 

**@return** [Pinned] a new instance of Pinned

## ref() [](#method-i-ref)
Return the object that this pinned instance references.

**@overload** [] 

