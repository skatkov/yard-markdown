# Class: Socket::AncillaryData
**Inherits:** Object
    

Socket::AncillaryData represents the ancillary data (control information) used
by sendmsg and recvmsg system call.  It contains socket #family, control
message (cmsg) #level, cmsg #type and cmsg #data.


# Class Methods
## int(vfamily , vlevel , vtype , integer ) [](#method-c-int)
Creates a new Socket::AncillaryData object which contains a int as data.

The size and endian is dependent on the host.

    require 'socket'

    p Socket::AncillaryData.int(:UNIX, :SOCKET, :RIGHTS, STDERR.fileno)
    #=> #<Socket::AncillaryData: UNIX SOCKET RIGHTS 2>
**@overload** [] 

## ip_pktinfo(*args ) [](#method-c-ip_pktinfo)
Returns new ancillary data for IP_PKTINFO.

If spec_dst is not given, addr is used.

IP_PKTINFO is not standard.

Supported platform: GNU/Linux

    addr = Addrinfo.ip("127.0.0.1")
    ifindex = 0
    spec_dst = Addrinfo.ip("127.0.0.1")
    p Socket::AncillaryData.ip_pktinfo(addr, ifindex, spec_dst)
    #=> #<Socket::AncillaryData: INET IP PKTINFO 127.0.0.1 ifindex:0 spec_dst:127.0.0.1>
**@overload** [] 

**@overload** [] 

## ipv6_pktinfo(v_addr , v_ifindex ) [](#method-c-ipv6_pktinfo)
Returns new ancillary data for IPV6_PKTINFO.

IPV6_PKTINFO is defined by RFC 3542.

    addr = Addrinfo.ip("::1")
    ifindex = 0
    p Socket::AncillaryData.ipv6_pktinfo(addr, ifindex)
    #=> #<Socket::AncillaryData: INET6 IPV6 PKTINFO ::1 ifindex:0>
**@overload** [] 

## unix_rights(*args ) [](#method-c-unix_rights)
Creates a new Socket::AncillaryData object which contains file descriptors as
data.

    p Socket::AncillaryData.unix_rights(STDERR)
    #=> #<Socket::AncillaryData: UNIX SOCKET RIGHTS 2>
**@overload** [] 


#Instance Methods
## cmsg_is?(vlevel, vtype) [](#method-i-cmsg_is?)
tests the level and type of *ancillarydata*.

    ancdata = Socket::AncillaryData.new(:INET6, :IPV6, :PKTINFO, "")
    ancdata.cmsg_is?(Socket::IPPROTO_IPV6, Socket::IPV6_PKTINFO) #=> true
    ancdata.cmsg_is?(:IPV6, :PKTINFO)       #=> true
    ancdata.cmsg_is?(:IP, :PKTINFO)         #=> false
    ancdata.cmsg_is?(:SOCKET, :RIGHTS)      #=> false

**@overload** [] 

## data() [](#method-i-data)
returns the cmsg data as a string.

    p Socket::AncillaryData.new(:INET6, :IPV6, :PKTINFO, "").data
    #=> ""

**@overload** [] 

## family() [](#method-i-family)
returns the socket family as an integer.

    p Socket::AncillaryData.new(:INET6, :IPV6, :PKTINFO, "").family
    #=> 10

**@overload** [] 

## initialize(vfamily, vlevel, vtype, data) [](#method-i-initialize)
*family* should be an integer, a string or a symbol.
*   Socket::AF_INET, "AF_INET", "INET", :AF_INET, :INET
*   Socket::AF_UNIX, "AF_UNIX", "UNIX", :AF_UNIX, :UNIX
*   etc.

*cmsg_level* should be an integer, a string or a symbol.
*   Socket::SOL_SOCKET, "SOL_SOCKET", "SOCKET", :SOL_SOCKET and :SOCKET
*   Socket::IPPROTO_IP, "IP" and :IP
*   Socket::IPPROTO_IPV6, "IPV6" and :IPV6
*   Socket::IPPROTO_TCP, "TCP" and :TCP
*   etc.

*cmsg_type* should be an integer, a string or a symbol. If a string/symbol is
specified, it is interpreted depend on *cmsg_level*.
*   Socket::SCM_RIGHTS, "SCM_RIGHTS", "RIGHTS", :SCM_RIGHTS, :RIGHTS for
    SOL_SOCKET
*   Socket::IP_RECVTTL, "RECVTTL" and :RECVTTL for IPPROTO_IP
*   Socket::IPV6_PKTINFO, "PKTINFO" and :PKTINFO for IPPROTO_IPV6
*   etc.

*cmsg_data* should be a string.

    p Socket::AncillaryData.new(:INET, :TCP, :NODELAY, "")
    #=> #<Socket::AncillaryData: INET TCP NODELAY "">

    p Socket::AncillaryData.new(:INET6, :IPV6, :PKTINFO, "")
    #=> #<Socket::AncillaryData: INET6 IPV6 PKTINFO "">

**@overload** [] 

## inspect() [](#method-i-inspect)
returns a string which shows ancillarydata in human-readable form.

    p Socket::AncillaryData.new(:INET6, :IPV6, :PKTINFO, "").inspect
    #=> "#<Socket::AncillaryData: INET6 IPV6 PKTINFO \"\">"

**@overload** [] 

## int() [](#method-i-int)
Returns the data in *ancillarydata* as an int.

The size and endian is dependent on the host.

    ancdata = Socket::AncillaryData.int(:UNIX, :SOCKET, :RIGHTS, STDERR.fileno)
    p ancdata.int #=> 2

**@overload** [] 

## ip_pktinfo() [](#method-i-ip_pktinfo)
Extracts addr, ifindex and spec_dst from IP_PKTINFO ancillary data.

IP_PKTINFO is not standard.

Supported platform: GNU/Linux

    addr = Addrinfo.ip("127.0.0.1")
    ifindex = 0
    spec_dest = Addrinfo.ip("127.0.0.1")
    ancdata = Socket::AncillaryData.ip_pktinfo(addr, ifindex, spec_dest)
    p ancdata.ip_pktinfo
    #=> [#<Addrinfo: 127.0.0.1>, 0, #<Addrinfo: 127.0.0.1>]

**@overload** [] 

## ipv6_pktinfo() [](#method-i-ipv6_pktinfo)
Extracts addr and ifindex from IPV6_PKTINFO ancillary data.

IPV6_PKTINFO is defined by RFC 3542.

    addr = Addrinfo.ip("::1")
    ifindex = 0
    ancdata = Socket::AncillaryData.ipv6_pktinfo(addr, ifindex)
    p ancdata.ipv6_pktinfo #=> [#<Addrinfo: ::1>, 0]

**@overload** [] 

## ipv6_pktinfo_addr() [](#method-i-ipv6_pktinfo_addr)
Extracts addr from IPV6_PKTINFO ancillary data.

IPV6_PKTINFO is defined by RFC 3542.

    addr = Addrinfo.ip("::1")
    ifindex = 0
    ancdata = Socket::AncillaryData.ipv6_pktinfo(addr, ifindex)
    p ancdata.ipv6_pktinfo_addr #=> #<Addrinfo: ::1>

**@overload** [] 

## ipv6_pktinfo_ifindex() [](#method-i-ipv6_pktinfo_ifindex)
Extracts ifindex from IPV6_PKTINFO ancillary data.

IPV6_PKTINFO is defined by RFC 3542.

    addr = Addrinfo.ip("::1")
    ifindex = 0
    ancdata = Socket::AncillaryData.ipv6_pktinfo(addr, ifindex)
    p ancdata.ipv6_pktinfo_ifindex #=> 0

**@overload** [] 

## level() [](#method-i-level)
returns the cmsg level as an integer.

    p Socket::AncillaryData.new(:INET6, :IPV6, :PKTINFO, "").level
    #=> 41

**@overload** [] 

## timestamp() [](#method-i-timestamp)
returns the timestamp as a time object.

*ancillarydata* should be one of following type:
*   SOL_SOCKET/SCM_TIMESTAMP (microsecond) GNU/Linux, FreeBSD, NetBSD,
    OpenBSD, Solaris, MacOS X
*   SOL_SOCKET/SCM_TIMESTAMPNS (nanosecond) GNU/Linux
*   SOL_SOCKET/SCM_BINTIME (2**(-64) second) FreeBSD

    Addrinfo.udp("127.0.0.1", 0).bind {|s1|
        Addrinfo.udp("127.0.0.1", 0).bind {|s2|
          s1.setsockopt(:SOCKET, :TIMESTAMP, true)
          s2.send "a", 0, s1.local_address
          ctl = s1.recvmsg.last
          p ctl    #=> #<Socket::AncillaryData: INET SOCKET TIMESTAMP 2009-02-24 17:35:46.775581>
          t = ctl.timestamp
          p t      #=> 2009-02-24 17:35:46 +0900
          p t.usec #=> 775581
          p t.nsec #=> 775581000
        }

    }

**@overload** [] 

## type() [](#method-i-type)
returns the cmsg type as an integer.

    p Socket::AncillaryData.new(:INET6, :IPV6, :PKTINFO, "").type
    #=> 2

**@overload** [] 

## unix_rights() [](#method-i-unix_rights)
returns the array of IO objects for SCM_RIGHTS control message in UNIX domain
socket.

The class of the IO objects in the array is IO or Socket.

The array is attached to *ancillarydata* when it is instantiated. For example,
BasicSocket#recvmsg attach the array when receives a SCM_RIGHTS control
message and :scm_rights=>true option is given.

    # recvmsg needs :scm_rights=>true for unix_rights
    s1, s2 = UNIXSocket.pair
    p s1                                         #=> #<UNIXSocket:fd 3>
    s1.sendmsg "stdin and a socket", 0, nil, Socket::AncillaryData.unix_rights(STDIN, s1)
    _, _, _, ctl = s2.recvmsg(:scm_rights=>true)
    p ctl                                        #=> #<Socket::AncillaryData: UNIX SOCKET RIGHTS 6 7>
    p ctl.unix_rights                            #=> [#<IO:fd 6>, #<Socket:fd 7>]
    p File.identical?(STDIN, ctl.unix_rights[0]) #=> true
    p File.identical?(s1, ctl.unix_rights[1])    #=> true

    # If :scm_rights=>true is not given, unix_rights returns nil
    s1, s2 = UNIXSocket.pair
    s1.sendmsg "stdin and a socket", 0, nil, Socket::AncillaryData.unix_rights(STDIN, s1)
    _, _, _, ctl = s2.recvmsg
    p ctl #=> #<Socket::AncillaryData: UNIX SOCKET RIGHTS 6 7>
    p ctl.unix_rights #=> nil

**@overload** [] 

