# Class: OpenSSL::OCSP::BasicResponse
**Inherits:** Object
    




#Instance Methods
## add_nonce(*args) [](#method-i-add_nonce)
Adds *nonce* to this response.  If no nonce was provided a random nonce will
be added.

**@overload** [] 

## add_status(cid, status, reason, revtime, thisupd, nextupd, ext) [](#method-i-add_status)
Adds a certificate status for *certificate_id*. *status* is the status, and
must be one of these:

*   OpenSSL::OCSP::V_CERTSTATUS_GOOD
*   OpenSSL::OCSP::V_CERTSTATUS_REVOKED
*   OpenSSL::OCSP::V_CERTSTATUS_UNKNOWN

*reason* and *revocation_time* can be given only when *status* is
OpenSSL::OCSP::V_CERTSTATUS_REVOKED. *reason* describes the reason for the
revocation, and must be one of OpenSSL::OCSP::REVOKED_STATUS_* constants.
*revocation_time* is the time when the certificate is revoked.

*this_update* and *next_update* indicate the time at which the status is
verified to be correct and the time at or before which newer information will
be available, respectively. *next_update* is optional.

*extensions* is an Array of OpenSSL::X509::Extension to be included in the
SingleResponse. This is also optional.

Note that the times, *revocation_time*, *this_update* and *next_update* can be
specified in either of Integer or Time object. If they are Integer, it is
treated as the relative seconds from the current time.

**@overload** [] 

## copy_nonce(request) [](#method-i-copy_nonce)
Copies the nonce from *request* into this response.  Returns 1 on success and
0 on failure.

**@overload** [] 

## find_response(target) [](#method-i-find_response)
Returns a SingleResponse whose CertId matches with *certificate_id*, or `nil`
if this BasicResponse does not contain it.

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Creates a new BasicResponse. If *der_string* is given, decodes *der_string* as
DER.

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## responses() [](#method-i-responses)
Returns an Array of SingleResponse for this BasicResponse.

**@overload** [] 

## sign(*args) [](#method-i-sign)
Signs this OCSP response using the *cert*, *key* and optional *digest*. This
behaves in the similar way as OpenSSL::OCSP::Request#sign.

*flags* can include:
OpenSSL::OCSP::NOCERTS
:   don't include certificates

OpenSSL::OCSP::NOTIME
:   don't set producedAt

OpenSSL::OCSP::RESPID_KEY
:   use signer's public key hash as responderID


**@overload** [] 

## status() [](#method-i-status)
Returns an Array of statuses for this response.  Each status contains a
CertificateId, the status (0 for good, 1 for revoked, 2 for unknown), the
reason for the status, the revocation time, the time of this update, the time
for the next update and a list of OpenSSL::X509::Extension.

This should be superseded by BasicResponse#responses and #find_response that
return SingleResponse.

**@overload** [] 

## to_der() [](#method-i-to_der)
Encodes this basic response into a DER-encoded string.

**@overload** [] 

## verify(*args) [](#method-i-verify)
Verifies the signature of the response using the given *certificates* and
*store*. This works in the similar way as OpenSSL::OCSP::Request#verify.

**@overload** [] 

