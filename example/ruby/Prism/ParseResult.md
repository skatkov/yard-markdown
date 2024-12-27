# Class: Prism::ParseResult
**Inherits:** Prism::Result
    

This is a result specific to the `parse` and `parse_file` methods.


# Attributes
## value[RW] [](#attribute-i-value)
The syntax tree that was parsed from the source code.


#Instance Methods
## attach_comments!() [](#method-i-attach_comments!)
Attach the list of comments to their respective locations in the tree.

## deconstruct_keys(keys) [](#method-i-deconstruct_keys)
Implement the hash pattern matching interface for ParseResult.

## errors_format() [](#method-i-errors_format)
Returns a string representation of the syntax tree with the errors displayed
inline.

## initialize(value, comments, magic_comments, data_loc, errors, warnings, source) [](#method-i-initialize)
Create a new parse result object with the given values.

**@return** [ParseResult] a new instance of ParseResult

## mark_newlines!() [](#method-i-mark_newlines!)
Walk the tree and mark nodes that are on a new line, loosely emulating the
behavior of CRuby's `:line` tracepoint event.

## statement() [](#method-i-statement)
Returns the first statement in the body of the parsed source.

