# Class: Gem::Resolv::IPv6
**Inherits:** Object
    

A Gem::Resolv::DNS IPv6 address.


# Class Methods
## create(arg ) [](#method-c-create)
Creates a new IPv6 address from `arg` which may be:

IPv6
:   returns `arg`.

String
:   `arg` must match one of the IPv6::Regex* constants

# Attributes
## address[RW] [](#attribute-i-address)
The raw IPv6 address as a String.


#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## eql?(other) [](#method-i-eql?)
:nodoc:

**@return** [Boolean] 

## hash() [](#method-i-hash)
:nodoc:

## initialize(address) [](#method-i-initialize)
:nodoc:

**@return** [IPv6] a new instance of IPv6

## inspect() [](#method-i-inspect)
:nodoc:

## to_name() [](#method-i-to_name)
Turns this IPv6 address into a Gem::Resolv::DNS::Name. -- ip6.arpa should be
searched too. [RFC3152]

## to_s() [](#method-i-to_s)
:nodoc:

