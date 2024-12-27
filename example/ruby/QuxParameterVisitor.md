# Class: QuxParameterVisitor
**Inherits:** Prism::Visitor
    

For deprecation or refactoring purposes, it's often useful to find all of the
places that call a specific method with a specific k  eyword parameter. This
is easily accomplished with a visitor such as this one.



#Instance Methods
## initialize(calls) [](#method-i-initialize)

**@return** [QuxParameterVisitor] a new instance of QuxParameterVisitor

## visit_call_node(node) [](#method-i-visit_call_node)

