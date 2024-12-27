# Class: OpenSSL::ASN1::Primitive
**Inherits:** OpenSSL::ASN1::ASN1Data
    
**Includes:** OpenSSL::ASN1::TaggedASN1Data
  

The parent class for all primitive encodings. Attributes are the same as for
ASN1Data, with the addition of *tagging*. Primitive values can never be
encoded with indefinite length form, thus it is not possible to set the
*indefinite_length* attribute for Primitive and its sub-classes.

## Primitive sub-classes and their mapping to Ruby classes
*   OpenSSL::ASN1::EndOfContent    <=> *value* is always `nil`
*   OpenSSL::ASN1::Boolean         <=> *value* is `true` or `false`
*   OpenSSL::ASN1::Integer         <=> *value* is an OpenSSL::BN
*   OpenSSL::ASN1::BitString       <=> *value* is a String
*   OpenSSL::ASN1::OctetString     <=> *value* is a String
*   OpenSSL::ASN1::Null            <=> *value* is always `nil`
*   OpenSSL::ASN1::Object          <=> *value* is a String
*   OpenSSL::ASN1::Enumerated      <=> *value* is an OpenSSL::BN
*   OpenSSL::ASN1::UTF8String      <=> *value* is a String
*   OpenSSL::ASN1::NumericString   <=> *value* is a String
*   OpenSSL::ASN1::PrintableString <=> *value* is a String
*   OpenSSL::ASN1::T61String       <=> *value* is a String
*   OpenSSL::ASN1::VideotexString  <=> *value* is a String
*   OpenSSL::ASN1::IA5String       <=> *value* is a String
*   OpenSSL::ASN1::UTCTime         <=> *value* is a Time
*   OpenSSL::ASN1::GeneralizedTime <=> *value* is a Time
*   OpenSSL::ASN1::GraphicString   <=> *value* is a String
*   OpenSSL::ASN1::ISO64String     <=> *value* is a String
*   OpenSSL::ASN1::GeneralString   <=> *value* is a String
*   OpenSSL::ASN1::UniversalString <=> *value* is a String
*   OpenSSL::ASN1::BMPString       <=> *value* is a String

## OpenSSL::ASN1::BitString

### Additional attributes
*unused_bits*: if the underlying BIT STRING's length is a multiple of 8 then
*unused_bits* is 0. Otherwise *unused_bits* indicates the number of bits that
are to be ignored in the final octet of the BitString's *value*.

## OpenSSL::ASN1::ObjectId

NOTE: While OpenSSL::ASN1::ObjectId.new will allocate a new ObjectId, it is
not typically allocated this way, but rather that are received from parsed
ASN1 encodings.

### Additional attributes
*   *sn*: the short name as defined in <openssl/objects.h>.
*   *ln*: the long name as defined in <openssl/objects.h>.
*   *oid*: the object identifier as a String, e.g. "1.2.3.4.5"
*   *short_name*: alias for *sn*.
*   *long_name*: alias for *ln*.

## Examples
With the Exception of OpenSSL::ASN1::EndOfContent, each Primitive class
constructor takes at least one parameter, the *value*.

### Creating EndOfContent
    eoc = OpenSSL::ASN1::EndOfContent.new

### Creating any other Primitive
    prim = <class>.new(value) # <class> being one of the sub-classes except EndOfContent
    prim_zero_tagged_implicit = <class>.new(value, 0, :IMPLICIT)
    prim_zero_tagged_explicit = <class>.new(value, 0, :EXPLICIT)



#Instance Methods
## initialize(value, tagnil, taggingnil, tag_classnil) [](#method-i-initialize)
:call-seq:
    OpenSSL::ASN1::Primitive.new(value [, tag, tagging, tag_class ]) => Primitive

*value*: is mandatory.

*tag*: optional, may be specified for tagged values. If no *tag* is specified,
the UNIVERSAL tag corresponding to the Primitive sub-class is used by default.

*tagging*: may be used as an encoding hint to encode a value either explicitly
or implicitly, see ASN1 for possible values.

*tag_class*: if *tag* and *tagging* are `nil` then this is set to `:UNIVERSAL`
by default. If either *tag* or *tagging* are set then `:CONTEXT_SPECIFIC` is
used as the default. For possible values please cf. ASN1.

## Example
    int = OpenSSL::ASN1::Integer.new(42)
    zero_tagged_int = OpenSSL::ASN1::Integer.new(42, 0, :IMPLICIT)
    private_explicit_zero_tagged_int = OpenSSL::ASN1::Integer.new(42, 0, :EXPLICIT, :PRIVATE)

**@raise** [ASN1Error] 

## to_der() [](#method-i-to_der)
See ASN1Data#to_der for details.

**@overload** [] 

