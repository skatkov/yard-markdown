# Class: OpenSSL::X509::Store
**Inherits:** Object
    

The X509 certificate store holds trusted CA certificates used to verify peer
certificates.

The easiest way to create a useful certificate store is:

    cert_store = OpenSSL::X509::Store.new
    cert_store.set_default_paths

This will use your system's built-in certificates.

If your system does not have a default set of certificates you can obtain a
set extracted from Mozilla CA certificate store by cURL maintainers here:
https://curl.haxx.se/docs/caextract.html (You may wish to use the
firefox-db2pem.sh script to extract the certificates from a local install to
avoid man-in-the-middle attacks.)

After downloading or generating a cacert.pem from the above link you can
create a certificate store from the pem file like this:

    cert_store = OpenSSL::X509::Store.new
    cert_store.add_file 'cacert.pem'

The certificate store can be used with an SSLSocket like this:

    ssl_context = OpenSSL::SSL::SSLContext.new
    ssl_context.verify_mode = OpenSSL::SSL::VERIFY_PEER
    ssl_context.cert_store = cert_store

    tcp_socket = TCPSocket.open 'example.com', 443

    ssl_socket = OpenSSL::SSL::SSLSocket.new tcp_socket, ssl_context



#Instance Methods
## add_cert(arg) [](#method-i-add_cert)
Adds the OpenSSL::X509::Certificate *cert* to the certificate store.

See also the man page X509_STORE_add_cert(3).

**@overload** [] 

## add_crl(arg) [](#method-i-add_crl)
Adds the OpenSSL::X509::CRL *crl* to the store.

See also the man page X509_STORE_add_crl(3).

**@overload** [] 

## add_file(file) [](#method-i-add_file)
Adds the certificates in *file* to the certificate store. *file* is the path
to the file, and the file contains one or more certificates in PEM format
concatenated together.

See also the man page X509_LOOKUP_file(3).

**@overload** [] 

## add_path(dir) [](#method-i-add_path)
Adds *path* as the hash dir to be looked up by the store.

See also the man page X509_LOOKUP_hash_dir(3).

**@overload** [] 

## flags=(flags) [](#method-i-flags=)
Sets the default flags used by certificate chain verification performed with
the Store.

*flags* consists of zero or more of the constants defined in OpenSSL::X509
with name V_FLAG_* or'ed together.

OpenSSL::X509::StoreContext#flags= can be used to change the flags for a
single verification operation.

See also the man page X509_VERIFY_PARAM_set_flags(3).

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Creates a new X509::Store.

**@overload** [] 

## purpose=(purpose) [](#method-i-purpose=)
Sets the store's default verification purpose. If specified, the verifications
on the store will check every certificate's extensions are consistent with the
purpose. The purpose is specified by constants:

*   X509::PURPOSE_SSL_CLIENT
*   X509::PURPOSE_SSL_SERVER
*   X509::PURPOSE_NS_SSL_SERVER
*   X509::PURPOSE_SMIME_SIGN
*   X509::PURPOSE_SMIME_ENCRYPT
*   X509::PURPOSE_CRL_SIGN
*   X509::PURPOSE_ANY
*   X509::PURPOSE_OCSP_HELPER
*   X509::PURPOSE_TIMESTAMP_SIGN

OpenSSL::X509::StoreContext#purpose= can be used to change the value for a
single verification operation.

See also the man page X509_VERIFY_PARAM_set_purpose(3).

**@overload** [] 

## set_default_paths() [](#method-i-set_default_paths)
Configures *store* to look up CA certificates from the system default
certificate store as needed basis. The location of the store can usually be
determined by:

*   OpenSSL::X509::DEFAULT_CERT_FILE
*   OpenSSL::X509::DEFAULT_CERT_DIR

See also the man page X509_STORE_set_default_paths(3).

**@overload** [] 

## time=(time) [](#method-i-time=)
Sets the time to be used in the certificate verifications with the store. By
default, if not specified, the current system time is used.

OpenSSL::X509::StoreContext#time= can be used to change the value for a single
verification operation.

See also the man page X509_VERIFY_PARAM_set_time(3).

**@overload** [] 

## trust=(trust) [](#method-i-trust=)
Sets the default trust settings used by the certificate verification with the
store.

OpenSSL::X509::StoreContext#trust= can be used to change the value for a
single verification operation.

See also the man page X509_VERIFY_PARAM_set_trust(3).

**@overload** [] 

## verify(*args) [](#method-i-verify)
Performs a certificate verification on the OpenSSL::X509::Certificate *cert*.

*chain* can be an array of OpenSSL::X509::Certificate that is used to
construct the certificate chain.

If a block is given, it overrides the callback set by #verify_callback=.

After finishing the verification, the error information can be retrieved by
#error, #error_string, and the resulting complete certificate chain can be
retrieved by #chain.

**@overload** [] 

## verify_callback=(cb) [](#method-i-verify_callback=)
General callback for OpenSSL verify

