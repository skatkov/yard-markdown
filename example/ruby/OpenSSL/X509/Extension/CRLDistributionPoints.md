# Module: OpenSSL::X509::Extension::CRLDistributionPoints
    
**Includes:** OpenSSL::X509::Extension::Helpers
  




#Instance Methods
## crl_uris() [](#method-i-crl_uris)
Get the distributionPoint fullName URI from the certificate's CRL distribution
points extension, as described in RFC 5280 Section 4.2.1.13.

Returns an array of strings or nil or raises ASN1::ASN1Error.

## find_extension(oid) [](#method-i-find_extension)

