# Class: Gem::Resolver
**Inherits:** Object
    
**Includes:** Gem::Molinillo::SpecificationProvider, Gem::Molinillo::UI
  

Given a set of Gem::Dependency objects as `needed` and a way to query the set
of available specs via `set`, calculates a set of ActivationRequest objects
which indicate all the specs that should be activated to meet the all the
requirements.


# Class Methods
## compose_sets(*sets ) [](#method-c-compose_sets)
Combines `sets` into a ComposedSet that allows specification lookup in a
uniform manner.  If one of the `sets` is itself a ComposedSet its sets are
flattened into the result ComposedSet.
## for_current_gems(needed ) [](#method-c-for_current_gems)
Creates a Resolver that queries only against the already installed gems for
the `needed` dependencies.
# Attributes
## development[RW] [](#attribute-i-development)
Set to true if all development dependencies should be considered.

## development_shallow[RW] [](#attribute-i-development_shallow)
Set to true if immediate development dependencies should be considered.

## ignore_dependencies[RW] [](#attribute-i-ignore_dependencies)
When true, no dependencies are looked up for requested gems.

## skip_gems[RW] [](#attribute-i-skip_gems)
Hash of gems to skip resolution.  Keyed by gem name, with arrays of gem
specifications as values.

## soft_missing[RW] [](#attribute-i-soft_missing)
Returns the value of attribute soft_missing.

## stats[RW] [](#attribute-i-stats)
List of dependencies that could not be found in the configured sources.


#Instance Methods
## activation_request(dep, possible) [](#method-i-activation_request)
Creates an ActivationRequest for the given `dep` and the last `possible`
specification.

Returns the Specification and the ActivationRequest

## after_resolution() [](#method-i-after_resolution)
Called after resolution ends (either successfully or with an error). By
default, prints a newline.

**@return** [void] 

## allow_missing?(dependency) [](#method-i-allow_missing?)

**@return** [Boolean] 

## before_resolution() [](#method-i-before_resolution)
Called before resolution begins.

**@return** [void] 

## debug(depth0) [](#method-i-debug)
Conveys debug information to the user.

**@param** [Integer] the current depth of the resolution process.

**@return** [void] 

## debug?() [](#method-i-debug?)

**@return** [Boolean] 

## dependencies_equal?(dependencies, other_dependencies) [](#method-i-dependencies_equal?)
Determines whether two arrays of dependencies are equal, and thus can be
grouped.

**@param** [Array<Object>] 

**@param** [Array<Object>] 

**@return** [Boolean] whether `dependencies` and `other_dependencies` should
be considered equal.

## dependencies_for(specification) [](#method-i-dependencies_for)

## explain(stage, *data) [](#method-i-explain)
:nodoc:

## explain_list(stage) [](#method-i-explain_list)
:nodoc:

## find_possible(dependency) [](#method-i-find_possible)
Extracts the specifications that may be able to fulfill `dependency` and
returns those that match the local platform and all those that match.

## indicate_progress() [](#method-i-indicate_progress)
Called roughly every {#progress_rate}, this method should convey progress to
the user.

**@return** [void] 

## initialize(needed, setnil) [](#method-i-initialize)
Create Resolver object which will resolve the tree starting with `needed`
Dependency objects.

`set` is an object that provides where to look for specifications to satisfy
the Dependencies. This defaults to IndexSet, which will query rubygems.org.

**@return** [Resolver] a new instance of Resolver

## name_for(dependency) [](#method-i-name_for)

## name_for_explicit_dependency_source() [](#method-i-name_for_explicit_dependency_source)

**@return** [String] the name of the source of explicit dependencies, i.e.
those passed to {Resolver#resolve} directly.

## name_for_locking_dependency_source() [](#method-i-name_for_locking_dependency_source)

**@return** [String] the name of the source of 'locked' dependencies, i.e.
those passed to {Resolver#resolve} directly as the `base`

## output() [](#method-i-output)

## progress_rate() [](#method-i-progress_rate)
How often progress should be conveyed to the user via {#indicate_progress}, in
seconds. A third of a second, by default.

**@return** [Float] 

## requests(s, act, reqs[]) [](#method-i-requests)
:nodoc:

## requirement_satisfied_by?(requirement, activated, spec) [](#method-i-requirement_satisfied_by?)

**@return** [Boolean] 

## resolve() [](#method-i-resolve)
Proceed with resolution! Returns an array of ActivationRequest objects.

## search_for(dependency) [](#method-i-search_for)

## select_local_platforms(specs) [](#method-i-select_local_platforms)
Returns the gems in `specs` that match the local platform.

## sort_dependencies(dependencies, activated, conflicts) [](#method-i-sort_dependencies)

