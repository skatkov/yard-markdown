# Class: Resolv::DNS::Resource::CAA
**Inherits:** Resolv::DNS::Resource
    

CAA resource record defined in RFC 8659

These records identify certificate authority allowed to issue certificates for
the given domain.


# Class Methods
## decode_rdata(msg ) [](#method-c-decode_rdata)
:nodoc:
# Attributes
## flags[RW] [](#attribute-i-flags)
Flags for this proprty:
*   Bit 0 : 0 = not critical, 1 = critical

## tag[RW] [](#attribute-i-tag)
Property tag ("issue", "issuewild", "iodef"...).

## value[RW] [](#attribute-i-value)
Property value.


#Instance Methods
## critical?() [](#method-i-critical?)
Whether the critical flag is set on this property.

**@return** [Boolean] 

## encode_rdata(msg) [](#method-i-encode_rdata)
:nodoc:

## initialize(flags, tag, value) [](#method-i-initialize)
Creates a new CAA for `flags`, `tag` and `value`.

**@return** [CAA] a new instance of CAA

