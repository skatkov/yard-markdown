# Class: Reline::Windows::KeyEventRecord
**Inherits:** Object
    



# Attributes
## char_code[RW] [](#attribute-i-char_code)
Returns the value of attribute char_code.

## control_key_state[RW] [](#attribute-i-control_key_state)
Returns the value of attribute control_key_state.

## control_keys[RW] [](#attribute-i-control_keys)
Returns the value of attribute control_keys.

## virtual_key_code[RW] [](#attribute-i-virtual_key_code)
Returns the value of attribute virtual_key_code.


#Instance Methods
## char() [](#method-i-char)

## enhanced?() [](#method-i-enhanced?)

**@return** [Boolean] 

## initialize(virtual_key_code, char_code, control_key_state) [](#method-i-initialize)

**@return** [KeyEventRecord] a new instance of KeyEventRecord

## match?(control_keys:nil, virtual_key_code:nil, char_code:nil) [](#method-i-match?)
Verifies if the arguments match with this key event. Nil arguments are
ignored, but at least one must be passed as non-nil. To verify that no control
keys were pressed, pass an empty array: `control_keys: []`.

**@raise** [ArgumentError] 

**@return** [Boolean] 

