# Class: OpenSSL::PKey::EC
**Inherits:** OpenSSL::PKey::PKey
    
**Includes:** OpenSSL::Marshal
  

OpenSSL::PKey::EC provides access to Elliptic Curve Digital Signature
Algorithm (ECDSA) and Elliptic Curve Diffie-Hellman (ECDH).

### Key exchange
    ec1 = OpenSSL::PKey::EC.generate("prime256v1")
    ec2 = OpenSSL::PKey::EC.generate("prime256v1")
    # ec1 and ec2 have own private key respectively
    shared_key1 = ec1.dh_compute_key(ec2.public_key)
    shared_key2 = ec2.dh_compute_key(ec1.public_key)

    p shared_key1 == shared_key2 #=> true


# Class Methods
## builtin_curves() [](#method-c-builtin_curves)
Obtains a list of all predefined curves by the OpenSSL. Curve names are
returned as sn.

See the OpenSSL documentation for EC_get_builtin_curves().
**@overload** [] 

## generate(arg ) [](#method-c-generate)
Creates a new EC instance with a new random private and public key.
**@overload** [] 

**@overload** [] 


#Instance Methods
## _dump(_level) [](#method-i-_dump)

## check_key() [](#method-i-check_key)
Raises an exception if the key is invalid.

See also the man page EVP_PKEY_public_check(3).

**@overload** [] 

## dh_compute_key(pubkey) [](#method-i-dh_compute_key)
:call-seq:
    ec.dh_compute_key(pubkey) -> string

Derives a shared secret by ECDH. *pubkey* must be an instance of
OpenSSL::PKey::EC::Point and must belong to the same group.

This method is provided for backwards compatibility, and calls #derive
internally.

## dsa_sign_asn1(data) [](#method-i-dsa_sign_asn1)
:call-seq:
    key.dsa_sign_asn1(data) -> String

**Deprecated in version 3.0**. Consider using PKey::PKey#sign_raw and
PKey::PKey#verify_raw instead.

## dsa_verify_asn1(data, sig) [](#method-i-dsa_verify_asn1)
:call-seq:
    key.dsa_verify_asn1(data, sig) -> true | false

**Deprecated in version 3.0**. Consider using PKey::PKey#sign_raw and
PKey::PKey#verify_raw instead.

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
:   Serializes it into a SEC 1/RFC 5915 ECPrivateKey.

    A PEM-encoded key will look like:

        -----BEGIN EC PRIVATE KEY-----
        [...]
        -----END EC PRIVATE KEY-----


When the key contains private components, and *cipher* and *password* are given
:   Serializes it into a SEC 1/RFC 5915 ECPrivateKey and encrypts it in
    OpenSSL's traditional PEM encryption format. *cipher* must be a cipher
    name understood by OpenSSL::Cipher.new or an instance of OpenSSL::Cipher.

    An encrypted PEM-encoded key will look like:

        -----BEGIN EC PRIVATE KEY-----
        Proc-Type: 4,ENCRYPTED
        DEK-Info: AES-128-CBC,733F5302505B34701FC41F5C0746E4C0

        [...]
        -----END EC PRIVATE KEY-----

    Note that this format uses MD5 to derive the encryption key, and hence
    will not be available on FIPS-compliant systems.


**This method is kept for compatibility.** This should only be used when the
SEC 1/RFC 5915 ECPrivateKey format is required.

Consider using #public_to_pem (X.509 SubjectPublicKeyInfo) or #private_to_pem
(PKCS #8 PrivateKeyInfo or EncryptedPrivateKeyInfo) instead.

**@overload** [] 

**@overload** [] 

## generate_key!() [](#method-i-generate_key!)
Generates a new random private and public key.

See also the OpenSSL documentation for EC_KEY_generate_key()

### Example
    ec = OpenSSL::PKey::EC.new("prime256v1")
    p ec.private_key # => nil
    ec.generate_key!
    p ec.private_key # => #<OpenSSL::BN XXXXXX>

**@overload** [] 

## group() [](#method-i-group)
Returns the EC::Group that the key is associated with. Modifying the returned
group does not affect *key*.

**@overload** [] 

## group=(group_v) [](#method-i-group=)
Sets the EC::Group for the key. The group structure is internally copied so
modification to *group* after assigning to a key has no effect on the key.

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Creates a new EC object from given arguments.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## private?() [](#method-i-private?)
Returns whether this EC instance has a private key. The private key (BN) can
be retrieved with EC#private_key.

**@overload** [] 

## private_key() [](#method-i-private_key)
See the OpenSSL documentation for EC_KEY_get0_private_key()

**@overload** [] 

## private_key=(private_key) [](#method-i-private_key=)
See the OpenSSL documentation for EC_KEY_set_private_key()

**@overload** [] 

## public?() [](#method-i-public?)
Returns whether this EC instance has a public key. The public key (EC::Point)
can be retrieved with EC#public_key.

**@overload** [] 

## public_key() [](#method-i-public_key)
See the OpenSSL documentation for EC_KEY_get0_public_key()

**@overload** [] 

## public_key=(public_key) [](#method-i-public_key=)
See the OpenSSL documentation for EC_KEY_set_public_key()

**@overload** [] 

## to_der() [](#method-i-to_der)
Serializes a private or public key to a DER-encoding.

See #to_pem for details.

**This method is kept for compatibility.** This should only be used when the
SEC 1/RFC 5915 ECPrivateKey format is required.

Consider using #public_to_der or #private_to_der instead.

**@overload** [] 

