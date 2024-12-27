# Class: Addrinfo
**Inherits:** Object
    



# Class Methods
## foreach(nodename , service , family nil, socktype nil, protocol nil, flags nil, timeout: nil, &block ) [](#method-c-foreach)
iterates over the list of Addrinfo objects obtained by Addrinfo.getaddrinfo.

    Addrinfo.foreach(nil, 80) {|x| p x }
    #=> #<Addrinfo: 127.0.0.1:80 TCP (:80)>
    #   #<Addrinfo: 127.0.0.1:80 UDP (:80)>
    #   #<Addrinfo: [::1]:80 TCP (:80)>
    #   #<Addrinfo: [::1]:80 UDP (:80)>
## getaddrinfo(*args ) [](#method-c-getaddrinfo)
returns a list of addrinfo objects as an array.

This method converts nodename (hostname) and service (port) to addrinfo. Since
the conversion is not unique, the result is a list of addrinfo objects.

nodename or service can be nil if no conversion intended.

family, socktype and protocol are hint for preferred protocol. If the result
will be used for a socket with SOCK_STREAM, SOCK_STREAM should be specified as
socktype. If so, Addrinfo.getaddrinfo returns addrinfo list appropriate for
SOCK_STREAM. If they are omitted or nil is given, the result is not
restricted.

Similarly, PF_INET6 as family restricts for IPv6.

flags should be bitwise OR of Socket::AI_??? constants such as follows. Note
that the exact list of the constants depends on OS.

    AI_PASSIVE      Get address to use with bind()
    AI_CANONNAME    Fill in the canonical name
    AI_NUMERICHOST  Prevent host name resolution
    AI_NUMERICSERV  Prevent service name resolution
    AI_V4MAPPED     Accept IPv4-mapped IPv6 addresses
    AI_ALL          Allow all addresses
    AI_ADDRCONFIG   Accept only if any address is assigned

Note that socktype should be specified whenever application knows the usage of
the address. Some platform causes an error when socktype is omitted and
servname is specified as an integer because some port numbers, 512 for
example, are ambiguous without socktype.

    Addrinfo.getaddrinfo("www.kame.net", 80, nil, :STREAM)
    #=> [#<Addrinfo: 203.178.141.194:80 TCP (www.kame.net)>,
    #    #<Addrinfo: [2001:200:dff:fff1:216:3eff:feb1:44d7]:80 TCP (www.kame.net)>]
**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## ip(host ) [](#method-c-ip)
returns an addrinfo object for IP address.

The port, socktype, protocol of the result is filled by zero. So, it is not
appropriate to create a socket.

    Addrinfo.ip("localhost") #=> #<Addrinfo: 127.0.0.1 (localhost)>
**@overload** [] 

## tcp(host , port ) [](#method-c-tcp)
returns an addrinfo object for TCP address.

    Addrinfo.tcp("localhost", "smtp") #=> #<Addrinfo: 127.0.0.1:25 TCP (localhost:smtp)>
**@overload** [] 

## udp(host , port ) [](#method-c-udp)
returns an addrinfo object for UDP address.

    Addrinfo.udp("localhost", "daytime") #=> #<Addrinfo: 127.0.0.1:13 UDP (localhost:daytime)>
**@overload** [] 

## unix(*args ) [](#method-c-unix)
returns an addrinfo object for UNIX socket address.

*socktype* specifies the socket type. If it is omitted, :STREAM is used.

    Addrinfo.unix("/tmp/sock")         #=> #<Addrinfo: /tmp/sock SOCK_STREAM>
    Addrinfo.unix("/tmp/sock", :DGRAM) #=> #<Addrinfo: /tmp/sock SOCK_DGRAM>
**@overload** [] 


#Instance Methods
## afamily() [](#method-i-afamily)
returns the address family as an integer.

    Addrinfo.tcp("localhost", 80).afamily == Socket::AF_INET #=> true

**@overload** [] 

## bind() [](#method-i-bind)
creates a socket bound to self.

If a block is given, it is called with the socket and the value of the block
is returned. The socket is returned otherwise.

    Addrinfo.udp("0.0.0.0", 9981).bind {|s|
      s.local_address.connect {|s| s.send "hello", 0 }
      p s.recv(10) #=> "hello"
    }

## canonname() [](#method-i-canonname)
returns the canonical name as a string.

nil is returned if no canonical name.

The canonical name is set by Addrinfo.getaddrinfo when AI_CANONNAME is
specified.

    list = Addrinfo.getaddrinfo("www.ruby-lang.org", 80, :INET, :STREAM, nil, Socket::AI_CANONNAME)
    p list[0] #=> #<Addrinfo: 221.186.184.68:80 TCP carbon.ruby-lang.org (www.ruby-lang.org)>
    p list[0].canonname #=> "carbon.ruby-lang.org"

**@overload** [] 

## connect(timeout:nil, &block) [](#method-i-connect)
:call-seq:
    addrinfo.connect([opts]) {|socket| ... }
    addrinfo.connect([opts])

creates a socket connected to the address of self.

The optional argument *opts* is options represented by a hash. *opts* may have
following options:

:timeout
:   specify the timeout in seconds.


If a block is given, it is called with the socket and the value of the block
is returned. The socket is returned otherwise.

    Addrinfo.tcp("www.ruby-lang.org", 80).connect {|s|
      s.print "GET / HTTP/1.0\r\nHost: www.ruby-lang.org\r\n\r\n"
      puts s.read
    }

## connect_from(*args, timeout:nil, &block) [](#method-i-connect_from)
:call-seq:
    addrinfo.connect_from([local_addr_args], [opts]) {|socket| ... }
    addrinfo.connect_from([local_addr_args], [opts])

creates a socket connected to the address of self.

If one or more arguments given as *local_addr_args*, it is used as the local
address of the socket. *local_addr_args* is given for family_addrinfo to
obtain actual address.

If *local_addr_args* is not given, the local address of the socket is not
bound.

The optional last argument *opts* is options represented by a hash. *opts* may
have following options:

:timeout
:   specify the timeout in seconds.


If a block is given, it is called with the socket and the value of the block
is returned. The socket is returned otherwise.

    Addrinfo.tcp("www.ruby-lang.org", 80).connect_from("0.0.0.0", 4649) {|s|
      s.print "GET / HTTP/1.0\r\nHost: www.ruby-lang.org\r\n\r\n"
      puts s.read
    }

    # Addrinfo object can be taken for the argument.
    Addrinfo.tcp("www.ruby-lang.org", 80).connect_from(Addrinfo.tcp("0.0.0.0", 4649)) {|s|
      s.print "GET / HTTP/1.0\r\nHost: www.ruby-lang.org\r\n\r\n"
      puts s.read
    }

## connect_to(*args, timeout:nil, &block) [](#method-i-connect_to)
:call-seq:
    addrinfo.connect_to([remote_addr_args], [opts]) {|socket| ... }
    addrinfo.connect_to([remote_addr_args], [opts])

creates a socket connected to *remote_addr_args* and bound to self.

The optional last argument *opts* is options represented by a hash. *opts* may
have following options:

:timeout
:   specify the timeout in seconds.


If a block is given, it is called with the socket and the value of the block
is returned. The socket is returned otherwise.

    Addrinfo.tcp("0.0.0.0", 4649).connect_to("www.ruby-lang.org", 80) {|s|
      s.print "GET / HTTP/1.0\r\nHost: www.ruby-lang.org\r\n\r\n"
      puts s.read
    }

## family_addrinfo(*args) [](#method-i-family_addrinfo)
creates an Addrinfo object from the arguments.

The arguments are interpreted as similar to self.

    Addrinfo.tcp("0.0.0.0", 4649).family_addrinfo("www.ruby-lang.org", 80)
    #=> #<Addrinfo: 221.186.184.68:80 TCP (www.ruby-lang.org:80)>

    Addrinfo.unix("/tmp/sock").family_addrinfo("/tmp/sock2")
    #=> #<Addrinfo: /tmp/sock2 SOCK_STREAM>

## getnameinfo(*args) [](#method-i-getnameinfo)
returns nodename and service as a pair of strings. This converts struct
sockaddr in addrinfo to textual representation.

flags should be bitwise OR of Socket::NI_??? constants.

    Addrinfo.tcp("127.0.0.1", 80).getnameinfo #=> ["localhost", "www"]

    Addrinfo.tcp("127.0.0.1", 80).getnameinfo(Socket::NI_NUMERICSERV)
    #=> ["localhost", "80"]

**@overload** [] 

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
returns a new instance of Addrinfo. The instance contains sockaddr, family,
socktype, protocol. sockaddr means struct sockaddr which can be used for
connect(2), etc. family, socktype and protocol are integers which is used for
arguments of socket(2).

sockaddr is specified as an array or a string. The array should be compatible
to the value of IPSocket#addr or UNIXSocket#addr. The string should be struct
sockaddr as generated by Socket.sockaddr_in or Socket.unpack_sockaddr_un.

sockaddr examples:
*   `["AF_INET", 46102, "localhost.localdomain", "127.0.0.1"]`
*   `["AF_INET6", 42304, "ip6-localhost", "::1"]`
*   `["AF_UNIX", "/tmp/sock"]`
*   `Socket.sockaddr_in("smtp", "2001:DB8::1")`
*   `Socket.sockaddr_in(80, "172.18.22.42")`
*   `Socket.sockaddr_in(80, "www.ruby-lang.org")`
*   `Socket.sockaddr_un("/tmp/sock")`

In an AF_INET/AF_INET6 sockaddr array, the 4th element, numeric IP address, is
used to construct socket address in the Addrinfo instance. If the 3rd element,
textual host name, is non-nil, it is also recorded but used only for
Addrinfo#inspect.

family is specified as an integer to specify the protocol family such as
Socket::PF_INET. It can be a symbol or a string which is the constant name
with or without PF_ prefix such as :INET, :INET6, :UNIX, "PF_INET", etc. If
omitted, PF_UNSPEC is assumed.

socktype is specified as an integer to specify the socket type such as
Socket::SOCK_STREAM. It can be a symbol or a string which is the constant name
with or without SOCK_ prefix such as :STREAM, :DGRAM, :RAW, "SOCK_STREAM",
etc. If omitted, 0 is assumed.

protocol is specified as an integer to specify the protocol such as
Socket::IPPROTO_TCP. It must be an integer, unlike family and socktype. If
omitted, 0 is assumed. Note that 0 is reasonable value for most protocols,
except raw socket.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## inspect() [](#method-i-inspect)
returns a string which shows addrinfo in human-readable form.

    Addrinfo.tcp("localhost", 80).inspect #=> "#<Addrinfo: 127.0.0.1:80 TCP (localhost)>"
    Addrinfo.unix("/tmp/sock").inspect    #=> "#<Addrinfo: /tmp/sock SOCK_STREAM>"

**@overload** [] 

## inspect_sockaddr() [](#method-i-inspect_sockaddr)
returns a string which shows the sockaddr in *addrinfo* with human-readable
form.

    Addrinfo.tcp("localhost", 80).inspect_sockaddr     #=> "127.0.0.1:80"
    Addrinfo.tcp("ip6-localhost", 80).inspect_sockaddr #=> "[::1]:80"
    Addrinfo.unix("/tmp/sock").inspect_sockaddr        #=> "/tmp/sock"

**@overload** [] 

## ip?() [](#method-i-ip?)
returns true if addrinfo is internet (IPv4/IPv6) address. returns false
otherwise.

    Addrinfo.tcp("127.0.0.1", 80).ip? #=> true
    Addrinfo.tcp("::1", 80).ip?       #=> true
    Addrinfo.unix("/tmp/sock").ip?    #=> false

**@overload** [] 

## ip_address() [](#method-i-ip_address)
Returns the IP address as a string.

    Addrinfo.tcp("127.0.0.1", 80).ip_address    #=> "127.0.0.1"
    Addrinfo.tcp("::1", 80).ip_address          #=> "::1"

**@overload** [] 

## ip_port() [](#method-i-ip_port)
Returns the port number as an integer.

    Addrinfo.tcp("127.0.0.1", 80).ip_port    #=> 80
    Addrinfo.tcp("::1", 80).ip_port          #=> 80

**@overload** [] 

## ip_unpack() [](#method-i-ip_unpack)
Returns the IP address and port number as 2-element array.

    Addrinfo.tcp("127.0.0.1", 80).ip_unpack    #=> ["127.0.0.1", 80]
    Addrinfo.tcp("::1", 80).ip_unpack          #=> ["::1", 80]

**@overload** [] 

## ipv4?() [](#method-i-ipv4?)
returns true if addrinfo is IPv4 address. returns false otherwise.

    Addrinfo.tcp("127.0.0.1", 80).ipv4? #=> true
    Addrinfo.tcp("::1", 80).ipv4?       #=> false
    Addrinfo.unix("/tmp/sock").ipv4?    #=> false

**@overload** [] 

## ipv4_loopback?() [](#method-i-ipv4_loopback?)
Returns true for IPv4 loopback address (127.0.0.0/8). It returns false
otherwise.

**@return** [Boolean] 

## ipv4_multicast?() [](#method-i-ipv4_multicast?)
Returns true for IPv4 multicast address (224.0.0.0/4). It returns false
otherwise.

**@return** [Boolean] 

## ipv4_private?() [](#method-i-ipv4_private?)
Returns true for IPv4 private address (10.0.0.0/8, 172.16.0.0/12,
192.168.0.0/16). It returns false otherwise.

**@return** [Boolean] 

## ipv6?() [](#method-i-ipv6?)
returns true if addrinfo is IPv6 address. returns false otherwise.

    Addrinfo.tcp("127.0.0.1", 80).ipv6? #=> false
    Addrinfo.tcp("::1", 80).ipv6?       #=> true
    Addrinfo.unix("/tmp/sock").ipv6?    #=> false

**@overload** [] 

## ipv6_linklocal?() [](#method-i-ipv6_linklocal?)
Returns true for IPv6 link local address (fe80::/10). It returns false
otherwise.

**@return** [Boolean] 

## ipv6_loopback?() [](#method-i-ipv6_loopback?)
Returns true for IPv6 loopback address (::1). It returns false otherwise.

**@return** [Boolean] 

## ipv6_mc_global?() [](#method-i-ipv6_mc_global?)
Returns true for IPv6 multicast global scope address. It returns false
otherwise.

**@return** [Boolean] 

## ipv6_mc_linklocal?() [](#method-i-ipv6_mc_linklocal?)
Returns true for IPv6 multicast link-local scope address. It returns false
otherwise.

**@return** [Boolean] 

## ipv6_mc_nodelocal?() [](#method-i-ipv6_mc_nodelocal?)
Returns true for IPv6 multicast node-local scope address. It returns false
otherwise.

**@return** [Boolean] 

## ipv6_mc_orglocal?() [](#method-i-ipv6_mc_orglocal?)
Returns true for IPv6 multicast organization-local scope address. It returns
false otherwise.

**@return** [Boolean] 

## ipv6_mc_sitelocal?() [](#method-i-ipv6_mc_sitelocal?)
Returns true for IPv6 multicast site-local scope address. It returns false
otherwise.

**@return** [Boolean] 

