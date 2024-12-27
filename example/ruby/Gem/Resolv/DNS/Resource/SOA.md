# Class: Gem::Resolv::DNS::Resource::SOA
**Inherits:** Gem::Resolv::DNS::Resource
    

Start Of Authority resource.


# Class Methods
## decode_rdata(msg ) [](#method-c-decode_rdata)
:nodoc:
# Attributes
## expire[RW] [](#attribute-i-expire)
Time in seconds that a secondary name server is to use the data before
refreshing from the primary name server.

## minimum[RW] [](#attribute-i-minimum)
The minimum number of seconds to be used for TTL values in RRs.

## mname[RW] [](#attribute-i-mname)
Name of the host where the master zone file for this zone resides.

## refresh[RW] [](#attribute-i-refresh)
How often, in seconds, a secondary name server is to check for updates from
the primary name server.

## retry[RW] [](#attribute-i-retry)
How often, in seconds, a secondary name server is to retry after a failure to
check for a refresh.

## rname[RW] [](#attribute-i-rname)
The person responsible for this domain name.

## serial[RW] [](#attribute-i-serial)
The version number of the zone file.


#Instance Methods
## encode_rdata(msg) [](#method-i-encode_rdata)
:nodoc:

## initialize(mname, rname, serial, refresh, retry_, expire, minimum) [](#method-i-initialize)
Creates a new SOA record.  See the attr documentation for the details of each
argument.

**@return** [SOA] a new instance of SOA

