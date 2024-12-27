# Class: MethodFormatter
**Inherits:** BaseFormatter
    



# Attributes
## methods[RW] [](#attribute-i-methods)
Returns the value of attribute methods.


#Instance Methods
## after(statenil) [](#method-i-after)
Callback for the MSpec :after event. Sets or adds to tallies for the example
block.

## before(state) [](#method-i-before)
Callback for the MSpec :before event. Parses the describe string into class
and method if possible. Resets the tallies so the counts are only for this
example.

## finish() [](#method-i-finish)
Callback for the MSpec :finish event. Prints out the summary information in
YAML format for all the methods.

## initialize(outnil) [](#method-i-initialize)

**@return** [MethodFormatter] a new instance of MethodFormatter

## method_type(sep) [](#method-i-method_type)
Returns the type of method as a "class", "instance", or "unknown".

