# Module: OpenSSL::TestUtils
    



# Class Methods
## generate_cert(dn , key , serial , issuer , not_before: nil, not_after: nil) [](#method-c-generate_cert)
## get_subject_key_id(cert , hex: true) [](#method-c-get_subject_key_id)
## issue_cert(dn , key , serial , extensions , issuer , issuer_key , not_before: nil, not_after: nil, digest: "sha256") [](#method-c-issue_cert)
## issue_crl(revoke_info , serial , lastup , nextup , extensions , issuer , issuer_key , digest ) [](#method-c-issue_crl)
## libressl?(major nil, minor nil, fix nil) [](#method-c-libressl?)
**@return** [Boolean] 

## openssl?(major nil, minor nil, fix nil, patch 0, status 0) [](#method-c-openssl?)
**@return** [Boolean] 


