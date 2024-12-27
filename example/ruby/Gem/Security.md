# Module: Gem::Security
    

forward-declare


# Class Methods
## alt_name_or_x509_entry(certificate , x509_entry ) [](#method-c-alt_name_or_x509_entry)
## create_cert(subject , key , age ONE_YEAR, extensions EXTENSIONS, serial 1) [](#method-c-create_cert)
Creates an unsigned certificate for `subject` and `key`.  The lifetime of the
key is from the current time to `age` which defaults to one year.

The `extensions` restrict the key to the indicated uses.
## create_cert_email(email , key , age ONE_YEAR, extensions EXTENSIONS) [](#method-c-create_cert_email)
Creates a self-signed certificate with an issuer and subject from `email`, a
subject alternative name of `email` and the given `extensions` for the `key`.
## create_cert_self_signed(subject , key , age ONE_YEAR, extensions EXTENSIONS, serial 1) [](#method-c-create_cert_self_signed)
Creates a self-signed certificate with an issuer and subject of `subject` and
the given `extensions` for the `key`.
## create_digest(algorithm DIGEST_NAME) [](#method-c-create_digest)
Creates a new digest instance using the specified `algorithm`. The default is
SHA256.
## create_key(algorithm ) [](#method-c-create_key)
Creates a new key pair of the specified `algorithm`. RSA, DSA, and EC are
supported.
## email_to_name(email_address ) [](#method-c-email_to_name)
Turns `email_address` into an OpenSSL::X509::Name
## get_public_key(key ) [](#method-c-get_public_key)
Gets the right public key from a PKey instance
## re_sign(expired_certificate , private_key , age ONE_YEAR, extensions EXTENSIONS) [](#method-c-re_sign)
Signs `expired_certificate` with `private_key` if the keys match and the
expired certificate was self-signed. -- TODO increment serial
**@raise** [Gem::Security::Exception] 

## reset() [](#method-c-reset)
Resets the trust directory for verifying gems.
## sign(certificate , signing_key , signing_cert , age ONE_YEAR, extensions EXTENSIONS, serial 1) [](#method-c-sign)
Sign the public key from `certificate` with the `signing_key` and
`signing_cert`, using the Gem::Security::DIGEST_NAME.  Uses the default
certificate validity range and extensions.

Returns the newly signed certificate.
## trust_dir() [](#method-c-trust_dir)
Returns a Gem::Security::TrustDir which wraps the directory where trusted
certificates live.
## trusted_certificates(&block ) [](#method-c-trusted_certificates)
Enumerates the trusted certificates via Gem::Security::TrustDir.
## write(pemmable , path , permissions 0o600, passphrase nil, cipher KEY_CIPHER) [](#method-c-write)
Writes `pemmable`, which must respond to `to_pem` to `path` with the given
`permissions`. If passed `cipher` and `passphrase` those arguments will be
passed to `to_pem`.

