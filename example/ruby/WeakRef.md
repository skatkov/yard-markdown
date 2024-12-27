# Class: WeakRef
**Inherits:** Delegator
    

Weak Reference class that allows a referenced object to be garbage-collected.

A WeakRef may be used exactly like the object it references.

Usage:

    foo = Object.new            # create a new object instance
    p foo.to_s                  # original's class
    foo = WeakRef.new(foo)      # reassign foo with WeakRef instance
    p foo.to_s                  # should be same class
    GC.start                    # start the garbage collector
    p foo.to_s                  # should raise exception (recycled)



#Instance Methods
## __getobj__() [](#method-i-__getobj__)
:nodoc:

## __setobj__(obj) [](#method-i-__setobj__)
:nodoc:

## initialize(orig) [](#method-i-initialize)
Creates a weak reference to `orig`

**@return** [WeakRef] a new instance of WeakRef

## weakref_alive?() [](#method-i-weakref_alive?)
Returns true if the referenced object is still alive.

**@return** [Boolean] 

