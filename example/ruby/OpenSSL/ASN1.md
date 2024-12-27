# Module: OpenSSL::ASN1
    

Abstract Syntax Notation One (or ASN.1) is a notation syntax to describe data
structures and is defined in ITU-T X.680. ASN.1 itself does not mandate any
encoding or parsing rules, but usually ASN.1 data structures are encoded using
the Distinguished Encoding Rules (DER) or less often the Basic Encoding Rules
(BER) described in ITU-T X.690. DER and BER encodings are binary
Tag-Length-Value (TLV) encodings that are quite concise compared to other
popular data description formats such as XML, JSON etc. ASN.1 data structures
are very common in cryptographic applications, e.g. X.509 public key
certificates or certificate revocation lists (CRLs) are all defined in ASN.1
and DER-encoded. ASN.1, DER and BER are the building blocks of applied
cryptography. The ASN1 module provides the necessary classes that allow
generation of ASN.1 data structures and the methods to encode them using a DER
encoding. The decode method allows parsing arbitrary BER-/DER-encoded data to
a Ruby object that can then be modified and re-encoded at will.

## ASN.1 class hierarchy

The base class representing ASN.1 structures is ASN1Data. ASN1Data offers
attributes to read and set the *tag*, the *tag_class* and finally the *value*
of a particular ASN.1 item. Upon parsing, any tagged values (implicit or
explicit) will be represented by ASN1Data instances because their "real type"
can only be determined using out-of-band information from the ASN.1 type
declaration. Since this information is normally known when encoding a type,
all sub-classes of ASN1Data offer an additional attribute *tagging* that
allows to encode a value implicitly (`:IMPLICIT`) or explicitly (`:EXPLICIT`).

### Constructive

Constructive is, as its name implies, the base class for all constructed
encodings, i.e. those that consist of several values, opposed to "primitive"
encodings with just one single value. The value of an Constructive is always
an Array.

#### ASN1::Set and ASN1::Sequence

The most common constructive encodings are SETs and SEQUENCEs, which is why
there are two sub-classes of Constructive representing each of them.

### Primitive

This is the super class of all primitive values. Primitive itself is not used
when parsing ASN.1 data, all values are either instances of a corresponding
sub-class of Primitive or they are instances of ASN1Data if the value was
tagged implicitly or explicitly. Please cf. Primitive documentation for
details on sub-classes and their respective mappings of ASN.1 data types to
Ruby objects.

## Possible values for *tagging*

When constructing an ASN1Data object the ASN.1 type definition may require
certain elements to be either implicitly or explicitly tagged. This can be
achieved by setting the *tagging* attribute manually for sub-classes of
ASN1Data. Use the symbol `:IMPLICIT` for implicit tagging and `:EXPLICIT` if
the element requires explicit tagging.

## Possible values for *tag_class*

It is possible to create arbitrary ASN1Data objects that also support a
PRIVATE or APPLICATION tag class. Possible values for the *tag_class*
attribute are:
*   `:UNIVERSAL` (the default for untagged values)
*   `:CONTEXT_SPECIFIC` (the default for tagged values)
*   `:APPLICATION`
*   `:PRIVATE`

## Tag constants

There is a constant defined for each universal tag:
*   OpenSSL::ASN1::EOC (0)
*   OpenSSL::ASN1::BOOLEAN (1)
*   OpenSSL::ASN1::INTEGER (2)
*   OpenSSL::ASN1::BIT_STRING (3)
*   OpenSSL::ASN1::OCTET_STRING (4)
*   OpenSSL::ASN1::NULL (5)
*   OpenSSL::ASN1::OBJECT (6)
*   OpenSSL::ASN1::ENUMERATED (10)
*   OpenSSL::ASN1::UTF8STRING (12)
*   OpenSSL::ASN1::SEQUENCE (16)
*   OpenSSL::ASN1::SET (17)
*   OpenSSL::ASN1::NUMERICSTRING (18)
*   OpenSSL::ASN1::PRINTABLESTRING (19)
*   OpenSSL::ASN1::T61STRING (20)
*   OpenSSL::ASN1::VIDEOTEXSTRING (21)
*   OpenSSL::ASN1::IA5STRING (22)
*   OpenSSL::ASN1::UTCTIME (23)
*   OpenSSL::ASN1::GENERALIZEDTIME (24)
*   OpenSSL::ASN1::GRAPHICSTRING (25)
*   OpenSSL::ASN1::ISO64STRING (26)
*   OpenSSL::ASN1::GENERALSTRING (27)
*   OpenSSL::ASN1::UNIVERSALSTRING (28)
*   OpenSSL::ASN1::BMPSTRING (30)

## UNIVERSAL_TAG_NAME constant

An Array that stores the name of a given tag number. These names are the same
as the name of the tag constant that is additionally defined, e.g.
`UNIVERSAL_TAG_NAME[2] = "INTEGER"` and `OpenSSL::ASN1::INTEGER = 2`.

## Example usage

### Decoding and viewing a DER-encoded file
    require 'openssl'
    require 'pp'
    der = File.binread('data.der')
    asn1 = OpenSSL::ASN1.decode(der)
    pp der

### Creating an ASN.1 structure and DER-encoding it
    require 'openssl'
    version = OpenSSL::ASN1::Integer.new(1)
    # Explicitly 0-tagged implies context-specific tag class
    serial = OpenSSL::ASN1::Integer.new(12345, 0, :EXPLICIT, :CONTEXT_SPECIFIC)
    name = OpenSSL::ASN1::PrintableString.new('Data 1')
    sequence = OpenSSL::ASN1::Sequence.new( [ version, serial, name ] )
    der = sequence.to_der


# Class Methods
## decode(obj ) [](#method-c-decode)
Decodes a BER- or DER-encoded value and creates an ASN1Data instance. *der*
may be a String or any object that features a `.to_der` method transforming it
into a BER-/DER-encoded String+

## Example
    der = File.binread('asn1data')
    asn1 = OpenSSL::ASN1.decode(der)
**@overload** [] 

## decode_all(obj ) [](#method-c-decode_all)
Similar to #decode with the difference that #decode expects one distinct value
represented in *der*. #decode_all on the contrary decodes a sequence of
sequential BER/DER values lined up in *der* and returns them as an array.

## Example
    ders = File.binread('asn1data_seq')
    asn1_ary = OpenSSL::ASN1.decode_all(ders)
**@overload** [] 

## take_default_tag(klass ) [](#method-c-take_default_tag)
:nodoc:
## traverse(obj ) [](#method-c-traverse)
If a block is given, it prints out each of the elements encountered. Block
parameters are (in that order):
*   depth: The recursion depth, plus one with each constructed value being
    encountered (Integer)
*   offset: Current byte offset (Integer)
*   header length: Combined length in bytes of the Tag and Length headers.
    (Integer)
*   length: The overall remaining length of the entire data (Integer)
*   constructed: Whether this value is constructed or not (Boolean)
*   tag_class: Current tag class (Symbol)
*   tag: The current tag number (Integer)

## Example
    der = File.binread('asn1data.der')
    OpenSSL::ASN1.traverse(der) do | depth, offset, header_len, length, constructed, tag_class, tag|
      puts "Depth: #{depth} Offset: #{offset} Length: #{length}"
      puts "Header length: #{header_len} Tag: #{tag} Tag class: #{tag_class} Constructed: #{constructed}"
    end
**@overload** [] 


