# Class: Gem::Resolver::LockSpecification
**Inherits:** Gem::Resolver::Specification
    

The LockSpecification comes from a lockfile (Gem::RequestSet::Lockfile).

A LockSpecification's dependency information is pre-filled from the lockfile.


# Attributes
## sources[RW] [](#attribute-i-sources)
Returns the value of attribute sources.


#Instance Methods
## add_dependency(dependency) [](#method-i-add_dependency)
Adds `dependency` from the lockfile to this specification

## initialize(set, name, version, sources, platform) [](#method-i-initialize)

**@return** [LockSpecification] a new instance of LockSpecification

## install(options{}) [](#method-i-install)
This is a null install as a locked specification is considered installed.
`options` are ignored.

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## spec() [](#method-i-spec)
A specification constructed from the lockfile is returned

