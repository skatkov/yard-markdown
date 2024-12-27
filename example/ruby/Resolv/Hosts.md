# Class: Resolv::Hosts
**Inherits:** Object
    

Resolv::Hosts is a hostname resolver that uses the system hosts file.



#Instance Methods
## each_address(name, &proc) [](#method-i-each_address)
Iterates over all IP addresses for `name` retrieved from the hosts file.

## each_name(address, &proc) [](#method-i-each_name)
Iterates over all hostnames for `address` retrieved from the hosts file.

## getaddress(name) [](#method-i-getaddress)
Gets the IP address of `name` from the hosts file.

**@raise** [ResolvError] 

## getaddresses(name) [](#method-i-getaddresses)
Gets all IP addresses for `name` from the hosts file.

## getname(address) [](#method-i-getname)
Gets the hostname of `address` from the hosts file.

**@raise** [ResolvError] 

## getnames(address) [](#method-i-getnames)
Gets all hostnames for `address` from the hosts file.

## initialize(filenameDefaultFileName) [](#method-i-initialize)
Creates a new Resolv::Hosts, using `filename` for its data source.

**@return** [Hosts] a new instance of Hosts

## lazy_initialize() [](#method-i-lazy_initialize)
:nodoc:

