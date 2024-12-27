# Class: Gem::Security::TrustDir
**Inherits:** Object
    

The TrustDir manages the trusted certificates for gem signature verification.


# Attributes
## dir[RW] [](#attribute-i-dir)
The directory where trusted certificates will be stored.


#Instance Methods
## cert_path(certificate) [](#method-i-cert_path)
Returns the path to the trusted `certificate`

## each_certificate() [](#method-i-each_certificate)
Enumerates trusted certificates.

## initialize(dir, permissionsDEFAULT_PERMISSIONS) [](#method-i-initialize)
Creates a new TrustDir using `dir` where the directory and file permissions
will be checked according to `permissions`

**@return** [TrustDir] a new instance of TrustDir

## issuer_of(certificate) [](#method-i-issuer_of)
Returns the issuer certificate of the given `certificate` if it exists in the
trust directory.

## load_certificate(certificate_file) [](#method-i-load_certificate)
Loads the given `certificate_file`

## name_path(name) [](#method-i-name_path)
Returns the path to the trusted certificate with the given ASN.1 `name`

## trust_cert(certificate) [](#method-i-trust_cert)
Add a certificate to trusted certificate list.

## verify() [](#method-i-verify)
Make sure the trust directory exists.  If it does exist, make sure it's
actually a directory.  If not, then create it with the appropriate
permissions.

