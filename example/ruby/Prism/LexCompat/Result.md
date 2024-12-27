# Class: Prism::LexCompat::Result
**Inherits:** Prism::Result
    

A result class specialized for holding tokens produced by the lexer.


# Attributes
## value[RW] [](#attribute-i-value)
The list of tokens that were produced by the lexer.


#Instance Methods
## deconstruct_keys(keys) [](#method-i-deconstruct_keys)
Implement the hash pattern matching interface for Result.

## initialize(value, comments, magic_comments, data_loc, errors, warnings, source) [](#method-i-initialize)
Create a new lex compat result object with the given values.

**@return** [Result] a new instance of Result

