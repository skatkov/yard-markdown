# Class: OpenSSL::X509::StoreContext
**Inherits:** Object
    

A StoreContext is used while validating a single certificate and holds the
status involved.



#Instance Methods
## chain() [](#method-i-chain)
Returns the verified chain.

See also the man page X509_STORE_CTX_set0_verified_chain(3).

**@overload** [] 

## cleanup() [](#method-i-cleanup)

## current_cert() [](#method-i-current_cert)
Returns the certificate which caused the error.

See also the man page X509_STORE_CTX_get_current_cert(3).

**@overload** [] 

## current_crl() [](#method-i-current_crl)
Returns the CRL which caused the error.

See also the man page X509_STORE_CTX_get_current_crl(3).

**@overload** [] 

## error() [](#method-i-error)
Returns the error code of *stctx*. This is typically called after #verify is
done, or from the verification callback set to
OpenSSL::X509::Store#verify_callback=.

See also the man page X509_STORE_CTX_get_error(3).

**@overload** [] 

## error=(err) [](#method-i-error=)
Sets the error code of *stctx*. This is used by the verification callback set
to OpenSSL::X509::Store#verify_callback=.

See also the man page X509_STORE_CTX_set_error(3).

**@overload** [] 

## error_depth() [](#method-i-error_depth)
Returns the depth of the chain. This is used in combination with #error.

See also the man page X509_STORE_CTX_get_error_depth(3).

**@overload** [] 

## error_string() [](#method-i-error_string)
Returns the human readable error string corresponding to the error code
retrieved by #error.

See also the man page X509_verify_cert_error_string(3).

**@overload** [] 

## flags=(flags) [](#method-i-flags=)
Sets the verification flags to the context. This overrides the default value
set by Store#flags=.

See also the man page X509_VERIFY_PARAM_set_flags(3).

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Sets up a StoreContext for a verification of the X.509 certificate *cert*.

**@overload** [] 

## purpose=(purpose) [](#method-i-purpose=)
Sets the purpose of the context. This overrides the default value set by
Store#purpose=.

See also the man page X509_VERIFY_PARAM_set_purpose(3).

**@overload** [] 

## time=(time) [](#method-i-time=)
Sets the time used in the verification. If not set, the current time is used.

See also the man page X509_VERIFY_PARAM_set_time(3).

**@overload** [] 

## trust=(trust) [](#method-i-trust=)
Sets the trust settings of the context. This overrides the default value set
by Store#trust=.

See also the man page X509_VERIFY_PARAM_set_trust(3).

**@overload** [] 

## verify() [](#method-i-verify)
Performs the certificate verification using the parameters set to *stctx*.

See also the man page X509_verify_cert(3).

**@overload** [] 

