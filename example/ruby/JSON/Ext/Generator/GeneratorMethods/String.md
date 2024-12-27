# Module: JSON::Ext::Generator::GeneratorMethods::String
    

:nodoc:


# Class Methods
## included(modul ) [](#method-c-included)
Extends *modul* with the String::Extend module.
**@overload** [] 


#Instance Methods
## to_json(*args) [](#method-i-to_json)
This string should be encoded with UTF-8 A call to this method returns a JSON
string encoded with UTF16 big endian characters as u????.

**@overload** [] 

## to_json_raw(*args) [](#method-i-to_json_raw)
This method creates a JSON text from the result of a call to
to_json_raw_object of this String.

**@overload** [] 

## to_json_raw_object() [](#method-i-to_json_raw_object)
This method creates a raw object hash, that can be nested into other data
structures and will be generated as a raw string. This method should be used,
if you want to convert raw strings to JSON instead of UTF-8 strings, e. g.
binary data.

**@overload** [] 

