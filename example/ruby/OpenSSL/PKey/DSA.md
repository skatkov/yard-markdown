# Class: OpenSSL::PKey::DSA
**Inherits:** OpenSSL::PKey::PKey
    
**Includes:** OpenSSL::Marshal
  

DSA, the Digital Signature Algorithm, is specified in NIST's FIPS 186-3. It is
an asymmetric public key algorithm that may be used similar to e.g. RSA.


# Class Methods
## generate(size , &blk ) [](#method-c-generate)
:call-seq:
    DSA.generate(size) -> dsa

Creates a new DSA instance by generating a private/public key pair from
scratch.

See also OpenSSL::PKey.generate_parameters and OpenSSL::PKey.generate_key.

`size`
:   The desired key size in bits.

## new(*args , &blk ) [](#method-c-new)
Handle DSA.new(size) form here; new(str) and new() forms are handled by
#initialize

#Instance Methods
## _dump(_level) [](#method-i-_dump)

## export(*args) [](#method-i-export)
Serializes a private or public key to a PEM-encoding.

When the key contains public components only
:   Serializes it into an X.509 SubjectPublicKeyInfo. The parameters *cipher*
    and *password* are ignored.

    A PEM-encoded key will look like:

        -----BEGIN PUBLIC KEY-----
        [...]
        -----END PUBLIC KEY-----

    Consider using #public_to_pem instead. This serializes the key into an
    X.509 SubjectPublicKeyInfo regardless of whether it is a public key or a
    private key.


When the key contains private components, and no parameters are given
:   Serializes it into a traditional OpenSSL DSAPrivateKey.

    A PEM-encoded key will look like:

        -----BEGIN DSA PRIVATE KEY-----
        [...]
        -----END DSA PRIVATE KEY-----


When the key contains private components, and *cipher* and *password* are given
:   Serializes it into a traditional OpenSSL DSAPrivateKey and encrypts it in
    OpenSSL's traditional PEM encryption format. *cipher* must be a cipher
    name understood by OpenSSL::Cipher.new or an instance of OpenSSL::Cipher.

    An encrypted PEM-encoded key will look like:

        -----BEGIN DSA PRIVATE KEY-----
        Proc-Type: 4,ENCRYPTED
        DEK-Info: AES-128-CBC,733F5302505B34701FC41F5C0746E4C0

        [...]
        -----END DSA PRIVATE KEY-----

    Note that this format uses MD5 to derive the encryption key, and hence
    will not be available on FIPS-compliant systems.


**This method is kept for compatibility.** This should only be used when the
traditional, non-standard OpenSSL format is required.

Consider using #public_to_pem (X.509 SubjectPublicKeyInfo) or #private_to_pem
(PKCS #8 PrivateKeyInfo or EncryptedPrivateKeyInfo) instead.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Creates a new DSA instance by reading an existing key from *string*.

If called without arguments, creates a new instance with no key components
set. They can be set individually by #set_pqg and #set_key.

If called with a String, tries to parse as DER or PEM encoding of a DSA key.
See also OpenSSL::PKey.read which can parse keys of any kinds.

If called with a number, generates random parameters and a key pair. This form
works as an alias of DSA.generate.

`string`
:   A String that contains a DER or PEM encoded key.

`pass`
:   A String that contains an optional password.

`size`
:   See DSA.generate.


Examples:
    p OpenSSL::PKey::DSA.new(1024)
    #=> #<OpenSSL::PKey::DSA:0x000055a8d6025bf0 oid=DSA>

    p OpenSSL::PKey::DSA.new(File.read('dsa.pem'))
    #=> #<OpenSSL::PKey::DSA:0x000055555d6b8110 oid=DSA>

    p OpenSSL::PKey::DSA.new(File.read('dsa.pem'), 'mypassword')
    #=> #<OpenSSL::PKey::DSA:0x0000556f973c40b8 oid=DSA>

**@overload** [] 

**@overload** [] 

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## params() [](#method-i-params)
Stores all parameters of key to the hash INSECURE: PRIVATE INFORMATIONS CAN
LEAK OUT!!! Don't use :-)) (I's up to you)

**@overload** [] 

## private?() [](#method-i-private?)
Indicates whether this DSA instance has a private key associated with it or
not. The private key may be retrieved with DSA#private_key.

**@overload** [] 

**@return** [Boolean] 

## public?() [](#method-i-public?)
Indicates whether this DSA instance has a public key associated with it or
not. The public key may be retrieved with DSA#public_key.

**@overload** [] 

**@return** [Boolean] 

## public_key() [](#method-i-public_key)
:call-seq:
    dsa.public_key -> dsanew

Returns a new DSA instance that carries just the DSA parameters and the public
key.

This method is provided for backwards compatibility. In most cases, there is
no need to call this method.

For the purpose of serializing the public key, to PEM or DER encoding of X.509
SubjectPublicKeyInfo format, check PKey#public_to_pem and PKey#public_to_der.

## set_key() [](#method-i-set_key)
Sets *pub_key* and *priv_key* for the DSA instance. *priv_key* may be `nil`.

**@overload** [] 

## set_pqg() [](#method-i-set_pqg)
Sets *p*, *q*, *g* to the DSA instance.

**@overload** [] 

## syssign(string) [](#method-i-syssign)
:call-seq:
    dsa.syssign(string) -> string

Computes and returns the DSA signature of `string`, where `string` is expected
to be an already-computed message digest of the original input data. The
signature is issued using the private key of this DSA instance.

**Deprecated in version 3.0**. Consider using PKey::PKey#sign_raw and
PKey::PKey#verify_raw instead.

`string`
:   A message digest of the original input data to be signed.


Example:
    dsa = OpenSSL::PKey::DSA.new(2048)
    doc = "Sign me"
    digest = OpenSSL::Digest.digest('SHA1', doc)

    # With legacy #syssign and #sysverify:
    sig = dsa.syssign(digest)
    p dsa.sysverify(digest, sig) #=> true

    # With #sign_raw and #verify_raw:
    sig = dsa.sign_raw(nil, digest)
    p dsa.verify_raw(nil, sig, digest) #=> true

## sysverify(digest, sig) [](#method-i-sysverify)
:call-seq:
    dsa.sysverify(digest, sig) -> true | false

Verifies whether the signature is valid given the message digest input. It
does so by validating `sig` using the public key of this DSA instance.

**Deprecated in version 3.0**. Consider using PKey::PKey#sign_raw and
PKey::PKey#verify_raw instead.

`digest`
:   A message digest of the original input data to be signed.

`sig`
:   A DSA signature value.


## to_der() [](#method-i-to_der)
Serializes a private or public key to a DER-encoding.

See #to_pem for details.

**This method is kept for compatibility.** This should only be used when the
traditional, non-standard OpenSSL format is required.

Consider using #public_to_der or #private_to_der instead.

**@overload** [] 

