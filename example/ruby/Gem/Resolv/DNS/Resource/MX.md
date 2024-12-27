# Class: Gem::Resolv::DNS::Resource::MX
**Inherits:** Gem::Resolv::DNS::Resource
    

Mail Exchanger resource.


# Class Methods
## decode_rdata(msg ) [](#method-c-decode_rdata)
:nodoc:
# Attributes
## exchange[RW] [](#attribute-i-exchange)
The host of this MX.

## preference[RW] [](#attribute-i-preference)
The preference for this MX.


#Instance Methods
## encode_rdata(msg) [](#method-i-encode_rdata)
:nodoc:

## initialize(preference, exchange) [](#method-i-initialize)
Creates a new MX record with `preference`, accepting mail at `exchange`.

**@return** [MX] a new instance of MX

