# Class: Gem::Resolver::LockSet
**Inherits:** Gem::Resolver::Set
    

A set of gems from a gem dependencies lockfile.


# Attributes
## specs[RW] [](#attribute-i-specs)
:nodoc:


#Instance Methods
## add(name, version, platform) [](#method-i-add)
Creates a new IndexSpecification in this set using the given `name`, `version`
and `platform`.

The specification's set will be the current set, and the source will be the
current set's source.

## find_all(req) [](#method-i-find_all)
Returns an Array of IndexSpecification objects matching the DependencyRequest
`req`.

## initialize(sources) [](#method-i-initialize)
Creates a new LockSet from the given `sources`

**@return** [LockSet] a new instance of LockSet

## load_spec(name, version, platform, source) [](#method-i-load_spec)
Loads a Gem::Specification with the given `name`, `version` and `platform`. 
`source` is ignored.

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

