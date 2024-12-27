# Class: RDoc::Context
**Inherits:** RDoc::CodeObject
    
**Includes:** Comparable
  

A Context is something that can hold modules, classes, methods, attributes,
aliases, requires, and includes. Classes, modules, and files are all Contexts.


# Attributes
## aliases[RW] [](#attribute-i-aliases)
Class/module aliases

## attributes[RW] [](#attribute-i-attributes)
All attr* methods

## block_params[RW] [](#attribute-i-block_params)
Block params to be used in the next MethodAttr parsed under this context

## constants[RW] [](#attribute-i-constants)
Constants defined

## constants_hash[RW] [](#attribute-i-constants_hash)
Hash of registered constants.

## current_line_visibility=[R] [](#attribute-i-current_line_visibility=)
Current visibility of this line

## current_section[RW] [](#attribute-i-current_section)
The current documentation section that new items will be added to.  If
temporary_section is available it will be used.

## extends[RW] [](#attribute-i-extends)
Modules this context is extended with

## external_aliases[RW] [](#attribute-i-external_aliases)
Aliases that could not be resolved.

## in_files[RW] [](#attribute-i-in_files)
Files this context is found in

## includes[RW] [](#attribute-i-includes)
Modules this context includes

## method_list[RW] [](#attribute-i-method_list)
Methods defined in this context

## methods_hash[RW] [](#attribute-i-methods_hash)
Hash of registered methods. Attributes are also registered here, twice if they
are RW.

## name[RW] [](#attribute-i-name)
Name of this class excluding namespace.  See also full_name

## params[RW] [](#attribute-i-params)
Params to be used in the next MethodAttr parsed under this context

## requires[RW] [](#attribute-i-requires)
Files this context requires

## temporary_section[RW] [](#attribute-i-temporary_section)
Use this section for the next method, attribute or constant added.

## unmatched_alias_lists[RW] [](#attribute-i-unmatched_alias_lists)
Hash `old_name => [aliases]`, for aliases that haven't (yet) been resolved to
a method/attribute. (Not to be confused with the aliases of the context.)

## visibility[RW] [](#attribute-i-visibility)
Current visibility of this context


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
Contexts are sorted by full_name

## ==(y) [](#method-i-==)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns 0. Also returns true if *obj* and *other* are the same object.

**@overload** [] 

## >(y) [](#method-i->)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than 0.

**@overload** [] 

## >=(y) [](#method-i->=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than or equal to 0.

**@overload** [] 

## add(klass, name, comment) [](#method-i-add)
Adds an item of type `klass` with the given `name` and `comment` to the
context.

Currently only RDoc::Extend and RDoc::Include are supported.

## add_alias(an_alias) [](#method-i-add_alias)
Adds `an_alias` that is automatically resolved

## add_attribute(attribute) [](#method-i-add_attribute)
Adds `attribute` if not already there. If it is (as method(s) or attribute),
updates the comment if it was empty.

The attribute is registered only if it defines a new method. For instance,
`attr_reader :foo` will not be registered if method `foo` exists, but
`attr_accessor :foo` will be registered if method `foo` exists, but `foo=`
does not.

## add_class(class_type, given_name, superclass'::Object') [](#method-i-add_class)
Adds a class named `given_name` with `superclass`.

Both `given_name` and `superclass` may contain '::', and are interpreted
relative to the `self` context. This allows handling correctly examples like
these:
    class RDoc::Gauntlet < Gauntlet
    module Mod
      class Object   # implies < ::Object
      class SubObject < Object  # this is _not_ ::Object

Given `class Container::Item` RDoc assumes `Container` is a module unless it
later sees `class Container`.  `add_class` automatically upgrades `given_name`
to a class in this case.

## add_class_or_module(mod, self_hash, all_hash) [](#method-i-add_class_or_module)
Adds the class or module `mod` to the modules or classes Hash `self_hash`, and
to `all_hash` (either `TopLevel::modules_hash` or `TopLevel::classes_hash`),
unless #done_documenting is `true`. Sets the #parent of `mod` to `self`, and
its #section to #current_section. Returns `mod`.

## add_constant(constant) [](#method-i-add_constant)
Adds `constant` if not already there. If it is, updates the comment, value
and/or is_alias_for of the known constant if they were empty/nil.

## add_extend(ext) [](#method-i-add_extend)
Adds extension module `ext` which should be an RDoc::Extend

## add_include(include) [](#method-i-add_include)
Adds included module `include` which should be an RDoc::Include

