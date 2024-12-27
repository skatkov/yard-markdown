# Module: Fiddle::LIBC
  
**Extended by:** Fiddle::Importer
    



# Class Methods
## [](name ) [](#method-c-[])
Returns the function mapped to `name`, that was created by either
Fiddle::Importer.extern or Fiddle::Importer.bind
## bind(signature , *opts , &blk ) [](#method-c-bind)
Creates a global method from the given C `signature` using the given `opts` as
bind parameters with the given block.
## bind_function(name , ctype , argtype , call_type nil, &block ) [](#method-c-bind_function)
Returns a new closure wrapper for the `name` function.

*   `ctype` is the return type of the function
*   `argtype` is an Array of arguments, passed to the callback function
*   `call_type` is the abi of the closure
*   `block` is passed to the callback

See Fiddle::Closure
## create_value(ty , val nil) [](#method-c-create_value)
Creates a class to wrap the C struct with the value `ty`

See also Fiddle::Importer.struct
## dlload(*libs ) [](#method-c-dlload)
Creates an array of handlers for the given `libs`, can be an instance of
Fiddle::Handle, Fiddle::Importer, or will create a new instance of
Fiddle::Handle using Fiddle.dlopen

Raises a DLError if the library cannot be loaded.

See Fiddle.dlopen
## extern(signature , *opts ) [](#method-c-extern)
Creates a global method from the given C `signature`.
## handler() [](#method-c-handler)
The Fiddle::CompositeHandler instance

Will raise an error if no handlers are open.
## import_function(name , ctype , argtype , call_type nil) [](#method-c-import_function)
Returns a new Fiddle::Function instance at the memory address of the given
`name` function.

Raises a DLError if the `name` doesn't exist.

*   `argtype` is an Array of arguments, passed to the `name` function.
*   `ctype` is the return type of the function
*   `call_type` is the ABI of the function

See also Fiddle:Function.new

See Fiddle::CompositeHandler.sym and Fiddle::Handler.sym
## import_symbol(name ) [](#method-c-import_symbol)
Returns a new Fiddle::Pointer instance at the memory address of the given
`name` symbol.

Raises a DLError if the `name` doesn't exist.

See Fiddle::CompositeHandler.sym and Fiddle::Handle.sym
## import_value(ty , addr ) [](#method-c-import_value)
Returns a new instance of the C struct with the value `ty` at the `addr`
address.
## parse_ctype(ty , tymap nil) [](#method-c-parse_ctype)
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
## parse_signature(signature , tymap nil) [](#method-c-parse_signature)
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
## parse_struct_signature(signature , tymap nil) [](#method-c-parse_struct_signature)
Parses a C struct's members

Example:
    require 'fiddle/import'

    include Fiddle::CParser
      #=> Object

    parse_struct_signature(['int i', 'char c'])
      #=> [[Fiddle::TYPE_INT, Fiddle::TYPE_CHAR], ["i", "c"]]

    parse_struct_signature(['char buffer[80]'])
      #=> [[[Fiddle::TYPE_CHAR, 80]], ["buffer"]]
## sizeof(ty ) [](#method-c-sizeof)
Returns the sizeof `ty`, using Fiddle::Importer.parse_ctype to determine the C
type and the appropriate Fiddle constant.
## struct(signature ) [](#method-c-struct)
Creates a class to wrap the C struct described by `signature`.

    MyStruct = struct ['int i', 'char c']
## typealias(alias_type , orig_type ) [](#method-c-typealias)
Sets the type alias for `alias_type` as `orig_type`
## union(signature ) [](#method-c-union)
Creates a class to wrap the C union described by `signature`.

    MyUnion = union ['int i', 'char c']

