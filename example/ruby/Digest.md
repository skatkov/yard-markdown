# Module: Digest
    

This module provides a framework for message digest libraries.

You may want to look at OpenSSL::Digest as it supports more algorithms.

A cryptographic hash function is a procedure that takes data and returns a
fixed bit string: the hash value, also known as *digest*. Hash functions are
also called one-way functions, it is easy to compute a digest from a message,
but it is infeasible to generate a message from a digest.

## Examples

    require 'digest'

    # Compute a complete digest
    Digest::SHA256.digest 'message'       #=> "\xABS\n\x13\xE4Y..."

    sha256 = Digest::SHA256.new
    sha256.digest 'message'               #=> "\xABS\n\x13\xE4Y..."

    # Other encoding formats
    Digest::SHA256.hexdigest 'message'    #=> "ab530a13e459..."
    Digest::SHA256.base64digest 'message' #=> "q1MKE+RZFJgr..."

    # Compute digest by chunks
    md5 = Digest::MD5.new
    md5.update 'message1'
    md5 << 'message2'                     # << is an alias for update

    md5.hexdigest                         #=> "94af09c09bb9..."

    # Compute digest for a file
    sha256 = Digest::SHA256.file 'testfile'
    sha256.hexdigest

Additionally digests can be encoded in "bubble babble" format as a sequence of
consonants and vowels which is more recognizable and comparable than a
hexadecimal digest.

    require 'digest/bubblebabble'

    Digest::SHA256.bubblebabble 'message' #=> "xopoh-fedac-fenyh-..."

See the bubble babble specification at
http://web.mit.edu/kenta/www/one/bubblebabble/spec/jrtrjwzi/draft-huima-01.txt
.

## Digest algorithms

Different digest algorithms (or hash functions) are available:

MD5
:   See RFC 1321 The MD5 Message-Digest Algorithm

RIPEMD-160
:   As Digest::RMD160. See
    http://homes.esat.kuleuven.be/~bosselae/ripemd160.html.

SHA1
:   See FIPS 180 Secure Hash Standard.

SHA2 family
:   See FIPS 180 Secure Hash Standard which defines the following algorithms:
    *   SHA512
    *   SHA384
    *   SHA256


The latest versions of the FIPS publications can be found here:
http://csrc.nist.gov/publications/PubsFIPS.html.


# Class Methods
## bubblebabble(str ) [](#method-c-bubblebabble)
call-seq:
    Digest.bubblebabble(string) -> bubblebabble_string

Returns a BubbleBabble encoded version of a given *string*.
## const_missing(name ) [](#method-c-const_missing)
:nodoc:
## digests() [](#method-c-digests)
Returns the names of all available digests in an array.
**@overload** [] 

## hexencode(str ) [](#method-c-hexencode)
Generates a hex-encoded version of a given *string*.
**@overload** [] 


#Instance Methods
## block_length() [](#method-i-block_length)
Returns the block length of the digest algorithm, i.e. the length in bytes of
an individual block. Most modern algorithms partition a message to be digested
into a sequence of fix-sized blocks that are processed consecutively.

### Example
    digest = OpenSSL::Digest.new('SHA1')
    puts digest.block_length # => 64

**@overload** [] 

## digest_length() [](#method-i-digest_length)
Returns the output size of the digest, i.e. the length in bytes of the final
message digest result.

### Example
    digest = OpenSSL::Digest.new('SHA1')
    puts digest.digest_length # => 20

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Creates a Digest instance based on *string*, which is either the ln (long
name) or sn (short name) of a supported digest algorithm. A list of supported
algorithms can be obtained by calling OpenSSL::Digest.digests.

If *data* (a String) is given, it is used as the initial input to the Digest
instance, i.e.

    digest = OpenSSL::Digest.new('sha256', 'digestdata')

is equivalent to

    digest = OpenSSL::Digest.new('sha256')
    digest.update('digestdata')

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## name() [](#method-i-name)
Returns the short name of this Digest algorithm which may differ slightly from
the original name provided.

### Example
    digest = OpenSSL::Digest.new('SHA512')
    puts digest.name # => SHA512

**@overload** [] 

## reset() [](#method-i-reset)
Resets the Digest in the sense that any Digest#update that has been performed
is abandoned and the Digest is set to its initial state again.

**@overload** [] 

## update(data) [](#method-i-update)
Not every message digest can be computed in one single pass. If a message
digest is to be computed from several subsequent sources, then each may be
passed individually to the Digest instance.

### Example
    digest = OpenSSL::Digest.new('SHA256')
    digest.update('First input')
    digest << 'Second input' # equivalent to digest.update('Second input')
    result = digest.digest

**@overload** [] 

