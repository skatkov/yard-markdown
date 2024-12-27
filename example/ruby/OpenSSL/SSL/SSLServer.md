# Class: OpenSSL::SSL::SSLServer
**Inherits:** Object
    
**Includes:** OpenSSL::SSL::SocketForwarder
  

SSLServer represents a TCP/IP server socket with Secure Sockets Layer.


# Attributes
## start_immediately[RW] [](#attribute-i-start_immediately)
When true then #accept works exactly the same as TCPServer#accept


#Instance Methods
## accept() [](#method-i-accept)
Works similar to TCPServer#accept.

## addr() [](#method-i-addr)

## close() [](#method-i-close)
See IO#close for details.

## close_on_exec=(value) [](#method-i-close_on_exec=)

## close_on_exec?() [](#method-i-close_on_exec?)

**@return** [Boolean] 

## closed?() [](#method-i-closed?)

**@return** [Boolean] 

## do_not_reverse_lookup=(flag) [](#method-i-do_not_reverse_lookup=)

## fcntl(*args) [](#method-i-fcntl)

## fileno() [](#method-i-fileno)
The file descriptor for the socket.

## getsockopt(level, optname) [](#method-i-getsockopt)

## initialize(svr, ctx) [](#method-i-initialize)
Creates a new instance of SSLServer.
*   *srv* is an instance of TCPServer.
*   *ctx* is an instance of OpenSSL::SSL::SSLContext.

**@return** [SSLServer] a new instance of SSLServer

## listen(backlogSocket::SOMAXCONN) [](#method-i-listen)
See TCPServer#listen for details.

## local_address() [](#method-i-local_address)

## peeraddr() [](#method-i-peeraddr)

## remote_address() [](#method-i-remote_address)

## setsockopt(level, optname, optval) [](#method-i-setsockopt)

## shutdown(howSocket::SHUT_RDWR) [](#method-i-shutdown)
See BasicSocket#shutdown for details.

## timeout() [](#method-i-timeout)

## timeout=(value) [](#method-i-timeout=)

## to_io() [](#method-i-to_io)
Returns the TCPServer passed to the SSLServer when initialized.

## wait(*args) [](#method-i-wait)

## wait_readable(*args) [](#method-i-wait_readable)

## wait_writable(*args) [](#method-i-wait_writable)

