# Class: Gem::Molinillo::Resolver
**Inherits:** Object
    

This class encapsulates a dependency resolver. The resolver is responsible for
determining which set of dependencies to activate, with feedback from the
{#specification_provider}


# Attributes
## resolver_ui[RW] [](#attribute-i-resolver_ui)

**@return** [UI] the UI module used to communicate back to the user
during the resolution process

## specification_provider[RW] [](#attribute-i-specification_provider)

**@return** [SpecificationProvider] the specification provider used
in the resolution process


#Instance Methods
## initialize(specification_provider, resolver_ui) [](#method-i-initialize)
Initializes a new resolver.

**@param** [SpecificationProvider] see {#specification_provider}

**@param** [UI] see {#resolver_ui}

**@return** [Resolver] a new instance of Resolver

## resolve(requested, baseDependencyGraph.new) [](#method-i-resolve)
Resolves the requested dependencies into a {DependencyGraph}, locking to the
base dependency graph (if specified)

**@param** [Array] an array of 'requested' dependencies that the
{#specification_provider} can understand

**@param** [DependencyGraph, nil] the base dependency graph to which
dependencies should be 'locked'

