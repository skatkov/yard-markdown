# Class: OpenSSL::ASN1::ASN1Data
**Inherits:** Object
    

The top-level class representing any ASN.1 object. When parsed by ASN1.decode,
tagged values are always represented by an instance of ASN1Data.

## The role of ASN1Data for parsing tagged values

When encoding an ASN.1 type it is inherently clear what original type (e.g.
INTEGER, OCTET STRING etc.) this value has, regardless of its tagging. But
opposed to the time an ASN.1 type is to be encoded, when parsing them it is
not possible to deduce the "real type" of tagged values. This is why tagged
values are generally parsed into ASN1Data instances, but with a different
outcome for implicit and explicit tagging.

### Example of a parsed implicitly tagged value

An implicitly 1-tagged INTEGER value will be parsed as an ASN1Data with
*   *tag* equal to 1
*   *tag_class* equal to `:CONTEXT_SPECIFIC`
*   *value* equal to a String that carries the raw encoding of the INTEGER.
This implies that a subsequent decoding step is required to completely decode
implicitly tagged values.

### Example of a parsed explicitly tagged value

An explicitly 1-tagged INTEGER value will be parsed as an ASN1Data with
*   *tag* equal to 1
*   *tag_class* equal to `:CONTEXT_SPECIFIC`
*   *value* equal to an Array with one single element, an instance of
    OpenSSL::ASN1::Integer, i.e. the inner element is the non-tagged primitive
    value, and the tagging is represented in the outer ASN1Data

## Example - Decoding an implicitly tagged INTEGER
    int = OpenSSL::ASN1::Integer.new(1, 0, :IMPLICIT) # implicit 0-tagged
    seq = OpenSSL::ASN1::Sequence.new( [int] )
    der = seq.to_der
    asn1 = OpenSSL::ASN1.decode(der)
    # pp asn1 => #<OpenSSL::ASN1::Sequence:0x87326e0
    #              @indefinite_length=false,
    #              @tag=16,
    #              @tag_class=:UNIVERSAL,
    #              @tagging=nil,
    #              @value=
    #                [#<OpenSSL::ASN1::ASN1Data:0x87326f4
    #                   @indefinite_length=false,
    #                   @tag=0,
    #                   @tag_class=:CONTEXT_SPECIFIC,
    #                   @value="\x01">]>
    raw_int = asn1.value[0]
    # manually rewrite tag and tag class to make it an UNIVERSAL value
    raw_int.tag = OpenSSL::ASN1::INTEGER
    raw_int.tag_class = :UNIVERSAL
    int2 = OpenSSL::ASN1.decode(raw_int)
    puts int2.value # => 1

## Example - Decoding an explicitly tagged INTEGER
    int = OpenSSL::ASN1::Integer.new(1, 0, :EXPLICIT) # explicit 0-tagged
    seq = OpenSSL::ASN1::Sequence.new( [int] )
    der = seq.to_der
    asn1 = OpenSSL::ASN1.decode(der)
    # pp asn1 => #<OpenSSL::ASN1::Sequence:0x87326e0
    #              @indefinite_length=false,
    #              @tag=16,
    #              @tag_class=:UNIVERSAL,
    #              @tagging=nil,
    #              @value=
    #                [#<OpenSSL::ASN1::ASN1Data:0x87326f4
    #                   @indefinite_length=false,
    #                   @tag=0,
    #                   @tag_class=:CONTEXT_SPECIFIC,
    #                   @value=
    #                     [#<OpenSSL::ASN1::Integer:0x85bf308
    #                        @indefinite_length=false,
    #                        @tag=2,
    #                        @tag_class=:UNIVERSAL
    #                        @tagging=nil,
    #                        @value=1>]>]>
    int2 = asn1.value[0].value[0]
    puts int2.value # => 1


# Attributes
## indefinite_length[RW] [](#attribute-i-indefinite_length)
Never `nil`. A boolean value indicating whether the encoding uses indefinite
length (in the case of parsing) or whether an indefinite length form shall be
used (in the encoding case). In DER, every value uses definite length form.
But in scenarios where large amounts of data need to be transferred it might
be desirable to have some kind of streaming support available. For example,
huge OCTET STRINGs are preferably sent in smaller-sized chunks, each at a
time. This is possible in BER by setting the length bytes of an encoding to
zero and by this indicating that the following value will be sent in chunks.
Indefinite length encodings are always constructed. The end of such a stream
of chunks is indicated by sending a EOC (End of Content) tag. SETs and
SEQUENCEs may use an indefinite length encoding, but also primitive types such
as e.g. OCTET STRINGS or BIT STRINGS may leverage this functionality (cf.
ITU-T X.690).

## tag[RW] [](#attribute-i-tag)
An Integer representing the tag number of this ASN1Data. Never `nil`.

## tag_class[RW] [](#attribute-i-tag_class)
A Symbol representing the tag class of this ASN1Data. Never `nil`. See
ASN1Data for possible values.

## value[RW] [](#attribute-i-value)
Carries the value of a ASN.1 type. Please confer Constructive and Primitive
for the mappings between ASN.1 data types and Ruby classes.


#Instance Methods
## initialize(value, tag, tag_class) [](#method-i-initialize)
:call-seq:
    OpenSSL::ASN1::ASN1Data.new(value, tag, tag_class) => ASN1Data

*value*: Please have a look at Constructive and Primitive to see how Ruby
types are mapped to ASN.1 types and vice versa.

*tag*: An Integer indicating the tag number.

*tag_class*: A Symbol indicating the tag class. Please cf. ASN1 for possible
values.

## Example
    asn1_int = OpenSSL::ASN1Data.new(42, 2, :UNIVERSAL) # => Same as OpenSSL::ASN1::Integer.new(42)
    tagged_int = OpenSSL::ASN1Data.new(42, 0, :CONTEXT_SPECIFIC) # implicitly 0-tagged INTEGER

**@raise** [ASN1Error] 

**@return** [ASN1Data] a new instance of ASN1Data

## to_der() [](#method-i-to_der)
Encodes this ASN1Data into a DER-encoded String value. The result is
DER-encoded except for the possibility of indefinite length forms. Indefinite
length forms are not allowed in strict DER, so strictly speaking the result of
such an encoding would be a BER-encoding.

**@overload** [] 

