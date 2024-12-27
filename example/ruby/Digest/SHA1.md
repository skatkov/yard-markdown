# Class: Digest::SHA1
**Inherits:** Digest_Base
    

A class for calculating message digests using the SHA-1 Secure Hash Algorithm
by NIST (the US' National Institute of Standards and Technology), described in
FIPS PUB 180-1.

See Digest::Instance for digest API.

SHA-1 calculates a digest of 160 bits (20 bytes).

## Examples
    require 'digest'

    # Compute a complete digest
    Digest::SHA1.hexdigest 'abc'      #=> "a9993e36..."

    # Compute digest by chunks
    sha1 = Digest::SHA1.new               # =>#<Digest::SHA1>
    sha1.update "ab"
    sha1 << "c"                           # alias for #update
    sha1.hexdigest                        # => "a9993e36..."

    # Use the same object to compute another digest
    sha1.reset
    sha1 << "message"
    sha1.hexdigest                        # => "6f9b9af3..."



