# Class: OpenSSL::PKey::RSA
**Inherits:** OpenSSL::PKey::PKey
    
**Includes:** OpenSSL::Marshal
  

RSA is an asymmetric public key algorithm that has been formalized in RFC
3447. It is in widespread use in public key infrastructures (PKI) where
certificates (cf. OpenSSL::X509::Certificate) often are issued on the basis of
a public/private RSA key pair. RSA is used in a wide field of applications
such as secure (symmetric) key exchange, e.g. when establishing a secure
TLS/SSL connection. It is also used in various digital signature schemes.


# Class Methods
## generate(size , exp 0x10001, &blk ) [](#method-c-generate)
:call-seq:
    RSA.generate(size, exponent = 65537) -> RSA

Generates an RSA keypair.

See also OpenSSL::PKey.generate_key.

`size`
:   The desired key size in bits.

`exponent`
:   An odd Integer, normally 3, 17, or 65537.

## new(*args , &blk ) [](#method-c-new)
Handle RSA.new(size, exponent) form here; new(str) and new() forms are handled
by #initialize

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
    X.509 SubjectPublicKeyInfo regardless of whether the key is a public key
    or a private key.


When the key contains private components, and no parameters are given
:   Serializes it into a PKCS #1 RSAPrivateKey.

    A PEM-encoded key will look like:

        -----BEGIN RSA PRIVATE KEY-----
        [...]
        -----END RSA PRIVATE KEY-----


When the key contains private components, and *cipher* and *password* are given
:   Serializes it into a PKCS #1 RSAPrivateKey and encrypts it in OpenSSL's
    traditional PEM encryption format. *cipher* must be a cipher name
    understood by OpenSSL::Cipher.new or an instance of OpenSSL::Cipher.

    An encrypted PEM-encoded key will look like:

        -----BEGIN RSA PRIVATE KEY-----
        Proc-Type: 4,ENCRYPTED
        DEK-Info: AES-128-CBC,733F5302505B34701FC41F5C0746E4C0

        [...]
        -----END RSA PRIVATE KEY-----

    Note that this format uses MD5 to derive the encryption key, and hence
    will not be available on FIPS-compliant systems.


**This method is kept for compatibility.** This should only be used when the
PKCS #1 RSAPrivateKey format is required.

Consider using #public_to_pem (X.509 SubjectPublicKeyInfo) or #private_to_pem
(PKCS #8 PrivateKeyInfo or EncryptedPrivateKeyInfo) instead.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Generates or loads an RSA keypair.

If called without arguments, creates a new instance with no key components
set. They can be set individually by #set_key, #set_factors, and
#set_crt_params.

If called with a String, tries to parse as DER or PEM encoding of an RSA key.
Note that if *password* is not specified, but the key is encrypted with a
password, OpenSSL will prompt for it. See also OpenSSL::PKey.read which can
parse keys of any kind.

If called with a number, generates a new key pair. This form works as an alias
of RSA.generate.

Examples:
    OpenSSL::PKey::RSA.new 2048
    OpenSSL::PKey::RSA.new File.read 'rsa.pem'
    OpenSSL::PKey::RSA.new File.read('rsa.pem'), 'my password'

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## params() [](#method-i-params)
THIS METHOD IS INSECURE, PRIVATE INFORMATION CAN LEAK OUT!!!

Stores all parameters of key to the hash.  The hash has keys 'n', 'e', 'd',
'p', 'q', 'dmp1', 'dmq1', 'iqmp'.

Don't use :-)) (It's up to you)

**@overload** [] 

## private?() [](#method-i-private?)
Does this keypair contain a private key?

**@overload** [] 

**@return** [Boolean] 

## private_decrypt(data, paddingPKCS1_PADDING) [](#method-i-private_decrypt)
:call-seq:
    rsa.private_decrypt(string)          -> String
    rsa.private_decrypt(string, padding) -> String

Decrypt `string`, which has been encrypted with the public key, with the
private key. `padding` defaults to PKCS1_PADDING, which is known to be
insecure but is kept for backwards compatibility.

**Deprecated in version 3.0**. Consider using PKey::PKey#encrypt and
PKey::PKey#decrypt instead.

## private_encrypt(string, paddingPKCS1_PADDING) [](#method-i-private_encrypt)
:call-seq:
    rsa.private_encrypt(string)          -> String
    rsa.private_encrypt(string, padding) -> String

