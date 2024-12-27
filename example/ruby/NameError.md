# Exception: NameError
**Inherits:** StandardError
    
**Includes:** ErrorHighlight::CoreExt
  

Raised when a given name is invalid or undefined.

    puts foo

*raises the exception:*

    NameError: undefined local variable or method `foo' for main:Object

Since constant names must start with a capital:

    Integer.const_set :answer, 42

*raises the exception:*

    NameError: wrong constant name answer



#Instance Methods
## detailed_message(highlight:false, error_highlight:true) [](#method-i-detailed_message)

## initialize(*args) [](#method-i-initialize)
Construct a new NameError exception. If given the *name* parameter may
subsequently be examined using the NameError#name method. *receiver* parameter
allows to pass object in context of which the error happened. Example:

    [1, 2, 3].method(:rject) # NameError with name "rject" and receiver: Array
    [1, 2, 3].singleton_method(:rject) # NameError with name "rject" and receiver: [1, 2, 3]

**@overload** [] 

## local_variables() [](#method-i-local_variables)
Return a list of the local variable names defined where this NameError
exception was raised.

Internal use only.

**@overload** [] 

## name() [](#method-i-name)
Return the name associated with this NameError exception.

**@overload** [] 

## receiver() [](#method-i-receiver)
Return the receiver associated with this NameError exception.

**@overload** [] 

## to_s() [](#method-i-to_s)

