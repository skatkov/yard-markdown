# Class: OpenSSL::X509::Certificate
**Inherits:** Object
    
**Includes:** OpenSSL::Marshal, OpenSSL::X509::Extension::AuthorityInfoAccess, OpenSSL::X509::Extension::AuthorityKeyIdentifier, OpenSSL::X509::Extension::CRLDistributionPoints, OpenSSL::X509::Extension::SubjectKeyIdentifier
  

Implementation of an X.509 certificate as specified in RFC 5280. Provides
access to a certificate's attributes and allows certificates to be read from a
string, but also supports the creation of new certificates from scratch.

### Reading a certificate from a file

Certificate is capable of handling DER-encoded certificates and certificates
encoded in OpenSSL's PEM format.

    raw = File.binread "cert.cer" # DER- or PEM-encoded
    certificate = OpenSSL::X509::Certificate.new raw

### Saving a certificate to a file

A certificate may be encoded in DER format

    cert = ...
    File.open("cert.cer", "wb") { |f| f.print cert.to_der }

or in PEM format

    cert = ...
    File.open("cert.pem", "wb") { |f| f.print cert.to_pem }

X.509 certificates are associated with a private/public key pair, typically a
RSA, DSA or ECC key (see also OpenSSL::PKey::RSA, OpenSSL::PKey::DSA and
OpenSSL::PKey::EC), the public key itself is stored within the certificate and
can be accessed in form of an OpenSSL::PKey. Certificates are typically used
to be able to associate some form of identity with a key pair, for example web
servers serving pages over HTTPs use certificates to authenticate themselves
to the user.

The public key infrastructure (PKI) model relies on trusted certificate
authorities ("root CAs") that issue these certificates, so that end users need
to base their trust just on a selected few authorities that themselves again
vouch for subordinate CAs issuing their certificates to end users.

The OpenSSL::X509 module provides the tools to set up an independent PKI,
similar to scenarios where the 'openssl' command line tool is used for issuing
certificates in a private PKI.

### Creating a root CA certificate and an end-entity certificate

First, we need to create a "self-signed" root certificate. To do so, we need
to generate a key first. Please note that the choice of "1" as a serial number
is considered a security flaw for real certificates. Secure choices are
integers in the two-digit byte range and ideally not sequential but secure
random numbers, steps omitted here to keep the example concise.

    root_key = OpenSSL::PKey::RSA.new 2048 # the CA's public/private key
    root_ca = OpenSSL::X509::Certificate.new
    root_ca.version = 2 # cf. RFC 5280 - to make it a "v3" certificate
    root_ca.serial = 1
    root_ca.subject = OpenSSL::X509::Name.parse "/DC=org/DC=ruby-lang/CN=Ruby CA"
    root_ca.issuer = root_ca.subject # root CA's are "self-signed"
    root_ca.public_key = root_key.public_key
    root_ca.not_before = Time.now
    root_ca.not_after = root_ca.not_before + 2 * 365 * 24 * 60 * 60 # 2 years validity
    ef = OpenSSL::X509::ExtensionFactory.new
    ef.subject_certificate = root_ca
    ef.issuer_certificate = root_ca
    root_ca.add_extension(ef.create_extension("basicConstraints","CA:TRUE",true))
    root_ca.add_extension(ef.create_extension("keyUsage","keyCertSign, cRLSign", true))
    root_ca.add_extension(ef.create_extension("subjectKeyIdentifier","hash",false))
    root_ca.add_extension(ef.create_extension("authorityKeyIdentifier","keyid:always",false))
    root_ca.sign(root_key, OpenSSL::Digest.new('SHA256'))

The next step is to create the end-entity certificate using the root CA
certificate.

    key = OpenSSL::PKey::RSA.new 2048
    cert = OpenSSL::X509::Certificate.new
    cert.version = 2
    cert.serial = 2
    cert.subject = OpenSSL::X509::Name.parse "/DC=org/DC=ruby-lang/CN=Ruby certificate"
    cert.issuer = root_ca.subject # root CA is the issuer
    cert.public_key = key.public_key
    cert.not_before = Time.now
    cert.not_after = cert.not_before + 1 * 365 * 24 * 60 * 60 # 1 years validity
    ef = OpenSSL::X509::ExtensionFactory.new
    ef.subject_certificate = cert
    ef.issuer_certificate = root_ca
    cert.add_extension(ef.create_extension("keyUsage","digitalSignature", true))
    cert.add_extension(ef.create_extension("subjectKeyIdentifier","hash",false))
    cert.sign(root_key, OpenSSL::Digest.new('SHA256'))


# Class Methods
## load(buffer ) [](#method-c-load)
Read the chained certificates from the given input. Supports both PEM and DER
encoded certificates.

PEM is a text format and supports more than one certificate.

DER is a binary format and only supports one certificate.

If the file is empty, or contains only unrelated data, an
`OpenSSL::X509::CertificateError` exception will be raised.
**@overload** [] 

**@overload** [] 

## load_file(path ) [](#method-c-load_file)

#Instance Methods
## ==(other) [](#method-i-==)
Compares the two certificates. Note that this takes into account all fields,
not just the issuer name and the serial number.

**@overload** [] 

## _dump(_level) [](#method-i-_dump)

## add_extension(extension) [](#method-i-add_extension)

**@overload** [] 

## authority_key_identifier() [](#method-i-authority_key_identifier)
Get the issuing certificate's key identifier from the authorityKeyIdentifier
extension, as described in RFC5280 Section 4.2.1.1

Returns the binary String keyIdentifier or nil or raises ASN1::ASN1Error.

## ca_issuer_uris() [](#method-i-ca_issuer_uris)
Get the information and services for the issuer from the certificate's
authority information access extension exteension, as described in RFC5280
Section 4.2.2.1.

Returns an array of strings or nil or raises ASN1::ASN1Error.

## check_private_key(key) [](#method-i-check_private_key)
Returns `true` if *key* is the corresponding private key to the Subject Public
Key Information, `false` otherwise.

**@overload** [] 

## crl_uris() [](#method-i-crl_uris)
Get the distributionPoint fullName URI from the certificate's CRL distribution
points extension, as described in RFC 5280 Section 4.2.1.13.

Returns an array of strings or nil or raises ASN1::ASN1Error.

## extensions() [](#method-i-extensions)

**@overload** [] 

## extensions=(ary) [](#method-i-extensions=)

## find_extension(oid) [](#method-i-find_extension)

## initialize(*args) [](#method-i-initialize)

**@overload** [] 

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## inspect() [](#method-i-inspect)

## issuer() [](#method-i-issuer)

**@overload** [] 

## issuer=(issuer) [](#method-i-issuer=)

**@overload** [] 

## not_after() [](#method-i-not_after)

**@overload** [] 

## not_after=(time) [](#method-i-not_after=)

**@overload** [] 

## not_before() [](#method-i-not_before)

**@overload** [] 

## not_before=(time) [](#method-i-not_before=)

**@overload** [] 

## ocsp_uris() [](#method-i-ocsp_uris)
Get the URIs for OCSP from the certificate's authority information access
extension exteension, as described in RFC5280 Section 4.2.2.1.

Returns an array of strings or nil or raises ASN1::ASN1Error.

## pretty_print(q) [](#method-i-pretty_print)

## public_key() [](#method-i-public_key)

**@overload** [] 

## public_key=(key) [](#method-i-public_key=)

**@overload** [] 

## serial() [](#method-i-serial)

**@overload** [] 

## serial=(num) [](#method-i-serial=)

**@overload** [] 

## sign(key, digest) [](#method-i-sign)

**@overload** [] 

## signature_algorithm() [](#method-i-signature_algorithm)

**@overload** [] 

## subject() [](#method-i-subject)

**@overload** [] 

## subject=(subject) [](#method-i-subject=)

**@overload** [] 

## subject_key_identifier() [](#method-i-subject_key_identifier)
Get the subject's key identifier from the subjectKeyIdentifier exteension, as
described in RFC5280 Section 4.2.1.2.

Returns the binary String key identifier or nil or raises ASN1::ASN1Error.

## tbs_bytes() [](#method-i-tbs_bytes)
Returns the DER-encoded bytes of the certificate's to be signed certificate.
This is mainly useful for validating embedded certificate transparency
signatures.

**@overload** [] 

## to_der() [](#method-i-to_der)

**@overload** [] 

## to_pem() [](#method-i-to_pem)

**@overload** [] 

## to_text() [](#method-i-to_text)

**@overload** [] 

## verify(key) [](#method-i-verify)
Verifies the signature of the certificate, with the public key *key*. *key*
must be an instance of OpenSSL::PKey.

**@overload** [] 

## version() [](#method-i-version)

**@overload** [] 

## version=(version) [](#method-i-version=)

**@overload** [] 

