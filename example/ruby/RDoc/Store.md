# Class: RDoc::Store
**Inherits:** Object
    

A set of rdoc data for a single project (gem, path, etc.).

The store manages reading and writing ri data for a project and maintains a
cache of methods, classes and ancestors in the store.

The store maintains a #cache of its contents for faster lookup.  After adding
items to the store it must be flushed using #save_cache.  The cache contains
the following structures:

    @cache = {
      :ancestors        => {}, # class name => ancestor names
      :attributes       => {}, # class name => attributes
      :class_methods    => {}, # class name => class methods
      :instance_methods => {}, # class name => instance methods
      :modules          => [], # classes and modules in this store
      :pages            => [], # page names
    }

-- TODO need to prune classes


# Attributes
## c_class_variables[RW] [](#attribute-i-c_class_variables)
Maps C variables to class or module names for each parsed C file.

## c_enclosure_classes[RW] [](#attribute-i-c_enclosure_classes)
Stores the name of the C variable a class belongs to.  This helps wire up
classes defined from C across files.

## c_enclosure_names[RW] [](#attribute-i-c_enclosure_names)
:nodoc:

## c_singleton_class_variables[RW] [](#attribute-i-c_singleton_class_variables)
Maps C variables to singleton class names for each parsed C file.

## cache[RW] [](#attribute-i-cache)
The contents of the Store

## dry_run[RW] [](#attribute-i-dry_run)
If true this Store will not write any files

## encoding[RW] [](#attribute-i-encoding)
The encoding of the contents in the Store

## path[RW] [](#attribute-i-path)
Path this store reads or writes

## rdoc[RW] [](#attribute-i-rdoc)
The RDoc::RDoc driver for this parse tree.  This allows classes consulting the
documentation tree to access user-set options, for example.

## type[RW] [](#attribute-i-type)
Type of ri datastore this was loaded from.  See RDoc::RI::Driver,
RDoc::RI::Paths.

## unmatched_constant_alias[RW] [](#attribute-i-unmatched_constant_alias)
The lazy constants alias will be discovered in passing


#Instance Methods
## add_c_enclosure(variable, namespace) [](#method-i-add_c_enclosure)
Adds `module` as an enclosure (namespace) for the given `variable` for C
files.

## add_c_variables(c_parser) [](#method-i-add_c_variables)
Adds C variables from an RDoc::Parser::C

## add_file(absolute_name, relative_name:absolute_name, parser:nil) [](#method-i-add_file)
Adds the file with `name` as an RDoc::TopLevel to the store.  Returns the
created RDoc::TopLevel.

## all_classes() [](#method-i-all_classes)
Returns all classes discovered by RDoc

## all_classes_and_modules() [](#method-i-all_classes_and_modules)
Returns all classes and modules discovered by RDoc

## all_files() [](#method-i-all_files)
All TopLevels known to RDoc

## all_modules() [](#method-i-all_modules)
Returns all modules discovered by RDoc

