# Class: Gem::TestCase::StaticSet
**Inherits:** Gem::Resolver::Set
    

The StaticSet is a static set of gem specifications used for testing only. It
is available by requiring Gem::TestCase.


# Attributes
## remote[RW] [](#attribute-i-remote)
A StaticSet ignores remote because it has a fixed set of gems.


#Instance Methods
## add(spec) [](#method-i-add)
Adds `spec` to this set.

## find_all(dep) [](#method-i-find_all)
Finds all gems matching `dep` in this set.

## find_spec(dep) [](#method-i-find_spec)
Finds `dep` in this set.

## initialize(specs) [](#method-i-initialize)
Creates a new StaticSet for the given `specs`

**@return** [StaticSet] a new instance of StaticSet

## load_spec(name, ver, platform, source) [](#method-i-load_spec)
Loads a Gem::Specification from this set which has the given `name`, version
`ver`, `platform`.  The `source` is ignored.

## prefetch(reqs) [](#method-i-prefetch)
:nodoc:

