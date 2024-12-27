# Class: CaseInsensitiveRegularExpressionVisitor
**Inherits:** Prism::Visitor
    




#Instance Methods
## initialize(regexps) [](#method-i-initialize)

**@return** [CaseInsensitiveRegularExpressionVisitor] a new instance of CaseInsensitiveRegularExpressionVisitor

## visit_interpolated_regular_expression_node(node) [](#method-i-visit_interpolated_regular_expression_node)

## visit_regular_expression_node(node) [](#method-i-visit_regular_expression_node)
As the visitor is walking the tree, this method will only be called when it
encounters a regular expression node. We can then call any regular expression
-specific APIs. In this case, we are only interested in the regular
expressions that are case-insensitive, which we can retrieve with the
#ignore_case? method.

