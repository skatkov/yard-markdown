# Class: Socket::UDPSource
**Inherits:** Object
    

UDP/IP address information used by Socket.udp_server_loop.


# Attributes
## local_address[RW] [](#attribute-i-local_address)
Local address

## remote_address[RW] [](#attribute-i-remote_address)
Address of the source


#Instance Methods
## initialize(remote_address, local_address, &reply_proc) [](#method-i-initialize)
`remote_address` is an Addrinfo object.

`local_address` is an Addrinfo object.

`reply_proc` is a Proc used to send reply back to the source.

**@return** [UDPSource] a new instance of UDPSource

## inspect() [](#method-i-inspect)
:nodoc:

## reply(msg) [](#method-i-reply)
Sends the String `msg` to the source

