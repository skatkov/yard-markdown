# Class: Psych::Visitors::YAMLTree
**Inherits:** Psych::Visitors::Visitor
    

YAMLTree builds a YAML ast given a Ruby object.  For example:

    builder = Psych::Visitors::YAMLTree.new
    builder << { :foo => 'bar' }
    builder.tree # => #<Psych::Nodes::Stream .. }


# Class Methods
## create(options {}, emitter nil) [](#method-c-create)
# Attributes
## finished[RW] [](#attribute-i-finished)
Returns the value of attribute finished.

## started[RW] [](#attribute-i-started)
Returns the value of attribute started.


#Instance Methods
## accept(target) [](#method-i-accept)

## finish() [](#method-i-finish)

## initialize(emitter, ss, options) [](#method-i-initialize)

**@return** [YAMLTree] a new instance of YAMLTree

## push(object) [](#method-i-push)

## start(encodingNodes::Stream::UTF8) [](#method-i-start)

## tree() [](#method-i-tree)

## visit_Array(o) [](#method-i-visit_Array)

## visit_BasicObject(o) [](#method-i-visit_BasicObject)

## visit_BigDecimal(o) [](#method-i-visit_BigDecimal)

## visit_Class(o) [](#method-i-visit_Class)

**@raise** [TypeError] 

## visit_Complex(o) [](#method-i-visit_Complex)

## visit_Date(o) [](#method-i-visit_Date)

## visit_DateTime(o) [](#method-i-visit_DateTime)

## visit_Encoding(o) [](#method-i-visit_Encoding)

## visit_Enumerator(o) [](#method-i-visit_Enumerator)

## visit_Exception(o) [](#method-i-visit_Exception)

## visit_Float(o) [](#method-i-visit_Float)

## visit_Hash(o) [](#method-i-visit_Hash)

## visit_Integer(o) [](#method-i-visit_Integer)

## visit_Module(o) [](#method-i-visit_Module)

**@raise** [TypeError] 

## visit_NameError(o) [](#method-i-visit_NameError)

## visit_NilClass(o) [](#method-i-visit_NilClass)

## visit_Object(o) [](#method-i-visit_Object)

## visit_Psych_Omap(o) [](#method-i-visit_Psych_Omap)

## visit_Psych_Set(o) [](#method-i-visit_Psych_Set)

## visit_Range(o) [](#method-i-visit_Range)

## visit_Rational(o) [](#method-i-visit_Rational)

## visit_Regexp(o) [](#method-i-visit_Regexp)

## visit_String(o) [](#method-i-visit_String)

## visit_Struct(o) [](#method-i-visit_Struct)

## visit_Symbol(o) [](#method-i-visit_Symbol)

## visit_Time(o) [](#method-i-visit_Time)

