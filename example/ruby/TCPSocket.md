# Class: TCPSocket
**Inherits:** IPSocket
    
**Includes:** CoreExtensions::TCPSocketExt
  

TCPSocket represents a TCP/IP client socket.

A simple client may look like:

    require 'socket'

    s = TCPSocket.new 'localhost', 2000

    while line = s.gets # Read lines from socket
      puts line         # and print them
    end

    s.close             # close socket when done


# Class Methods
## gethostbyname(host ) [](#method-c-gethostbyname)
Use Addrinfo.getaddrinfo instead. This method is deprecated for the following
reasons:

*   The 3rd element of the result is the address family of the first address.
    The address families of the rest of the addresses are not returned.
*   gethostbyname() may take a long time and it may block other threads. (GVL
    cannot be released since gethostbyname() is not thread safe.)
*   This method uses gethostbyname() function already removed from POSIX.

This method lookups host information by *hostname*.

    TCPSocket.gethostbyname("localhost")
    #=> ["localhost", ["hal"], 2, "127.0.0.1"]
**@overload** [] 


#Instance Methods
## initialize(*args) [](#method-i-initialize)
Opens a TCP connection to `remote_host` on `remote_port`.  If `local_host` and
`local_port` are specified, then those parameters are used on the local end to
establish the connection.

Starting from Ruby 3.4, this method operates according to the Happy Eyeballs
Version 2 ([RFC 8305](https://datatracker.ietf.org/doc/html/rfc8305))
algorithm by default, except on Windows.

For details on Happy Eyeballs Version 2, see
[Socket.tcp_fast_fallback=](rdoc-ref:Socket.tcp_fast_fallback=).

To make it behave the same as in Ruby 3.3 and earlier, explicitly specify the
option fast_fallback:false. Or, setting Socket.tcp_fast_fallback=false will
disable Happy Eyeballs Version 2 not only for this method but for all Socket
globally.

When using TCPSocket.new on Windows, Happy Eyeballs Version 2 is not provided,
and it behaves the same as in Ruby 3.3 and earlier.

:resolv_timeout
:   Specifies the timeout in seconds from when the hostname resolution starts.

:connect_timeout
:   This method sequentially attempts connecting to all candidate destination
    addresses.  
    The `connect_timeout` specifies the timeout in seconds from the start of
    the connection attempt to the last candidate.  
    By default, all connection attempts continue until the timeout occurs.  
    When `fast_fallback:false` is explicitly specified,  
    a timeout is set for each connection attempt and any connection attempt
    that exceeds its timeout will be canceled.

:fast_fallback
:   Enables the Happy Eyeballs Version 2 algorithm (enabled by default).


**@overload** [] 

