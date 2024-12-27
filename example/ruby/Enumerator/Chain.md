# Class: Enumerator::Chain
**Inherits:** Enumerator
    

Enumerator::Chain is a subclass of Enumerator, which represents a chain of
enumerables that works as a single enumerator.

This type of objects can be created by Enumerable#chain and Enumerator#+.



#Instance Methods
## each(*args) [](#method-i-each)
Iterates over the elements of the first enumerable by calling the "each"
method on it with the given arguments, then proceeds to the following
enumerables in sequence until all of the enumerables are exhausted.

If no block is given, returns an enumerator.

**@overload** [] 

**@overload** [] 

## initialize(enums) [](#method-i-initialize)
Generates a new enumerator object that iterates over the elements of given
enumerable objects in sequence.

    e = Enumerator::Chain.new(1..3, [4, 5])
    e.to_a #=> [1, 2, 3, 4, 5]
    e.size #=> 5

**@overload** [] 

## initialize_copy(orig) [](#method-i-initialize_copy)
:nodoc:

## inspect() [](#method-i-inspect)
Returns a printable version of the enumerator chain.

**@overload** [] 

## rewind() [](#method-i-rewind)
Rewinds the enumerator chain by calling the "rewind" method on each enumerable
in reverse order.  Each call is performed only if the enumerable responds to
the method.

**@overload** [] 

## size() [](#method-i-size)
Returns the total size of the enumerator chain calculated by summing up the
size of each enumerable in the chain.  If any of the enumerables reports its
size as nil or Float::INFINITY, that value is returned as the total size.

**@overload** [] 

