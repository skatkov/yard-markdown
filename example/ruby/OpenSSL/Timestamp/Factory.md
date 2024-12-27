# Class: OpenSSL::Timestamp::Factory
**Inherits:** Object
    

Used to generate a Response from scratch.

Please bear in mind that the implementation will always apply and prefer the
policy object identifier given in the request over the default policy id
specified in the Factory. As a consequence, `default_policy_id` will only be
applied if no Request#policy_id was given. But this also means that one needs
to check the policy identifier in the request manually before creating the
Response, e.g. to check whether it complies to a specific set of acceptable
policies.

There exists also the possibility to add certificates (instances of
OpenSSL::X509::Certificate) besides the timestamping certificate that will be
included in the resulting timestamp token if Request#cert_requested? is
`true`. Ideally, one would also include any intermediate certificates (the
root certificate can be left out - in order to trust it any verifying party
will have to be in its possession anyway). This simplifies validation of the
timestamp since these intermediate certificates are "already there" and need
not be passed as external parameters to Response#verify anymore, thus
minimizing external resources needed for verification.

### Example: Inclusion of (untrusted) intermediate certificates

Assume we received a timestamp request that has set Request#policy_id to `nil`
and Request#cert_requested? to true. The raw request bytes are stored in a
variable called `req_raw`. We'd still like to integrate the necessary
intermediate certificates (in `inter1.cer` and `inter2.cer`) to simplify
validation of the resulting Response. `ts.p12` is a PKCS#12-compatible file
including the private key and the timestamping certificate.

    req = OpenSSL::Timestamp::Request.new(raw_bytes)
    p12 = OpenSSL::PKCS12.new(File.binread('ts.p12'), 'pwd')
    inter1 = OpenSSL::X509::Certificate.new(File.binread('inter1.cer'))
    inter2 = OpenSSL::X509::Certificate.new(File.binread('inter2.cer'))
    fac = OpenSSL::Timestamp::Factory.new
    fac.gen_time = Time.now
    fac.serial_number = 1
    fac.allowed_digests = ["sha256", "sha384", "sha512"]
    #needed because the Request contained no policy identifier
    fac.default_policy_id = '1.2.3.4.5'
    fac.additional_certificates = [ inter1, inter2 ]
    timestamp = fac.create_timestamp(p12.key, p12.certificate, req)

## Attributes

### default_policy_id

Request#policy_id will always be preferred over this if present in the
Request, only if Request#policy_id is nil default_policy will be used. If none
of both is present, a TimestampError will be raised when trying to create a
Response.

call-seq:
    factory.default_policy_id = "string" -> string
    factory.default_policy_id            -> string or nil

### serial_number

Sets or retrieves the serial number to be used for timestamp creation. Must be
present for timestamp creation.

call-seq:
    factory.serial_number = number -> number
    factory.serial_number          -> number or nil

### gen_time

Sets or retrieves the Time value to be used in the Response. Must be present
for timestamp creation.

call-seq:
    factory.gen_time = Time -> Time
    factory.gen_time        -> Time or nil

### additional_certs

Sets or retrieves additional certificates apart from the timestamp certificate
(e.g. intermediate certificates) to be added to the Response. Must be an Array
of OpenSSL::X509::Certificate.

call-seq:
    factory.additional_certs = [cert1, cert2] -> [ cert1, cert2 ]
    factory.additional_certs                  -> array or nil

### allowed_digests

Sets or retrieves the digest algorithms that the factory is allowed create
timestamps for. Known vulnerable or weak algorithms should not be allowed
where possible. Must be an Array of String or OpenSSL::Digest subclass
instances.

call-seq:
    factory.allowed_digests = ["sha1", OpenSSL::Digest.new('SHA256').new] -> [ "sha1", OpenSSL::Digest) ]
    factory.allowed_digests                                               -> array or nil



#Instance Methods
## create_timestamp(key, certificate, request) [](#method-i-create_timestamp)
Creates a Response with the help of an OpenSSL::PKey, an
OpenSSL::X509::Certificate and a Request.

Mandatory parameters for timestamp creation that need to be set in the
Request:

*   Request#algorithm
*   Request#message_imprint

Mandatory parameters that need to be set in the Factory:
*   Factory#serial_number
*   Factory#gen_time
*   Factory#allowed_digests

In addition one of either Request#policy_id or Factory#default_policy_id must
be set.

Raises a TimestampError if creation fails, though successfully created error
responses may be returned.

call-seq:
    factory.create_timestamp(key, certificate, request) -> Response

