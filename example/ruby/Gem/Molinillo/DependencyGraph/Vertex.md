# Class: Gem::Molinillo::DependencyGraph::Vertex
**Inherits:** Object
    

A vertex in a {DependencyGraph} that encapsulates a {#name} and a {#payload}


# Attributes
## explicit_requirements[RW] [](#attribute-i-explicit_requirements)

**@return** [Array<Object>] the explicit requirements that required
this vertex

## incoming_edges[RW] [](#attribute-i-incoming_edges)

**@return** [Array<Edge>] the edges of {#graph} that have `self` as their
{Edge#destination}

## name[RW] [](#attribute-i-name)

**@return** [String] the name of the vertex

## outgoing_edges[RW] [](#attribute-i-outgoing_edges)

**@return** [Array<Edge>] the edges of {#graph} that have `self` as their
{Edge#origin}

## payload[RW] [](#attribute-i-payload)

**@return** [Object] the payload the vertex holds

## root[RW] [](#attribute-i-root)

**@return** [Boolean] whether the vertex is considered a root vertex


#Instance Methods
## ==(other) [](#method-i-==)

**@return** [Boolean] whether the two vertices are equal, determined
by a recursive traversal of each {Vertex#successors}

## ancestor?(other) [](#method-i-ancestor?)
Is there a path from `other` to `self` following edges in the dependency
graph?

**@return** [Boolean] whether there is a path following edges within this {#graph}

## hash() [](#method-i-hash)

**@return** [Fixnum] a hash for the vertex based upon its {#name}

## initialize(name, payload) [](#method-i-initialize)
Initializes a vertex with the given name and payload.

**@param** [String] see {#name}

**@param** [Object] see {#payload}

**@return** [Vertex] a new instance of Vertex

## inspect() [](#method-i-inspect)

**@return** [String] a string suitable for debugging

## path_to?(other) [](#method-i-path_to?)
Is there a path from `self` to `other` following edges in the dependency
graph?

**@return** [Boolean] whether there is a path following edges within this {#graph}

## predecessors() [](#method-i-predecessors)

**@return** [Array<Vertex>] the vertices of {#graph} that have an edge with
`self` as their {Edge#destination}

## recursive_predecessors() [](#method-i-recursive_predecessors)

**@return** [Set<Vertex>] the vertices of {#graph} where `self` is a
{#descendent?}

## recursive_successors() [](#method-i-recursive_successors)

**@return** [Set<Vertex>] the vertices of {#graph} where `self` is an
{#ancestor?}

## requirements() [](#method-i-requirements)

**@return** [Array<Object>] all of the requirements that required
this vertex

## shallow_eql?(other) [](#method-i-shallow_eql?)

**@param** [Vertex] the other vertex to compare to

**@return** [Boolean] whether the two vertices are equal, determined
solely by {#name} and {#payload} equality

## successors() [](#method-i-successors)

**@return** [Array<Vertex>] the vertices of {#graph} that have an edge with
`self` as their {Edge#origin}

