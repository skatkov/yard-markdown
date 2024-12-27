# Class: IPAddr
**Inherits:** Object
    
**Includes:** Comparable
  

IPAddr provides a set of methods to manipulate an IP address.  Both IPv4 and
IPv6 are supported.

## Example

    require 'ipaddr'

    ipaddr1 = IPAddr.new "3ffe:505:2::1"

    p ipaddr1                   #=> #<IPAddr: IPv6:3ffe:0505:0002:0000:0000:0000:0000:0001/ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff>

    p ipaddr1.to_s              #=> "3ffe:505:2::1"

    ipaddr2 = ipaddr1.mask(48)  #=> #<IPAddr: IPv6:3ffe:0505:0002:0000:0000:0000:0000:0000/ffff:ffff:ffff:0000:0000:0000:0000:0000>

    p ipaddr2.to_s              #=> "3ffe:505:2::"

    ipaddr3 = IPAddr.new "192.168.2.0/24"

    p ipaddr3                   #=> #<IPAddr: IPv4:192.168.2.0/255.255.255.0>


# Class Methods
## new_ntoh(addr ) [](#method-c-new_ntoh)
Creates a new ipaddr containing the given network byte ordered string form of
an IP address.
## ntop(addr ) [](#method-c-ntop)
Convert a network byte ordered string form of an IP address into human
readable form. It expects the string to be encoded in Encoding::ASCII_8BIT
(BINARY).
# Attributes
## family[RW] [](#attribute-i-family)
Returns the address family of this IP address.


#Instance Methods
## &(other) [](#method-i-&)
Returns a new ipaddr built by bitwise AND.

## <(y) [](#method-i-<)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than 0.

**@overload** [] 

## <<(num) [](#method-i-<<)
Returns a new ipaddr built by bitwise left shift.

## <=(y) [](#method-i-<=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than or equal to 0.

**@overload** [] 

## <=>(other) [](#method-i-<=>)
Compares the ipaddr with another.

## ==(other) [](#method-i-==)
Returns true if two ipaddrs are equal.

## >(y) [](#method-i->)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than 0.

**@overload** [] 

## >=(y) [](#method-i->=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than or equal to 0.

**@overload** [] 

## >>(num) [](#method-i->>)
Returns a new ipaddr built by bitwise right-shift.

## as_json() [](#method-i-as_json)
Returns a string containing the IP address representation with prefix.

## between?(min, max) [](#method-i-between?)
Returns `false` if *obj* `<=>` *min* is less than zero or if *obj* `<=>` *max*
is greater than zero, `true` otherwise.

    3.between?(1, 5)               #=> true
    6.between?(1, 5)               #=> false
    'cat'.between?('ant', 'dog')   #=> true
    'gnu'.between?('ant', 'dog')   #=> false

**@overload** [] 

## cidr() [](#method-i-cidr)
Returns a string containing the IP address representation in cidr notation

## clamp(*args) [](#method-i-clamp)
In `(min, max)` form, returns *min* if *obj* `<=>` *min* is less than zero,
*max* if *obj* `<=>` *max* is greater than zero, and *obj* otherwise.

    12.clamp(0, 100)         #=> 12
    523.clamp(0, 100)        #=> 100
    -3.123.clamp(0, 100)     #=> 0

    'd'.clamp('a', 'f')      #=> 'd'
    'z'.clamp('a', 'f')      #=> 'f'

If *min* is `nil`, it is considered smaller than *obj*, and if *max* is `nil`,
it is considered greater than *obj*.

    -20.clamp(0, nil)           #=> 0
    523.clamp(nil, 100)         #=> 100

In `(range)` form, returns *range.begin* if *obj* `<=>` *range.begin* is less
than zero, *range.end* if *obj* `<=>` *range.end* is greater than zero, and
*obj* otherwise.

    12.clamp(0..100)         #=> 12
    523.clamp(0..100)        #=> 100
    -3.123.clamp(0..100)     #=> 0

    'd'.clamp('a'..'f')      #=> 'd'
    'z'.clamp('a'..'f')      #=> 'f'

If *range.begin* is `nil`, it is considered smaller than *obj*, and if
*range.end* is `nil`, it is considered greater than *obj*.

    -20.clamp(0..)           #=> 0
    523.clamp(..100)         #=> 100

When *range.end* is excluded and not `nil`, an exception is raised.

    100.clamp(0...100)       # ArgumentError

**@overload** [] 

**@overload** [] 

## eql?(other) [](#method-i-eql?)
Checks equality used by Hash.

**@return** [Boolean] 

## hash() [](#method-i-hash)
Returns a hash value used by Hash, Set, and Array classes

## hton() [](#method-i-hton)
Returns a network byte ordered string form of the IP address.

## include?(other) [](#method-i-include?)
Returns true if the given ipaddr is in the range.

e.g.:
    require 'ipaddr'
    net1 = IPAddr.new("192.168.2.0/24")
    net2 = IPAddr.new("192.168.2.100")
    net3 = IPAddr.new("192.168.3.0")
    net4 = IPAddr.new("192.168.2.0/16")
    p net1.include?(net2)     #=> true
    p net1.include?(net3)     #=> false
    p net1.include?(net4)     #=> false
    p net4.include?(net1)     #=> true

**@return** [Boolean] 

## inspect() [](#method-i-inspect)
Returns a string containing a human-readable representation of the ipaddr.
("#<IPAddr: family:address/mask>")

## ip6_arpa() [](#method-i-ip6_arpa)
Returns a string for DNS reverse lookup compatible with RFC3172.

## ip6_int() [](#method-i-ip6_int)
Returns a string for DNS reverse lookup compatible with RFC1886.

## ipv4?() [](#method-i-ipv4?)
Returns true if the ipaddr is an IPv4 address.

**@return** [Boolean] 

## ipv4_compat() [](#method-i-ipv4_compat)
Returns a new ipaddr built by converting the native IPv4 address into an
IPv4-compatible IPv6 address.

## ipv4_compat?() [](#method-i-ipv4_compat?)
Returns true if the ipaddr is an IPv4-compatible IPv6 address.

**@return** [Boolean] 

## ipv4_mapped() [](#method-i-ipv4_mapped)
Returns a new ipaddr built by converting the native IPv4 address into an
IPv4-mapped IPv6 address.

## ipv4_mapped?() [](#method-i-ipv4_mapped?)
Returns true if the ipaddr is an IPv4-mapped IPv6 address.

**@return** [Boolean] 

## ipv6?() [](#method-i-ipv6?)
Returns true if the ipaddr is an IPv6 address.

**@return** [Boolean] 

## link_local?() [](#method-i-link_local?)
Returns true if the ipaddr is a link-local address.  IPv4 addresses in
169.254.0.0/16 reserved by RFC 3927 and link-local IPv6 Unicast Addresses in
fe80::/10 reserved by RFC 4291 are considered link-local. Link-local IPv4
addresses in the IPv4-mapped IPv6 address range are also considered
link-local.

**@return** [Boolean] 

## loopback?() [](#method-i-loopback?)
Returns true if the ipaddr is a loopback address. Loopback IPv4 addresses in
the IPv4-mapped IPv6 address range are also considered as loopback addresses.

**@return** [Boolean] 

## mask(prefixlen) [](#method-i-mask)
Returns a new ipaddr built by masking IP address with the given
prefixlen/netmask. (e.g. 8, 64, "255.255.255.0", etc.)

## native() [](#method-i-native)
Returns a new ipaddr built by converting the IPv6 address into a native IPv4
address.  If the IP address is not an IPv4-mapped or IPv4-compatible IPv6
address, returns self.

## netmask() [](#method-i-netmask)
Returns the netmask in string format e.g. 255.255.0.0

## prefix() [](#method-i-prefix)
Returns the prefix length in bits for the ipaddr.

## prefix=(prefix) [](#method-i-prefix=)
Sets the prefix length in bits

## private?() [](#method-i-private?)
Returns true if the ipaddr is a private address.  IPv4 addresses in
10.0.0.0/8, 172.16.0.0/12 and 192.168.0.0/16 as defined in RFC 1918 and IPv6
Unique Local Addresses in fc00::/7 as defined in RFC 4193 are considered
private. Private IPv4 addresses in the IPv4-mapped IPv6 address range are also
considered private.

**@return** [Boolean] 

## reverse() [](#method-i-reverse)
Returns a string for DNS reverse lookup.  It returns a string in RFC3172 form
for an IPv6 address.

## succ() [](#method-i-succ)
Returns the successor to the ipaddr.

## to_i() [](#method-i-to_i)
Returns the integer representation of the ipaddr.

## to_json(*a) [](#method-i-to_json)
Returns a json string containing the IP address representation.

## to_range() [](#method-i-to_range)
Creates a Range object for the network address.

## to_s() [](#method-i-to_s)
Returns a string containing the IP address representation.

## to_string() [](#method-i-to_string)
Returns a string containing the IP address representation in canonical form.

## wildcard_mask() [](#method-i-wildcard_mask)
Returns the wildcard mask in string format e.g. 0.0.255.255

## zone_id() [](#method-i-zone_id)
Returns the IPv6 zone identifier, if present. Raises InvalidAddressError if
not an IPv6 address.

## zone_id=(zid) [](#method-i-zone_id=)
Returns the IPv6 zone identifier, if present. Raises InvalidAddressError if
not an IPv6 address.

## |(other) [](#method-i-|)
Returns a new ipaddr built by bitwise OR.

## ~() [](#method-i-~)
Returns a new ipaddr built by bitwise negation.

