# Class: Gem::Resolv::DNS::Resource::HINFO
**Inherits:** Gem::Resolv::DNS::Resource
    

Host Information resource.


# Class Methods
## decode_rdata(msg ) [](#method-c-decode_rdata)
:nodoc:
# Attributes
## cpu[RW] [](#attribute-i-cpu)
CPU architecture for this resource.

## os[RW] [](#attribute-i-os)
Operating system for this resource.


#Instance Methods
## encode_rdata(msg) [](#method-i-encode_rdata)
:nodoc:

## initialize(cpu, os) [](#method-i-initialize)
Creates a new HINFO running `os` on `cpu`.

**@return** [HINFO] a new instance of HINFO

