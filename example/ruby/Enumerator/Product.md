# Class: Enumerator::Product
**Inherits:** Enumerator
    

Enumerator::Product generates a Cartesian product of any number of enumerable
objects.  Iterating over the product of enumerable objects is roughly
equivalent to nested each_entry loops where the loop for the rightmost object
is put innermost.

    innings = Enumerator::Product.new(1..9, ['top', 'bottom'])

    innings.each do |i, h|
      p [i, h]
    end
    # [1, "top"]
    # [1, "bottom"]
    # [2, "top"]
    # [2, "bottom"]
    # [3, "top"]
    # [3, "bottom"]
    # ...
    # [9, "top"]
    # [9, "bottom"]

The method used against each enumerable object is `each_entry` instead of
`each` so that the product of N enumerable objects yields an array of exactly
N elements in each iteration.

When no enumerator is given, it calls a given block once yielding an empty
argument list.

This type of objects can be created by Enumerator.product.



#Instance Methods
## each() [](#method-i-each)
Iterates over the elements of the first enumerable by calling the "each_entry"
method on it with the given arguments, then proceeds to the following
enumerables in sequence until all of the enumerables are exhausted.

If no block is given, returns an enumerator.  Otherwise, returns self.

**@overload** [] 

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Generates a new enumerator object that generates a Cartesian product of given
enumerable objects.

    e = Enumerator::Product.new(1..3, [4, 5])
    e.to_a #=> [[1, 4], [1, 5], [2, 4], [2, 5], [3, 4], [3, 5]]
    e.size #=> 6

**@overload** [] 

## initialize_copy(orig) [](#method-i-initialize_copy)
:nodoc:

## inspect() [](#method-i-inspect)
Returns a printable version of the product enumerator.

**@overload** [] 

## rewind() [](#method-i-rewind)
Rewinds the product enumerator by calling the "rewind" method on each
enumerable in reverse order.  Each call is performed only if the enumerable
responds to the method.

**@overload** [] 

## size() [](#method-i-size)
Returns the total size of the enumerator product calculated by multiplying the
sizes of enumerables in the product.  If any of the enumerables reports its
size as nil or Float::INFINITY, that value is returned as the size.

**@overload** [] 

