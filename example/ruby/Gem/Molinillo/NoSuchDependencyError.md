# Exception: Gem::Molinillo::NoSuchDependencyError
**Inherits:** Gem::Molinillo::ResolverError
    

An error caused by searching for a dependency that is completely unknown, i.e.
has no versions available whatsoever.


# Attributes
## dependency[RW] [](#attribute-i-dependency)

**@return** [Object] the dependency that could not be found

## required_by[RW] [](#attribute-i-required_by)

**@return** [Array<Object>] the specifications that depended upon {#dependency}


#Instance Methods
## initialize(dependency, required_by[]) [](#method-i-initialize)
Initializes a new error with the given missing dependency.

**@param** [Object] @see {#dependency}

**@param** [Array<Object>] @see {#required_by}

**@return** [NoSuchDependencyError] a new instance of NoSuchDependencyError

## message() [](#method-i-message)
The error message for the missing dependency, including the specifications
that had this dependency.

