# Class: Gem::Resolver::Specification
**Inherits:** Object
    

A Resolver::Specification contains a subset of the information contained in a
Gem::Specification.  Only the information necessary for dependency resolution
in the resolver is included.


# Attributes
## dependencies[RW] [](#attribute-i-dependencies)
The dependencies of the gem for this specification

## name[RW] [](#attribute-i-name)
The name of the gem for this specification

## platform[RW] [](#attribute-i-platform)
The platform this gem works on.

## required_ruby_version[RW] [](#attribute-i-required_ruby_version)
The required_ruby_version constraint for this specification.

## required_rubygems_version[RW] [](#attribute-i-required_rubygems_version)
The required_ruby_version constraint for this specification.

## set[RW] [](#attribute-i-set)
The set this specification came from.

## source[RW] [](#attribute-i-source)
The source for this specification

## spec[RW] [](#attribute-i-spec)
The Gem::Specification for this Resolver::Specification.

Implementers, note that #install updates @spec, so be sure to cache the
Gem::Specification in @spec when overriding.

## version[RW] [](#attribute-i-version)
The version of the gem for this specification.


#Instance Methods
## download(options) [](#method-i-download)

## fetch_development_dependencies() [](#method-i-fetch_development_dependencies)
Fetches development dependencies if the source does not provide them by
default (see APISpecification).

## full_name() [](#method-i-full_name)
The name and version of the specification.

Unlike Gem::Specification#full_name, the platform is not included.

## initialize() [](#method-i-initialize)
Sets default instance variables for the specification.

**@return** [Specification] a new instance of Specification

## install(options{}) [](#method-i-install)
Installs this specification using the Gem::Installer `options`.  The install
method yields a Gem::Installer instance, which indicates the gem will be
installed, or `nil`, which indicates the gem is already installed.

After installation #spec is updated to point to the just-installed
specification.

**@yield** [installer] 

## installable_platform?() [](#method-i-installable_platform?)
Returns true if this specification is installable on this platform.

**@return** [Boolean] 

## local?() [](#method-i-local?)
:nodoc:

**@return** [Boolean] 

