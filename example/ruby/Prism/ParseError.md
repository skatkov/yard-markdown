# Class: Prism::ParseError
**Inherits:** Object
    

This represents an error that was encountered during parsing.


# Attributes
## level[RW] [](#attribute-i-level)
The level of this error.

## location[RW] [](#attribute-i-location)
A Location object representing the location of this error in the source.

## message[RW] [](#attribute-i-message)
The message associated with this error.

## type[RW] [](#attribute-i-type)
The type of error. This is an *internal* symbol that is used for communicating
with translation layers. It is not meant to be public API.


#Instance Methods
## deconstruct_keys(keys) [](#method-i-deconstruct_keys)
Implement the hash pattern matching interface for ParseError.

## initialize(type, message, location, level) [](#method-i-initialize)
Create a new error object with the given message and location.

**@return** [ParseError] a new instance of ParseError

## inspect() [](#method-i-inspect)
Returns a string representation of this error.

