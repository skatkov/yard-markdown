# Class: Prism::LexResult
**Inherits:** Prism::Result
    

This is a result specific to the `lex` and `lex_file` methods.


# Attributes
## value[RW] [](#attribute-i-value)
The list of tokens that were parsed from the source code.


#Instance Methods
## deconstruct_keys(keys) [](#method-i-deconstruct_keys)
Implement the hash pattern matching interface for LexResult.

## initialize(value, comments, magic_comments, data_loc, errors, warnings, source) [](#method-i-initialize)
Create a new lex result object with the given values.

**@return** [LexResult] a new instance of LexResult