## ancestors() [](#method-i-ancestors)
Ancestors cache accessor.  Maps a klass name to an Array of its ancestors in
this store.  If Foo in this store inherits from Object, Kernel won't be listed
(it will be included from ruby's ri store).

## attributes() [](#method-i-attributes)
Attributes cache accessor.  Maps a class to an Array of its attributes.

## cache_path() [](#method-i-cache_path)
Path to the cache file

## class_file(klass_name) [](#method-i-class_file)
Path to the ri data for `klass_name`

## class_methods() [](#method-i-class_methods)
Class methods cache accessor.  Maps a class to an Array of its class methods
(not full name).

## class_path(klass_name) [](#method-i-class_path)
Path where data for `klass_name` will be stored (methods or class data)

## classes_hash() [](#method-i-classes_hash)
Hash of all classes known to RDoc

## clean_cache_collection(collection) [](#method-i-clean_cache_collection)
Removes empty items and ensures item in each collection are unique and sorted

## complete(min_visibility) [](#method-i-complete)
Prepares the RDoc code object tree for use by a generator.

It finds unique classes/modules defined, and replaces classes/modules that are
aliases for another one by a copy with RDoc::ClassModule#is_alias_for set.

It updates the RDoc::ClassModule#constant_aliases attribute of "real" classes
or modules.

It also completely removes the classes and modules that should be removed from
the documentation and the methods that have a visibility below
`min_visibility`, which is the `--visibility` option.

See also RDoc::Context#remove_from_documentation?

## files_hash() [](#method-i-files_hash)
Hash of all files known to RDoc

## find_c_enclosure(variable) [](#method-i-find_c_enclosure)
Finds the enclosure (namespace) for the given C `variable`.

## find_class_named(name) [](#method-i-find_class_named)
Finds the class with `name` in all discovered classes

## find_class_named_from(name, from) [](#method-i-find_class_named_from)
Finds the class with `name` starting in namespace `from`

## find_class_or_module(name) [](#method-i-find_class_or_module)
Finds the class or module with `name`

## find_file_named(name) [](#method-i-find_file_named)
Finds the file with `name` in all discovered files

## find_module_named(name) [](#method-i-find_module_named)
Finds the module with `name` in all discovered modules

## find_text_page(file_name) [](#method-i-find_text_page)
Returns the RDoc::TopLevel that is a text file and has the given `file_name`

## find_unique(all_hash) [](#method-i-find_unique)
Finds unique classes/modules defined in `all_hash`, and returns them as an
array. Performs the alias updates in `all_hash`: see ::complete. -- TODO 
aliases should be registered by Context#add_module_alias

## fix_basic_object_inheritance() [](#method-i-fix_basic_object_inheritance)
Fixes the erroneous `BasicObject < Object` in 1.9.

Because we assumed all classes without a stated superclass inherit from
Object, we have the above wrong inheritance.

We fix BasicObject right away if we are running in a Ruby version >= 1.9.

## friendly_path() [](#method-i-friendly_path)
Friendly rendition of #path

## initialize(pathnil, typenil) [](#method-i-initialize)
Creates a new Store of `type` that will load or save to `path`

**@return** [Store] a new instance of Store

## inspect() [](#method-i-inspect)
:nodoc:

## instance_methods() [](#method-i-instance_methods)
Instance methods cache accessor.  Maps a class to an Array of its instance
methods (not full name).

## load_all() [](#method-i-load_all)
Loads all items from this store into memory.  This recreates a documentation
tree for use by a generator

## load_cache() [](#method-i-load_cache)
Loads cache file for this store

## load_class(klass_name) [](#method-i-load_class)
Loads ri data for `klass_name` and hooks it up to this store.

## load_class_data(klass_name) [](#method-i-load_class_data)
Loads ri data for `klass_name`

## load_method(klass_name, method_name) [](#method-i-load_method)
Loads ri data for `method_name` in `klass_name`

## load_page(page_name) [](#method-i-load_page)
Loads ri data for `page_name`

## main() [](#method-i-main)
Gets the main page for this RDoc store.  This page is used as the root of the
RDoc server.

## main=(page) [](#method-i-main=)
Sets the main page for this RDoc store.

## make_variable_map(variables) [](#method-i-make_variable_map)
Converts the variable => ClassModule map `variables` from a C parser into a
variable => class name map.

## method_file(klass_name, method_name) [](#method-i-method_file)
Path to the ri data for `method_name` in `klass_name`

## module_names() [](#method-i-module_names)
Modules cache accessor.  An Array of all the module (and class) names in the
store.

## modules_hash() [](#method-i-modules_hash)
Hash of all modules known to RDoc

## page(name) [](#method-i-page)
Returns the RDoc::TopLevel that is a text file and has the given `name`

## page_file(page_name) [](#method-i-page_file)
Path to the ri data for `page_name`

## remove_nodoc(all_hash) [](#method-i-remove_nodoc)
Removes from `all_hash` the contexts that are nodoc or have no content.

See RDoc::Context#remove_from_documentation?

## resolve_c_superclasses() [](#method-i-resolve_c_superclasses)
Make sure any references to C variable names are resolved to the corresponding
class.

## save() [](#method-i-save)
Saves all entries in the store

## save_cache() [](#method-i-save_cache)
Writes the cache file for this store

## save_class(klass) [](#method-i-save_class)
Writes the ri data for `klass` (or module)

## save_method(klass, method) [](#method-i-save_method)
Writes the ri data for `method` on `klass`

## save_page(page) [](#method-i-save_page)
Writes the ri data for `page`

## source() [](#method-i-source)
Source of the contents of this store.

For a store from a gem the source is the gem name.  For a store from the home
directory the source is "home".  For system ri store (the standard library
documentation) the source is"ruby".  For a store from the site ri directory
the store is "site".  For other stores the source is the #path.

## title() [](#method-i-title)
Gets the title for this RDoc store.  This is used as the title in each page on
the RDoc server

## title=(title) [](#method-i-title=)
Sets the title page for this RDoc store.

## unique_classes() [](#method-i-unique_classes)
Returns the unique classes discovered by RDoc.

::complete must have been called prior to using this method.

## unique_classes_and_modules() [](#method-i-unique_classes_and_modules)
Returns the unique classes and modules discovered by RDoc. ::complete must
have been called prior to using this method.

## unique_modules() [](#method-i-unique_modules)
Returns the unique modules discovered by RDoc. ::complete must have been
called prior to using this method.

## update_parser_of_file(absolute_name, parser) [](#method-i-update_parser_of_file)
Sets the parser of `absolute_name`, unless it from a source code file.

