# Class: Prism::Token
**Inherits:** Object
    

This represents a token from the Ruby source.


# Attributes
## type[RW] [](#attribute-i-type)
The type of token that this token is.

## value[RW] [](#attribute-i-value)
A byteslice of the source that this token represents.


#Instance Methods
## ==(other) [](#method-i-==)
Returns true if the given other token is equal to this token.

## deconstruct_keys(keys) [](#method-i-deconstruct_keys)
Implement the hash pattern matching interface for Token.

## initialize(source, type, value, location) [](#method-i-initialize)
Create a new token object with the given type, value, and location.

**@return** [Token] a new instance of Token

## inspect() [](#method-i-inspect)
Returns a string representation of this token.

## location() [](#method-i-location)
A Location object representing the location of this token in the source.

## pretty_print(q) [](#method-i-pretty_print)
Implement the pretty print interface for Token.

