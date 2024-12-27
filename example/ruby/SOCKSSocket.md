# Class: SOCKSSocket
**Inherits:** TCPSocket
    

SOCKS is an Internet protocol that routes packets between a client and a
server through a proxy server.  SOCKS5, if supported, additionally provides
authentication so only authorized users may access a server.



#Instance Methods
## close() [](#method-i-close)
Closes the SOCKS connection.

## initialize(host, port) [](#method-i-initialize)
Opens a SOCKS connection to `host` via the SOCKS server.

The SOCKS server configuration varies by implementation

When using the Dante libsocks/libsocksd implementation it is configured as
SOCKS_SERVER env var.

See: https://manpages.debian.org/testing/dante-client/socksify.1.en.html for
full env variable support.

**@overload** [] 

