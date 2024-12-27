# Class: OpenSSL::X509::CRL
**Inherits:** Object
    
**Includes:** OpenSSL::Marshal, OpenSSL::X509::Extension::AuthorityKeyIdentifier
  




#Instance Methods
## ==(other) [](#method-i-==)

## _dump(_level) [](#method-i-_dump)

## add_extension(extension) [](#method-i-add_extension)

## add_revoked(revoked) [](#method-i-add_revoked)

## authority_key_identifier() [](#method-i-authority_key_identifier)
Get the issuing certificate's key identifier from the authorityKeyIdentifier
extension, as described in RFC5280 Section 4.2.1.1

Returns the binary String keyIdentifier or nil or raises ASN1::ASN1Error.

## extensions() [](#method-i-extensions)
Gets X509v3 extensions as array of X509Ext objects

## extensions=(ary) [](#method-i-extensions=)
Sets X509_EXTENSIONs

## find_extension(oid) [](#method-i-find_extension)

## initialize(*args) [](#method-i-initialize)

## initialize_copy(other) [](#method-i-initialize_copy)

## issuer() [](#method-i-issuer)

## issuer=(issuer) [](#method-i-issuer=)
NO DUP - don't free

## last_update() [](#method-i-last_update)

## last_update=(time) [](#method-i-last_update=)

## next_update() [](#method-i-next_update)

## next_update=(time) [](#method-i-next_update=)

## revoked() [](#method-i-revoked)

## revoked=(ary) [](#method-i-revoked=)

## sign(key, digest) [](#method-i-sign)

## signature_algorithm() [](#method-i-signature_algorithm)

## to_der() [](#method-i-to_der)

## to_pem() [](#method-i-to_pem)

## to_text() [](#method-i-to_text)

## verify(key) [](#method-i-verify)

## version() [](#method-i-version)

## version=(version) [](#method-i-version=)

