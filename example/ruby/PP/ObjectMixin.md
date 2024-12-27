# Module: PP::ObjectMixin
    

:nodoc:



#Instance Methods
## pretty_print(q) [](#method-i-pretty_print)
A default pretty printing method for general objects. It calls
#pretty_print_instance_variables to list instance variables.

If `self` has a customized (redefined) #inspect method, the result of
self.inspect is used but it obviously has no line break hints.

This module provides predefined #pretty_print methods for some of the most
commonly used built-in classes for convenience.

## pretty_print_cycle(q) [](#method-i-pretty_print_cycle)
A default pretty printing method for general objects that are detected as part
of a cycle.

## pretty_print_inspect() [](#method-i-pretty_print_inspect)
Is #inspect implementation using #pretty_print. If you implement
#pretty_print, it can be used as follows.

    alias inspect pretty_print_inspect

However, doing this requires that every class that #inspect is called on
implement #pretty_print, or a RuntimeError will be raised.

## pretty_print_instance_variables() [](#method-i-pretty_print_instance_variables)
Returns a sorted array of instance variable names.

This method should return an array of names of instance variables as symbols
or strings as: +[:@a, :@b]+.

