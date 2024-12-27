# Module: OpenSSL::X509::Extension::SubjectKeyIdentifier
    
**Includes:** OpenSSL::X509::Extension::Helpers
  




#Instance Methods
## find_extension(oid) [](#method-i-find_extension)

## subject_key_identifier() [](#method-i-subject_key_identifier)
Get the subject's key identifier from the subjectKeyIdentifier exteension, as
described in RFC5280 Section 4.2.1.2.

Returns the binary String key identifier or nil or raises ASN1::ASN1Error.

