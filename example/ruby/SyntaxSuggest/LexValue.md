# Class: SyntaxSuggest::LexValue
**Inherits:** Object
    

Value object for accessing lex values

This lex:

    [1, 0], :on_ident, "describe", CMDARG

Would translate into:

    lex.line # => 1
    lex.type # => :on_indent
    lex.token # => "describe"


# Attributes
## line[RW] [](#attribute-i-line)
Returns the value of attribute line.

## state[RW] [](#attribute-i-state)
Returns the value of attribute state.

## token[RW] [](#attribute-i-token)
Returns the value of attribute token.

## type[RW] [](#attribute-i-type)
Returns the value of attribute type.


#Instance Methods
## expr_beg?() [](#method-i-expr_beg?)

**@return** [Boolean] 

## expr_label?() [](#method-i-expr_label?)

**@return** [Boolean] 

## fname?() [](#method-i-fname?)

**@return** [Boolean] 

## ignore_newline?() [](#method-i-ignore_newline?)

**@return** [Boolean] 

## initialize(line, type, token, state, last_lexnil) [](#method-i-initialize)

**@return** [LexValue] a new instance of LexValue

## is_end?() [](#method-i-is_end?)

**@return** [Boolean] 

## is_kw?() [](#method-i-is_kw?)

**@return** [Boolean] 

