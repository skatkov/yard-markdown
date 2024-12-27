# Class: TrueClass
**Inherits:** Object
    

The class of the singleton object `true`.

Several of its methods act as operators:

*   #&
*   #|
*   #===
*   #^

One other method:

*   #to_s and its alias #inspect.



#Instance Methods
## &(obj2) [](#method-i-&)
Returns `false` if `object` is `false` or `nil`, `true` otherwise:

true & Object.new # => true true & false      # => false true & nil        #
=> false

**@overload** [] 

## ===() [](#method-i-===)

## ^(obj2) [](#method-i-^)
Returns `true` if `object` is `false` or `nil`, `false` otherwise:

    true ^ Object.new # => false
    true ^ false      # => true
    true ^ nil        # => true

**@overload** [] 

## hash() [](#method-i-hash)

## to_s() [](#method-i-to_s)
Returns string `'true'`:

    true.to_s # => "true"

TrueClass#inspect is an alias for TrueClass#to_s.

**@overload** [] 

## |(obj2) [](#method-i-|)
Returns `true`:

    true | Object.new # => true
    true | false      # => true
    true | nil        # => true

Argument `object` is evaluated. This is different from `true` with the
short-circuit operator, whose operand is evaluated only if necessary:

    true | raise # => Raises RuntimeError.
    true || raise # => true

**@overload** [] 

