# Module: Random::Formatter
    

## Random number formatter.

Formats generated random numbers in many manners. When `'random/formatter'` is
required, several methods are added to empty core module `Random::Formatter`,
making them available as Random's instance and module methods.

Standard library SecureRandom is also extended with the module, and the
methods described below are available as a module methods in it.

### Examples

Generate random hexadecimal strings:

    require 'random/formatter'

    prng = Random.new
    prng.hex(10) #=> "52750b30ffbc7de3b362"
    prng.hex(10) #=> "92b15d6c8dc4beb5f559"
    prng.hex(13) #=> "39b290146bea6ce975c37cfc23"
    # or just
    Random.hex #=> "1aed0c631e41be7f77365415541052ee"

Generate random base64 strings:

    prng.base64(10) #=> "EcmTPZwWRAozdA=="
    prng.base64(10) #=> "KO1nIU+p9DKxGg=="
    prng.base64(12) #=> "7kJSM/MzBJI+75j8"
    Random.base64(4) #=> "bsQ3fQ=="

Generate random binary strings:

    prng.random_bytes(10) #=> "\016\t{\370g\310pbr\301"
    prng.random_bytes(10) #=> "\323U\030TO\234\357\020\a\337"
    Random.random_bytes(6) #=> "\xA1\xE6Lr\xC43"

Generate alphanumeric strings:

    prng.alphanumeric(10) #=> "S8baxMJnPl"
    prng.alphanumeric(10) #=> "aOxAg8BAJe"
    Random.alphanumeric #=> "TmP9OsJHJLtaZYhP"

Generate UUIDs:

    prng.uuid #=> "2d931510-d99f-494a-8c67-87feb05e1594"
    prng.uuid #=> "bad85eb9-0713-4da7-8d36-07a8e4b00eab"
    Random.uuid #=> "f14e0271-de96-45cc-8911-8910292a42cd"

All methods are available in the standard library SecureRandom, too:

    SecureRandom.hex #=> "05b45376a30c67238eb93b16499e50cf"



#Instance Methods
## alphanumeric(nnil, chars:ALPHANUMERIC) [](#method-i-alphanumeric)
Generate a random alphanumeric string.

The argument *n* specifies the length, in characters, of the alphanumeric
string to be generated. The argument *chars* specifies the character list
which the result is consist of.

If *n* is not specified or is nil, 16 is assumed. It may be larger in the
future.

The result may contain A-Z, a-z and 0-9, unless *chars* is specified.

    require 'random/formatter'

    Random.alphanumeric     #=> "2BuBuLf3WfSKyQbR"
    # or
    prng = Random.new
    prng.alphanumeric(10) #=> "i6K93NdqiH"

    Random.alphanumeric(4, chars: [*"0".."9"]) #=> "2952"
    # or
    prng = Random.new
    prng.alphanumeric(10, chars: [*"!".."/"]) #=> ",.,++%/''."

## base64(nnil) [](#method-i-base64)
Generate a random base64 string.

The argument *n* specifies the length, in bytes, of the random number to be
generated. The length of the result string is about 4/3 of *n*.

If *n* is not specified or is nil, 16 is assumed. It may be larger in the
future.

The result may contain A-Z, a-z, 0-9, "+", "/" and "=".

    require 'random/formatter'

    Random.base64 #=> "/2BuBuLf3+WfSKyQbRcc/A=="
    # or
    prng = Random.new
    prng.base64 #=> "6BbW0pxO0YENxn38HMUbcQ=="

See RFC 3548 for the definition of base64.

## hex(nnil) [](#method-i-hex)
Generate a random hexadecimal string.

The argument *n* specifies the length, in bytes, of the random number to be
generated. The length of the resulting hexadecimal string is twice of *n*.

If *n* is not specified or is nil, 16 is assumed. It may be larger in the
future.

The result may contain 0-9 and a-f.

    require 'random/formatter'

    Random.hex #=> "eb693ec8252cd630102fd0d0fb7c3485"
    # or
    prng = Random.new
    prng.hex #=> "91dc3bfb4de5b11d029d376634589b61"

## rand(*args) [](#method-i-rand)
Generates formatted random number from raw random bytes. See Random#rand.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## random_bytes(nnil) [](#method-i-random_bytes)
Generate a random binary string.

The argument *n* specifies the length of the result string.

If *n* is not specified or is nil, 16 is assumed. It may be larger in future.

The result may contain any byte: "x00" - "xff".

    require 'random/formatter'

    Random.random_bytes #=> "\xD8\\\xE0\xF4\r\xB2\xFC*WM\xFF\x83\x18\xF45\xB6"
    # or
    prng = Random.new
    prng.random_bytes #=> "m\xDC\xFC/\a\x00Uf\xB2\xB2P\xBD\xFF6S\x97"

## random_number(*args) [](#method-i-random_number)
Generates formatted random number from raw random bytes. See Random#rand.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## urlsafe_base64(nnil, paddingfalse) [](#method-i-urlsafe_base64)
Generate a random URL-safe base64 string.

The argument *n* specifies the length, in bytes, of the random number to be
generated. The length of the result string is about 4/3 of *n*.

