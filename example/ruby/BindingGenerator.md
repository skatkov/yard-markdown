# Class: BindingGenerator
**Inherits:** Object
    

Convert Node objects to a Ruby binding source.


# Attributes
## src[RW] [](#attribute-i-src)
Returns the value of attribute src.


#Instance Methods
## generate(nodes) [](#method-i-generate)

## initialize(src_path:, consts:, values:, funcs:, types:, dynamic_types:, skip_fields:, ruby_fields:) [](#method-i-initialize)

**@param** [String] 

**@param** [Hash{ Symbol => Array<String> }] 

**@param** [Hash{ Symbol => Array<String> }] 

**@param** [Array<String>] 

**@param** [Array<String>] 

**@param** [Array<String>] #ifdef-dependent immediate types, which need Primitive.cexpr! for type detection

**@param** [Hash{ Symbol => Array<String> }] Struct fields that are skipped from bindgen

**@param** [Hash{ Symbol => Array<String> }] Struct VALUE fields that are considered Ruby objects

**@return** [BindingGenerator] a new instance of BindingGenerator

