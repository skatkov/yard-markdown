# Module: OpenSSL::ASN1::TaggedASN1Data
    



# Attributes
## tagging[RW] [](#attribute-i-tagging)
May be used as a hint for encoding a value either implicitly or explicitly by
setting it either to `:IMPLICIT` or to `:EXPLICIT`. *tagging* is not set when
a ASN.1 structure is parsed using OpenSSL::ASN1.decode.


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

