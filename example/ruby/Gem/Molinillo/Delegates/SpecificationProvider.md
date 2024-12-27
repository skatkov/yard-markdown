# Module: Gem::Molinillo::Delegates::SpecificationProvider
    

Delegates all {Gem::Molinillo::SpecificationProvider} methods to a
`#specification_provider` property.



#Instance Methods
## allow_missing?(dependency) [](#method-i-allow_missing?)
Returns whether this dependency, which has no possible matching
specifications, can safely be ignored.

**@param** [Object] 

**@return** [Boolean] whether this dependency can safely be skipped.

## dependencies_equal?(dependencies, other_dependencies) [](#method-i-dependencies_equal?)
Determines whether two arrays of dependencies are equal, and thus can be
grouped.

**@param** [Array<Object>] 

**@param** [Array<Object>] 

**@return** [Boolean] whether `dependencies` and `other_dependencies` should
be considered equal.

## dependencies_for(specification) [](#method-i-dependencies_for)
Returns the dependencies of `specification`.

**@note** [] This method should be 'pure', i.e. the return value should depend
only on the `specification` parameter.

**@param** [Object] 

**@return** [Array<Object>] the dependencies that are required by the given
`specification`.

## name_for(dependency) [](#method-i-name_for)
Returns the name for the given `dependency`.

**@note** [] This method should be 'pure', i.e. the return value should depend
only on the `dependency` parameter.

**@param** [Object] 

**@return** [String] the name for the given `dependency`.

## name_for_explicit_dependency_source() [](#method-i-name_for_explicit_dependency_source)

**@return** [String] the name of the source of explicit dependencies, i.e.
those passed to {Resolver#resolve} directly.

## name_for_locking_dependency_source() [](#method-i-name_for_locking_dependency_source)

**@return** [String] the name of the source of 'locked' dependencies, i.e.
those passed to {Resolver#resolve} directly as the `base`

## requirement_satisfied_by?(requirement, activated, spec) [](#method-i-requirement_satisfied_by?)
Determines whether the given `requirement` is satisfied by the given `spec`,
in the context of the current `activated` dependency graph.

**@param** [Object] 

**@param** [DependencyGraph] the current dependency graph in the
resolution process.

**@param** [Object] 

**@return** [Boolean] whether `requirement` is satisfied by `spec` in the
context of the current `activated` dependency graph.

## search_for(dependency) [](#method-i-search_for)
Search for the specifications that match the given dependency. The
specifications in the returned array will be considered in reverse order, so
the latest version ought to be last.

**@note** [] This method should be 'pure', i.e. the return value should depend
only on the `dependency` parameter.

**@param** [Object] 

**@return** [Array<Object>] the specifications that satisfy the given
`dependency`.

## sort_dependencies(dependencies, activated, conflicts) [](#method-i-sort_dependencies)
Sort dependencies so that the ones that are easiest to resolve are first.
Easiest to resolve is (usually) defined by:
    1) Is this dependency already activated?
    2) How relaxed are the requirements?
    3) Are there any conflicts for this dependency?
    4) How many possibilities are there to satisfy this dependency?

**@param** [Array<Object>] 

**@param** [DependencyGraph] the current dependency graph in the
resolution process.

**@param** [{String => Array<Conflict>}] 

**@return** [Array<Object>] a sorted copy of `dependencies`.

