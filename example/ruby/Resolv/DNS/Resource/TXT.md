# Class: Resolv::DNS::Resource::TXT
**Inherits:** Resolv::DNS::Resource
    

Unstructured text resource.


# Class Methods
## decode_rdata(msg ) [](#method-c-decode_rdata)
:nodoc:
# Attributes
## strings[RW] [](#attribute-i-strings)
Returns an Array of Strings for this TXT record.


#Instance Methods
## data() [](#method-i-data)
Returns the concatenated string from `strings`.

## encode_rdata(msg) [](#method-i-encode_rdata)
:nodoc:

## initialize(first_string, *rest_strings) [](#method-i-initialize)

**@return** [TXT] a new instance of TXT

