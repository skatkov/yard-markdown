# Module: Prism::Relocation
    

Prism parses deterministically for the same input. This provides a nice
property that is exposed through the #node_id API on nodes. Effectively this
means that for the same input, these values will remain consistent every time
the source is parsed. This means we can reparse the source same with a
#node_id value and find the exact same node again.

The Relocation module provides an API around this property. It allows you to
"save" nodes and locations using a minimal amount of memory (just the node_id
and a field identifier) and then reify them later.


# Class Methods
## filepath(value ) [](#method-c-filepath)
Create a new repository for the given filepath.
## string(value ) [](#method-c-string)
Create a new repository for the given string.

