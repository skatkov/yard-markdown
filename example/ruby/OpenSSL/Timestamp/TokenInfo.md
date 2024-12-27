# Class: OpenSSL::Timestamp::TokenInfo
**Inherits:** Object
    

Immutable and read-only representation of a timestamp token info from a
Response.



#Instance Methods
## algorithm() [](#method-i-algorithm)
Returns the 'short name' of the object identifier representing the algorithm
that was used to derive the message imprint digest. For valid timestamps, this
is the same value that was already given in the Request. If status is GRANTED
or GRANTED_WITH_MODS, this is never `nil`.

### Example:
    algo = token_info.algorithm
    puts algo                -> "SHA1"

call-seq:
    token_info.algorithm -> string or nil

## gen_time() [](#method-i-gen_time)
Returns time when this timestamp token was created. If status is GRANTED or
GRANTED_WITH_MODS, this is never `nil`.

call-seq:
    token_info.gen_time -> Time

## initialize(der) [](#method-i-initialize)
Creates a TokenInfo from a `File` or `string` parameter, the corresponding
`File` or `string` must be DER-encoded. Please note that TokenInfo is an
immutable read-only class. If you'd like to create timestamps please refer to
Factory instead.

call-seq:
    OpenSSL::Timestamp::TokenInfo.new(file)    -> token-info
    OpenSSL::Timestamp::TokenInfo.new(string)  -> token-info

## message_imprint() [](#method-i-message_imprint)
Returns the message imprint digest. For valid timestamps, this is the same
value that was already given in the Request. If status is GRANTED or
GRANTED_WITH_MODS, this is never `nil`.

### Example:
    mi = token_info.msg_imprint
    puts mi                -> "DEADBEEF"

call-seq:
    token_info.msg_imprint -> string.

## nonce() [](#method-i-nonce)
If the timestamp token is valid then this field contains the same nonce that
was passed to the timestamp server in the initial Request.

call-seq:
    token_info.nonce -> BN or nil

## ordering() [](#method-i-ordering)
If the ordering field is missing, or if the ordering field is present and set
to false, then the genTime field only indicates the time at which the
time-stamp token has been created by the TSA.  In such a case, the ordering of
time-stamp tokens issued by the same TSA or different TSAs is only possible
when the difference between the genTime of the first time-stamp token and the
genTime of the second time-stamp token is greater than the sum of the
accuracies of the genTime for each time-stamp token.

If the ordering field is present and set to true, every time-stamp token from
the same TSA can always be ordered based on the genTime field, regardless of
the genTime accuracy.

call-seq:
    token_info.ordering -> true, falses or nil

## policy_id() [](#method-i-policy_id)
Returns the timestamp policy object identifier of the policy this timestamp
was created under. If status is GRANTED or GRANTED_WITH_MODS, this is never
`nil`.

### Example:
    id = token_info.policy_id
    puts id                 -> "1.2.3.4.5"

call-seq:
    token_info.policy_id -> string or nil

## serial_number() [](#method-i-serial_number)
Returns serial number of the timestamp token. This value shall never be the
same for two timestamp tokens issued by a dedicated timestamp authority. If
status is GRANTED or GRANTED_WITH_MODS, this is never `nil`.

call-seq:
    token_info.serial_number -> BN or nil

## to_der() [](#method-i-to_der)
Returns the TokenInfo in DER-encoded form.

call-seq:
    token_info.to_der -> string

## to_text() [](#method-i-to_text)

## version() [](#method-i-version)
Returns the version number of the token info. With compliant servers, this
value should be `1` if present. If status is GRANTED or GRANTED_WITH_MODS.

call-seq:
    token_info.version -> Integer or nil

