# Class: JSON::Ext::Parser
**Inherits:** Object
    

This is the JSON parser implemented as a C extension. It can be configured to
be used by setting

    JSON.parser = JSON::Ext::Parser

with the method parser= in JSON.


# Class Methods
## parse(source , opts ) [](#method-c-parse)

#Instance Methods
## initialize(*args) [](#method-i-initialize)
Creates a new JSON::Ext::Parser instance for the string *source*.

It will be configured by the *opts* hash. *opts* can have the following keys:

*opts* can have the following keys:
*   **max_nesting**: The maximum depth of nesting allowed in the parsed data
    structures. Disable depth checking with :max_nesting => false|nil|0, it
    defaults to 100.
*   **allow_nan**: If set to true, allow NaN, Infinity and -Infinity in
    defiance of RFC 4627 to be parsed by the Parser. This option defaults to
    false.
*   **symbolize_names**: If set to true, returns symbols for the names (keys)
    in a JSON object. Otherwise strings are returned, which is also the
    default. It's not possible to use this option in conjunction with the
    **create_additions** option.
*   **create_additions**: If set to false, the Parser doesn't create additions
    even if a matching class and create_id was found. This option defaults to
    false.
*   **object_class**: Defaults to Hash. If another type is provided, it will
    be used instead of Hash to represent JSON objects. The type must respond
    to `new` without arguments, and return an object that respond to `[]=`.
*   **array_class**: Defaults to Array If another type is provided, it will be
    used instead of Hash to represent JSON arrays. The type must respond to
    `new` without arguments, and return an object that respond to +<<+.
*   **decimal_class**: Specifies which class to use instead of the default
        (Float) when parsing decimal numbers. This class must accept a single
        string argument in its constructor.

**@overload** [] 

## parse() [](#method-i-parse)
Parses the current JSON text *source* and returns the complete data
    structure as a result.
    It raises JSON::ParserError if fail to parse.

**@overload** [] 

## source() [](#method-i-source)
Returns a copy of the current *source* string, that was used to construct this
Parser.

**@overload** [] 

