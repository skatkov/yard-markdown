# Class: OpenSSL::OCSP::CertificateId
**Inherits:** Object
    




#Instance Methods
## cmp(other) [](#method-i-cmp)
Compares this certificate id with *other* and returns `true` if they are the
same.

**@overload** [] 

## cmp_issuer(other) [](#method-i-cmp_issuer)
Compares this certificate id's issuer with *other* and returns `true` if they
are the same.

**@overload** [] 

## hash_algorithm() [](#method-i-hash_algorithm)
Returns the ln (long name) of the hash algorithm used to generate the
issuerNameHash and the issuerKeyHash values.

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Creates a new OpenSSL::OCSP::CertificateId for the given *subject* and
*issuer* X509 certificates.  The *digest* is a digest algorithm that is used
to compute the hash values. This defaults to SHA-1.

If only one argument is given, decodes it as DER representation of a
certificate ID or generates certificate ID from the object that responds to
the to_der method.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## issuer_key_hash() [](#method-i-issuer_key_hash)
Returns the issuerKeyHash of this certificate ID, the hash of the issuer's
public key.

**@overload** [] 

## issuer_name_hash() [](#method-i-issuer_name_hash)
Returns the issuerNameHash of this certificate ID, the hash of the issuer's
distinguished name calculated with the hashAlgorithm.

**@overload** [] 

## serial() [](#method-i-serial)
Returns the serial number of the certificate for which status is being
requested.

**@overload** [] 

## to_der() [](#method-i-to_der)
Encodes this certificate identifier into a DER-encoded string.

**@overload** [] 

