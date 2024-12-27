# Class: Lrama::Grammar::Symbol
**Inherits:** Object
    



# Attributes
## accept_symbol=[R] [](#attribute-i-accept_symbol=)
Sets the attribute accept_symbol

**@param** [] the value to set the attribute accept_symbol to.

## alias_name[RW] [](#attribute-i-alias_name)
Returns the value of attribute alias_name.

## destructor[RW] [](#attribute-i-destructor)
Returns the value of attribute destructor.

## eof_symbol=[R] [](#attribute-i-eof_symbol=)
Sets the attribute eof_symbol

**@param** [] the value to set the attribute eof_symbol to.

## error_symbol=[R] [](#attribute-i-error_symbol=)
Sets the attribute error_symbol

**@param** [] the value to set the attribute error_symbol to.

## error_token[RW] [](#attribute-i-error_token)
Returns the value of attribute error_token.

## first_set[RW] [](#attribute-i-first_set)
Returns the value of attribute first_set.

## first_set_bitmap[RW] [](#attribute-i-first_set_bitmap)
Returns the value of attribute first_set_bitmap.

## id[RW] [](#attribute-i-id)
Returns the value of attribute id.

## nullable[RW] [](#attribute-i-nullable)
Returns the value of attribute nullable.

## number[RW] [](#attribute-i-number)
Returns the value of attribute number.

## precedence[RW] [](#attribute-i-precedence)
Returns the value of attribute precedence.

## printer[RW] [](#attribute-i-printer)
Returns the value of attribute printer.

## tag[RW] [](#attribute-i-tag)
Returns the value of attribute tag.

## term[RW] [](#attribute-i-term)
Returns the value of attribute term.

## token_id[RW] [](#attribute-i-token_id)
Returns the value of attribute token_id.

## undef_symbol=[R] [](#attribute-i-undef_symbol=)
Sets the attribute undef_symbol

**@param** [] the value to set the attribute undef_symbol to.


#Instance Methods
## accept_symbol?() [](#method-i-accept_symbol?)

**@return** [Boolean] 

## comment() [](#method-i-comment)
comment for yysymbol_kind_t

## display_name() [](#method-i-display_name)

## enum_name() [](#method-i-enum_name)
name for yysymbol_kind_t

See: b4_symbol_kind_base

## eof_symbol?() [](#method-i-eof_symbol?)

**@return** [Boolean] 

## error_symbol?() [](#method-i-error_symbol?)

**@return** [Boolean] 

## initialize(id:, term:, alias_name:nil, number:nil, tag:nil, token_id:nil, nullable:nil, precedence:nil, printer:nil, destructor:nil) [](#method-i-initialize)

**@return** [Symbol] a new instance of Symbol

## nterm?() [](#method-i-nterm?)

**@return** [Boolean] 

## term?() [](#method-i-term?)

**@return** [Boolean] 

## undef_symbol?() [](#method-i-undef_symbol?)

**@return** [Boolean] 

