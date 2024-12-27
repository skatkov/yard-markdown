# Class: Gem::Resolver::Set
**Inherits:** Object
    

Resolver sets are used to look up specifications (and their dependencies) used
in resolution.  This set is abstract.


# Attributes
## errors[RW] [](#attribute-i-errors)
Errors encountered when resolving gems

## prerelease[RW] [](#attribute-i-prerelease)
When true, allows matching of requests to prerelease gems.

## remote[RW] [](#attribute-i-remote)
Set to true to disable network access for this set


#Instance Methods
## find_all(req) [](#method-i-find_all)
The find_all method must be implemented.  It returns all Resolver
Specification objects matching the given DependencyRequest `req`.

**@raise** [NotImplementedError] 

## initialize() [](#method-i-initialize)
:nodoc:

**@return** [Set] a new instance of Set

## prefetch(reqs) [](#method-i-prefetch)
The #prefetch method may be overridden, but this is not necessary.  This
default implementation does nothing, which is suitable for sets where looking
up a specification is cheap (such as installed gems).

When overridden, the #prefetch method should look up specifications matching
`reqs`.

## remote?() [](#method-i-remote?)
When true, this set is allowed to access the network when looking up
specifications or dependencies.

**@return** [Boolean] 

