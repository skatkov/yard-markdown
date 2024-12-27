# Class: OpenSSL::Timestamp::Response
**Inherits:** Object
    

Immutable and read-only representation of a timestamp response returned from a
timestamp server after receiving an associated Request. Allows access to
specific information about the response but also allows to verify the
Response.



#Instance Methods
## failure_info() [](#method-i-failure_info)
In cases no timestamp token has been created, this field contains further info
about the reason why response creation failed. The method returns either nil
(the request was successful and a timestamp token was created) or one of the
following:
*   :BAD_ALG - Indicates that the timestamp server rejects the message imprint
    algorithm used in the Request
*   :BAD_REQUEST - Indicates that the timestamp server was not able to process
    the Request properly
*   :BAD_DATA_FORMAT - Indicates that the timestamp server was not able to
    parse certain data in the Request
*   :TIME_NOT_AVAILABLE - Indicates that the server could not access its time
    source
*   :UNACCEPTED_POLICY - Indicates that the requested policy identifier is not
    recognized or supported by the timestamp server
*   :UNACCEPTED_EXTENSIION - Indicates that an extension in the Request is not
    supported by the timestamp server
*   :ADD_INFO_NOT_AVAILABLE -Indicates that additional information requested
    is either not understood or currently not available
*   :SYSTEM_FAILURE - Timestamp creation failed due to an internal error that
    occurred on the timestamp server

call-seq:
    response.failure_info -> nil or symbol

## initialize(der) [](#method-i-initialize)
Creates a Response from a `File` or `string` parameter, the corresponding
`File` or `string` must be DER-encoded. Please note that Response is an
immutable read-only class. If you'd like to create timestamps please refer to
Factory instead.

call-seq:
    OpenSSL::Timestamp::Response.new(file)    -> response
    OpenSSL::Timestamp::Response.new(string)  -> response

## status() [](#method-i-status)
Returns one of GRANTED, GRANTED_WITH_MODS, REJECTION, WAITING,
REVOCATION_WARNING or REVOCATION_NOTIFICATION. A timestamp token has been
created only in case `status` is equal to GRANTED or GRANTED_WITH_MODS.

call-seq:
    response.status -> BN (never nil)

## status_text() [](#method-i-status_text)
In cases of failure this field may contain an array of strings further
describing the origin of the failure.

call-seq:
    response.status_text -> Array of strings or nil

## to_der() [](#method-i-to_der)
Returns the Response in DER-encoded form.

call-seq:
    response.to_der -> string

## to_text() [](#method-i-to_text)

## token() [](#method-i-token)
If a timestamp token is present, this returns it in the form of a
OpenSSL::PKCS7.

call-seq:
    response.token -> nil or OpenSSL::PKCS7

## token_info() [](#method-i-token_info)
Get the response's token info if present.

call-seq:
    response.token_info -> nil or OpenSSL::Timestamp::TokenInfo

## tsa_certificate() [](#method-i-tsa_certificate)
If the Request specified to request the TSA certificate
(Request#cert_requested = true), then this field contains the certificate of
the timestamp authority.

call-seq:
    response.tsa_certificate -> OpenSSL::X509::Certificate or nil

## verify(*args) [](#method-i-verify)
Verifies a timestamp token by checking the signature, validating the
certificate chain implied by tsa_certificate and by checking conformance to a
given Request. Mandatory parameters are the Request associated to this
Response, and an OpenSSL::X509::Store of trusted roots.

Intermediate certificates can optionally be supplied for creating the
certificate chain. These intermediate certificates must all be instances of
OpenSSL::X509::Certificate.

If validation fails, several kinds of exceptions can be raised:
*   TypeError if types don't fit
*   TimestampError if something is wrong with the timestamp token itself, if
    it is not conformant to the Request, or if validation of the timestamp
    certificate chain fails.

call-seq:
    response.verify(Request, root_store) -> Response
    response.verify(Request, root_store, [intermediate_cert]) -> Response

