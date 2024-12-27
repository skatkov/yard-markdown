# Class: Resolv::DNS::Resource::IN::WKS
**Inherits:** Resolv::DNS::Resource
    

Well Known Service resource.


# Class Methods
## decode_rdata(msg ) [](#method-c-decode_rdata)
:nodoc:
# Attributes
## address[RW] [](#attribute-i-address)
The host these services run on.

## bitmap[RW] [](#attribute-i-bitmap)
A bit map of enabled services on this host.

If protocol is 6 (TCP) then the 26th bit corresponds to the SMTP service (port
25).  If this bit is set, then an SMTP server should be listening on TCP port
25; if zero, SMTP service is not supported.

## protocol[RW] [](#attribute-i-protocol)
IP protocol number for these services.


#Instance Methods
## encode_rdata(msg) [](#method-i-encode_rdata)
:nodoc:

## initialize(address, protocol, bitmap) [](#method-i-initialize)

**@return** [WKS] a new instance of WKS

