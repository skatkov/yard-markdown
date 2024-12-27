# Class: IPSocket
**Inherits:** BasicSocket
    

IPSocket is the super class of TCPSocket and UDPSocket.


# Class Methods
## getaddress(host ) [](#method-c-getaddress)
Lookups the IP address of *host*.

    require 'socket'

    IPSocket.getaddress("localhost")     #=> "127.0.0.1"
    IPSocket.getaddress("ip6-localhost") #=> "::1"
**@overload** [] 


#Instance Methods
## addr(*args) [](#method-i-addr)
Returns the local address as an array which contains address_family, port,
hostname and numeric_address.

If `reverse_lookup` is `true` or `:hostname`, hostname is obtained from
numeric_address using reverse lookup. Or if it is `false`, or `:numeric`,
hostname is the same as numeric_address. Or if it is `nil` or omitted, obeys
to `ipsocket.do_not_reverse_lookup`. See `Socket.getaddrinfo` also.

    TCPSocket.open("www.ruby-lang.org", 80) {|sock|
      p sock.addr #=> ["AF_INET", 49429, "hal", "192.168.0.128"]
      p sock.addr(true)  #=> ["AF_INET", 49429, "hal", "192.168.0.128"]
      p sock.addr(false) #=> ["AF_INET", 49429, "192.168.0.128", "192.168.0.128"]
      p sock.addr(:hostname)  #=> ["AF_INET", 49429, "hal", "192.168.0.128"]
      p sock.addr(:numeric)   #=> ["AF_INET", 49429, "192.168.0.128", "192.168.0.128"]
    }

**@overload** [] 

## inspect() [](#method-i-inspect)
Return a string describing this IPSocket object.

**@overload** [] 

## peeraddr(*args) [](#method-i-peeraddr)
Returns the remote address as an array which contains address_family, port,
hostname and numeric_address. It is defined for connection oriented socket
such as TCPSocket.

If `reverse_lookup` is `true` or `:hostname`, hostname is obtained from
numeric_address using reverse lookup. Or if it is `false`, or `:numeric`,
hostname is the same as numeric_address. Or if it is `nil` or omitted, obeys
to `ipsocket.do_not_reverse_lookup`. See `Socket.getaddrinfo` also.

    TCPSocket.open("www.ruby-lang.org", 80) {|sock|
      p sock.peeraddr #=> ["AF_INET", 80, "carbon.ruby-lang.org", "221.186.184.68"]
      p sock.peeraddr(true)  #=> ["AF_INET", 80, "carbon.ruby-lang.org", "221.186.184.68"]
      p sock.peeraddr(false) #=> ["AF_INET", 80, "221.186.184.68", "221.186.184.68"]
      p sock.peeraddr(:hostname) #=> ["AF_INET", 80, "carbon.ruby-lang.org", "221.186.184.68"]
      p sock.peeraddr(:numeric)  #=> ["AF_INET", 80, "221.186.184.68", "221.186.184.68"]
    }

**@overload** [] 

## recvfrom(*args) [](#method-i-recvfrom)
Receives a message and return the message as a string and an address which the
message come from.

*maxlen* is the maximum number of bytes to receive.

*flags* should be a bitwise OR of Socket::MSG_* constants.

ipaddr is the same as IPSocket#{peeraddr,addr}.

    u1 = UDPSocket.new
    u1.bind("127.0.0.1", 4913)
    u2 = UDPSocket.new
    u2.send "uuuu", 0, "127.0.0.1", 4913
    p u1.recvfrom(10) #=> ["uuuu", ["AF_INET", 33230, "localhost", "127.0.0.1"]]

**@overload** [] 

**@overload** [] 

