# Module: OpenURI::Meta
    

Mixin for holding meta-information.


# Class Methods
## init(obj , src nil) [](#method-c-init)
:nodoc:
# Attributes
## base_uri[RW] [](#attribute-i-base_uri)
returns a URI that is the base of relative URIs in the data. It may differ
from the URI supplied by a user due to redirection.

## meta[RW] [](#attribute-i-meta)
returns a Hash that represents header fields. The Hash keys are downcased for
canonicalization. The Hash values are a field body. If there are multiple
field with same field name, the field values are concatenated with a comma.

## metas[RW] [](#attribute-i-metas)
returns a Hash that represents header fields. The Hash keys are downcased for
canonicalization. The Hash value are an array of field values.

## status[RW] [](#attribute-i-status)
returns an Array that consists of status code and message.


#Instance Methods
## charset() [](#method-i-charset)
returns a charset parameter in Content-Type field. It is downcased for
canonicalization.

If charset parameter is not given but a block is given, the block is called
and its result is returned. It can be used to guess charset.

If charset parameter and block is not given, nil is returned except text type.
In that case, "utf-8" is returned as defined by RFC6838 4.2.1

## content_encoding() [](#method-i-content_encoding)
Returns a list of encodings in Content-Encoding field as an array of strings.

The encodings are downcased for canonicalization.

## content_type() [](#method-i-content_type)
returns "type/subtype" which is MIME Content-Type. It is downcased for
canonicalization. Content-Type parameters are stripped.

## content_type_parse() [](#method-i-content_type_parse)
:nodoc:

## last_modified() [](#method-i-last_modified)
returns a Time that represents the Last-Modified field.

## meta_add_field(name, value) [](#method-i-meta_add_field)
:nodoc:

## meta_add_field2(name, values) [](#method-i-meta_add_field2)
:nodoc:

## meta_setup_encoding() [](#method-i-meta_setup_encoding)
:nodoc:

