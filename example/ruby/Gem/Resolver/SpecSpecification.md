# Class: Gem::Resolver::SpecSpecification
**Inherits:** Gem::Resolver::Specification
    

The Resolver::SpecSpecification contains common functionality for Resolver
specifications that are backed by a Gem::Specification.



#Instance Methods
## dependencies() [](#method-i-dependencies)
The dependencies of the gem for this specification

## full_name() [](#method-i-full_name)
The name and version of the specification.

Unlike Gem::Specification#full_name, the platform is not included.

## hash() [](#method-i-hash)
The hash value for this specification.

## initialize(set, spec, sourcenil) [](#method-i-initialize)
A SpecSpecification is created for a `set` for a Gem::Specification in `spec`.
 The `source` is either where the `spec` came from, or should be loaded from.

**@return** [SpecSpecification] a new instance of SpecSpecification

## name() [](#method-i-name)
The name of the gem for this specification

## platform() [](#method-i-platform)
The platform this gem works on.

## required_ruby_version() [](#method-i-required_ruby_version)
The required_ruby_version constraint for this specification

## required_rubygems_version() [](#method-i-required_rubygems_version)
The required_rubygems_version constraint for this specification

## version() [](#method-i-version)
The version of the gem for this specification.

