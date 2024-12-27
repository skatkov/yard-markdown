# Exception: Gem::RemoteFetcher::FetchError
**Inherits:** Gem::Exception
    

A FetchError exception wraps up the various possible IO and HTTP failures that
could happen while downloading from the internet.


# Attributes
## original_uri[RW] [](#attribute-i-original_uri)
The URI which was being accessed when the exception happened.

## uri[RW] [](#attribute-i-uri)
The URI which was being accessed when the exception happened.


#Instance Methods
## initialize(message, uri) [](#method-i-initialize)

**@return** [FetchError] a new instance of FetchError

## to_s() [](#method-i-to_s)
:nodoc:

