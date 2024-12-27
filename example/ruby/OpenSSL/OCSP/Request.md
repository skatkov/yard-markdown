# Class: OpenSSL::OCSP::Request
**Inherits:** Object
    




#Instance Methods
## add_certid(certid) [](#method-i-add_certid)
Adds *certificate_id* to the request.

**@overload** [] 

## add_nonce(*args) [](#method-i-add_nonce)
Adds a *nonce* to the OCSP request.  If no nonce is given a random one will be
generated.

The nonce is used to prevent replay attacks but some servers do not support
it.

**@overload** [] 

## certid() [](#method-i-certid)
Returns all certificate IDs in this request.

**@overload** [] 

## check_nonce(basic_resp) [](#method-i-check_nonce)
Checks the nonce validity for this request and *response*.

The return value is one of the following:

-1
:   nonce in request only.

0
:   nonces both present and not equal.

1
:   nonces present and equal.

2
:   nonces both absent.

3
:   nonce present in response only.


For most responses, clients can check *result* > 0.  If a responder doesn't
handle nonces `result.nonzero?` may be necessary.  A result of `0` is always
an error.

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Creates a new OpenSSL::OCSP::Request.  The request may be created empty or
from a *request_der* string.

**@overload** [] 

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## sign(*args) [](#method-i-sign)
Signs this OCSP request using *cert*, *key* and optional *digest*. If *digest*
is not specified, SHA-1 is used. *certs* is an optional Array of additional
certificates which are included in the request in addition to the signer
certificate. Note that if *certs* is `nil` or not given, flag
OpenSSL::OCSP::NOCERTS is enabled. Pass an empty array to include only the
signer certificate.

*flags* is a bitwise OR of the following constants:

OpenSSL::OCSP::NOCERTS
:   Don't include any certificates in the request. *certs* will be ignored.


**@overload** [] 

## signed?() [](#method-i-signed?)
Returns `true` if the request is signed, `false` otherwise. Note that the
validity of the signature is **not** checked. Use #verify to verify that.

**@overload** [] 

## to_der() [](#method-i-to_der)
Returns this request as a DER-encoded string

## verify(*args) [](#method-i-verify)
Verifies this request using the given *certificates* and *store*.
*certificates* is an array of OpenSSL::X509::Certificate, *store* is an
OpenSSL::X509::Store.

Note that `false` is returned if the request does not have a signature. Use
#signed? to check whether the request is signed or not.

**@overload** [] 

