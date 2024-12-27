# Class: RDoc::MethodAttr
**Inherits:** RDoc::CodeObject
    
**Includes:** Comparable
  

Abstract class representing either a method or an attribute.


# Attributes
## aliases[RW] [](#attribute-i-aliases)
Array of other names for this method/attribute

## arglists[RW] [](#attribute-i-arglists)
The call_seq or the param_seq with method name, if there is no call_seq.

## block_params[RW] [](#attribute-i-block_params)
Parameters yielded by the called block

## call_seq[RW] [](#attribute-i-call_seq)
Different ways to call this method

## is_alias_for[RW] [](#attribute-i-is_alias_for)
The method/attribute we're aliasing

## name[RW] [](#attribute-i-name)
Name of this method/attribute.

## param_seq[RW] [](#attribute-i-param_seq)
Pretty parameter list for this method

## params[RW] [](#attribute-i-params)
Parameters for this method

## singleton[RW] [](#attribute-i-singleton)
Is this a singleton method/attribute?

## text[RW] [](#attribute-i-text)
Source file token stream

## visibility[RW] [](#attribute-i-visibility)
public, protected, private


#Instance Methods
## <(y) [](#method-i-<)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than 0.

**@overload** [] 

## <=(y) [](#method-i-<=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than or equal to 0.

**@overload** [] 

## <=>(other) [](#method-i-<=>)
Order by #singleton then #name

## ==(other) [](#method-i-==)
:nodoc:

## >(y) [](#method-i->)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than 0.

**@overload** [] 

## >=(y) [](#method-i->=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than or equal to 0.

**@overload** [] 

## add_alias(an_alias, context) [](#method-i-add_alias)
Abstract method. Contexts in their building phase call this to register a new
alias for this known method/attribute.

*   creates a new AnyMethod/Attribute named `an_alias.new_name`;
*   adds `self` as an alias for the new method or attribute
*   adds the method or attribute to #aliases
*   adds the method or attribute to `context`.

**@raise** [NotImplementedError] 

## add_line_numbers(src) [](#method-i-add_line_numbers)
Prepend `src` with line numbers.  Relies on the first line of a source code
listing having:

    # File xxxxx, line dddd

If it has this comment then line numbers are added to `src` and the `, line
dddd` portion of the comment is removed.

## aref() [](#method-i-aref)
HTML fragment reference for this method

## aref_prefix() [](#method-i-aref_prefix)
Prefix for `aref`, defined by subclasses.

**@raise** [NotImplementedError] 

## between?(min, max) [](#method-i-between?)
Returns `false` if *obj* `<=>` *min* is less than zero or if *obj* `<=>` *max*
is greater than zero, `true` otherwise.

    3.between?(1, 5)               #=> true
    6.between?(1, 5)               #=> false
    'cat'.between?('ant', 'dog')   #=> true
    'gnu'.between?('ant', 'dog')   #=> false

**@overload** [] 

## clamp(*args) [](#method-i-clamp)
In `(min, max)` form, returns *min* if *obj* `<=>` *min* is less than zero,
*max* if *obj* `<=>` *max* is greater than zero, and *obj* otherwise.

    12.clamp(0, 100)         #=> 12
    523.clamp(0, 100)        #=> 100
    -3.123.clamp(0, 100)     #=> 0

    'd'.clamp('a', 'f')      #=> 'd'
    'z'.clamp('a', 'f')      #=> 'f'

If *min* is `nil`, it is considered smaller than *obj*, and if *max* is `nil`,
it is considered greater than *obj*.

    -20.clamp(0, nil)           #=> 0
    523.clamp(nil, 100)         #=> 100

In `(range)` form, returns *range.begin* if *obj* `<=>` *range.begin* is less
than zero, *range.end* if *obj* `<=>` *range.end* is greater than zero, and
*obj* otherwise.

    12.clamp(0..100)         #=> 12
    523.clamp(0..100)        #=> 100
    -3.123.clamp(0..100)     #=> 0

    'd'.clamp('a'..'f')      #=> 'd'
    'z'.clamp('a'..'f')      #=> 'f'

If *range.begin* is `nil`, it is considered smaller than *obj*, and if
*range.end* is `nil`, it is considered greater than *obj*.

    -20.clamp(0..)           #=> 0
    523.clamp(..100)         #=> 100

When *range.end* is excluded and not `nil`, an exception is raised.

    100.clamp(0...100)       # ArgumentError

**@overload** [] 

**@overload** [] 

## documented?() [](#method-i-documented?)
A method/attribute is documented if any of the following is true:
*   it was marked with :nodoc:;
*   it has a comment;
*   it is an alias for a documented method;
*   it has a `#see` method that is documented.

**@return** [Boolean] 

## find_method_or_attribute(name) [](#method-i-find_method_or_attribute)
:nodoc:

## find_see() [](#method-i-find_see)
:nodoc:

## full_name() [](#method-i-full_name)
Full method/attribute name including namespace

## html_name() [](#method-i-html_name)
HTML id-friendly method/attribute name

## initialize(text, name) [](#method-i-initialize)
Creates a new MethodAttr from token stream `text` and method or attribute name
`name`.

Usually this is called by super from a subclass.

**@return** [MethodAttr] a new instance of MethodAttr

## initialize_copy(other) [](#method-i-initialize_copy)
Resets cached data for the object so it can be rebuilt by accessor methods

## initialize_visibility() [](#method-i-initialize_visibility)
:nodoc:

## inspect() [](#method-i-inspect)
:nodoc:

## markup_code() [](#method-i-markup_code)
Turns the method's token stream into HTML.

Prepends line numbers if `options.line_numbers` is true.

## name_ord_range() [](#method-i-name_ord_range)
:nodoc:

## name_prefix() [](#method-i-name_prefix)
'::' for a class method/attribute, '#' for an instance method.

## output_name(context) [](#method-i-output_name)
Name for output to HTML.  For class methods the full name with a "." is used
like `SomeClass.method_name`.  For instance methods the class name is used if
`context` does not match the parent.

This is to help prevent people from using
:   to call class methods.


## parent_name() [](#method-i-parent_name)
Name of our parent with special handling for un-marshaled methods

## path() [](#method-i-path)
Path to this method for use with HTML generator output.

## pretty_name() [](#method-i-pretty_name)
Method/attribute name with class/instance indicator

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## search_record() [](#method-i-search_record)
Used by RDoc::Generator::JsonIndex to create a record for the search engine.

## see() [](#method-i-see)
A method/attribute to look at, in particular if this method/attribute has no
documentation.

It can be a method/attribute of the superclass or of an included module,
including the Kernel module, which is always appended to the included modules.

Returns `nil` if there is no such method/attribute. The `#is_alias_for`
method/attribute, if any, is not included.

Templates may generate a "see also ..." if this method/attribute has
documentation, and "see ..." if it does not.

## store=(store) [](#method-i-store=)
Sets the store for this class or module and its contained code objects.

## to_s() [](#method-i-to_s)
:nodoc:

## type() [](#method-i-type)
Type of method/attribute (class or instance)

