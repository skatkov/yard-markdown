# Class: Prism::StringQuery
**Inherits:** Object
    

Query methods that allow categorizing strings based on their context for where
they could be valid in a Ruby syntax tree.


# Class Methods
## constant?(string ) [](#method-c-constant?)
Returns true if the string constitutes a valid constant name. Note that this
means the names that can be set through Module#const_set, not necessarily the
ones that can be set through a constant assignment.
**@overload** [] 

## local?(string ) [](#method-c-local?)
Returns true if the string constitutes a valid local variable name. Note that
this means the names that can be set through Binding#local_variable_set, not
necessarily the ones that can be set through a local variable assignment.
**@overload** [] 

## method_name?(string ) [](#method-c-method_name?)
Returns true if the string constitutes a valid method name.
**@overload** [] 

# Attributes
## string[RW] [](#attribute-i-string)
The string that this query is wrapping.


#Instance Methods
## constant?() [](#method-i-constant?)
Whether or not this string is a valid constant name.

**@return** [Boolean] 

## initialize(string) [](#method-i-initialize)
Initialize a new query with the given string.

**@return** [StringQuery] a new instance of StringQuery

## local?() [](#method-i-local?)
Whether or not this string is a valid local variable name.

**@return** [Boolean] 

## method_name?() [](#method-i-method_name?)
Whether or not this string is a valid method name.

**@return** [Boolean] 

