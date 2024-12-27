# Class: UNIXSocket
**Inherits:** BasicSocket
    

UNIXSocket represents a UNIX domain stream client socket.


# Class Methods
## pair(*args ) [](#method-c-pair)
Creates a pair of sockets connected to each other.

*type* should be a socket type such as: :STREAM, :DGRAM, :RAW, etc.

*protocol* should be a protocol defined in the domain. 0 is default protocol
for the domain.

    s1, s2 = UNIXSocket.pair
    s1.send "a", 0
    s1.send "b", 0
    p s2.recv(10) #=> "ab"
**@overload** [] 

**@overload** [] 

## socketpair(*args ) [](#method-c-socketpair)
Creates a pair of sockets connected to each other.

*type* should be a socket type such as: :STREAM, :DGRAM, :RAW, etc.

*protocol* should be a protocol defined in the domain. 0 is default protocol
for the domain.

    s1, s2 = UNIXSocket.pair
    s1.send "a", 0
    s1.send "b", 0
    p s2.recv(10) #=> "ab"
**@overload** [] 

**@overload** [] 


#Instance Methods
## addr() [](#method-i-addr)
Returns the local address as an array which contains address_family and
unix_path.

Example
    serv = UNIXServer.new("/tmp/sock")
    p serv.addr #=> ["AF_UNIX", "/tmp/sock"]

**@overload** [] 

## initialize(path) [](#method-i-initialize)
Creates a new UNIX client socket connected to *path*.

    require 'socket'

    s = UNIXSocket.new("/tmp/sock")
    s.send "hello", 0

**@overload** [] 

## path() [](#method-i-path)
Returns the path of the local address of unixsocket.

    s = UNIXServer.new("/tmp/sock")
    p s.path #=> "/tmp/sock"

**@overload** [] 

## peeraddr() [](#method-i-peeraddr)
Returns the remote address as an array which contains address_family and
unix_path.

Example
    serv = UNIXServer.new("/tmp/sock")
    c = UNIXSocket.new("/tmp/sock")
    p c.peeraddr #=> ["AF_UNIX", "/tmp/sock"]

**@overload** [] 

## recv_io(*args) [](#method-i-recv_io)
Example

    UNIXServer.open("/tmp/sock") {|serv|
      UNIXSocket.open("/tmp/sock") {|c|
        s = serv.accept

        c.send_io STDOUT
        stdout = s.recv_io

        p STDOUT.fileno #=> 1
        p stdout.fileno #=> 7

        stdout.puts "hello" # outputs "hello\n" to standard output.
      }
    }

*klass* will determine the class of *io* returned (using the IO.for_fd
singleton method or similar). If *klass* is `nil`, an integer file descriptor
is returned.

*mode* is the same as the argument passed to IO.for_fd

**@overload** [] 

## recvfrom(*args) [](#method-i-recvfrom)
Receives a message via *unixsocket*.

*maxlen* is the maximum number of bytes to receive.

*flags* should be a bitwise OR of Socket::MSG_* constants.

*outbuf* will contain only the received data after the method call even if it
is not empty at the beginning.

    s1 = Socket.new(:UNIX, :DGRAM, 0)
    s1_ai = Addrinfo.unix("/tmp/sock1")
    s1.bind(s1_ai)

    s2 = Socket.new(:UNIX, :DGRAM, 0)
    s2_ai = Addrinfo.unix("/tmp/sock2")
    s2.bind(s2_ai)
    s3 = UNIXSocket.for_fd(s2.fileno)

    s1.send "a", 0, s2_ai
    p s3.recvfrom(10) #=> ["a", ["AF_UNIX", "/tmp/sock1"]]

**@overload** [] 

## send_io(val) [](#method-i-send_io)
Sends *io* as file descriptor passing.

    s1, s2 = UNIXSocket.pair

    s1.send_io STDOUT
    stdout = s2.recv_io

    p STDOUT.fileno #=> 1
    p stdout.fileno #=> 6

    stdout.puts "hello" # outputs "hello\n" to standard output.

*io* may be any kind of IO object or integer file descriptor.

**@overload** [] 

