# Module: OpenSSL::X509::Extension::AuthorityInfoAccess
    
**Includes:** OpenSSL::X509::Extension::Helpers
  




#Instance Methods
## ca_issuer_uris() [](#method-i-ca_issuer_uris)
Get the information and services for the issuer from the certificate's
authority information access extension exteension, as described in RFC5280
Section 4.2.2.1.

Returns an array of strings or nil or raises ASN1::ASN1Error.

## find_extension(oid) [](#method-i-find_extension)

## ocsp_uris() [](#method-i-ocsp_uris)
Get the URIs for OCSP from the certificate's authority information access
extension exteension, as described in RFC5280 Section 4.2.2.1.

Returns an array of strings or nil or raises ASN1::ASN1Error.

