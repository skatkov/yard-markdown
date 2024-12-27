# Exception: Gem::DependencyResolutionError
**Inherits:** Gem::DependencyError
    

Raised by Gem::Resolver when a Gem::Dependency::Conflict reaches the toplevel.
 Indicates which dependencies were incompatible through #conflict and
#conflicting_dependencies


# Attributes
## conflict[RW] [](#attribute-i-conflict)
Returns the value of attribute conflict.


#Instance Methods
## conflicting_dependencies() [](#method-i-conflicting_dependencies)

## initialize(conflict) [](#method-i-initialize)

**@return** [DependencyResolutionError] a new instance of DependencyResolutionError

