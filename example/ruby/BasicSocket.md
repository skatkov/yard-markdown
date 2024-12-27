# Class: BasicSocket
**Inherits:** IO
    

BasicSocket is the super class for all the Socket classes.


# Class Methods
## do_not_reverse_lookup() [](#method-c-do_not_reverse_lookup)
Gets the global do_not_reverse_lookup flag.

    BasicSocket.do_not_reverse_lookup  #=> false
**@overload** [] 

## do_not_reverse_lookup=(val ) [](#method-c-do_not_reverse_lookup=)
Sets the global do_not_reverse_lookup flag.

The flag is used for initial value of do_not_reverse_lookup for each socket.

    s1 = TCPSocket.new("localhost", 80)
    p s1.do_not_reverse_lookup                 #=> true
    BasicSocket.do_not_reverse_lookup = false
    s2 = TCPSocket.new("localhost", 80)
    p s2.do_not_reverse_lookup                 #=> false
    p s1.do_not_reverse_lookup                 #=> true
**@overload** [] 

## for_fd(_descriptor ) [](#method-c-for_fd)
Returns a socket object which contains the file descriptor, *fd*.

    # If invoked by inetd, STDIN/STDOUT/STDERR is a socket.
    STDIN_SOCK = Socket.for_fd(STDIN.fileno)
    p STDIN_SOCK.remote_address
**@overload** [] 


#Instance Methods
## close_read() [](#method-i-close_read)
Disallows further read using shutdown system call.

    s1, s2 = UNIXSocket.pair
    s1.close_read
    s2.puts #=> Broken pipe (Errno::EPIPE)

**@overload** [] 

## close_write() [](#method-i-close_write)
Disallows further write using shutdown system call.

    UNIXSocket.pair {|s1, s2|
      s1.print "ping"
      s1.close_write
      p s2.read        #=> "ping"
      s2.print "pong"
      s2.close
      p s1.read        #=> "pong"
    }

**@overload** [] 

## connect_address() [](#method-i-connect_address)
Returns an address of the socket suitable for connect in the local machine.

This method returns *self*.local_address, except following condition.

*   IPv4 unspecified address (0.0.0.0) is replaced by IPv4 loopback address
    (127.0.0.1).
*   IPv6 unspecified address (::) is replaced by IPv6 loopback address (::1).

If the local address is not suitable for connect, SocketError is raised. IPv4
and IPv6 address which port is 0 is not suitable for connect. Unix domain
socket which has no path is not suitable for connect.

    Addrinfo.tcp("0.0.0.0", 0).listen {|serv|
      p serv.connect_address #=> #<Addrinfo: 127.0.0.1:53660 TCP>
      serv.connect_address.connect {|c|
        s, _ = serv.accept
        p [c, s] #=> [#<Socket:fd 4>, #<Socket:fd 6>]
      }
    }

## do_not_reverse_lookup() [](#method-i-do_not_reverse_lookup)
Gets the do_not_reverse_lookup flag of *basicsocket*.

    require 'socket'

    BasicSocket.do_not_reverse_lookup = false
    TCPSocket.open("www.ruby-lang.org", 80) {|sock|
      p sock.do_not_reverse_lookup      #=> false
    }
    BasicSocket.do_not_reverse_lookup = true
    TCPSocket.open("www.ruby-lang.org", 80) {|sock|
      p sock.do_not_reverse_lookup      #=> true
    }

**@overload** [] 

## do_not_reverse_lookup=(state) [](#method-i-do_not_reverse_lookup=)
Sets the do_not_reverse_lookup flag of *basicsocket*.

    TCPSocket.open("www.ruby-lang.org", 80) {|sock|
      p sock.do_not_reverse_lookup       #=> true
      p sock.peeraddr                    #=> ["AF_INET", 80, "221.186.184.68", "221.186.184.68"]
      sock.do_not_reverse_lookup = false
      p sock.peeraddr                    #=> ["AF_INET", 80, "carbon.ruby-lang.org", "54.163.249.195"]
    }

