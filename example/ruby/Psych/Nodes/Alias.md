# Class: Psych::Nodes::Alias
**Inherits:** Psych::Nodes::Node
    

This class represents a [YAML Alias](http://yaml.org/spec/1.1/#alias). It
points to an `anchor`.

A Psych::Nodes::Alias is a terminal node and may have no children.


# Attributes
## anchor[RW] [](#attribute-i-anchor)
The anchor this alias links to


#Instance Methods
## alias?() [](#method-i-alias?)

**@return** [Boolean] 

## initialize(anchor) [](#method-i-initialize)
Create a new Alias that points to an `anchor`

**@return** [Alias] a new instance of Alias

