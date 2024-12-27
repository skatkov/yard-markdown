# Class: Resolv::MDNS
**Inherits:** Resolv::DNS
    

Resolv::MDNS is a one-shot Multicast DNS (mDNS) resolver.  It blindly makes
queries to the mDNS addresses without understanding anything about multicast
ports.

Information taken form the following places:

*   RFC 6762



#Instance Methods
## each_address(name) [](#method-i-each_address)
Iterates over all IP addresses for `name` retrieved from the mDNS resolver,
provided name ends with "local".  If the name does not end in "local" no
records will be returned.

`name` can be a Resolv::DNS::Name or a String.  Retrieved addresses will be a
Resolv::IPv4 or Resolv::IPv6

## initialize(config_infonil) [](#method-i-initialize)
Creates a new one-shot Multicast DNS (mDNS) resolver.

`config_info` can be:

nil
:   Uses the default mDNS addresses


Hash
:   Must contain :nameserver or :nameserver_port like Resolv::DNS#initialize.


**@return** [MDNS] a new instance of MDNS

## make_udp_requester() [](#method-i-make_udp_requester)
:nodoc:

