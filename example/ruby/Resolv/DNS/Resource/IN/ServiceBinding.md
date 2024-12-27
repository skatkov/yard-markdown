# Class: Resolv::DNS::Resource::IN::ServiceBinding
**Inherits:** Object
    

Common implementation for SVCB-compatible resource records.


# Class Methods
## decode_rdata(msg ) [](#method-c-decode_rdata)
:nodoc:
# Attributes
## params[RW] [](#attribute-i-params)
The service parameters for the target host.

## priority[RW] [](#attribute-i-priority)
The priority of this target host.

The range is 0-65535. If set to 0, this RR is in AliasMode. Otherwise, it is
in ServiceMode.

## target[RW] [](#attribute-i-target)
The domain name of the target host.


#Instance Methods
## alias_mode?() [](#method-i-alias_mode?)
Whether this RR is in AliasMode.

**@return** [Boolean] 

## encode_rdata(msg) [](#method-i-encode_rdata)
:nodoc:

## initialize(priority, target, params[]) [](#method-i-initialize)
Create a service binding resource record.

**@return** [ServiceBinding] a new instance of ServiceBinding

## service_mode?() [](#method-i-service_mode?)
Whether this RR is in ServiceMode.

**@return** [Boolean] 

