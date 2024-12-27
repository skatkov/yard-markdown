# Class: OpenSSL::Timestamp::Request
**Inherits:** Object
    

Allows to create timestamp requests or parse existing ones. A Request is also
needed for creating timestamps from scratch with Factory. When created from
scratch, some default values are set:
*   version is set to `1`
*   cert_requested is set to `true`
*   algorithm, message_imprint, policy_id, and nonce are set to `false`



#Instance Methods
## algorithm() [](#method-i-algorithm)
Returns the 'short name' of the object identifier that represents the
algorithm that was used to create the message imprint digest.

    call-seq:
         request.algorithm    -> string

## algorithm=(algo) [](#method-i-algorithm=)
Allows to set the object identifier  or the 'short name' of the algorithm that
was used to create the message imprint digest.

### Example:
        request.algorithm = "SHA1"

    call-seq:
         request.algorithm = "string"    -> string

## cert_requested=(requested) [](#method-i-cert_requested=)
Specify whether the response shall contain the timestamp authority's
certificate or not. The default value is `true`.

call-seq:
    request.cert_requested = boolean -> true or false

## cert_requested?() [](#method-i-cert_requested?)
Indicates whether the response shall contain the timestamp authority's
certificate or not.

call-seq:
    request.cert_requested?  -> true or false

**@return** [Boolean] 

## initialize(*args) [](#method-i-initialize)
When creating a Request with the `File` or `string` parameter, the
corresponding `File` or `string` must be DER-encoded.

call-seq:
    OpenSSL::Timestamp::Request.new(file)    -> request
    OpenSSL::Timestamp::Request.new(string)  -> request
    OpenSSL::Timestamp::Request.new          -> empty request

## message_imprint() [](#method-i-message_imprint)
Returns the message imprint (digest) of the data to be timestamped.

call-seq:
    request.message_imprint    -> string or nil

## message_imprint=(hash) [](#method-i-message_imprint=)
Set the message imprint digest.

    call-seq:
         request.message_imprint = "string"    -> string

## nonce() [](#method-i-nonce)
Returns the nonce (number used once) that the server shall include in its
response.

call-seq:
    request.nonce    -> BN or nil

## nonce=(num) [](#method-i-nonce=)
Sets the nonce (number used once) that the server shall include in its
response. If the nonce is set, the server must return the same nonce value in
a valid Response.

call-seq:
    request.nonce = number    -> BN

## policy_id() [](#method-i-policy_id)
Returns the 'short name' of the object identifier that represents the
timestamp policy under which the server shall create the timestamp.

call-seq:
    request.policy_id    -> string or nil

## policy_id=(oid) [](#method-i-policy_id=)
Allows to set the object identifier that represents the timestamp policy under
which the server shall create the timestamp. This may be left `nil`, implying
that the timestamp server will issue the timestamp using some default policy.

### Example:
    request.policy_id = "1.2.3.4.5"

call-seq:
    request.policy_id = "string"   -> string

## to_der() [](#method-i-to_der)
DER-encodes this Request.

call-seq:
    request.to_der    -> DER-encoded string

## to_text() [](#method-i-to_text)

## version() [](#method-i-version)
Returns the version of this request. `1` is the default value.

call-seq:
    request.version -> Integer

## version=(version) [](#method-i-version=)
Sets the version number for this Request. This should be `1` for compliant
servers.

call-seq:
    request.version = number    -> Integer

