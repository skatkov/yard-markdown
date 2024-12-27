# Class: Psych::Visitors::ToRuby
**Inherits:** Psych::Visitors::Visitor
    

This class walks a YAML AST, converting each node to Ruby


# Class Methods
## create(symbolize_names: false, freeze: false, strict_integer: false) [](#method-c-create)
# Attributes
## class_loader[RW] [](#attribute-i-class_loader)
Returns the value of attribute class_loader.


#Instance Methods
## accept(target) [](#method-i-accept)

## initialize(ss, class_loader, symbolize_names:false, freeze:false) [](#method-i-initialize)

**@return** [ToRuby] a new instance of ToRuby

## visit_Psych_Nodes_Alias(o) [](#method-i-visit_Psych_Nodes_Alias)

## visit_Psych_Nodes_Document(o) [](#method-i-visit_Psych_Nodes_Document)

## visit_Psych_Nodes_Mapping(o) [](#method-i-visit_Psych_Nodes_Mapping)

## visit_Psych_Nodes_Scalar(o) [](#method-i-visit_Psych_Nodes_Scalar)

## visit_Psych_Nodes_Sequence(o) [](#method-i-visit_Psych_Nodes_Sequence)

## visit_Psych_Nodes_Stream(o) [](#method-i-visit_Psych_Nodes_Stream)

