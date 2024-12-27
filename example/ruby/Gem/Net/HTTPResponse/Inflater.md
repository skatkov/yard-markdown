# Class: Gem::Net::HTTPResponse::Inflater
**Inherits:** Object
    

Inflater is a wrapper around Gem::Net::BufferedIO that transparently inflates
zlib and gzip streams.



#Instance Methods
## bytes_inflated() [](#method-i-bytes_inflated)
The number of bytes inflated, used to update the Content-Length of the
response.

## finish() [](#method-i-finish)
Finishes the inflate stream.

## inflate_adapter(dest) [](#method-i-inflate_adapter)
Returns a Gem::Net::ReadAdapter that inflates each read chunk into `dest`.

This allows a large response body to be inflated without storing the entire
body in memory.

## initialize(socket) [](#method-i-initialize)
Creates a new Inflater wrapping `socket`

**@return** [Inflater] a new instance of Inflater

## read(clen, dest, ignore_eoffalse) [](#method-i-read)
Reads `clen` bytes from the socket, inflates them, then writes them to `dest`.
 `ignore_eof` is passed down to Gem::Net::BufferedIO#read

Unlike Gem::Net::BufferedIO#read, this method returns more than `clen` bytes.
At this time there is no way for a user of Gem::Net::HTTPResponse to read a
specific number of bytes from the HTTP response body, so this internal API
does not return the same number of bytes as were requested.

See https://bugs.ruby-lang.org/issues/6492 for further discussion.

## read_all(dest) [](#method-i-read_all)
Reads the rest of the socket, inflates it, then writes it to `dest`.

