# Class: Lrama::Grammar::Rule
**Inherits:** Struct
    

_rhs holds original RHS element. Use rhs to refer to Symbol.


# Attributes
## _lhs[RW] [](#attribute-i-_lhs)
Returns the value of attribute _lhs

**@return** [Object] the current value of _lhs

## _rhs[RW] [](#attribute-i-_rhs)
Returns the value of attribute _rhs

**@return** [Object] the current value of _rhs

## id[RW] [](#attribute-i-id)
Returns the value of attribute id

**@return** [Object] the current value of id

## lhs[RW] [](#attribute-i-lhs)
Returns the value of attribute lhs

**@return** [Object] the current value of lhs

## lhs_tag[RW] [](#attribute-i-lhs_tag)
Returns the value of attribute lhs_tag

**@return** [Object] the current value of lhs_tag

## lineno[RW] [](#attribute-i-lineno)
Returns the value of attribute lineno

**@return** [Object] the current value of lineno

## nullable[RW] [](#attribute-i-nullable)
Returns the value of attribute nullable

**@return** [Object] the current value of nullable

## original_rule[RW] [](#attribute-i-original_rule)
Returns the value of attribute original_rule.

## position_in_original_rule_rhs[RW] [](#attribute-i-position_in_original_rule_rhs)
Returns the value of attribute position_in_original_rule_rhs

**@return** [Object] the current value of position_in_original_rule_rhs

## precedence_sym[RW] [](#attribute-i-precedence_sym)
Returns the value of attribute precedence_sym

**@return** [Object] the current value of precedence_sym

## rhs[RW] [](#attribute-i-rhs)
Returns the value of attribute rhs

**@return** [Object] the current value of rhs

## token_code[RW] [](#attribute-i-token_code)
Returns the value of attribute token_code

**@return** [Object] the current value of token_code


#Instance Methods
## ==(other) [](#method-i-==)

## as_comment() [](#method-i-as_comment)
Used by #user_actions

## contains_at_reference?() [](#method-i-contains_at_reference?)

**@return** [Boolean] 

## display_name() [](#method-i-display_name)

## empty_rule?() [](#method-i-empty_rule?)
opt_nl: ε     <-- empty_rule
    | '\n'  <-- not empty_rule

**@return** [Boolean] 

## initial_rule?() [](#method-i-initial_rule?)

**@return** [Boolean] 

## precedence() [](#method-i-precedence)

## translated_code() [](#method-i-translated_code)

## with_actions() [](#method-i-with_actions)