## ipv6_multicast?() [](#method-i-ipv6_multicast?)
Returns true for IPv6 multicast address (ff00::/8). It returns false
otherwise.

**@return** [Boolean] 

## ipv6_sitelocal?() [](#method-i-ipv6_sitelocal?)
Returns true for IPv6 site local address (fec0::/10). It returns false
otherwise.

**@return** [Boolean] 

## ipv6_to_ipv4() [](#method-i-ipv6_to_ipv4)
Returns IPv4 address of IPv4 mapped/compatible IPv6 address. It returns nil if
`self` is not IPv4 mapped/compatible IPv6 address.

    Addrinfo.ip("::192.0.2.3").ipv6_to_ipv4      #=> #<Addrinfo: 192.0.2.3>
    Addrinfo.ip("::ffff:192.0.2.3").ipv6_to_ipv4 #=> #<Addrinfo: 192.0.2.3>
    Addrinfo.ip("::1").ipv6_to_ipv4              #=> nil
    Addrinfo.ip("192.0.2.3").ipv6_to_ipv4        #=> nil
    Addrinfo.unix("/tmp/sock").ipv6_to_ipv4      #=> nil

## ipv6_unique_local?() [](#method-i-ipv6_unique_local?)
Returns true for IPv6 unique local address (fc00::/7, RFC4193). It returns
false otherwise.

**@return** [Boolean] 

## ipv6_unspecified?() [](#method-i-ipv6_unspecified?)
Returns true for IPv6 unspecified address (::). It returns false otherwise.

**@return** [Boolean] 

## ipv6_v4compat?() [](#method-i-ipv6_v4compat?)
Returns true for IPv4-compatible IPv6 address (::/80). It returns false
otherwise.

**@return** [Boolean] 

## ipv6_v4mapped?() [](#method-i-ipv6_v4mapped?)
Returns true for IPv4-mapped IPv6 address (::ffff:0:0/80). It returns false
otherwise.

**@return** [Boolean] 

## listen(backlogSocket::SOMAXCONN) [](#method-i-listen)
creates a listening socket bound to self.

## marshal_dump() [](#method-i-marshal_dump)
:nodoc:

## marshal_load(ary) [](#method-i-marshal_load)
:nodoc:

## pfamily() [](#method-i-pfamily)
returns the protocol family as an integer.

    Addrinfo.tcp("localhost", 80).pfamily == Socket::PF_INET #=> true

**@overload** [] 

## protocol() [](#method-i-protocol)
returns the socket type as an integer.

    Addrinfo.tcp("localhost", 80).protocol == Socket::IPPROTO_TCP #=> true

**@overload** [] 

## socktype() [](#method-i-socktype)
returns the socket type as an integer.

    Addrinfo.tcp("localhost", 80).socktype == Socket::SOCK_STREAM #=> true

**@overload** [] 

## to_s() [](#method-i-to_s)
returns the socket address as packed struct sockaddr string.

    Addrinfo.tcp("localhost", 80).to_sockaddr
    #=> "\x02\x00\x00P\x7F\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00"

**@overload** [] 

**@overload** [] 

## to_sockaddr() [](#method-i-to_sockaddr)
returns the socket address as packed struct sockaddr string.

    Addrinfo.tcp("localhost", 80).to_sockaddr
    #=> "\x02\x00\x00P\x7F\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00"

**@overload** [] 

**@overload** [] 

## unix?() [](#method-i-unix?)
returns true if addrinfo is UNIX address. returns false otherwise.

    Addrinfo.tcp("127.0.0.1", 80).unix? #=> false
    Addrinfo.tcp("::1", 80).unix?       #=> false
    Addrinfo.unix("/tmp/sock").unix?    #=> true

**@overload** [] 

## unix_path() [](#method-i-unix_path)
Returns the socket path as a string.

    Addrinfo.unix("/tmp/sock").unix_path       #=> "/tmp/sock"

**@overload** [] 

