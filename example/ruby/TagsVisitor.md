# Class: TagsVisitor
**Inherits:** Prism::Visitor
    

This visitor is responsible for visiting the nodes in the AST and generating
the appropriate tags. The tags are stored in the entries array as strings.


# Attributes
## entries[RW] [](#attribute-i-entries)
Returns the value of attribute entries.

## filepath[RW] [](#attribute-i-filepath)
Returns the value of attribute filepath.

## lines[RW] [](#attribute-i-lines)
Returns the value of attribute lines.

## nesting[RW] [](#attribute-i-nesting)
Returns the value of attribute nesting.

## singleton[RW] [](#attribute-i-singleton)
Returns the value of attribute singleton.


#Instance Methods
## initialize(entries, filepath, lines, nesting[], singletonfalse) [](#method-i-initialize)
Initialize the visitor with the given parameters. The first three parameters
are constant throughout the visit, while the last two are controlled by the
visitor as it traverses the AST. These are treated as immutable by virtue of
the visit methods constructing new visitors when they need to change.

**@return** [TagsVisitor] a new instance of TagsVisitor

## visit_alias_method_node(node) [](#method-i-visit_alias_method_node)
Visit a method alias node and generate the appropriate tags.

    alias m2 m1

## visit_call_node(node) [](#method-i-visit_call_node)
Visit a method call to attr_reader, attr_writer, or attr_accessor without a
receiver and generate the appropriate tags. Note that this ignores the fact
that these methods could be overridden, which is a limitation of this script.

    attr_accessor :m1

## visit_class_node(node) [](#method-i-visit_class_node)
Visit a class node and generate the appropriate tags.

    class C1
    end

## visit_constant_path_write_node(node) [](#method-i-visit_constant_path_write_node)
Visit a constant path write node and generate the appropriate tags.

    C1::C2 = 1

## visit_constant_write_node(node) [](#method-i-visit_constant_write_node)
Visit a constant write node and generate the appropriate tags.

    C1 = 1

## visit_def_node(node) [](#method-i-visit_def_node)
Visit a method definition node and generate the appropriate tags.

    def m1; end

## visit_module_node(node) [](#method-i-visit_module_node)
Visit a module node and generate the appropriate tags.

    module M1
    end

## visit_singleton_class_node(node) [](#method-i-visit_singleton_class_node)
Visit a singleton class node and generate the appropriate tags.

    class << self
    end

