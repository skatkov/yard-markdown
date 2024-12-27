# Class: Prism::DesugarCompiler
**Inherits:** MutationCompiler
    

DesugarCompiler is a compiler that desugars Ruby code into a more primitive
form. This is useful for consumers that want to deal with fewer node types.



#Instance Methods
## visit_class_variable_and_write_node(node) [](#method-i-visit_class_variable_and_write_node)
@@foo &&= bar

becomes

@@foo && @@foo = bar

## visit_class_variable_operator_write_node(node) [](#method-i-visit_class_variable_operator_write_node)
@@foo += bar

becomes

@@foo = @@foo + bar

## visit_class_variable_or_write_node(node) [](#method-i-visit_class_variable_or_write_node)
@@foo ||= bar

becomes

defined?(@@foo) ? @@foo : @@foo = bar

## visit_constant_and_write_node(node) [](#method-i-visit_constant_and_write_node)
Foo &&= bar

becomes

Foo && Foo = bar

## visit_constant_operator_write_node(node) [](#method-i-visit_constant_operator_write_node)
Foo += bar

becomes

Foo = Foo + bar

## visit_constant_or_write_node(node) [](#method-i-visit_constant_or_write_node)
Foo ||= bar

becomes

defined?(Foo) ? Foo : Foo = bar

## visit_global_variable_and_write_node(node) [](#method-i-visit_global_variable_and_write_node)
$foo &&= bar

becomes

$foo && $foo = bar

## visit_global_variable_operator_write_node(node) [](#method-i-visit_global_variable_operator_write_node)
$foo += bar

becomes

$foo = $foo + bar

## visit_global_variable_or_write_node(node) [](#method-i-visit_global_variable_or_write_node)
$foo ||= bar

becomes

defined?($foo) ? $foo : $foo = bar

## visit_instance_variable_and_write_node(node) [](#method-i-visit_instance_variable_and_write_node)
becomes

## visit_instance_variable_operator_write_node(node) [](#method-i-visit_instance_variable_operator_write_node)
becomes

## visit_instance_variable_or_write_node(node) [](#method-i-visit_instance_variable_or_write_node)
becomes

## visit_local_variable_and_write_node(node) [](#method-i-visit_local_variable_and_write_node)
foo &&= bar

becomes

foo && foo = bar

## visit_local_variable_operator_write_node(node) [](#method-i-visit_local_variable_operator_write_node)
foo += bar

becomes

foo = foo + bar

## visit_local_variable_or_write_node(node) [](#method-i-visit_local_variable_or_write_node)
foo ||= bar

becomes

foo || foo = bar

