# Module: Fiddle::CParser
    

A mixin that provides methods for parsing C struct and prototype signatures.

## Example
    require 'fiddle/import'

    include Fiddle::CParser
      #=> Object

    parse_ctype('int')
      #=> Fiddle::TYPE_INT

    parse_struct_signature(['int i', 'char c'])
      #=> [[Fiddle::TYPE_INT, Fiddle::TYPE_CHAR], ["i", "c"]]

    parse_signature('double sum(double, double)')
      #=> ["sum", Fiddle::TYPE_DOUBLE, [Fiddle::TYPE_DOUBLE, Fiddle::TYPE_DOUBLE]]



#Instance Methods
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

