# Class: CertStore
**Inherits:** Object
    



# Attributes
## crl[RW] [](#attribute-i-crl)
Returns the value of attribute crl.

## ee[RW] [](#attribute-i-ee)
Returns the value of attribute ee.

## other_ca[RW] [](#attribute-i-other_ca)
Returns the value of attribute other_ca.

## request[RW] [](#attribute-i-request)
Returns the value of attribute request.

## self_signed_ca[RW] [](#attribute-i-self_signed_ca)
Returns the value of attribute self_signed_ca.


#Instance Methods
## generate_cert(filename) [](#method-i-generate_cert)

## initialize(certs_dir) [](#method-i-initialize)

**@return** [CertStore] a new instance of CertStore

## is_ca?(cert) [](#method-i-is_ca?)

**@return** [Boolean] 

## match_cert(cert1, cert2) [](#method-i-match_cert)

## scan_certs() [](#method-i-scan_certs)

## verify(cert) [](#method-i-verify)

