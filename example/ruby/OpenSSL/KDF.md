# Module: OpenSSL::KDF
    

Provides functionality of various KDFs (key derivation function).

KDF is typically used for securely deriving arbitrary length symmetric keys to
be used with an OpenSSL::Cipher from passwords. Another use case is for
storing passwords: Due to the ability to tweak the effort of computation by
increasing the iteration count, computation can be slowed down artificially in
order to render possible attacks infeasible.

Currently, OpenSSL::KDF provides implementations for the following KDF:

*   PKCS #5 PBKDF2 (Password-Based Key Derivation Function 2) in combination
    with HMAC
*   scrypt
*   HKDF

## Examples
### Generating a 128 bit key for a Cipher (e.g. AES)
    pass = "secret"
    salt = OpenSSL::Random.random_bytes(16)
    iter = 20_000
    key_len = 16
    key = OpenSSL::KDF.pbkdf2_hmac(pass, salt: salt, iterations: iter,
                                   length: key_len, hash: "sha1")

### Storing Passwords
    pass = "secret"
    # store this with the generated value
    salt = OpenSSL::Random.random_bytes(16)
    iter = 20_000
    hash = OpenSSL::Digest.new('SHA256')
    len = hash.digest_length
    # the final value to be stored
    value = OpenSSL::KDF.pbkdf2_hmac(pass, salt: salt, iterations: iter,
                                     length: len, hash: hash)

## Important Note on Checking Passwords
When comparing passwords provided by the user with previously stored values, a
common mistake made is comparing the two values using "==". Typically, "=="
short-circuits on evaluation, and is therefore vulnerable to timing attacks.
The proper way is to use a method that always takes the same amount of time
when comparing two values, thus not leaking any information to potential
attackers. To do this, use `OpenSSL.fixed_length_secure_compare`.


# Class Methods
## hkdf(*args ) [](#method-c-hkdf)
HMAC-based Extract-and-Expand Key Derivation Function (HKDF) as specified in
[RFC 5869](https://www.rfc-editor.org/rfc/rfc5869).

New in OpenSSL 1.1.0.

### Parameters
*ikm*
:   The input keying material.

*salt*
:   The salt.

*info*
:   The context and application specific information.

*length*
:   The output length in octets. Must be <= `255 * HashLen`, where HashLen is
    the length of the hash function output in octets.

*hash*
:   The hash function.


### Example
    # The values from https://www.rfc-editor.org/rfc/rfc5869#appendix-A.1
    ikm = ["0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b"].pack("H*")
    salt = ["000102030405060708090a0b0c"].pack("H*")
    info = ["f0f1f2f3f4f5f6f7f8f9"].pack("H*")
    p OpenSSL::KDF.hkdf(ikm, salt: salt, info: info, length: 42, hash: "SHA256").unpack1("H*")
    # => "3cb25f25faacd57a90434f64d0362f2a2d2d0a90cf1a5a4c5db02d56ecc4c5bf34007208d5b887185865"
**@overload** [] 

## pbkdf2_hmac(*args ) [](#method-c-pbkdf2_hmac)
PKCS #5 PBKDF2 (Password-Based Key Derivation Function 2) in combination with
HMAC. Takes *pass*, *salt* and *iterations*, and then derives a key of
*length* bytes.

For more information about PBKDF2, see RFC 2898 Section 5.2
(https://www.rfc-editor.org/rfc/rfc2898#section-5.2).

### Parameters
pass
:   The password.

salt
:   The salt. Salts prevent attacks based on dictionaries of common passwords
    and attacks based on rainbow tables. It is a public value that can be
    safely stored along with the password (e.g. if the derived value is used
    for password storage).

iterations
:   The iteration count. This provides the ability to tune the algorithm. It
    is better to use the highest count possible for the maximum resistance to
    brute-force attacks.

length
:   The desired length of the derived key in octets.

hash
:   The hash algorithm used with HMAC for the PRF. May be a String
    representing the algorithm name, or an instance of OpenSSL::Digest.

**@overload** [] 

## scrypt(*args ) [](#method-c-scrypt)
Derives a key from *pass* using given parameters with the scrypt
password-based key derivation function. The result can be used for password
storage.

scrypt is designed to be memory-hard and more secure against brute-force
attacks using custom hardwares than alternative KDFs such as PBKDF2 or bcrypt.

The keyword arguments *N*, *r* and *p* can be used to tune scrypt. RFC 7914
(published on 2016-08, https://www.rfc-editor.org/rfc/rfc7914#section-2)
states that using values r=8 and p=1 appears to yield good results.

See RFC 7914 (https://www.rfc-editor.org/rfc/rfc7914) for more information.

### Parameters
pass
:   Passphrase.

salt
:   Salt.

N
:   CPU/memory cost parameter. This must be a power of 2.

r
:   Block size parameter.

p
:   Parallelization parameter.

length
:   Length in octets of the derived key.


### Example
    pass = "password"
    salt = SecureRandom.random_bytes(16)
    dk = OpenSSL::KDF.scrypt(pass, salt: salt, N: 2**14, r: 8, p: 1, length: 32)
    p dk #=> "\xDA\xE4\xE2...\x7F\xA1\x01T"
**@overload** [] 


