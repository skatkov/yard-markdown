# Class: Gem::Molinillo::Resolver::Resolution
**Inherits:** Object
    
**Includes:** Gem::Molinillo::Delegates::ResolutionState, Gem::Molinillo::Delegates::SpecificationProvider
  

A specific resolution from a given {Resolver}


# Attributes
## base[RW] [](#attribute-i-base)

**@return** [DependencyGraph] the base dependency graph to which
dependencies should be 'locked'

## iteration_rate=[R] [](#attribute-i-iteration_rate=)

**@return** [Integer] the number of resolver iterations in between calls to
{#resolver_ui}'s {UI#indicate_progress} method

## original_requested[RW] [](#attribute-i-original_requested)

**@return** [Array] the dependencies that were explicitly required

## resolver_ui[RW] [](#attribute-i-resolver_ui)

**@return** [UI] the UI that knows how to communicate feedback about the
resolution process back to the user

## specification_provider[RW] [](#attribute-i-specification_provider)

**@return** [SpecificationProvider] the provider that knows about
dependencies, requirements, specifications, versions, etc.

## started_at=[R] [](#attribute-i-started_at=)

**@return** [Time] the time at which resolution began

## states=[R] [](#attribute-i-states=)

**@return** [Array<ResolutionState>] the stack of states for the resolution


#Instance Methods
## activated() [](#method-i-activated)
the graph of activated dependencies

## allow_missing?(dependency) [](#method-i-allow_missing?)
Returns whether this dependency, which has no possible matching
specifications, can safely be ignored.

**@param** [Object] 

**@return** [Boolean] whether this dependency can safely be skipped.

## conflicts() [](#method-i-conflicts)
unresolved conflicts, indexed by dependency name

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

## depth() [](#method-i-depth)
the depth of the resolution

## initialize(specification_provider, resolver_ui, requested, base) [](#method-i-initialize)
Initializes a new resolution.

**@param** [SpecificationProvider] see {#specification_provider}

**@param** [UI] see {#resolver_ui}

**@param** [Array] see {#original_requested}

**@param** [DependencyGraph] see {#base}

**@return** [Resolution] a new instance of Resolution

## name() [](#method-i-name)
the name of the current requirement

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

## possibilities() [](#method-i-possibilities)
the possibilities to satisfy the current requirement

## requirement() [](#method-i-requirement)
the current requirement

## requirement_satisfied_by?(requirement, activated, spec) [](#method-i-requirement_satisfied_by?)
Determines whether the given `requirement` is satisfied by the given `spec`,
in the context of the current `activated` dependency graph.

**@param** [Object] 

**@param** [DependencyGraph] the current dependency graph in the
resolution process.

**@param** [Object] 

**@return** [Boolean] whether `requirement` is satisfied by `spec` in the
context of the current `activated` dependency graph.

## requirements() [](#method-i-requirements)
currently unsatisfied requirements

## resolve() [](#method-i-resolve)
Resolves the {#original_requested} dependencies into a full dependency
    graph

**@raise** [ResolverError] if successful resolution is impossible

**@return** [DependencyGraph] the dependency graph of successfully resolved
dependencies

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

## unused_unwind_options() [](#method-i-unused_unwind_options)
unwinds for previous conflicts that weren't explored

