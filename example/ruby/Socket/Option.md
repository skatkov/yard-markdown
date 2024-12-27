# Class: Socket::Option
**Inherits:** Object
    

Socket::Option represents a socket option used by BasicSocket#getsockopt and
BasicSocket#setsockopt.  A socket option contains the socket #family, protocol
#level, option name #optname and option value #data.


# Class Methods
## bool(vfamily , vlevel , voptname , vbool ) [](#method-c-bool)
Creates a new Socket::Option object which contains boolean as data. Actually 0
or 1 as int is used.

    require 'socket'

    p Socket::Option.bool(:INET, :SOCKET, :KEEPALIVE, true)
    #=> #<Socket::Option: INET SOCKET KEEPALIVE 1>

    p Socket::Option.bool(:INET, :SOCKET, :KEEPALIVE, false)
    #=> #<Socket::Option: AF_INET SOCKET KEEPALIVE 0>
**@overload** [] 

## byte(vfamily , vlevel , voptname , vint ) [](#method-c-byte)
Creates a new Socket::Option object which contains a byte as data.

    p Socket::Option.byte(:INET, :SOCKET, :KEEPALIVE, 1)
    #=> #<Socket::Option: INET SOCKET KEEPALIVE 1>
**@overload** [] 

## int(vfamily , vlevel , voptname , vint ) [](#method-c-int)
Creates a new Socket::Option object which contains an int as data.

The size and endian is dependent on the platform.

    p Socket::Option.int(:INET, :SOCKET, :KEEPALIVE, 1)
    #=> #<Socket::Option: INET SOCKET KEEPALIVE 1>
**@overload** [] 

## ipv4_multicast_loop(value ) [](#method-c-ipv4_multicast_loop)
Creates a new Socket::Option object for IP_MULTICAST_LOOP.

The size is dependent on the platform.

    sockopt = Socket::Option.int(:INET, :IPPROTO_IP, :IP_MULTICAST_LOOP, 1)
    p sockopt.int => 1

    p Socket::Option.ipv4_multicast_loop(10)
    #=> #<Socket::Option: INET IP MULTICAST_LOOP 10>
**@overload** [] 

## ipv4_multicast_ttl(value ) [](#method-c-ipv4_multicast_ttl)
Creates a new Socket::Option object for IP_MULTICAST_TTL.

The size is dependent on the platform.

    p Socket::Option.ipv4_multicast_ttl(10)
    #=> #<Socket::Option: INET IP MULTICAST_TTL 10>
**@overload** [] 

## linger(vonoff , vsecs ) [](#method-c-linger)
Creates a new Socket::Option object for SOL_SOCKET/SO_LINGER.

*onoff* should be an integer or a boolean.

*secs* should be the number of seconds.

    p Socket::Option.linger(true, 10)
    #=> #<Socket::Option: UNSPEC SOCKET LINGER on 10sec>
**@overload** [] 


#Instance Methods
## bool() [](#method-i-bool)
Returns the data in *sockopt* as an boolean value.

    sockopt = Socket::Option.int(:INET, :SOCKET, :KEEPALIVE, 1)
    p sockopt.bool => true

**@overload** [] 

## byte() [](#method-i-byte)
Returns the data in *sockopt* as an byte.

    sockopt = Socket::Option.byte(:INET, :SOCKET, :KEEPALIVE, 1)
    p sockopt.byte => 1

**@overload** [] 

## data() [](#method-i-data)
returns the socket option data as a string.

    p Socket::Option.new(:INET6, :IPV6, :RECVPKTINFO, [1].pack("i!")).data
    #=> "\x01\x00\x00\x00"

**@overload** [] 

**@overload** [] 

## family() [](#method-i-family)
returns the socket family as an integer.

    p Socket::Option.new(:INET6, :IPV6, :RECVPKTINFO, [1].pack("i!")).family
    #=> 10

**@overload** [] 

## initialize(vfamily, vlevel, voptname, data) [](#method-i-initialize)
Returns a new Socket::Option object.

    sockopt = Socket::Option.new(:INET, :SOCKET, :KEEPALIVE, [1].pack("i"))
    p sockopt #=> #<Socket::Option: INET SOCKET KEEPALIVE 1>

**@overload** [] 

## inspect() [](#method-i-inspect)
Returns a string which shows sockopt in human-readable form.

    p Socket::Option.new(:INET, :SOCKET, :KEEPALIVE, [1].pack("i")).inspect
    #=> "#<Socket::Option: INET SOCKET KEEPALIVE 1>"

**@overload** [] 

## int() [](#method-i-int)
Returns the data in *sockopt* as an int.

The size and endian is dependent on the platform.

    sockopt = Socket::Option.int(:INET, :SOCKET, :KEEPALIVE, 1)
    p sockopt.int => 1

**@overload** [] 

## ipv4_multicast_loop() [](#method-i-ipv4_multicast_loop)
Returns the ipv4_multicast_loop data in *sockopt* as an integer.

    sockopt = Socket::Option.ipv4_multicast_loop(10)
    p sockopt.ipv4_multicast_loop => 10

**@overload** [] 

## ipv4_multicast_ttl() [](#method-i-ipv4_multicast_ttl)
Returns the ipv4_multicast_ttl data in *sockopt* as an integer.

    sockopt = Socket::Option.ipv4_multicast_ttl(10)
    p sockopt.ipv4_multicast_ttl => 10

**@overload** [] 

## level() [](#method-i-level)
returns the socket level as an integer.

    p Socket::Option.new(:INET6, :IPV6, :RECVPKTINFO, [1].pack("i!")).level
    #=> 41

**@overload** [] 

## linger() [](#method-i-linger)
Returns the linger data in *sockopt* as a pair of boolean and integer.

    sockopt = Socket::Option.linger(true, 10)
    p sockopt.linger => [true, 10]

**@overload** [] 

## optname() [](#method-i-optname)
returns the socket option name as an integer.

    p Socket::Option.new(:INET6, :IPV6, :RECVPKTINFO, [1].pack("i!")).optname
    #=> 2

**@overload** [] 

## to_s() [](#method-i-to_s)
returns the socket option data as a string.

    p Socket::Option.new(:INET6, :IPV6, :RECVPKTINFO, [1].pack("i!")).data
    #=> "\x01\x00\x00\x00"

**@overload** [] 

**@overload** [] 

## unpack(template) [](#method-i-unpack)
Calls String#unpack on sockopt.data.

    sockopt = Socket::Option.new(:INET, :SOCKET, :KEEPALIVE, [1].pack("i"))
    p sockopt.unpack("i")      #=> [1]
    p sockopt.data.unpack("i") #=> [1]

**@overload** [] 

