# Class: Digest::MD5
**Inherits:** Digest_Base
    

A class for calculating message digests using the MD5 Message-Digest Algorithm
by RSA Data Security, Inc., described in RFC1321.

MD5 calculates a digest of 128 bits (16 bytes).

## Examples
    require 'digest'

    # Compute a complete digest
    Digest::MD5.hexdigest 'abc'      #=> "90015098..."

    # Compute digest by chunks
    md5 = Digest::MD5.new               # =>#<Digest::MD5>
    md5.update "ab"
    md5 << "c"                           # alias for #update
    md5.hexdigest                        # => "90015098..."

    # Use the same object to compute another digest
    md5.reset
    md5 << "message"
    md5.hexdigest                        # => "78e73102..."



