# Class: Indexer::Repository
**Inherits:** Object
    

A class that implements the #enter functionality so that it can be passed to
the various save* APIs. This effectively bundles up all of the node_id and
field_name pairs so that they can be written back to the parent process.


# Attributes
## entries[RW] [](#attribute-i-entries)
Returns the value of attribute entries.

## scope[RW] [](#attribute-i-scope)
Returns the value of attribute scope.


#Instance Methods
## empty?() [](#method-i-empty?)

**@return** [Boolean] 

## enter(node_id, field_name) [](#method-i-enter)

## initialize() [](#method-i-initialize)

**@return** [Repository] a new instance of Repository

## with(next_scope) [](#method-i-with)

