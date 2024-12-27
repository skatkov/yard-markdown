# Class: Fiddle::TestCParser
**Inherits:** Fiddle::TestCase
    
**Includes:** Fiddle::CParser
  




#Instance Methods
## expand_struct_types(types) [](#method-i-expand_struct_types)

## parse_ctype(ty, tymapnil) [](#method-i-parse_ctype)
Given a String of C type `ty`, returns the corresponding Fiddle constant.

`ty` can also accept an Array of C type Strings, and will be returned in a
corresponding Array.

If Hash `tymap` is provided, `ty` is expected to be the key, and the value
will be the C type to be looked up.

Example:
    require 'fiddle/import'

    include Fiddle::CParser
      #=> Object

    parse_ctype('int')
      #=> Fiddle::TYPE_INT

    parse_ctype('double diff')
      #=> Fiddle::TYPE_DOUBLE

    parse_ctype('unsigned char byte')
      #=> -Fiddle::TYPE_CHAR

    parse_ctype('const char* const argv[]')
      #=> -Fiddle::TYPE_VOIDP

## parse_signature(signature, tymapnil) [](#method-i-parse_signature)
Parses a C prototype signature

If Hash `tymap` is provided, the return value and the arguments from the
`signature` are expected to be keys, and the value will be the C type to be
looked up.

Example:
    require 'fiddle/import'

    include Fiddle::CParser
      #=> Object

    parse_signature('double sum(double, double)')
      #=> ["sum", Fiddle::TYPE_DOUBLE, [Fiddle::TYPE_DOUBLE, Fiddle::TYPE_DOUBLE]]

    parse_signature('void update(void (*cb)(int code))')
      #=> ["update", Fiddle::TYPE_VOID, [Fiddle::TYPE_VOIDP]]

    parse_signature('char (*getbuffer(void))[80]')
      #=> ["getbuffer", Fiddle::TYPE_VOIDP, []]

## parse_struct_signature(signature, tymapnil) [](#method-i-parse_struct_signature)
Parses a C struct's members

Example:
    require 'fiddle/import'

    include Fiddle::CParser
      #=> Object

    parse_struct_signature(['int i', 'char c'])
      #=> [[Fiddle::TYPE_INT, Fiddle::TYPE_CHAR], ["i", "c"]]

    parse_struct_signature(['char buffer[80]'])
      #=> [[[Fiddle::TYPE_CHAR, 80]], ["buffer"]]

## test_bool_ctype() [](#method-i-test_bool_ctype)

## test_char_ctype() [](#method-i-test_char_ctype)

## test_int_ctype() [](#method-i-test_int_ctype)

## test_intptr_t_ctype() [](#method-i-test_intptr_t_ctype)

## test_long_ctype() [](#method-i-test_long_ctype)

## test_ptrdiff_t_ctype() [](#method-i-test_ptrdiff_t_ctype)

## test_short_ctype() [](#method-i-test_short_ctype)

## test_signature_array_variable() [](#method-i-test_signature_array_variable)

## test_signature_basic() [](#method-i-test_signature_basic)

## test_signature_function_pointer() [](#method-i-test_signature_function_pointer)

## test_signature_multiple_variables() [](#method-i-test_signature_multiple_variables)

## test_signature_return_array() [](#method-i-test_signature_return_array)

## test_signature_return_array_with_args() [](#method-i-test_signature_return_array_with_args)

## test_signature_return_function_pointer() [](#method-i-test_signature_return_function_pointer)

## test_signature_return_function_pointer_with_args() [](#method-i-test_signature_return_function_pointer_with_args)

## test_signature_return_pointer() [](#method-i-test_signature_return_pointer)

## test_signature_semi() [](#method-i-test_signature_semi)

## test_signature_single_variable() [](#method-i-test_signature_single_variable)

## test_signature_type_args() [](#method-i-test_signature_type_args)

## test_signature_variadic_arguments() [](#method-i-test_signature_variadic_arguments)

## test_signature_void_arg() [](#method-i-test_signature_void_arg)

## test_size_t_ctype() [](#method-i-test_size_t_ctype)

## test_ssize_t_ctype() [](#method-i-test_ssize_t_ctype)

## test_struct_array() [](#method-i-test_struct_array)

## test_struct_array_str() [](#method-i-test_struct_array_str)

## test_struct_basic() [](#method-i-test_struct_basic)

## test_struct_double_nested_struct() [](#method-i-test_struct_double_nested_struct)

## test_struct_double_nested_struct_inner_array() [](#method-i-test_struct_double_nested_struct_inner_array)

## test_struct_double_nested_struct_outer_array() [](#method-i-test_struct_double_nested_struct_outer_array)

## test_struct_function_pointer() [](#method-i-test_struct_function_pointer)

## test_struct_function_pointer_str() [](#method-i-test_struct_function_pointer_str)

## test_struct_nested_defined_struct() [](#method-i-test_struct_nested_defined_struct)

## test_struct_nested_struct() [](#method-i-test_struct_nested_struct)

## test_struct_nested_struct_array() [](#method-i-test_struct_nested_struct_array)

## test_struct_string() [](#method-i-test_struct_string)

## test_struct_undefined() [](#method-i-test_struct_undefined)

## test_struct_undefined_with_type_alias() [](#method-i-test_struct_undefined_with_type_alias)

## test_uintptr_t_ctype() [](#method-i-test_uintptr_t_ctype)

## test_undefined_ctype() [](#method-i-test_undefined_ctype)

## test_undefined_ctype_with_type_alias() [](#method-i-test_undefined_ctype_with_type_alias)

