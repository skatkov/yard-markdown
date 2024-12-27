# Class: Reline::Config
**Inherits:** Object
    



# Attributes
## autocompletion[RW] [](#attribute-i-autocompletion)
Returns the value of attribute autocompletion.

## test_mode[RW] [](#attribute-i-test_mode)
Returns the value of attribute test_mode.


#Instance Methods
## add_default_key_binding(keystroke, target) [](#method-i-add_default_key_binding)

## add_default_key_binding_by_keymap(keymap, keystroke, target) [](#method-i-add_default_key_binding_by_keymap)

## add_oneshot_key_binding(keystroke, target) [](#method-i-add_oneshot_key_binding)

## bind_key(key, value) [](#method-i-bind_key)

## bind_variable(name, value, raw_value) [](#method-i-bind_variable)

## editing_mode() [](#method-i-editing_mode)

## editing_mode=(val) [](#method-i-editing_mode=)

## editing_mode_is?(*val) [](#method-i-editing_mode_is?)

**@return** [Boolean] 

## handle_directive(directive, file, no, if_stack) [](#method-i-handle_directive)

## initialize() [](#method-i-initialize)

**@return** [Config] a new instance of Config

## inputrc_path() [](#method-i-inputrc_path)

## key_bindings() [](#method-i-key_bindings)

## key_notation_to_code(notation) [](#method-i-key_notation_to_code)

## keymap() [](#method-i-keymap)

## loaded?() [](#method-i-loaded?)

**@return** [Boolean] 

## parse_key_binding(key, func_name) [](#method-i-parse_key_binding)

## parse_keyseq(str) [](#method-i-parse_keyseq)

## read(filenil) [](#method-i-read)

## read_lines(lines, filenil) [](#method-i-read_lines)

## reload() [](#method-i-reload)

## reset() [](#method-i-reset)

## reset_oneshot_key_bindings() [](#method-i-reset_oneshot_key_bindings)

## reset_variables() [](#method-i-reset_variables)

## retrieve_string(str) [](#method-i-retrieve_string)

