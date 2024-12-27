# Class: Gem::Resolver::ComposedSet
**Inherits:** Gem::Resolver::Set
    

A ComposedSet allows multiple sets to be queried like a single set.

To create a composed set with any number of sets use:

    Gem::Resolver.compose_sets set1, set2

This method will eliminate nesting of composed sets.


# Attributes
## sets[RW] [](#attribute-i-sets)
:nodoc:


#Instance Methods
## errors() [](#method-i-errors)

## find_all(req) [](#method-i-find_all)
Finds all specs matching `req` in all sets.

## initialize(*sets) [](#method-i-initialize)
Creates a new ComposedSet containing `sets`.  Use Gem::Resolver::compose_sets
instead.

**@return** [ComposedSet] a new instance of ComposedSet

## prefetch(reqs) [](#method-i-prefetch)
Prefetches `reqs` in all sets.

## prerelease=(allow_prerelease) [](#method-i-prerelease=)
When `allow_prerelease` is set to `true` prereleases gems are allowed to match
dependencies.

## remote=(remote) [](#method-i-remote=)
Sets the remote network access for all composed sets.