**@overload** [] 

## getpeereid() [](#method-i-getpeereid)
Returns the user and group on the peer of the UNIX socket. The result is a two
element array which contains the effective uid and the effective gid.

    Socket.unix_server_loop("/tmp/sock") {|s|
      begin
        euid, egid = s.getpeereid

        # Check the connected client is myself or not.
        next if euid != Process.uid

        # do something about my resource.

      ensure
        s.close
      end
    }

**@overload** [] 

## getpeername() [](#method-i-getpeername)
Returns the remote address of the socket as a sockaddr string.

    TCPServer.open("127.0.0.1", 1440) {|serv|
      c = TCPSocket.new("127.0.0.1", 1440)
      s = serv.accept
      p s.getpeername #=> "\x02\x00\x82u\x7F\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00"
    }

If Addrinfo object is preferred over the binary string, use
BasicSocket#remote_address.

**@overload** [] 

## getsockname() [](#method-i-getsockname)
Returns the local address of the socket as a sockaddr string.

    TCPServer.open("127.0.0.1", 15120) {|serv|
      p serv.getsockname #=> "\x02\x00;\x10\x7F\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00"
    }

If Addrinfo object is preferred over the binary string, use
BasicSocket#local_address.

**@overload** [] 

## getsockopt(lev, optname) [](#method-i-getsockopt)
Gets a socket option. These are protocol and system specific, see your local
system documentation for details. The option is returned as a Socket::Option
object.

### Parameters
*   `level` is an integer, usually one of the SOL_ constants such as
    Socket::SOL_SOCKET, or a protocol level. A string or symbol of the name,
    possibly without prefix, is also accepted.
*   `optname` is an integer, usually one of the SO_ constants, such as
    Socket::SO_REUSEADDR. A string or symbol of the name, possibly without
    prefix, is also accepted.

### Examples

Some socket options are integers with boolean values, in this case #getsockopt
could be called like this:

    reuseaddr = sock.getsockopt(:SOCKET, :REUSEADDR).bool

    optval = sock.getsockopt(Socket::SOL_SOCKET,Socket::SO_REUSEADDR)
    optval = optval.unpack "i"
    reuseaddr = optval[0] == 0 ? false : true

Some socket options are integers with numeric values, in this case #getsockopt
could be called like this:

    ipttl = sock.getsockopt(:IP, :TTL).int

    optval = sock.getsockopt(Socket::IPPROTO_IP, Socket::IP_TTL)
    ipttl = optval.unpack1("i")

Option values may be structs. Decoding them can be complex as it involves
examining your system headers to determine the correct definition. An example
is a +struct linger+, which may be defined in your system headers as:
    struct linger {
      int l_onoff;
      int l_linger;
    };

In this case #getsockopt could be called like this:

    # Socket::Option knows linger structure.
    onoff, linger = sock.getsockopt(:SOCKET, :LINGER).linger

    optval =  sock.getsockopt(Socket::SOL_SOCKET, Socket::SO_LINGER)
    onoff, linger = optval.unpack "ii"
    onoff = onoff == 0 ? false : true

**@overload** [] 

## local_address() [](#method-i-local_address)
Returns an Addrinfo object for local address obtained by getsockname.

Note that addrinfo.protocol is filled by 0.

    TCPSocket.open("www.ruby-lang.org", 80) {|s|
      p s.local_address #=> #<Addrinfo: 192.168.0.129:36873 TCP>
    }

    TCPServer.open("127.0.0.1", 1512) {|serv|
      p serv.local_address #=> #<Addrinfo: 127.0.0.1:1512 TCP>
    }

**@overload** [] 

## read_nonblock(len, strnil, exception:true) [](#method-i-read_nonblock)
:nodoc:

## recv(*args) [](#method-i-recv)
Receives a message.

*maxlen* is the maximum number of bytes to receive.

*flags* should be a bitwise OR of Socket::MSG_* constants.

