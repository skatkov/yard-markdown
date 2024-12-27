# Class: RaiseErrorMatcher
**Inherits:** Object
    



# Attributes
## block=[R] [](#attribute-i-block=)
Sets the attribute block

**@param** [] the value to set the attribute block to.


#Instance Methods
## exception_class_and_message(exception_class, message) [](#method-i-exception_class_and_message)

## failure_message() [](#method-i-failure_message)

## format_exception(exception) [](#method-i-format_exception)

## format_expected_exception() [](#method-i-format_expected_exception)

## initialize(exception, message, &block) [](#method-i-initialize)

**@return** [RaiseErrorMatcher] a new instance of RaiseErrorMatcher

## matches?(proc) [](#method-i-matches?)
This #matches? method is unusual because it doesn't always return a boolean
but instead re-raises the original exception if proc.call raises an exception
and #matching_exception? is false. The reasoning is the original exception
class matters and we don't want to change it by raising another exception, so
instead we attach the #failure_message and extract it in
ExceptionState#message.

**@return** [Boolean] 

## matching_class?(exc) [](#method-i-matching_class?)

**@return** [Boolean] 

## matching_exception?(exc) [](#method-i-matching_exception?)

**@return** [Boolean] 

## matching_message?(exc) [](#method-i-matching_message?)

**@return** [Boolean] 

## negative_failure_message() [](#method-i-negative_failure_message)

