# Class: Resolv::DNS
**Inherits:** Object
    

Resolv::DNS is a DNS stub resolver.

Information taken from the following places:

*   STD0013
*   RFC 1035
*   ftp://ftp.isi.edu/in-notes/iana/assignments/dns-parameters
*   etc.


# Class Methods
## allocate_request_id(host , port ) [](#method-c-allocate_request_id)
:nodoc:
## bind_random_port(udpsock , bind_host "0.0.0.0") [](#method-c-bind_random_port)
:nodoc:
## free_request_id(host , port , id ) [](#method-c-free_request_id)
:nodoc:
## open(*args ) [](#method-c-open)
Creates a new DNS resolver.  See Resolv::DNS.new for argument details.

Yields the created DNS resolver to the block, if given, otherwise returns it.
## random(arg ) [](#method-c-random)
:nodoc:

#Instance Methods
## close() [](#method-i-close)
Closes the DNS resolver.

## each_address(name) [](#method-i-each_address)
Iterates over all IP addresses for `name` retrieved from the DNS resolver.

`name` can be a Resolv::DNS::Name or a String.  Retrieved addresses will be a
Resolv::IPv4 or Resolv::IPv6

## each_name(address) [](#method-i-each_name)
Iterates over all hostnames for `address` retrieved from the DNS resolver.

`address` must be a Resolv::IPv4, Resolv::IPv6 or a String.  Retrieved names
will be Resolv::DNS::Name instances.

## each_resource(name, typeclass, &proc) [](#method-i-each_resource)
Iterates over all `typeclass` DNS resources for `name`.  See #getresource for
argument details.

## extract_resources(msg, name, typeclass) [](#method-i-extract_resources)
:nodoc:

## fetch_resource(name, typeclass) [](#method-i-fetch_resource)

## getaddress(name) [](#method-i-getaddress)
Gets the IP address of `name` from the DNS resolver.

`name` can be a Resolv::DNS::Name or a String.  Retrieved address will be a
Resolv::IPv4 or Resolv::IPv6

**@raise** [ResolvError] 

## getaddresses(name) [](#method-i-getaddresses)
Gets all IP addresses for `name` from the DNS resolver.

`name` can be a Resolv::DNS::Name or a String.  Retrieved addresses will be a
Resolv::IPv4 or Resolv::IPv6

## getname(address) [](#method-i-getname)
Gets the hostname for `address` from the DNS resolver.

`address` must be a Resolv::IPv4, Resolv::IPv6 or a String.  Retrieved name
will be a Resolv::DNS::Name.

**@raise** [ResolvError] 

## getnames(address) [](#method-i-getnames)
Gets all hostnames for `address` from the DNS resolver.

`address` must be a Resolv::IPv4, Resolv::IPv6 or a String.  Retrieved names
will be Resolv::DNS::Name instances.

## getresource(name, typeclass) [](#method-i-getresource)
Look up the `typeclass` DNS resource of `name`.

`name` must be a Resolv::DNS::Name or a String.

`typeclass` should be one of the following:

*   Resolv::DNS::Resource::IN::A
*   Resolv::DNS::Resource::IN::AAAA
*   Resolv::DNS::Resource::IN::ANY
*   Resolv::DNS::Resource::IN::CNAME
*   Resolv::DNS::Resource::IN::HINFO
*   Resolv::DNS::Resource::IN::MINFO
*   Resolv::DNS::Resource::IN::MX
*   Resolv::DNS::Resource::IN::NS
*   Resolv::DNS::Resource::IN::PTR
*   Resolv::DNS::Resource::IN::SOA
*   Resolv::DNS::Resource::IN::TXT
*   Resolv::DNS::Resource::IN::WKS

Returned resource is represented as a Resolv::DNS::Resource instance, i.e.
Resolv::DNS::Resource::IN::A.

**@raise** [ResolvError] 

## getresources(name, typeclass) [](#method-i-getresources)
Looks up all `typeclass` DNS resources for `name`.  See #getresource for
argument details.

## initialize(config_infonil) [](#method-i-initialize)
Creates a new DNS resolver.

`config_info` can be:

nil
:   Uses /etc/resolv.conf.

String
:   Path to a file using /etc/resolv.conf's format.

Hash
:   Must contain :nameserver, :search and :ndots keys.

:nameserver_port can be used to specify port number of nameserver address.
:raise_timeout_errors can be used to raise timeout errors as exceptions
instead of treating the same as an NXDOMAIN response.

The value of :nameserver should be an address string or an array of address
strings.
*   :nameserver => '8.8.8.8'
*   :nameserver => ['8.8.8.8', '8.8.4.4']

The value of :nameserver_port should be an array of pair of nameserver address
and port number.
*   :nameserver_port => [['8.8.8.8', 53], ['8.8.4.4', 53]]

Example:

    Resolv::DNS.new(:nameserver => ['210.251.121.21'],
                    :search => ['ruby-lang.org'],
                    :ndots => 1)

**@return** [DNS] a new instance of DNS

## lazy_initialize() [](#method-i-lazy_initialize)
:nodoc:

## make_tcp_requester(host, port) [](#method-i-make_tcp_requester)
:nodoc:

## make_udp_requester() [](#method-i-make_udp_requester)
:nodoc:

## timeouts=(values) [](#method-i-timeouts=)
Sets the resolver timeouts.  This may be a single positive number or an array
of positive numbers representing timeouts in seconds. If an array is
specified, a DNS request will retry and wait for each successive interval in
the array until a successful response is received.  Specifying `nil` reverts
to the default timeouts:
5, second = 5 * 2 / nameserver_count, 2 * second, 4 * second
:   Example:

        dns.timeouts = 3


