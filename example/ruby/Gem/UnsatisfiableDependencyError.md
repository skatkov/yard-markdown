# Exception: Gem::UnsatisfiableDependencyError
**Inherits:** Gem::DependencyError
    

Raised by Resolver when a dependency requests a gem for which there is no
spec.


# Attributes
## dependency[RW] [](#attribute-i-dependency)
The unsatisfiable dependency.  This is a Gem::Resolver::DependencyRequest, not
a Gem::Dependency

## errors[RW] [](#attribute-i-errors)
Errors encountered which may have contributed to this exception


#Instance Methods
## initialize(dep, platform_mismatchnil) [](#method-i-initialize)
Creates a new UnsatisfiableDependencyError for the unsatisfiable
Gem::Resolver::DependencyRequest `dep`

**@return** [UnsatisfiableDependencyError] a new instance of UnsatisfiableDependencyError

## name() [](#method-i-name)
The name of the unresolved dependency

## version() [](#method-i-version)
The Requirement of the unresolved dependency (not Version).

