# Class: Resolv
**Inherits:** Object
    

Resolv is a thread-aware DNS resolver library written in Ruby.  Resolv can
handle multiple DNS requests concurrently without blocking the entire Ruby
interpreter.

See also resolv-replace.rb to replace the libc resolver with Resolv.

Resolv can look up various DNS resources using the DNS module directly.

Examples:

    p Resolv.getaddress "www.ruby-lang.org"
    p Resolv.getname "210.251.121.214"

    Resolv::DNS.open do |dns|
      ress = dns.getresources "www.ruby-lang.org", Resolv::DNS::Resource::IN::A
      p ress.map(&:address)
      ress = dns.getresources "ruby-lang.org", Resolv::DNS::Resource::IN::MX
      p ress.map { |r| [r.exchange.to_s, r.preference] }
    end

## Bugs

*   NIS is not supported.
*   /etc/nsswitch.conf is not supported.


# Class Methods
## each_address(name , &block ) [](#method-c-each_address)
Iterates over all IP addresses for `name`.
## each_name(address , &proc ) [](#method-c-each_name)
Iterates over all hostnames for `address`.
## getaddress(name ) [](#method-c-getaddress)
Looks up the first IP address for `name`.
## getaddresses(name ) [](#method-c-getaddresses)
Looks up all IP address for `name`.
## getname(address ) [](#method-c-getname)
Looks up the hostname of `address`.
## getnames(address ) [](#method-c-getnames)
Looks up all hostnames for `address`.

#Instance Methods
## each_address(name) [](#method-i-each_address)
Iterates over all IP addresses for `name`.

## each_name(address) [](#method-i-each_name)
Iterates over all hostnames for `address`.

## getaddress(name) [](#method-i-getaddress)
Looks up the first IP address for `name`.

**@raise** [ResolvError] 

## getaddresses(name) [](#method-i-getaddresses)
Looks up all IP address for `name`.

## getname(address) [](#method-i-getname)
Looks up the hostname of `address`.

**@raise** [ResolvError] 

## getnames(address) [](#method-i-getnames)
Looks up all hostnames for `address`.

## initialize(resolvers(arg_not_set = true; nil), use_ipv6:(keyword_not_set = true; nil)) [](#method-i-initialize)
Creates a new Resolv using `resolvers`.

If `resolvers` is not given, a hash, or `nil`, uses a Hosts resolver and and a
DNS resolver.  If `resolvers` is a hash, uses the hash as configuration for
the DNS resolver.

**@return** [Resolv] a new instance of Resolv

