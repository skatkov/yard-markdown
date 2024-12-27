# Class: RDoc::Constant
**Inherits:** RDoc::CodeObject
    

A constant


# Attributes
## is_alias_for[RW] [](#attribute-i-is_alias_for)
The module or class this constant is an alias for

## name[RW] [](#attribute-i-name)
The constant's name

## value[RW] [](#attribute-i-value)
The constant's value

## visibility[RW] [](#attribute-i-visibility)
The constant's visibility


#Instance Methods
## <=>(other) [](#method-i-<=>)
Constants are ordered by name

## ==(other) [](#method-i-==)
Constants are equal when their #parent and #name is the same

## documented?() [](#method-i-documented?)
A constant is documented if it has a comment, or is an alias for a documented
class or module.

**@return** [Boolean] 

## full_name() [](#method-i-full_name)
Full constant name including namespace

## initialize(name, value, comment) [](#method-i-initialize)
Creates a new constant with `name`, `value` and `comment`

**@return** [Constant] a new instance of Constant

## inspect() [](#method-i-inspect)
:nodoc:

## marshal_dump() [](#method-i-marshal_dump)
Dumps this Constant for use by ri.  See also #marshal_load

## marshal_load(array) [](#method-i-marshal_load)
Loads this Constant from `array`.  For a loaded Constant the following methods
will return cached values:

*   #full_name
*   #parent_name

## path() [](#method-i-path)
Path to this constant for use with HTML generator output.

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## store=(store) [](#method-i-store=)
Sets the store for this class or module and its contained code objects.

## to_s() [](#method-i-to_s)
:nodoc:

