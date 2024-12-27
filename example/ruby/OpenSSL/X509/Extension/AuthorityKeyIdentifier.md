# Module: OpenSSL::X509::Extension::AuthorityKeyIdentifier
    
**Includes:** OpenSSL::X509::Extension::Helpers
  




#Instance Methods
## authority_key_identifier() [](#method-i-authority_key_identifier)
Get the issuing certificate's key identifier from the authorityKeyIdentifier
extension, as described in RFC5280 Section 4.2.1.1

Returns the binary String keyIdentifier or nil or raises ASN1::ASN1Error.

## find_extension(oid) [](#method-i-find_extension)

