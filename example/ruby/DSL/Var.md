# Class: DSL::Var
**Inherits:** Object
    



# Attributes
## value[RW] [](#attribute-i-value)
Returns the value of attribute value.

## var[RW] [](#attribute-i-var)
Returns the value of attribute var.


#Instance Methods
## [](idx) [](#method-i-[])
Indexing.

    $:1 -> v1=get_value($:1)
    $:1[0] -> rb_ary_entry(v1, 0)
    $:1[0..1] -> [rb_ary_entry(v1, 0), rb_ary_entry(v1, 1)]
    *$:1[0..1] -> rb_ary_entry(v1, 0), rb_ary_entry(v1, 1)

Splat needs `[range]` because `Var` does not have the length info.

## initialize(table, arg, &block) [](#method-i-initialize)

**@return** [Var] a new instance of Var

## pretty_print_instance_variables() [](#method-i-pretty_print_instance_variables)

