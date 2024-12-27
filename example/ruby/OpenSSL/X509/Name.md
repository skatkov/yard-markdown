# Class: OpenSSL::X509::Name
**Inherits:** Object
    
**Includes:** Comparable, OpenSSL::Marshal
  

An X.509 name represents a hostname, email address or other entity associated
with a public key.

You can create a Name by parsing a distinguished name String or by supplying
the distinguished name as an Array.

    name = OpenSSL::X509::Name.parse_rfc2253 'DC=example,CN=nobody'

    name = OpenSSL::X509::Name.new [['CN', 'nobody'], ['DC', 'example']]


# Class Methods
## parse_openssl(str , template OBJECT_TYPE_TEMPLATE) [](#method-c-parse_openssl)
Parses the string representation of a distinguished name. Two different forms
are supported:

*   OpenSSL format (`X509_NAME_oneline()`) used by `#to_s`. For example:
    `/DC=com/DC=example/CN=nobody`
*   OpenSSL format (`X509_NAME_print()`) used by
    `#to_s(OpenSSL::X509::Name::COMPAT)`. For example: `DC=com, DC=example,
    CN=nobody`

Neither of them is standardized and has quirks and inconsistencies in handling
of escaped characters or multi-valued RDNs.

Use of this method is discouraged in new applications. See Name.parse_rfc2253
and #to_utf8 for the alternative.
## parse_rfc2253(str , template OBJECT_TYPE_TEMPLATE) [](#method-c-parse_rfc2253)
Parses the UTF-8 string representation of a distinguished name, according to
RFC 2253.

See also #to_utf8 for the opposite operation.

#Instance Methods
## <(y) [](#method-i-<)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than 0.

**@overload** [] 

## <=(y) [](#method-i-<=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than or equal to 0.

**@overload** [] 

## ==(y) [](#method-i-==)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns 0. Also returns true if *obj* and *other* are the same object.

**@overload** [] 

## >(y) [](#method-i->)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than 0.

**@overload** [] 

## >=(y) [](#method-i->=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than or equal to 0.

**@overload** [] 

## _dump(_level) [](#method-i-_dump)

## add_entry(*args) [](#method-i-add_entry)
Adds a new entry with the given *oid* and *value* to this name.  The *oid* is
an object identifier defined in ASN.1.  Some common OIDs are:

C
:   Country Name

CN
:   Common Name

DC
:   Domain Component

O
:   Organization Name

OU
:   Organizational Unit Name

ST
:   State or Province Name


The optional keyword parameters *loc* and *set* specify where to insert the
new attribute. Refer to the manpage of X509_NAME_add_entry(3) for details.
*loc* defaults to -1 and *set* defaults to 0. This appends a single-valued RDN
to the end.

**@overload** [] 

## between?(min, max) [](#method-i-between?)
Returns `false` if *obj* `<=>` *min* is less than zero or if *obj* `<=>` *max*
is greater than zero, `true` otherwise.

    3.between?(1, 5)               #=> true
    6.between?(1, 5)               #=> false
    'cat'.between?('ant', 'dog')   #=> true
    'gnu'.between?('ant', 'dog')   #=> false

**@overload** [] 

## clamp(*args) [](#method-i-clamp)
In `(min, max)` form, returns *min* if *obj* `<=>` *min* is less than zero,
*max* if *obj* `<=>` *max* is greater than zero, and *obj* otherwise.

    12.clamp(0, 100)         #=> 12
    523.clamp(0, 100)        #=> 100
    -3.123.clamp(0, 100)     #=> 0

    'd'.clamp('a', 'f')      #=> 'd'
    'z'.clamp('a', 'f')      #=> 'f'

If *min* is `nil`, it is considered smaller than *obj*, and if *max* is `nil`,
it is considered greater than *obj*.

    -20.clamp(0, nil)           #=> 0
    523.clamp(nil, 100)         #=> 100

In `(range)` form, returns *range.begin* if *obj* `<=>` *range.begin* is less
than zero, *range.end* if *obj* `<=>` *range.end* is greater than zero, and
*obj* otherwise.

    12.clamp(0..100)         #=> 12
    523.clamp(0..100)        #=> 100
    -3.123.clamp(0..100)     #=> 0

    'd'.clamp('a'..'f')      #=> 'd'
    'z'.clamp('a'..'f')      #=> 'f'

If *range.begin* is `nil`, it is considered smaller than *obj*, and if
*range.end* is `nil`, it is considered greater than *obj*.

    -20.clamp(0..)           #=> 0
    523.clamp(..100)         #=> 100

When *range.end* is excluded and not `nil`, an exception is raised.

    100.clamp(0...100)       # ArgumentError

**@overload** [] 

**@overload** [] 

## cmp(other) [](#method-i-cmp)
Compares this Name with *other* and returns `0` if they are the same and `-1`
or `+1` if they are greater or less than each other respectively. Returns
`nil` if they are not comparable (i.e. different types).

**@overload** [] 

**@overload** [] 

## eql?(other) [](#method-i-eql?)
Returns true if *name* and *other* refer to the same hash key.

**@overload** [] 

**@return** [Boolean] 

## hash() [](#method-i-hash)
The hash value returned is suitable for use as a certificate's filename in a
CA path.

**@overload** [] 

## hash_old() [](#method-i-hash_old)
Returns an MD5 based hash used in OpenSSL 0.9.X.

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Creates a new Name.

A name may be created from a DER encoded string *der*, an Array representing a
*distinguished_name* or a *distinguished_name* along with a *template*.

    name = OpenSSL::X509::Name.new [['CN', 'nobody'], ['DC', 'example']]

    name = OpenSSL::X509::Name.new name.to_der

See add_entry for a description of the *distinguished_name* Array's contents

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## inspect() [](#method-i-inspect)
:nodoc:

## pretty_print(q) [](#method-i-pretty_print)

## to_a() [](#method-i-to_a)
Returns an Array representation of the distinguished name suitable for passing
to ::new

**@overload** [] 

## to_der() [](#method-i-to_der)
Converts the name to DER encoding

**@overload** [] 

## to_s(*args) [](#method-i-to_s)
Returns a String representation of the Distinguished Name. *format* is one of:

*   OpenSSL::X509::Name::COMPAT
*   OpenSSL::X509::Name::RFC2253
*   OpenSSL::X509::Name::ONELINE
*   OpenSSL::X509::Name::MULTILINE

If *format* is omitted, the largely broken and traditional OpenSSL format
(`X509_NAME_oneline()` format) is chosen.

**Use of this method is discouraged.** None of the formats other than
OpenSSL::X509::Name::RFC2253 is standardized and may show an inconsistent
behavior through OpenSSL versions.

It is recommended to use #to_utf8 instead, which is equivalent to calling
`name.to_s(OpenSSL::X509::Name::RFC2253).force_encoding("UTF-8")`.

**@overload** [] 

**@overload** [] 

## to_utf8() [](#method-i-to_utf8)
Returns an UTF-8 representation of the distinguished name, as specified in
[RFC 2253](https://www.ietf.org/rfc/rfc2253.txt).

**@overload** [] 