Encrypt `string` with the private key.  `padding` defaults to PKCS1_PADDING,
which is known to be insecure but is kept for backwards compatibility. The
encrypted string output can be decrypted using #public_decrypt.

**Deprecated in version 3.0**. Consider using PKey::PKey#sign_raw and
PKey::PKey#verify_raw, and PKey::PKey#verify_recover instead.

## public?() [](#method-i-public?)
The return value is always `true` since every private key is also a public
key.

**@overload** [] 

## public_decrypt(string, paddingPKCS1_PADDING) [](#method-i-public_decrypt)
:call-seq:
    rsa.public_decrypt(string)          -> String
    rsa.public_decrypt(string, padding) -> String

Decrypt `string`, which has been encrypted with the private key, with the
public key.  `padding` defaults to PKCS1_PADDING which is known to be insecure
but is kept for backwards compatibility.

**Deprecated in version 3.0**. Consider using PKey::PKey#sign_raw and
PKey::PKey#verify_raw, and PKey::PKey#verify_recover instead.

## public_encrypt(data, paddingPKCS1_PADDING) [](#method-i-public_encrypt)
:call-seq:
    rsa.public_encrypt(string)          -> String
    rsa.public_encrypt(string, padding) -> String

Encrypt `string` with the public key.  `padding` defaults to PKCS1_PADDING,
which is known to be insecure but is kept for backwards compatibility. The
encrypted string output can be decrypted using #private_decrypt.

**Deprecated in version 3.0**. Consider using PKey::PKey#encrypt and
PKey::PKey#decrypt instead.

## public_key() [](#method-i-public_key)
:call-seq:
    rsa.public_key -> rsanew

Returns a new RSA instance that carries just the public key components.

This method is provided for backwards compatibility. In most cases, there is
no need to call this method.

For the purpose of serializing the public key, to PEM or DER encoding of X.509
SubjectPublicKeyInfo format, check PKey#public_to_pem and PKey#public_to_der.

## set_crt_params() [](#method-i-set_crt_params)
Sets *dmp1*, *dmq1*, *iqmp* for the RSA instance. They are calculated by `d
mod (p - 1)`, `d mod (q - 1)` and `q^(-1) mod p` respectively.

**@overload** [] 

## set_factors() [](#method-i-set_factors)
Sets *p*, *q* for the RSA instance.

**@overload** [] 

## set_key() [](#method-i-set_key)
Sets *n*, *e*, *d* for the RSA instance.

**@overload** [] 

## sign_pss(*args) [](#method-i-sign_pss)
Signs *data* using the Probabilistic Signature Scheme (RSA-PSS) and returns
the calculated signature.

RSAError will be raised if an error occurs.

See #verify_pss for the verification operation.

### Parameters
*digest*
:   A String containing the message digest algorithm name.

*data*
:   A String. The data to be signed.

*salt_length*
:   The length in octets of the salt. Two special values are reserved:
    `:digest` means the digest length, and `:max` means the maximum possible
    length for the combination of the private key and the selected message
    digest algorithm.

*mgf1_hash*
:   The hash algorithm used in MGF1 (the currently supported mask generation
    function (MGF)).


### Example
    data = "Sign me!"
    pkey = OpenSSL::PKey::RSA.new(2048)
    signature = pkey.sign_pss("SHA256", data, salt_length: :max, mgf1_hash: "SHA256")
    pub_key = OpenSSL::PKey.read(pkey.public_to_der)
    puts pub_key.verify_pss("SHA256", signature, data,
                            salt_length: :auto, mgf1_hash: "SHA256") # => true

**@overload** [] 

## to_der() [](#method-i-to_der)
Serializes a private or public key to a DER-encoding.

See #to_pem for details.

**This method is kept for compatibility.** This should only be used when the
PKCS #1 RSAPrivateKey format is required.

Consider using #public_to_der or #private_to_der instead.

**@overload** [] 

## verify_pss(*args) [](#method-i-verify_pss)
Verifies *data* using the Probabilistic Signature Scheme (RSA-PSS).

The return value is `true` if the signature is valid, `false` otherwise.
RSAError will be raised if an error occurs.

See #sign_pss for the signing operation and an example code.

### Parameters
*digest*
:   A String containing the message digest algorithm name.

*data*
:   A String. The data to be signed.

*salt_length*
:   The length in octets of the salt. Two special values are reserved:
    `:digest` means the digest length, and `:auto` means automatically
    determining the length based on the signature.

*mgf1_hash*
:   The hash algorithm used in MGF1.


**@overload** [] 

