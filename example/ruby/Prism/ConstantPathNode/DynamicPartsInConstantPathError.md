# Exception: Prism::ConstantPathNode::DynamicPartsInConstantPathError
**Inherits:** StandardError
    

An error class raised when dynamic parts are found while computing a constant
path's full name. For example: Foo::Bar::Baz -> does not raise because all
parts of the constant path are simple constants var::Bar::Baz -> raises
because the first part of the constant path is a local variable



