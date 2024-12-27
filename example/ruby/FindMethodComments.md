# Class: FindMethodComments
**Inherits:** Prism::Visitor
    




#Instance Methods
## initialize(target, comments, nesting[]) [](#method-i-initialize)

**@return** [FindMethodComments] a new instance of FindMethodComments

## visit_class_node(node) [](#method-i-visit_class_node)

## visit_def_node(node) [](#method-i-visit_def_node)

## visit_module_node(node) [](#method-i-visit_module_node)
These visit methods are specific to each class. Defining a visitor allows you
to group functionality that applies to all node types into a single class. You
can find which method corresponds to which node type by looking at the class
name, calling #type on the node, or by looking at the #accept method
definition on the node.

