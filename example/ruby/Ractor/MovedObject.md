# Class: Ractor::MovedObject
**Inherits:** BasicObject
    

A special object which replaces any value that was moved to another ractor in
Ractor#send or Ractor.yield. Any attempt to access the object results in
Ractor::MovedError.

    r = Ractor.new { receive }

    ary = [1, 2, 3]
    r.send(ary, move: true)
    p Ractor::MovedObject === ary
    # => true
    ary.inspect
    # Ractor::MovedError (can not send any methods to a moved object)



#Instance Methods
## !() [](#method-i-!)

## !=() [](#method-i-!=)

## ==() [](#method-i-==)

## __id__() [](#method-i-__id__)

## __send__() [](#method-i-__send__)
override methods defined in BasicObject

## equal?() [](#method-i-equal?)

**@return** [Boolean] 

## instance_eval() [](#method-i-instance_eval)

## instance_exec() [](#method-i-instance_exec)

## method_missing() [](#method-i-method_missing)

