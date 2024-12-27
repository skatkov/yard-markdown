# Class: Prism::ConstantPathNode
**Inherits:** Prism::Node
    




#Instance Methods
## child() [](#method-i-child)
Previously, we had a child node on this class that contained either a constant
read or a missing node. To not cause a breaking change, we continue to supply
that API.

## full_name() [](#method-i-full_name)
Returns the full name of this constant path. For example: "Foo::Bar"

## full_name_parts() [](#method-i-full_name_parts)
Returns the list of parts for the full name of this constant path. For
example: [:Foo, :Bar]

