# Class: JSON::Ext::Generator::State
**Inherits:** Object
    



# Class Methods
## from_state(opts ) [](#method-c-from_state)
Creates a State object from *opts*, which ought to be Hash to create a new
State instance configured by *opts*, something else to create an unconfigured
instance. If *opts* is a State object, it is just returned.
**@overload** [] 

## generate(obj , opts , io ) [](#method-c-generate)

#Instance Methods
## [](name) [](#method-i-[])
call-seq: [](name)

Returns the value returned by method `name`.

## []=(name, value) [](#method-i-[]=)
call-seq: []=(name, value)

Sets the attribute name to value.

## allow_nan=(enable) [](#method-i-allow_nan=)
This sets whether or not to serialize NaN, Infinity, and -Infinity

**@overload** [] 

## allow_nan?() [](#method-i-allow_nan?)
Returns true, if NaN, Infinity, and -Infinity should be generated, otherwise
returns false.

**@overload** [] 

**@return** [Boolean] 

## array_nl() [](#method-i-array_nl)
This string is put at the end of a line that holds a JSON array.

**@overload** [] 

## array_nl=(array_nl) [](#method-i-array_nl=)
This string is put at the end of a line that holds a JSON array.

**@overload** [] 

## ascii_only=(enable) [](#method-i-ascii_only=)
This sets whether only ASCII characters should be generated.

**@overload** [] 

## ascii_only?() [](#method-i-ascii_only?)
Returns true, if only ASCII characters should be generated. Otherwise returns
false.

**@overload** [] 

**@return** [Boolean] 

## buffer_initial_length() [](#method-i-buffer_initial_length)
This integer returns the current initial length of the buffer.

**@overload** [] 

## buffer_initial_length=(buffer_initial_length) [](#method-i-buffer_initial_length=)
This sets the initial length of the buffer to `length`, if `length` > 0,
otherwise its value isn't changed.

**@overload** [] 

## check_circular?() [](#method-i-check_circular?)
Returns true, if circular data structures should be checked, otherwise returns
false.

**@overload** [] 

**@return** [Boolean] 

## configure(opts) [](#method-i-configure)
call-seq: configure(opts)

Configure this State instance with the Hash *opts*, and return itself.

## depth() [](#method-i-depth)
This integer returns the current depth of data structure nesting.

**@overload** [] 

## depth=(depth) [](#method-i-depth=)
This sets the maximum level of data structure nesting in the generated JSON to
the integer depth, max_nesting = 0 if no maximum should be checked.

**@overload** [] 

## generate(obj, ionil) [](#method-i-generate)
call-seq:
    generate(obj) -> String
    generate(obj, anIO) -> anIO

Generates a valid JSON document from object `obj` and returns the result. If
no valid JSON document can be created this method raises a GeneratorError
exception.

## indent() [](#method-i-indent)
Returns the string that is used to indent levels in the JSON text.

**@overload** [] 

## indent=(indent) [](#method-i-indent=)
Sets the string that is used to indent levels in the JSON text.

**@overload** [] 

## initialize(optsnil) [](#method-i-initialize)
call-seq: new(opts = {})

Instantiates a new State object, configured by *opts*.

*opts* can have the following keys:

*   **indent**: a string used to indent levels (default: ''),
*   **space**: a string that is put after, a : or , delimiter (default: ''),
*   **space_before**: a string that is put before a : pair delimiter (default:
    ''),
*   **object_nl**: a string that is put at the end of a JSON object (default:
    ''),
*   **array_nl**: a string that is put at the end of a JSON array (default:
    ''),
*   **allow_nan**: true if NaN, Infinity, and -Infinity should be generated,
    otherwise an exception is thrown, if these values are encountered. This
    options defaults to false.
*   **ascii_only**: true if only ASCII characters should be generated. This
    option defaults to false.
*   **buffer_initial_length**: sets the initial length of the generator's
    internal buffer.

**@return** [State] a new instance of State

## initialize_copy(orig) [](#method-i-initialize_copy)
Initializes this object from orig if it can be duplicated/cloned and returns
it.

**@overload** [] 

## max_nesting() [](#method-i-max_nesting)
This integer returns the maximum level of data structure nesting in the
generated JSON, max_nesting = 0 if no maximum is checked.

**@overload** [] 

## max_nesting=(depth) [](#method-i-max_nesting=)
This sets the maximum level of data structure nesting in the generated JSON to
the integer depth, max_nesting = 0 if no maximum should be checked.

**@overload** [] 

## object_nl() [](#method-i-object_nl)
This string is put at the end of a line that holds a JSON object (or Hash).

**@overload** [] 

## object_nl=(object_nl) [](#method-i-object_nl=)
This string is put at the end of a line that holds a JSON object (or Hash).

**@overload** [] 

## script_safe() [](#method-i-script_safe)
If this boolean is true, the forward slashes will be escaped in the json
output.

**@overload** [] 

## script_safe=(enable) [](#method-i-script_safe=)
This sets whether or not the forward slashes will be escaped in the json
output.

**@overload** [] 

## script_safe?() [](#method-i-script_safe?)
If this boolean is true, the forward slashes will be escaped in the json
output.

**@overload** [] 

**@return** [Boolean] 

## space() [](#method-i-space)
Returns the string that is used to insert a space between the tokens in a JSON
string.

**@overload** [] 

## space=(space) [](#method-i-space=)
Sets *space* to the string that is used to insert a space between the tokens
in a JSON string.

**@overload** [] 

## space_before() [](#method-i-space_before)
Returns the string that is used to insert a space before the ':' in JSON
objects.

**@overload** [] 

## space_before=(space_before) [](#method-i-space_before=)
Sets the string that is used to insert a space before the ':' in JSON objects.

**@overload** [] 

## strict() [](#method-i-strict)
If this boolean is false, types unsupported by the JSON format will be
serialized as strings. If this boolean is true, types unsupported by the JSON
format will raise a JSON::GeneratorError.

**@overload** [] 

## strict=(enable) [](#method-i-strict=)
This sets whether or not to serialize types unsupported by the JSON format as
strings. If this boolean is false, types unsupported by the JSON format will
be serialized as strings. If this boolean is true, types unsupported by the
JSON format will raise a JSON::GeneratorError.

**@overload** [] 

## strict?() [](#method-i-strict?)
If this boolean is false, types unsupported by the JSON format will be
serialized as strings. If this boolean is true, types unsupported by the JSON
format will raise a JSON::GeneratorError.

**@overload** [] 

**@return** [Boolean] 

## to_h() [](#method-i-to_h)
call-seq: to_h

Returns the configuration instance variables as a hash, that can be passed to
the configure method.