*outbuf* will contain only the received data after the method call even if it
is not empty at the beginning.

    UNIXSocket.pair {|s1, s2|
      s1.puts "Hello World"
      p s2.recv(4)                     #=> "Hell"
      p s2.recv(4, Socket::MSG_PEEK)   #=> "o Wo"
      p s2.recv(4)                     #=> "o Wo"
      p s2.recv(10)                    #=> "rld\n"
    }

**@overload** [] 

## recv_nonblock(len, flag0, strnil, exception:true) [](#method-i-recv_nonblock)
call-seq: 	basicsocket.recv_nonblock(maxlen [, flags [, buf [, options ]]]) =>
mesg

Receives up to *maxlen* bytes from `socket` using recvfrom(2) after O_NONBLOCK
is set for the underlying file descriptor. *flags* is zero or more of the
`MSG_` options. The result, *mesg*, is the data received.

When recvfrom(2) returns 0, Socket#recv_nonblock returns nil. In most cases it
means the connection was closed, but for UDP connections it may mean an empty
packet was received, as the underlying API makes it impossible to distinguish
these two cases.

### Parameters
*   `maxlen` - the number of bytes to receive from the socket
*   `flags` - zero or more of the `MSG_` options
*   `buf` - destination String buffer
*   `options` - keyword hash, supporting `exception: false`

### Example
	serv = TCPServer.new("127.0.0.1", 0) 	af, port, host, addr = serv.addr 	c =
TCPSocket.new(addr, port) 	s = serv.accept 	c.send "aaa", 0 	begin # emulate
blocking recv. 	  p s.recv_nonblock(10) #=> "aaa" 	rescue IO::WaitReadable 	 
[IO.select(](s)) 	  retry 	end

Refer to Socket#recvfrom for the exceptions that may be thrown if the call to
*recv_nonblock* fails.

BasicSocket#recv_nonblock may raise any error corresponding to recvfrom(2)
failure, including Errno::EWOULDBLOCK.

If the exception is Errno::EWOULDBLOCK or Errno::EAGAIN, it is extended by
IO::WaitReadable. So IO::WaitReadable can be used to rescue the exceptions for
retrying recv_nonblock.

By specifying a keyword argument *exception* to `false`, you can indicate that
recv_nonblock should not raise an IO::WaitReadable exception, but return the
symbol `:wait_readable` instead.

### See
*   Socket#recvfrom

## recvmsg(dlennil, flags0, clennil, scm_rights:false) [](#method-i-recvmsg)
call-seq:
    basicsocket.recvmsg(maxmesglen=nil, flags=0, maxcontrollen=nil, opts={}) => [mesg, sender_addrinfo, rflags, *controls]

recvmsg receives a message using recvmsg(2) system call in blocking manner.

*maxmesglen* is the maximum length of mesg to receive.

*flags* is bitwise OR of MSG_* constants such as Socket::MSG_PEEK.

*maxcontrollen* is the maximum length of controls (ancillary data) to receive.

*opts* is option hash. Currently :scm_rights=>bool is the only option.

:scm_rights option specifies that application expects SCM_RIGHTS control
message. If the value is nil or false, application don't expects SCM_RIGHTS
control message. In this case, recvmsg closes the passed file descriptors
immediately. This is the default behavior.

If :scm_rights value is neither nil nor false, application expects SCM_RIGHTS
control message. In this case, recvmsg creates IO objects for each file
descriptors for Socket::AncillaryData#unix_rights method.

The return value is 4-elements array.

*mesg* is a string of the received message.

*sender_addrinfo* is a sender socket address for connection-less socket. It is
an Addrinfo object. For connection-oriented socket such as TCP,
sender_addrinfo is platform dependent.

*rflags* is a flags on the received message which is bitwise OR of MSG_*
constants such as Socket::MSG_TRUNC. It will be nil if the system uses 4.3BSD
style old recvmsg system call.

