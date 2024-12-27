# Class: Gem::Resolv::DNS::Name
**Inherits:** Object
    

A representation of a DNS name.


# Class Methods
## create(arg ) [](#method-c-create)
Creates a new DNS name from `arg`.  `arg` can be:

Name
:   returns `arg`.

String
:   Creates a new Name.


#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## [](i) [](#method-i-[])
:nodoc:

## absolute?() [](#method-i-absolute?)
True if this name is absolute.

**@return** [Boolean] 

## hash() [](#method-i-hash)
:nodoc:

## initialize(labels, absolutetrue) [](#method-i-initialize)
:nodoc:

**@return** [Name] a new instance of Name

## inspect() [](#method-i-inspect)
:nodoc:

## length() [](#method-i-length)
:nodoc:

## subdomain_of?(other) [](#method-i-subdomain_of?)
Returns true if `other` is a subdomain.

Example:

    domain = Gem::Resolv::DNS::Name.create("y.z")
    p Gem::Resolv::DNS::Name.create("w.x.y.z").subdomain_of?(domain) #=> true
    p Gem::Resolv::DNS::Name.create("x.y.z").subdomain_of?(domain) #=> true
    p Gem::Resolv::DNS::Name.create("y.z").subdomain_of?(domain) #=> false
    p Gem::Resolv::DNS::Name.create("z").subdomain_of?(domain) #=> false
    p Gem::Resolv::DNS::Name.create("x.y.z.").subdomain_of?(domain) #=> false
    p Gem::Resolv::DNS::Name.create("w.z").subdomain_of?(domain) #=> false

**@raise** [ArgumentError] 

**@return** [Boolean] 

## to_a() [](#method-i-to_a)
:nodoc:

## to_s() [](#method-i-to_s)
returns the domain name as a string.

The domain name doesn't have a trailing dot even if the name object is
absolute.

Example:

    p Gem::Resolv::DNS::Name.create("x.y.z.").to_s #=> "x.y.z"
    p Gem::Resolv::DNS::Name.create("x.y.z").to_s #=> "x.y.z"

