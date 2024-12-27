# Exception: Gem::Molinillo::CircularDependencyError
**Inherits:** Gem::Molinillo::ResolverError
    

An error caused by attempting to fulfil a dependency that was circular

**@note** [] This exception will be thrown if and only if a {Vertex} is added to a
{DependencyGraph} that has a {DependencyGraph::Vertex#path_to?} an
existing {DependencyGraph::Vertex}


# Attributes
## dependencies[RW] [](#attribute-i-dependencies)
Set<Object>
:   the dependencies responsible for causing the error



#Instance Methods
## initialize(vertices) [](#method-i-initialize)
Initializes a new error with the given circular vertices.

**@param** [Array<DependencyGraph::Vertex>] the vertices in the dependency
that caused the error

**@return** [CircularDependencyError] a new instance of CircularDependencyError