If *n* is not specified or is nil, 16 is assumed. It may be larger in the
future.

The boolean argument *padding* specifies the padding. If it is false or nil,
padding is not generated. Otherwise padding is generated. By default, padding
is not generated because "=" may be used as a URL delimiter.

The result may contain A-Z, a-z, 0-9, "-" and "_". "=" is also used if
*padding* is true.

    require 'random/formatter'

    Random.urlsafe_base64 #=> "b4GOKm4pOYU_-BOXcrUGDg"
    # or
    prng = Random.new
    prng.urlsafe_base64 #=> "UZLdOkzop70Ddx-IJR0ABg"

    prng.urlsafe_base64(nil, true) #=> "i0XQ-7gglIsHGV2_BNPrdQ=="
    prng.urlsafe_base64(nil, true) #=> "-M8rLhr7JEpJlqFGUMmOxg=="

See RFC 3548 for the definition of URL-safe base64.

## uuid() [](#method-i-uuid)
Generate a random v4 UUID (Universally Unique IDentifier).

    require 'random/formatter'

    Random.uuid #=> "2d931510-d99f-494a-8c67-87feb05e1594"
    Random.uuid #=> "bad85eb9-0713-4da7-8d36-07a8e4b00eab"
    # or
    prng = Random.new
    prng.uuid #=> "62936e70-1815-439b-bf89-8492855a7e6b"

The version 4 UUID is purely random (except the version). It doesn't contain
meaningful information such as MAC addresses, timestamps, etc.

The result contains 122 random bits (15.25 random bytes).

See [RFC9562](https://www.rfc-editor.org/rfc/rfc9562) for details of UUIDv4.

## uuid_v7(extra_timestamp_bits:0) [](#method-i-uuid_v7)
Generate a random v7 UUID (Universally Unique IDentifier).

    require 'random/formatter'

    Random.uuid_v7 # => "0188d4c3-1311-7f96-85c7-242a7aa58f1e"
    Random.uuid_v7 # => "0188d4c3-16fe-744f-86af-38fa04c62bb5"
    Random.uuid_v7 # => "0188d4c3-1af8-764f-b049-c204ce0afa23"
    Random.uuid_v7 # => "0188d4c3-1e74-7085-b14f-ef6415dc6f31"
    #                    |<--sorted-->| |<----- random ---->|

    # or
    prng = Random.new
    prng.uuid_v7 # => "0188ca51-5e72-7950-a11d-def7ff977c98"

The version 7 UUID starts with the least significant 48 bits of a 64 bit Unix
timestamp (milliseconds since the epoch) and fills the remaining bits with
random data, excluding the version and variant bits.

This allows version 7 UUIDs to be sorted by creation time.  Time ordered UUIDs
can be used for better database index locality of newly inserted records,
which may have a significant performance benefit compared to random data
inserts.

The result contains 74 random bits (9.25 random bytes).

Note that this method cannot be made reproducible because its output includes
not only random bits but also timestamp.

See [RFC9562](https://www.rfc-editor.org/rfc/rfc9562) for details of UUIDv7.

#### Monotonicity

UUIDv7 has millisecond precision by default, so multiple UUIDs created within
the same millisecond are not issued in monotonically increasing order.  To
create UUIDs that are time-ordered with sub-millisecond precision, up to 12
bits of additional timestamp may added with `extra_timestamp_bits`.  The extra
timestamp precision comes at the expense of random bits.  Setting
`extra_timestamp_bits: 12` provides ~244ns of precision, but only 62 random
bits (7.75 random bytes).

    prng = Random.new
    Array.new(4) { prng.uuid_v7(extra_timestamp_bits: 12) }
    # =>
    ["0188d4c7-13da-74f9-8b53-22a786ffdd5a",
     "0188d4c7-13da-753b-83a5-7fb9b2afaeea",
     "0188d4c7-13da-754a-88ea-ac0baeedd8db",
     "0188d4c7-13da-7557-83e1-7cad9cda0d8d"]
    # |<--- sorted --->| |<-- random --->|

    Array.new(4) { prng.uuid_v7(extra_timestamp_bits: 8) }
    # =>
    ["0188d4c7-3333-7a95-850a-de6edb858f7e",
     "0188d4c7-3333-7ae8-842e-bc3a8b7d0cf9",  # <- out of order
     "0188d4c7-3333-7ae2-995a-9f135dc44ead",  # <- out of order
     "0188d4c7-3333-7af9-87c3-8f612edac82e"]
    # |<--- sorted -->||<---- random --->|

Any rollbacks of the system clock will break monotonicity.  UUIDv7 is based on
UTC, which excludes leap seconds and can rollback the clock.  To avoid this,
the system clock can synchronize with an NTP server configured to use a "leap
smear" approach.  NTP or PTP will also be needed to synchronize across
distributed nodes.

Counters and other mechanisms for stronger guarantees of monotonicity are not
implemented.  Applications with stricter requirements should follow [Section
6.2](https://www.rfc-editor.org/rfc/rfc9562.html#name-monotonicity-and-counter
s) of the specification.

