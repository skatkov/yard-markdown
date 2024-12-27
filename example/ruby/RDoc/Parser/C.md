# Class: RDoc::Parser::C
**Inherits:** RDoc::Parser
    
**Includes:** RDoc::Text
  

RDoc::Parser::C attempts to parse C extension files.  It looks for the
standard patterns that you find in extensions: `rb_define_class`,
`rb_define_method` and so on.  It tries to find the corresponding C source for
the methods and extract comments, but if we fail we don't worry too much.

The comments associated with a Ruby method are extracted from the C comment
block associated with the routine that *implements* that method, that is to
say the method whose name is given in the `rb_define_method` call. For
example, you might write:

    /*
     * Returns a new array that is a one-dimensional flattening of this
     * array (recursively). That is, for every element that is an array,
     * extract its elements into the new array.
     *
     *    s = [ 1, 2, 3 ]           #=> [1, 2, 3]
     *    t = [ 4, 5, 6, [7, 8] ]   #=> [4, 5, 6, [7, 8]]
     *    a = [ s, t, 9, 10 ]       #=> [[1, 2, 3], [4, 5, 6, [7, 8]], 9, 10]
     *    a.flatten                 #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
     */
     static VALUE
     rb_ary_flatten(VALUE ary)
     {
         ary = rb_obj_dup(ary);
         rb_ary_flatten_bang(ary);
         return ary;
     }

     ...

     void
     Init_Array(void)
     {
       ...
       rb_define_method(rb_cArray, "flatten", rb_ary_flatten, 0);

Here RDoc will determine from the `rb_define_method` line that there's a
method called "flatten" in class Array, and will look for the implementation
in the method `rb_ary_flatten`. It will then use the comment from that method
in the HTML output. This method must be in the same source file as the
`rb_define_method`.

The comment blocks may include special directives:

Document-class: `name`
:   Documentation for the named class.


Document-module: `name`
:   Documentation for the named module.


Document-const: `name`
:   Documentation for the named `rb_define_const`.

    Constant values can be supplied on the first line of the comment like so:

        /* 300: The highest possible score in bowling */
        rb_define_const(cFoo, "PERFECT", INT2FIX(300));

    The value can contain internal colons so long as they are escaped with a \


Document-global: `name`
:   Documentation for the named `rb_define_global_const`


Document-variable: `name`
:   Documentation for the named `rb_define_variable`


Document-method: `method_name`
:   Documentation for the named method.  Use this when the method name is
    unambiguous.


Document-method: `ClassName::method_name`
:   Documentation for a singleton method in the given class.  Use this when
    the method name alone is ambiguous.


Document-method: `ClassName#method_name`
:   Documentation for a instance method in the given class.  Use this when the
    method name alone is ambiguous.


Document-attr: `name`
:   Documentation for the named attribute.


call-seq:  *text up to an empty line*
:   Because C source doesn't give descriptive names to Ruby-level parameters,
    you need to document the calling sequence explicitly


In addition, RDoc assumes by default that the C method implementing a Ruby
function is in the same source file as the rb_define_method call. If this
isn't the case, add the comment:

    rb_define_method(....);  // in filename

As an example, we might have an extension that defines multiple classes in its
Init_xxx method. We could document them using

    /*
     * Document-class:  MyClass
     *
     * Encapsulate the writing and reading of the configuration
     * file. ...
     */

    /*
     * Document-method: read_value
     *
     * call-seq:
     *   cfg.read_value(key)            -> value
     *   cfg.read_value(key} { |key| }  -> value
     *
     * Return the value corresponding to +key+ from the configuration.
     * In the second form, if the key isn't found, invoke the
     * block and return its value.
     */


# Class Methods
## tsort_each_child(node , &block ) [](#method-c-tsort_each_child)
## tsort_each_node(&block ) [](#method-c-tsort_each_node)
# Attributes
## classes[RW] [](#attribute-i-classes)
Maps C variable names to names of Ruby classes or modules

## content[RW] [](#attribute-i-content)
C file the parser is parsing

## enclosure_dependencies[RW] [](#attribute-i-enclosure_dependencies)
Dependencies from a missing enclosing class to the classes in
missing_dependencies that depend upon it.

## known_classes[RW] [](#attribute-i-known_classes)
Maps C variable names to names of Ruby classes (and singleton classes)

## missing_dependencies[RW] [](#attribute-i-missing_dependencies)
Classes found while parsing the C file that were not yet registered due to a
missing enclosing class.  These are processed by do_missing

## singleton_classes[RW] [](#attribute-i-singleton_classes)
Maps C variable names to names of Ruby singleton classes

## top_level[RW] [](#attribute-i-top_level)
The TopLevel items in the parsed file belong to


#Instance Methods
## add_alias(var_name, class_obj, old_name, new_name, comment) [](#method-i-add_alias)
Add alias, either from a direct alias definition, or from two method that
reference the same function.

## do_aliases() [](#method-i-do_aliases)
Scans #content for rb_define_alias

## do_attrs() [](#method-i-do_attrs)
Scans #content for rb_attr and rb_define_attr

## do_boot_defclass() [](#method-i-do_boot_defclass)
Scans #content for boot_defclass

## do_classes_and_modules() [](#method-i-do_classes_and_modules)
Scans #content for rb_define_class, boot_defclass, rb_define_class_under and
rb_singleton_class

## do_constants() [](#method-i-do_constants)
Scans #content for rb_define_variable, rb_define_readonly_variable,
rb_define_const and rb_define_global_const

## do_includes() [](#method-i-do_includes)
Scans #content for rb_include_module

## do_methods() [](#method-i-do_methods)
Scans #content for rb_define_method, rb_define_singleton_method,
rb_define_module_function, rb_define_private_method, rb_define_global_function
and define_filetest_function

## do_missing() [](#method-i-do_missing)
Creates classes and module that were missing were defined due to the file
order being different than the declaration order.

## expand_tabs(text) [](#method-i-expand_tabs)
Expands tab characters in `text` to eight spaces

## find_alias_comment(class_name, new_name, old_name) [](#method-i-find_alias_comment)
Finds the comment for an alias on `class_name` from `new_name` to `old_name`

## find_attr_comment(var_name, attr_name, readnil, writenil) [](#method-i-find_attr_comment)
Finds a comment for rb_define_attr, rb_attr or Document-attr.

`var_name` is the C class variable the attribute is defined on. `attr_name` is
the attribute's name.

`read` and `write` are the read/write flags ('1' or '0').  Either both or
neither must be provided.

## find_body(class_name, meth_name, meth_obj, file_content, quietfalse) [](#method-i-find_body)
Find the C code corresponding to a Ruby method

## find_class(raw_name, name, base_namenil) [](#method-i-find_class)
Finds a RDoc::NormalClass or RDoc::NormalModule for `raw_name`

## find_class_comment(class_name, class_mod) [](#method-i-find_class_comment)
Look for class or module documentation above Init_`class_name`(void), in a
Document-class `class_name` (or module) comment or above an rb_define_class
(or module).  If a comment is supplied above a matching Init_ and a
rb_define_class the Init_ comment is used.

    /*
     * This is a comment for Foo
     */
    Init_Foo(void) {
        VALUE cFoo = rb_define_class("Foo", rb_cObject);
    }

    /*
     * Document-class: Foo
     * This is a comment for Foo
     */
    Init_foo(void) {
        VALUE cFoo = rb_define_class("Foo", rb_cObject);
    }

    /*
     * This is a comment for Foo
     */
    VALUE cFoo = rb_define_class("Foo", rb_cObject);

## find_const_comment(type, const_name, class_namenil) [](#method-i-find_const_comment)
Finds a comment matching `type` and `const_name` either above the comment or
in the matching Document- section.

## find_modifiers(comment, meth_obj) [](#method-i-find_modifiers)
Handles modifiers in `comment` and updates `meth_obj` as appropriate.

## find_override_comment(class_name, meth_obj) [](#method-i-find_override_comment)
Finds a `Document-method` override for `meth_obj` on `class_name`

## flush_left(text) [](#method-i-flush_left)
Flush `text` left based on the shortest line

## gen_body_table(file_content) [](#method-i-gen_body_table)
Generate a Ruby-method table

## gen_const_table(file_content) [](#method-i-gen_const_table)
Generate a const table

## handle_attr(var_name, attr_name, read, write) [](#method-i-handle_attr)
Creates a new RDoc::Attr `attr_name` on class `var_name` that is either
`read`, `write` or both

## handle_class_module(var_name, type, class_name, parent, in_module) [](#method-i-handle_class_module)
Creates a new RDoc::NormalClass or RDoc::NormalModule based on `type` named
`class_name` in `parent` which was assigned to the C `var_name`.

## handle_constants(type, var_name, const_name, definition) [](#method-i-handle_constants)
Adds constants.  By providing some_value: at the start of the comment you can
override the C value of the comment to give a friendly definition.

    /* 300: The perfect score in bowling */
    rb_define_const(cFoo, "PERFECT", INT2FIX(300));

Will override `INT2FIX(300)` with the value `300` in the output RDoc.  Values
may include quotes and escaped colons (:).

## handle_ifdefs_in(body) [](#method-i-handle_ifdefs_in)
Removes #ifdefs that would otherwise confuse us

## handle_method(type, var_name, meth_name, function, param_count, source_filenil) [](#method-i-handle_method)
Adds an RDoc::AnyMethod `meth_name` defined on a class or module assigned to
`var_name`.  `type` is the type of method definition function used.
`singleton_method` and `module_function` create a singleton method.

## handle_singleton(sclass_var, class_var) [](#method-i-handle_singleton)
Registers a singleton class `sclass_var` as a singleton of `class_var`

## initialize(top_level, file_name, content, options, stats) [](#method-i-initialize)
Prepares for parsing a C file.  See RDoc::Parser#initialize for details on the
arguments.

**@return** [C] a new instance of C

## load_variable_map(map_name) [](#method-i-load_variable_map)
Loads the variable map with the given `name` from the RDoc::Store, if present.

## look_for_directives_in(context, comment) [](#method-i-look_for_directives_in)
Look for directives in a normal comment block:

    /*
     * :title: My Awesome Project
     */

This method modifies the `comment` Both :main: and :title: directives are
deprecated and will be removed in RDoc 7.

## markup(text) [](#method-i-markup)
Convert a string in markup format into HTML.

Requires the including class to implement #formatter

## new_comment(textnil, locationnil, languagenil) [](#method-i-new_comment)
Creates a RDoc::Comment instance.

## normalize_comment(text) [](#method-i-normalize_comment)
Strips hashes, expands tabs then flushes `text` to the left

## parse(text, format'rdoc') [](#method-i-parse)
Normalizes `text` then builds a RDoc::Markup::Document from it

## rb_scan_args(method_body) [](#method-i-rb_scan_args)
Extracts parameters from the `method_body` and returns a method parameter
string.  Follows 1.9.3dev's scan-arg-spec, see README.EXT

## remove_commented_out_lines() [](#method-i-remove_commented_out_lines)
Removes lines that are commented out that might otherwise get picked up when
scanning for classes and methods

## scan() [](#method-i-scan)
Extracts the classes, modules, methods, attributes, constants and aliases from
a C file and returns an RDoc::TopLevel for this file

## snippet(text, limit100) [](#method-i-snippet)
The first `limit` characters of `text` as HTML

## strip_hashes(text) [](#method-i-strip_hashes)
Strips leading # characters from `text`

## strip_newlines(text) [](#method-i-strip_newlines)
Strips leading and trailing n characters from `text`

## strip_stars(text) [](#method-i-strip_stars)
Strips /* */ style comments

## to_html(text) [](#method-i-to_html)
Converts ampersand, dashes, ellipsis, quotes, copyright and registered
trademark symbols in `text` to properly encoded characters.

## wrap(txt, line_len76) [](#method-i-wrap)
Wraps `txt` to `line_len`

