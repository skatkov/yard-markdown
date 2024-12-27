# Class: OpenSSL::OCSP::SingleResponse
**Inherits:** Object
    




#Instance Methods
## cert_status() [](#method-i-cert_status)
Returns the status of the certificate identified by the certid. The return
value may be one of these constant:

*   V_CERTSTATUS_GOOD
*   V_CERTSTATUS_REVOKED
*   V_CERTSTATUS_UNKNOWN

When the status is V_CERTSTATUS_REVOKED, the time at which the certificate was
revoked can be retrieved by #revocation_time.

**@overload** [] 

## certid() [](#method-i-certid)
Returns the CertificateId for which this SingleResponse is.

**@overload** [] 

## check_validity(*args) [](#method-i-check_validity)
Checks the validity of thisUpdate and nextUpdate fields of this
SingleResponse. This checks the current time is within the range thisUpdate to
nextUpdate.

It is possible that the OCSP request takes a few seconds or the time is not
accurate. To avoid rejecting a valid response, this method allows the times to
be within *nsec* seconds of the current time.

Some responders don't set the nextUpdate field. This may cause a very old
response to be considered valid. The *maxsec* parameter can be used to limit
the age of responses.

**@overload** [] 

## extensions() [](#method-i-extensions)

**@overload** [] 

## initialize(arg) [](#method-i-initialize)
Creates a new SingleResponse from *der_string*.

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## next_update() [](#method-i-next_update)

**@overload** [] 

## revocation_reason() [](#method-i-revocation_reason)

**@overload** [] 

## revocation_time() [](#method-i-revocation_time)

**@overload** [] 

## this_update() [](#method-i-this_update)

**@overload** [] 

## to_der() [](#method-i-to_der)
Encodes this SingleResponse into a DER-encoded string.

**@overload** [] 

