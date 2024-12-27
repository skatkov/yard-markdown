# Class: OpenSSL::Netscape::SPKI
**Inherits:** Object
    

A Simple Public Key Infrastructure implementation (pronounced "spooky"). The
structure is defined as
    PublicKeyAndChallenge ::= SEQUENCE {
      spki SubjectPublicKeyInfo,
      challenge IA5STRING
    }

    SignedPublicKeyAndChallenge ::= SEQUENCE {
      publicKeyAndChallenge PublicKeyAndChallenge,
      signatureAlgorithm AlgorithmIdentifier,
      signature BIT STRING
    }

where the definitions of SubjectPublicKeyInfo and AlgorithmIdentifier can be
found in RFC5280. SPKI is typically used in browsers for generating a
public/private key pair and a subsequent certificate request, using the HTML
<keygen> element.

## Examples

### Creating an SPKI
    key = OpenSSL::PKey::RSA.new 2048
    spki = OpenSSL::Netscape::SPKI.new
    spki.challenge = "RandomChallenge"
    spki.public_key = key.public_key
    spki.sign(key, OpenSSL::Digest.new('SHA256'))
    #send a request containing this to a server generating a certificate

### Verifying an SPKI request
    request = #...
    spki = OpenSSL::Netscape::SPKI.new request
    unless spki.verify(spki.public_key)
      # signature is invalid
    end
    #proceed



#Instance Methods
## challenge() [](#method-i-challenge)
Returns the challenge string associated with this SPKI.

**@overload** [] 

## challenge=(str) [](#method-i-challenge=)
### Parameters
*   *str* - the challenge string to be set for this instance

Sets the challenge to be associated with the SPKI. May be used by the server,
e.g. to prevent replay.

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
### Parameters
*   *request* - optional raw request, either in PEM or DER format.

**@overload** [] 

## public_key() [](#method-i-public_key)
Returns the public key associated with the SPKI, an instance of OpenSSL::PKey.

**@overload** [] 

## public_key=(key) [](#method-i-public_key=)
### Parameters
*   *pub* - the public key to be set for this instance

Sets the public key to be associated with the SPKI, an instance of
OpenSSL::PKey. This should be the public key corresponding to the private key
used for signing the SPKI.

**@overload** [] 

## sign(key, digest) [](#method-i-sign)
### Parameters
*   *key* - the private key to be used for signing this instance
*   *digest* - the digest to be used for signing this instance

To sign an SPKI, the private key corresponding to the public key set for this
instance should be used, in addition to a digest algorithm in the form of an
OpenSSL::Digest. The private key should be an instance of OpenSSL::PKey.

**@overload** [] 

## to_der() [](#method-i-to_der)
Returns the DER encoding of this SPKI.

**@overload** [] 

## to_pem() [](#method-i-to_pem)
Returns the PEM encoding of this SPKI.

**@overload** [] 

## to_text() [](#method-i-to_text)
Returns a textual representation of this SPKI, useful for debugging purposes.

**@overload** [] 

## verify(key) [](#method-i-verify)
### Parameters
*   *key* - the public key to be used for verifying the SPKI signature

Returns `true` if the signature is valid, `false` otherwise. To verify an
SPKI, the public key contained within the SPKI should be used.

**@overload** [] 

