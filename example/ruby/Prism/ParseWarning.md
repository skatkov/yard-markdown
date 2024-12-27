# Class: Prism::ParseWarning
**Inherits:** Object
    

This represents a warning that was encountered during parsing.


# Attributes
## level[RW] [](#attribute-i-level)
The level of this warning.

## location[RW] [](#attribute-i-location)
A Location object representing the location of this warning in the source.

## message[RW] [](#attribute-i-message)
The message associated with this warning.

## type[RW] [](#attribute-i-type)
The type of warning. This is an *internal* symbol that is used for
communicating with translation layers. It is not meant to be public API.


#Instance Methods
## deconstruct_keys(keys) [](#method-i-deconstruct_keys)
Implement the hash pattern matching interface for ParseWarning.

## initialize(type, message, location, level) [](#method-i-initialize)
Create a new warning object with the given message and location.

**@return** [ParseWarning] a new instance of ParseWarning

## inspect() [](#method-i-inspect)
Returns a string representation of this warning.

