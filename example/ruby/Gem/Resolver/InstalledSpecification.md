# Class: Gem::Resolver::InstalledSpecification
**Inherits:** Gem::Resolver::SpecSpecification
    

An InstalledSpecification represents a gem that is already installed locally.



#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## install(options{}) [](#method-i-install)
This is a null install as this specification is already installed. `options`
are ignored.

**@yield** [nil] 

## installable_platform?() [](#method-i-installable_platform?)
Returns `true` if this gem is installable for the current platform.

**@return** [Boolean] 

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## source() [](#method-i-source)
The source for this specification

