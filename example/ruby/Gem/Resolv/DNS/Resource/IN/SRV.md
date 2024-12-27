# Class: Gem::Resolv::DNS::Resource::IN::SRV
**Inherits:** Gem::Resolv::DNS::Resource
    

SRV resource record defined in RFC 2782

These records identify the hostname and port that a service is available at.


# Class Methods
## decode_rdata(msg ) [](#method-c-decode_rdata)
:nodoc:
# Attributes
## port[RW] [](#attribute-i-port)
The port on this target host of this service.

The range is 0-65535.

## priority[RW] [](#attribute-i-priority)
The priority of this target host.

A client MUST attempt to contact the target host with the lowest-numbered
priority it can reach; target hosts with the same priority SHOULD be tried in
an order defined by the weight field. The range is 0-65535.  Note that it is
not widely implemented and should be set to zero.

## target[RW] [](#attribute-i-target)
The domain name of the target host.

A target of "." means that the service is decidedly not available at this
domain.

## weight[RW] [](#attribute-i-weight)
A server selection mechanism.

The weight field specifies a relative weight for entries with the same
priority. Larger weights SHOULD be given a proportionately higher probability
of being selected. The range of this number is 0-65535.  Domain administrators
SHOULD use Weight 0 when there isn't any server selection to do, to make the
RR easier to read for humans (less noisy). Note that it is not widely
implemented and should be set to zero.


#Instance Methods
## encode_rdata(msg) [](#method-i-encode_rdata)
:nodoc:

## initialize(priority, weight, port, target) [](#method-i-initialize)
Create a SRV resource record.

See the documentation for #priority, #weight, #port and #target for
`priority`, `weight`, +port and `target` respectively.

**@return** [SRV] a new instance of SRV

