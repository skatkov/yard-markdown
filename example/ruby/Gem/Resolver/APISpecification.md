# Class: Gem::Resolver::APISpecification
**Inherits:** Gem::Resolver::Specification
    

Represents a specification retrieved via the rubygems.org API.

This is used to avoid loading the full Specification object when all we need
is the name, version, and dependencies.


# Class Methods
## new(set , api_data ) [](#method-c-new)

#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## fetch_development_dependencies() [](#method-i-fetch_development_dependencies)
:nodoc:

## hash() [](#method-i-hash)

## initialize(set, api_data) [](#method-i-initialize)
Creates an APISpecification for the given `set` from the rubygems.org
`api_data`.

See https://guides.rubygems.org/rubygems-org-api/#misc-methods for the format
of the `api_data`.

**@return** [APISpecification] a new instance of APISpecification

## installable_platform?() [](#method-i-installable_platform?)
:nodoc:

**@return** [Boolean] 

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## source() [](#method-i-source)
:nodoc:

## spec() [](#method-i-spec)
Fetches a Gem::Specification for this APISpecification.

