# Class: Socket::Ifaddr
**Inherits:** Object
    

Socket::Ifaddr represents a result of getifaddrs() function.



#Instance Methods
## addr() [](#method-i-addr)
Returns the address of *ifaddr*. nil is returned if address is not available
in *ifaddr*.

**@overload** [] 

## broadaddr() [](#method-i-broadaddr)
Returns the broadcast address of *ifaddr*. nil is returned if the flags
doesn't have IFF_BROADCAST.

**@overload** [] 

## dstaddr() [](#method-i-dstaddr)
Returns the destination address of *ifaddr*. nil is returned if the flags
doesn't have IFF_POINTOPOINT.

**@overload** [] 

## flags() [](#method-i-flags)
Returns the flags of *ifaddr*.

**@overload** [] 

## ifindex() [](#method-i-ifindex)
Returns the interface index of *ifaddr*.

**@overload** [] 

## inspect() [](#method-i-inspect)
Returns a string to show contents of *ifaddr*.

**@overload** [] 

## name() [](#method-i-name)
Returns the interface name of *ifaddr*.

**@overload** [] 

## netmask() [](#method-i-netmask)
Returns the netmask address of *ifaddr*. nil is returned if netmask is not
available in *ifaddr*.

**@overload** [] 

## vhid() [](#method-i-vhid)
Returns the vhid address of *ifaddr*. nil is returned if there is no vhid.

**@overload** [] 

