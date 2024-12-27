# Class: Delegator
**Inherits:** BasicObject
    

This library provides three different ways to delegate method calls to an
object.  The easiest to use is SimpleDelegator.  Pass an object to the
constructor and all methods supported by the object will be delegated.  This
object can be changed later.

Going a step further, the top level DelegateClass method allows you to easily
setup delegation through class inheritance.  This is considerably more
flexible and thus probably the most common use for this library.

Finally, if you need full control over the delegation scheme, you can inherit
from the abstract class Delegator and customize as needed.  (If you find
yourself needing this control, have a look at Forwardable which is also in the
standard library.  It may suit your needs better.)

SimpleDelegator's implementation serves as a nice example of the use of
Delegator:

    require 'delegate'

    class SimpleDelegator < Delegator
      def __getobj__
        @delegate_sd_obj # return object we are delegating to, required
      end

      def __setobj__(obj)
        @delegate_sd_obj = obj # change delegation object,
                               # a feature we're providing
      end
    end

## Notes

Be advised, RDoc will not detect delegated methods.


# Class Methods
## const_missing(n ) [](#method-c-const_missing)
:stopdoc:
## delegating_block(mid ) [](#method-c-delegating_block)
:nodoc:
## public_api() [](#method-c-public_api)
:nodoc:

#Instance Methods
## !() [](#method-i-!)
Delegates ! to the _*getobj*_

## !=(obj) [](#method-i-!=)
Returns true if two objects are not considered of equal value.

## ==(obj) [](#method-i-==)
Returns true if two objects are considered of equal value.

## __getobj__() [](#method-i-__getobj__)
This method must be overridden by subclasses and should return the object
method calls are being delegated to.

## __setobj__(obj) [](#method-i-__setobj__)
This method must be overridden by subclasses and change the object delegate to
*obj*.

## eql?(obj) [](#method-i-eql?)
Returns true if two objects are considered of equal value.

**@return** [Boolean] 

## freeze() [](#method-i-freeze)
:method: freeze Freeze both the object returned by _*getobj*_ and self.

## initialize(obj) [](#method-i-initialize)
Pass in the *obj* to delegate method calls to.  All methods supported by *obj*
will be delegated to.

**@return** [Delegator] a new instance of Delegator

## marshal_dump() [](#method-i-marshal_dump)
Serialization support for the object returned by _*getobj*_.

## marshal_load(data) [](#method-i-marshal_load)
Reinitializes delegation from a serialized object.

## methods(alltrue) [](#method-i-methods)
Returns the methods available to this delegate object as the union of this
object's and _*getobj*_ methods.

## protected_methods(alltrue) [](#method-i-protected_methods)
Returns the methods available to this delegate object as the union of this
object's and _*getobj*_ protected methods.

## public_methods(alltrue) [](#method-i-public_methods)
Returns the methods available to this delegate object as the union of this
object's and _*getobj*_ public methods.

## respond_to_missing?(m, include_private) [](#method-i-respond_to_missing?)
Checks for a method provided by this the delegate object by forwarding the
call through _*getobj*_.

**@return** [Boolean] 

