# Class: OpenSSL::Timestamp
**Inherits:** Object
    

Provides classes and methods to request, create and validate
[RFC3161-compliant](http://www.ietf.org/rfc/rfc3161.txt) timestamps. Request
may be used to either create requests from scratch or to parse existing
requests that again can be used to request timestamps from a timestamp server,
e.g. via the net/http. The resulting timestamp response may be parsed using
Response.

Please note that Response is read-only and immutable. To create a Response, an
instance of Factory as well as a valid Request are needed.

### Create a Response:
    #Assumes ts.p12 is a PKCS#12-compatible file with a private key
    #and a certificate that has an extended key usage of 'timeStamping'
    p12 = OpenSSL::PKCS12.new(File.binread('ts.p12'), 'pwd')
    md = OpenSSL::Digest.new('SHA1')
    hash = md.digest(data) #some binary data to be timestamped
    req = OpenSSL::Timestamp::Request.new
    req.algorithm = 'SHA1'
    req.message_imprint = hash
    req.policy_id = "1.2.3.4.5"
    req.nonce = 42
    fac = OpenSSL::Timestamp::Factory.new
    fac.gen_time = Time.now
    fac.serial_number = 1
    timestamp = fac.create_timestamp(p12.key, p12.certificate, req)

### Verify a timestamp response:
    #Assume we have a timestamp token in a file called ts.der
    ts = OpenSSL::Timestamp::Response.new(File.binread('ts.der'))
    #Assume we have the Request for this token in a file called req.der
    req = OpenSSL::Timestamp::Request.new(File.binread('req.der'))
    # Assume the associated root CA certificate is contained in a
    # DER-encoded file named root.cer
    root = OpenSSL::X509::Certificate.new(File.binread('root.cer'))
    # get the necessary intermediate certificates, available in
    # DER-encoded form in inter1.cer and inter2.cer
    inter1 = OpenSSL::X509::Certificate.new(File.binread('inter1.cer'))
    inter2 = OpenSSL::X509::Certificate.new(File.binread('inter2.cer'))
    ts.verify(req, root, inter1, inter2) -> ts or raises an exception if validation fails



