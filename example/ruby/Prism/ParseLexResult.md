# Class: Prism::ParseLexResult
**Inherits:** Prism::Result
    

This is a result specific to the `parse_lex` and `parse_lex_file` methods.


# Attributes
## value[RW] [](#attribute-i-value)
A tuple of the syntax tree and the list of tokens that were parsed from the
source code.


#Instance Methods
## deconstruct_keys(keys) [](#method-i-deconstruct_keys)
Implement the hash pattern matching interface for ParseLexResult.

## initialize(value, comments, magic_comments, data_loc, errors, warnings, source) [](#method-i-initialize)
Create a new parse lex result object with the given values.

**@return** [ParseLexResult] a new instance of ParseLexResult

