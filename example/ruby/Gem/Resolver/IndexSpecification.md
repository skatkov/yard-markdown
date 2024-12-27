# Class: Gem::Resolver::IndexSpecification
**Inherits:** Gem::Resolver::Specification
    

Represents a possible Specification object returned from IndexSet.  Used to
delay needed to download full Specification objects when only the `name` and
`version` are needed.



#Instance Methods
## ==(other) [](#method-i-==)

## dependencies() [](#method-i-dependencies)
The dependencies of the gem for this specification

## hash() [](#method-i-hash)

## initialize(set, name, version, source, platform) [](#method-i-initialize)
An IndexSpecification is created from the index format described in `gem help
generate_index`.

The `set` contains other specifications for this (URL) `source`.

The `name`, `version` and `platform` are the name, version and platform of the
gem.

**@return** [IndexSpecification] a new instance of IndexSpecification

## inspect() [](#method-i-inspect)
:nodoc:

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## required_ruby_version() [](#method-i-required_ruby_version)
The required_ruby_version constraint for this specification

A fallback is included because when generated, some marshalled specs have it
set to `nil`.

## required_rubygems_version() [](#method-i-required_rubygems_version)
The required_rubygems_version constraint for this specification

A fallback is included because the original version of the specification API
didn't include that field, so some marshalled specs in the index have it set
to `nil`.

## spec() [](#method-i-spec)
Fetches a Gem::Specification for this IndexSpecification from the #source.

