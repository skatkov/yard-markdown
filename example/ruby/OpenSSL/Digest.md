# Class: OpenSSL::Digest
**Inherits:** Object
    

OpenSSL::Digest allows you to compute message digests (sometimes
interchangeably called "hashes") of arbitrary data that are cryptographically
secure, i.e. a Digest implements a secure one-way function.

One-way functions offer some useful properties. E.g. given two distinct inputs
the probability that both yield the same output is highly unlikely. Combined
with the fact that every message digest algorithm has a fixed-length output of
just a few bytes, digests are often used to create unique identifiers for
arbitrary data. A common example is the creation of a unique id for binary
documents that are stored in a database.

Another useful characteristic of one-way functions (and thus the name) is that
given a digest there is no indication about the original data that produced
it, i.e. the only way to identify the original input is to "brute-force"
through every possible combination of inputs.

These characteristics make one-way functions also ideal companions for public
key signature algorithms: instead of signing an entire document, first a hash
of the document is produced with a considerably faster message digest
algorithm and only the few bytes of its output need to be signed using the
slower public key algorithm. To validate the integrity of a signed document,
it suffices to re-compute the hash and verify that it is equal to that in the
signature.

You can get a list of all digest algorithms supported on your system by
running this command in your terminal:

    openssl list -digest-algorithms

Among the OpenSSL 1.1.1 supported message digest algorithms are:
*   SHA224, SHA256, SHA384, SHA512, SHA512-224 and SHA512-256
*   SHA3-224, SHA3-256, SHA3-384 and SHA3-512
*   BLAKE2s256 and BLAKE2b512

Each of these algorithms can be instantiated using the name:

    digest = OpenSSL::Digest.new('SHA256')

"Breaking" a message digest algorithm means defying its one-way function
characteristics, i.e. producing a collision or finding a way to get to the
original data by means that are more efficient than brute-forcing etc. Most of
the supported digest algorithms can be considered broken in this sense, even
the very popular MD5 and SHA1 algorithms. Should security be your highest
concern, then you should probably rely on SHA224, SHA256, SHA384 or SHA512.

### Hashing a file

    data = File.binread('document')
    sha256 = OpenSSL::Digest.new('SHA256')
    digest = sha256.digest(data)

### Hashing several pieces of data at once

    data1 = File.binread('file1')
    data2 = File.binread('file2')
    data3 = File.binread('file3')
    sha256 = OpenSSL::Digest.new('SHA256')
    sha256 << data1
    sha256 << data2
    sha256 << data3
    digest = sha256.digest

### Reuse a Digest instance

    data1 = File.binread('file1')
    sha256 = OpenSSL::Digest.new('SHA256')
    digest1 = sha256.digest(data1)

    data2 = File.binread('file2')
    sha256.reset
    digest2 = sha256.digest(data2)


# Class Methods
## digest(name , data ) [](#method-c-digest)
Return the hash value computed with *name* Digest. *name* is either the long
name or short name of a supported digest algorithm.

### Example

    OpenSSL::Digest.digest("SHA256", "abc")