## add_method(method) [](#method-i-add_method)
Adds `method` if not already there. If it is (as method or attribute), updates
the comment if it was empty.

## add_module(class_type, name) [](#method-i-add_module)
Adds a module named `name`.  If RDoc already knows `name` is a class then that
class is returned instead.  See also #add_class.

## add_module_alias(from, from_name, to, file) [](#method-i-add_module_alias)
Adds an alias from `from` (a class or module) to `name` which was defined in
`file`.

## add_module_by_normal_module(mod) [](#method-i-add_module_by_normal_module)
Adds a module by `RDoc::NormalModule` instance. See also #add_module.

## add_require(require) [](#method-i-add_require)
Adds `require` to this context's top level

## add_section(title, commentnil) [](#method-i-add_section)
Returns a section with `title`, creating it if it doesn't already exist.
`comment` will be appended to the section's comment.

A section with a `title` of `nil` will return the default section.

See also RDoc::Context::Section

## add_to(array, thing) [](#method-i-add_to)
Adds `thing` to the collection `array`

## any_content(includestrue) [](#method-i-any_content)
Is there any content?

This means any of: comment, aliases, methods, attributes, external aliases,
require, constant.

Includes and extends are also checked unless `includes == false`.

## between?(min, max) [](#method-i-between?)
Returns `false` if *obj* `<=>` *min* is less than zero or if *obj* `<=>` *max*
is greater than zero, `true` otherwise.

    3.between?(1, 5)               #=> true
    6.between?(1, 5)               #=> false
    'cat'.between?('ant', 'dog')   #=> true
    'gnu'.between?('ant', 'dog')   #=> false

**@overload** [] 

## child_name(name) [](#method-i-child_name)
Creates the full name for a child with `name`

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

## class_attributes() [](#method-i-class_attributes)
Class attributes

## class_method_list() [](#method-i-class_method_list)
Class methods

## classes() [](#method-i-classes)
Array of classes in this context

## classes_and_modules() [](#method-i-classes_and_modules)
All classes and modules in this namespace

## classes_hash() [](#method-i-classes_hash)
Hash of classes keyed by class name

## defined_in?(file) [](#method-i-defined_in?)
Is part of this thing was defined in `file`?

**@return** [Boolean] 

## display(method_attr) [](#method-i-display)
:nodoc:

## each_ancestor(&_) [](#method-i-each_ancestor)
Iterator for ancestors for duck-typing.  Does nothing.  See
RDoc::ClassModule#each_ancestor.

This method exists to make it easy to work with Context subclasses that aren't
part of RDoc.

## each_attribute() [](#method-i-each_attribute)
Iterator for attributes

## each_classmodule(&block) [](#method-i-each_classmodule)
Iterator for classes and modules

## each_constant() [](#method-i-each_constant)
Iterator for constants

## each_extend() [](#method-i-each_extend)
Iterator for extension modules

## each_include() [](#method-i-each_include)
Iterator for included modules

## each_method() [](#method-i-each_method)
Iterator for methods

## each_section() [](#method-i-each_section)
Iterator for each section's contents sorted by title.  The `section`, the
section's `constants` and the sections `attributes` are yielded.  The
`constants` and `attributes` collections are sorted.

To retrieve methods in a section use #methods_by_type with the optional
`section` parameter.

NOTE: Do not edit collections yielded by this method

## find_attribute(name, singleton) [](#method-i-find_attribute)
Finds an attribute `name` with singleton value `singleton`.

## find_attribute_named(name) [](#method-i-find_attribute_named)
Finds an attribute with `name` in this context

## find_class_method_named(name) [](#method-i-find_class_method_named)
Finds a class method with `name` in this context

## find_constant_named(name) [](#method-i-find_constant_named)
Finds a constant with `name` in this context

## find_enclosing_module_named(name) [](#method-i-find_enclosing_module_named)
Find a module at a higher scope

## find_external_alias(name, singleton) [](#method-i-find_external_alias)
Finds an external alias `name` with singleton value `singleton`.

## find_external_alias_named(name) [](#method-i-find_external_alias_named)
Finds an external alias with `name` in this context

## find_file_named(name) [](#method-i-find_file_named)
Finds a file with `name` in this context

## find_instance_method_named(name) [](#method-i-find_instance_method_named)
Finds an instance method with `name` in this context

## find_local_symbol(symbol) [](#method-i-find_local_symbol)
Finds a method, constant, attribute, external alias, module or file named
`symbol` in this context.

## find_method(name, singleton) [](#method-i-find_method)
Finds a method named `name` with singleton value `singleton`.

## find_method_named(name) [](#method-i-find_method_named)
Finds a instance or module method with `name` in this context

## find_module_named(name) [](#method-i-find_module_named)
Find a module with `name` using ruby's scoping rules

## find_symbol(symbol) [](#method-i-find_symbol)
Look up `symbol`, first as a module, then as a local symbol.

## find_symbol_module(symbol) [](#method-i-find_symbol_module)
Look up a module named `symbol`.

## full_name() [](#method-i-full_name)
The full name for this context.  This method is overridden by subclasses.

## fully_documented?() [](#method-i-fully_documented?)
Does this context and its methods and constants all have documentation?

(Yes, fully documented doesn't mean everything.)

**@return** [Boolean] 

## http_url(prefix) [](#method-i-http_url)
URL for this with a `prefix`

## initialize() [](#method-i-initialize)
Creates an unnamed empty context with public current visibility

**@return** [Context] a new instance of Context

## initialize_methods_etc() [](#method-i-initialize_methods_etc)
Sets the defaults for methods and so-forth

## instance_attributes() [](#method-i-instance_attributes)
Instance attributes

## instance_method_list() [](#method-i-instance_method_list)
Instance methods -- TODO remove this later

## instance_methods() [](#method-i-instance_methods)
Instance methods

## methods_by_type(sectionnil) [](#method-i-methods_by_type)
Breaks method_list into a nested hash by type (`'class'` or `'instance'`) and
visibility (`:public`, `:protected`, `:private`).

If `section` is provided only methods in that RDoc::Context::Section will be
returned.

## methods_matching(methods, singletonfalse, &block) [](#method-i-methods_matching)
Yields AnyMethod and Attr entries matching the list of names in `methods`.

## modules() [](#method-i-modules)
Array of modules in this context

## modules_hash() [](#method-i-modules_hash)
Hash of modules keyed by module name

## name_for_path() [](#method-i-name_for_path)
Name to use to generate the url. `#full_name` by default.

## ongoing_visibility=(visibility) [](#method-i-ongoing_visibility=)
Changes the visibility for new methods to `visibility`

## record_location(top_level) [](#method-i-record_location)
Record `top_level` as a file `self` is in.

## remove_from_documentation?() [](#method-i-remove_from_documentation?)
Should we remove this context from the documentation?

The answer is yes if:
*   #received_nodoc is `true`
*   #any_content is `false` (not counting includes)
*   All #includes are modules (not a string), and their module has
    `#remove_from_documentation? == true`
*   All classes and modules have `#remove_from_documentation? == true`

**@return** [Boolean] 

## remove_invisible(min_visibility) [](#method-i-remove_invisible)
Removes methods and attributes with a visibility less than `min_visibility`.
-- TODO mark the visibility of attributes in the template (if not public?)

## remove_invisible_in(array, min_visibility) [](#method-i-remove_invisible_in)
Only called when min_visibility == :public or :private

## resolve_aliases(added) [](#method-i-resolve_aliases)
Tries to resolve unmatched aliases when a method or attribute has just been
added.

## section_contents() [](#method-i-section_contents)
Returns RDoc::Context::Section objects referenced in this context for use in a
table of contents.

## sections() [](#method-i-sections)
Sections in this context

## sections_hash() [](#method-i-sections_hash)
:nodoc:

## set_constant_visibility_for(names, visibility) [](#method-i-set_constant_visibility_for)
Given an array `names` of constants, set the visibility of each constant to
`visibility`

## set_current_section(title, comment) [](#method-i-set_current_section)
Sets the current section to a section with `title`.  See also #add_section

## set_visibility_for(methods, visibility, singletonfalse) [](#method-i-set_visibility_for)
Given an array `methods` of method names, set the visibility of each to
`visibility`

## sort_sections() [](#method-i-sort_sections)
Sorts sections alphabetically (default) or in TomDoc fashion (none, Public,
Internal, Deprecated)

## to_s() [](#method-i-to_s)
:nodoc:

## top_level() [](#method-i-top_level)
Return the TopLevel that owns us -- FIXME we can be 'owned' by several
TopLevel (see #record_location & #in_files)

## upgrade_to_class(mod, class_type, enclosing) [](#method-i-upgrade_to_class)
Upgrades NormalModule `mod` in `enclosing` to a `class_type`