*controls* is ancillary data which is an array of Socket::AncillaryData
objects such as:

    #<Socket::AncillaryData: AF_UNIX SOCKET RIGHTS 7>

*maxmesglen* and *maxcontrollen* can be nil. In that case, the buffer will be
grown until the message is not truncated. Internally, MSG_PEEK is used. Buffer
full and MSG_CTRUNC are checked for truncation.

recvmsg can be used to implement recv_io as follows:

    mesg, sender_sockaddr, rflags, *controls = sock.recvmsg(:scm_rights=>true)
    controls.each {|ancdata|
      if ancdata.cmsg_is?(:SOCKET, :RIGHTS)
        return ancdata.unix_rights[0]
      end
    }

## recvmsg_nonblock(dlennil, flags0, clennil, scm_rights:false, exception:true) [](#method-i-recvmsg_nonblock)
call-seq:
    basicsocket.recvmsg_nonblock(maxdatalen=nil, flags=0, maxcontrollen=nil, opts={}) => [data, sender_addrinfo, rflags, *controls]

recvmsg receives a message using recvmsg(2) system call in non-blocking
manner.

It is similar to BasicSocket#recvmsg but non-blocking flag is set before the
system call and it doesn't retry the system call.

By specifying a keyword argument *exception* to `false`, you can indicate that
recvmsg_nonblock should not raise an IO::WaitReadable exception, but return
the symbol `:wait_readable` instead.

## remote_address() [](#method-i-remote_address)
Returns an Addrinfo object for remote address obtained by getpeername.

Note that addrinfo.protocol is filled by 0.

    TCPSocket.open("www.ruby-lang.org", 80) {|s|
      p s.remote_address #=> #<Addrinfo: 221.186.184.68:80 TCP>
    }

    TCPServer.open("127.0.0.1", 1728) {|serv|
      c = TCPSocket.new("127.0.0.1", 1728)
      s = serv.accept
      p s.remote_address #=> #<Addrinfo: 127.0.0.1:36504 TCP>
    }

**@overload** [] 

## send(*args) [](#method-i-send)
send *mesg* via *basicsocket*.

*mesg* should be a string.

*flags* should be a bitwise OR of Socket::MSG_* constants.

*dest_sockaddr* should be a packed sockaddr string or an addrinfo.

    TCPSocket.open("localhost", 80) {|s|
      s.send "GET / HTTP/1.0\r\n\r\n", 0
      p s.read
    }

**@overload** [] 

## sendmsg(mesg, flags0, dest_sockaddrnil, *controls) [](#method-i-sendmsg)
call-seq:
    basicsocket.sendmsg(mesg, flags=0, dest_sockaddr=nil, *controls) => numbytes_sent

sendmsg sends a message using sendmsg(2) system call in blocking manner.

*mesg* is a string to send.

*flags* is bitwise OR of MSG_* constants such as Socket::MSG_OOB.

*dest_sockaddr* is a destination socket address for connection-less socket. It
should be a sockaddr such as a result of Socket.sockaddr_in. An Addrinfo
object can be used too.

*controls* is a list of ancillary data. The element of *controls* should be
Socket::AncillaryData or 3-elements array. The 3-element array should contains
cmsg_level, cmsg_type and data.

The return value, *numbytes_sent* is an integer which is the number of bytes
sent.

sendmsg can be used to implement send_io as follows:

    # use Socket::AncillaryData.
    ancdata = Socket::AncillaryData.int(:UNIX, :SOCKET, :RIGHTS, io.fileno)
    sock.sendmsg("a", 0, nil, ancdata)

    # use 3-element array.
    ancdata = [:SOCKET, :RIGHTS, [io.fileno].pack("i!")]
    sock.sendmsg("\0", 0, nil, ancdata)

## sendmsg_nonblock(mesg, flags0, dest_sockaddrnil, *controls, exception:true) [](#method-i-sendmsg_nonblock)
call-seq:
    basicsocket.sendmsg_nonblock(mesg, flags=0, dest_sockaddr=nil, *controls, opts={}) => numbytes_sent

sendmsg_nonblock sends a message using sendmsg(2) system call in non-blocking
manner.

It is similar to BasicSocket#sendmsg but the non-blocking flag is set before
the system call and it doesn't retry the system call.

By specifying a keyword argument *exception* to `false`, you can indicate that
sendmsg_nonblock should not raise an IO::WaitWritable exception, but return
the symbol `:wait_writable` instead.

## setsockopt(*args) [](#method-i-setsockopt)
Sets a socket option. These are protocol and system specific, see your local
system documentation for details.

### Parameters
*   `level` is an integer, usually one of the SOL_ constants such as
    Socket::SOL_SOCKET, or a protocol level. A string or symbol of the name,
    possibly without prefix, is also accepted.
*   `optname` is an integer, usually one of the SO_ constants, such as
    Socket::SO_REUSEADDR. A string or symbol of the name, possibly without
    prefix, is also accepted.
*   `optval` is the value of the option, it is passed to the underlying
    setsockopt() as a pointer to a certain number of bytes. How this is done
    depends on the type:
    *   Integer: value is assigned to an int, and a pointer to the int is
        passed, with length of sizeof(int).
    *   true or false: 1 or 0 (respectively) is assigned to an int, and the
        int is passed as for an Integer. Note that `false` must be passed, not
        `nil`.
    *   String: the string's data and length is passed to the socket.
*   `socketoption` is an instance of Socket::Option

### Examples

Some socket options are integers with boolean values, in this case #setsockopt
could be called like this:
    sock.setsockopt(:SOCKET, :REUSEADDR, true)
    sock.setsockopt(Socket::SOL_SOCKET,Socket::SO_REUSEADDR, true)
    sock.setsockopt(Socket::Option.bool(:INET, :SOCKET, :REUSEADDR, true))

Some socket options are integers with numeric values, in this case #setsockopt
could be called like this:
    sock.setsockopt(:IP, :TTL, 255)
    sock.setsockopt(Socket::IPPROTO_IP, Socket::IP_TTL, 255)
    sock.setsockopt(Socket::Option.int(:INET, :IP, :TTL, 255))

Option values may be structs. Passing them can be complex as it involves
examining your system headers to determine the correct definition. An example
is an `ip_mreq`, which may be defined in your system headers as:
    struct ip_mreq {
      struct  in_addr imr_multiaddr;
      struct  in_addr imr_interface;
    };

In this case #setsockopt could be called like this:
    optval = IPAddr.new("224.0.0.251").hton +
             IPAddr.new(Socket::INADDR_ANY, Socket::AF_INET).hton
    sock.setsockopt(Socket::IPPROTO_IP, Socket::IP_ADD_MEMBERSHIP, optval)

**@overload** [] 

**@overload** [] 

## shutdown(*args) [](#method-i-shutdown)
Calls shutdown(2) system call.

s.shutdown(Socket::SHUT_RD) disallows further read.

s.shutdown(Socket::SHUT_WR) disallows further write.

s.shutdown(Socket::SHUT_RDWR) disallows further read and write.

*how* can be symbol or string:
*   :RD, :SHUT_RD, "RD" and "SHUT_RD" are accepted as Socket::SHUT_RD.
*   :WR, :SHUT_WR, "WR" and "SHUT_WR" are accepted as Socket::SHUT_WR.
*   :RDWR, :SHUT_RDWR, "RDWR" and "SHUT_RDWR" are accepted as
    Socket::SHUT_RDWR.

    UNIXSocket.pair {|s1, s2|
        s1.puts "ping"
        s1.shutdown(:WR)
        p s2.read          #=> "ping\n"
        s2.puts "pong"
        s2.close
        p s1.read          #=> "pong\n"

    }

**@overload** [] 

## write_nonblock(buf, exception:true) [](#method-i-write_nonblock)
:nodoc:

