# Class: OpenSSL::PKey::DH
**Inherits:** OpenSSL::PKey::PKey
    
**Includes:** OpenSSL::Marshal
  

An implementation of the Diffie-Hellman key exchange protocol based on
discrete logarithms in finite fields, the same basis that DSA is built on.

### Accessor methods for the Diffie-Hellman parameters
DH#p
:   The prime (an OpenSSL::BN) of the Diffie-Hellman parameters.

DH#g
:   The generator (an OpenSSL::BN) g of the Diffie-Hellman parameters.

DH#pub_key
:   The per-session public key (an OpenSSL::BN) matching the private key. This
    needs to be passed to DH#compute_key.

DH#priv_key
:   The per-session private key, an OpenSSL::BN.


### Example of a key exchange
    # you may send the parameters (der) and own public key (pub1) publicly
    # to the participating party
    dh1 = OpenSSL::PKey::DH.new(2048)
    der = dh1.to_der
    pub1 = dh1.pub_key

    # the other party generates its per-session key pair
    dhparams = OpenSSL::PKey::DH.new(der)
    dh2 = OpenSSL::PKey.generate_key(dhparams)
    pub2 = dh2.pub_key

    symm_key1 = dh1.compute_key(pub2)
    symm_key2 = dh2.compute_key(pub1)
    puts symm_key1 == symm_key2 # => true


# Class Methods
## generate(size , generator 2, &blk ) [](#method-c-generate)
:call-seq:
    DH.generate(size, generator = 2) -> dh

Creates a new DH instance from scratch by generating random parameters and a
key pair.

See also OpenSSL::PKey.generate_parameters and OpenSSL::PKey.generate_key.

`size`
:   The desired key size in bits.

`generator`
:   The generator.

## new(*args , &blk ) [](#method-c-new)
Handle DH.new(size, generator) form here; new(str) and new() forms are handled
by #initialize

#Instance Methods
## _dump(_level) [](#method-i-_dump)

## compute_key(pub_bn) [](#method-i-compute_key)
:call-seq:
    dh.compute_key(pub_bn) -> string

Returns a String containing a shared secret computed from the other party's
public value.

This method is provided for backwards compatibility, and calls #derive
internally.

### Parameters
*   *pub_bn* is a OpenSSL::BN, **not** the DH instance returned by
    DH#public_key as that contains the DH parameters only.

## export() [](#method-i-export)
Serializes the DH parameters to a PEM-encoding.

Note that any existing per-session public/private keys will **not** get
encoded, just the Diffie-Hellman parameters will be encoded.

PEM-encoded parameters will look like:

    -----BEGIN DH PARAMETERS-----
    [...]
    -----END DH PARAMETERS-----

See also #public_to_pem (X.509 SubjectPublicKeyInfo) and #private_to_pem (PKCS
#8 PrivateKeyInfo or EncryptedPrivateKeyInfo) for serialization with the
private or public key components.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## generate_key!() [](#method-i-generate_key!)
:call-seq:
    dh.generate_key! -> self

Generates a private and public key unless a private key already exists. If
this DH instance was generated from public DH parameters (e.g. by encoding the
result of DH#public_key), then this method needs to be called first in order
to generate the per-session keys before performing the actual key exchange.

**Deprecated in version 3.0**. This method is incompatible with OpenSSL 3.0.0
or later.

See also OpenSSL::PKey.generate_key.

Example:
    # DEPRECATED USAGE: This will not work on OpenSSL 3.0 or later
    dh0 = OpenSSL::PKey::DH.new(2048)
    dh = dh0.public_key # #public_key only copies the DH parameters (contrary to the name)
    dh.generate_key!
    puts dh.private? # => true
    puts dh0.pub_key == dh.pub_key #=> false

    # With OpenSSL::PKey.generate_key
    dh0 = OpenSSL::PKey::DH.new(2048)
    dh = OpenSSL::PKey.generate_key(dh0)
    puts dh0.pub_key == dh.pub_key #=> false

## initialize(*args) [](#method-i-initialize)
Creates a new instance of OpenSSL::PKey::DH.

If called without arguments, an empty instance without any parameter or key
components is created. Use #set_pqg to manually set the parameters afterwards
(and optionally #set_key to set private and public key components).

If a String is given, tries to parse it as a DER- or PEM- encoded parameters.
See also OpenSSL::PKey.read which can parse keys of any kinds.

The DH.new(size [, generator]) form is an alias of DH.generate.

`string`
:   A String that contains the DER or PEM encoded key.

`size`
:   See DH.generate.

`generator`
:   See DH.generate.


Examples:
    # Creating an instance from scratch
    # Note that this is deprecated and will not work on OpenSSL 3.0 or later.
    dh = OpenSSL::PKey::DH.new
    dh.set_pqg(bn_p, nil, bn_g)

    # Generating a parameters and a key pair
    dh = OpenSSL::PKey::DH.new(2048) # An alias of OpenSSL::PKey::DH.generate(2048)

    # Reading DH parameters
    dh_params = OpenSSL::PKey::DH.new(File.read('parameters.pem')) # loads parameters only
    dh = OpenSSL::PKey.generate_key(dh_params) # generates a key pair

**@overload** [] 

**@overload** [] 

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## params() [](#method-i-params)
Stores all parameters of key to the hash INSECURE: PRIVATE INFORMATIONS CAN
LEAK OUT!!! Don't use :-)) (I's up to you)

**@overload** [] 

## params_ok?() [](#method-i-params_ok?)
Validates the Diffie-Hellman parameters associated with this instance. It
checks whether a safe prime and a suitable generator are used. If this is not
the case, `false` is returned.

See also the man page EVP_PKEY_param_check(3).

**@overload** [] 

**@return** [Boolean] 

## private?() [](#method-i-private?)
Indicates whether this DH instance has a private key associated with it or
not. The private key may be retrieved with DH#priv_key.

**@overload** [] 

**@return** [Boolean] 

## public?() [](#method-i-public?)
Indicates whether this DH instance has a public key associated with it or not.
The public key may be retrieved with DH#pub_key.

**@overload** [] 

**@return** [Boolean] 

## public_key() [](#method-i-public_key)
:call-seq:
    dh.public_key -> dhnew

Returns a new DH instance that carries just the DH parameters.

Contrary to the method name, the returned DH object contains only parameters
and not the public key.

This method is provided for backwards compatibility. In most cases, there is
no need to call this method.

For the purpose of re-generating the key pair while keeping the parameters,
check OpenSSL::PKey.generate_key.

Example:
    # OpenSSL::PKey::DH.generate by default generates a random key pair
    dh1 = OpenSSL::PKey::DH.generate(2048)
    p dh1.priv_key #=> #<OpenSSL::BN 1288347...>
    dhcopy = dh1.public_key
    p dhcopy.priv_key #=> nil

## set_key() [](#method-i-set_key)
Sets *pub_key* and *priv_key* for the DH instance. *priv_key* may be `nil`.

**@overload** [] 

## set_pqg() [](#method-i-set_pqg)
Sets *p*, *q*, *g* to the DH instance.

**@overload** [] 

## to_der() [](#method-i-to_der)
Serializes the DH parameters to a DER-encoding

Note that any existing per-session public/private keys will **not** get
encoded, just the Diffie-Hellman parameters will be encoded.

See also #public_to_der (X.509 SubjectPublicKeyInfo) and #private_to_der (PKCS
#8 PrivateKeyInfo or EncryptedPrivateKeyInfo) for serialization with the
private or public key components.

**@overload** [] 

