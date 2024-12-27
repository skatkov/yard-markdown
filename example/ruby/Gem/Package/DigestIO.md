# Class: Gem::Package::DigestIO
**Inherits:** Object
    

IO wrapper that creates digests of contents written to the IO it wraps.


# Class Methods
## wrap(io , digests ) [](#method-c-wrap)
Wraps `io` and updates digest for each of the digest algorithms in the
`digests` Hash.  Returns the digests hash.  Example:

    io = StringIO.new
    digests = {
      'SHA1'   => OpenSSL::Digest.new('SHA1'),
      'SHA512' => OpenSSL::Digest.new('SHA512'),
    }

    Gem::Package::DigestIO.wrap io, digests do |digest_io|
      digest_io.write "hello"
    end

    digests['SHA1'].hexdigest   #=> "aaf4c61d[...]"
    digests['SHA512'].hexdigest #=> "9b71d224[...]"
**@yield** [digest_io] 

# Attributes
## digests[RW] [](#attribute-i-digests)
Collected digests for wrapped writes.

    {
      'SHA1'   => #<OpenSSL::Digest: [...]>,
      'SHA512' => #<OpenSSL::Digest: [...]>,
    }


#Instance Methods
## initialize(io, digests) [](#method-i-initialize)
Creates a new DigestIO instance.  Using ::wrap is recommended, see the ::wrap
documentation for documentation of `io` and `digests`.

**@return** [DigestIO] a new instance of DigestIO

## write(data) [](#method-i-write)
Writes `data` to the underlying IO and updates the digests

