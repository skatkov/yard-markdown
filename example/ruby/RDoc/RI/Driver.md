# Class: RDoc::RI::Driver
**Inherits:** Object
    

The RI driver implements the command-line ri tool.

The driver supports:
*   loading RI data from:
    *   Ruby's standard library
    *   RubyGems
    *   ~/.rdoc
    *   A user-supplied directory
*   Paging output (uses RI_PAGER environment variable, PAGER environment
    variable or the less, more and pager programs)
*   Interactive mode with tab-completion
*   Abbreviated names (ri Zl shows Zlib documentation)
*   Colorized output
*   Merging output from multiple RI data sources


# Class Methods
## default_options() [](#method-c-default_options)
Default options for ri
## dump(data_path ) [](#method-c-dump)
Dump `data_path` using pp
## process_args(argv ) [](#method-c-process_args)
Parses `argv` and returns a Hash of options
## run(argv ARGV) [](#method-c-run)
Runs the ri command line executable using `argv`
# Attributes
## show_all[RW] [](#attribute-i-show_all)
Show all method documentation following a class or module

## stores[RW] [](#attribute-i-stores)
An RDoc::RI::Store for each entry in the RI path

## use_stdout[RW] [](#attribute-i-use_stdout)
Controls the user of the pager vs $stdout


#Instance Methods
## add_also_in(out, also_in) [](#method-i-add_also_in)
Adds paths for undocumented classes `also_in` to `out`

## add_class(out, name, classes) [](#method-i-add_class)
Adds a class header to `out` for class `name` which is described in `classes`.

## add_extends(out, extends) [](#method-i-add_extends)
Adds `extends` to `out`

## add_extension_modules(out, type, extensions) [](#method-i-add_extension_modules)
Adds a list of `extensions` to this module of the given `type` to `out`.
add_includes and add_extends call this, so you should use those directly.

## add_extension_modules_multiple(out, store, modules) [](#method-i-add_extension_modules_multiple)
Renders multiple included `modules` from `store` to `out`.

## add_extension_modules_single(out, store, include) [](#method-i-add_extension_modules_single)
Adds a single extension module `include` from `store` to `out`

## add_from(out, store) [](#method-i-add_from)
Adds "(from ...)" to `out` for `store`

## add_includes(out, includes) [](#method-i-add_includes)
Adds `includes` to `out`

## add_method(out, name) [](#method-i-add_method)
Looks up the method `name` and adds it to `out`

## add_method_documentation(out, klass) [](#method-i-add_method_documentation)
Adds documentation for all methods in `klass` to `out`

## add_method_list(out, methods, name) [](#method-i-add_method_list)
Adds a list of `methods` to `out` with a heading of `name`

## ancestors_of(klass) [](#method-i-ancestors_of)
Returns ancestor classes of `klass`

## check_did_you_mean() [](#method-i-check_did_you_mean)
:nodoc:

## class_cache() [](#method-i-class_cache)
For RubyGems backwards compatibility

## class_document(name, found, klasses, includes, extends) [](#method-i-class_document)
Builds a RDoc::Markup::Document from `found`, `klasess` and `includes`

## class_document_comment(out, comment) [](#method-i-class_document_comment)
Adds the class `comment` to `out`.

## class_document_constants(out, klass) [](#method-i-class_document_constants)
Adds the constants from `klass` to the Document `out`.

## classes() [](#method-i-classes)
Hash mapping a known class or module to the stores it can be loaded from

## classes_and_includes_and_extends_for(name) [](#method-i-classes_and_includes_and_extends_for)
Returns the stores wherein `name` is found along with the classes, extends and
includes that match it

## complete(name) [](#method-i-complete)
Completes `name` based on the caches.  For Readline

## complete_klass(name, klass, selector, method, completions) [](#method-i-complete_klass)
:nodoc:

## complete_method(name, klass, selector, completions) [](#method-i-complete_method)
:nodoc:

## display(document) [](#method-i-display)
Converts `document` to text and writes it to the pager

## display_class(name) [](#method-i-display_class)
Outputs formatted RI data for class `name`.  Groups undocumented classes

## display_method(name) [](#method-i-display_method)
Outputs formatted RI data for method `name`

## display_name(name) [](#method-i-display_name)
Outputs formatted RI data for the class or method `name`.

Returns true if `name` was found, false if it was not an alternative could be
guessed, raises an error if `name` couldn't be guessed.

## display_names(names) [](#method-i-display_names)
Displays each name in `name`

## display_page(name) [](#method-i-display_page)
Outputs formatted RI data for page `name`.

## display_page_list(store, pages, searchnil) [](#method-i-display_page_list)
Outputs a formatted RI page list for the pages in `store`.

## expand_class(klass) [](#method-i-expand_class)
Expands abbreviated klass `klass` into a fully-qualified class.  "Zl::Da" will
be expanded to Zlib::DataError.

## expand_name(name) [](#method-i-expand_name)
Expands the class portion of `name` into a fully-qualified class.  See
#expand_class.

## expand_rdoc_refs_at_the_bottom(out) [](#method-i-expand_rdoc_refs_at_the_bottom)

## filter_methods(found, name) [](#method-i-filter_methods)
Filters the methods in `found` trying to find a match for `name`.

## find_methods(name) [](#method-i-find_methods)
Yields items matching `name` including the store they were found in, the class
being searched for, the class they were found in (an ancestor) the types of
methods to look up (from #method_type), and the method name being searched for

## find_store(name) [](#method-i-find_store)
Finds a store that matches `name` which can be the name of a gem, "ruby",
"home" or "site".

See also RDoc::Store#source

**@raise** [RDoc::RI::Driver::NotFoundError] 

## formatter(io) [](#method-i-formatter)
Creates a new RDoc::Markup::Formatter.  If a formatter is given with -f, use
it.  If we're outputting to a pager, use bs, otherwise ansi.

## initialize(initial_options{}) [](#method-i-initialize)
Creates a new driver using `initial_options` from ::process_args

**@return** [Driver] a new instance of Driver

## interactive() [](#method-i-interactive)
Runs ri interactively using Readline if it is available.

## list_known_classes(names[]) [](#method-i-list_known_classes)
Lists classes known to ri starting with `names`.  If `names` is empty all
known classes are shown.

## list_methods_matching(name) [](#method-i-list_methods_matching)
Returns an Array of methods matching `name`

## load_method(store, cache, klass, type, name) [](#method-i-load_method)
Loads RI data for method `name` on `klass` from `store`.  `type` and `cache`
indicate if it is a class or instance method.

## load_methods_matching(name) [](#method-i-load_methods_matching)
Returns an Array of RI data for methods matching `name`

## lookup_method(name) [](#method-i-lookup_method)
Returns a filtered list of methods matching `name`

## method_document(out, name, filtered) [](#method-i-method_document)
Builds a RDoc::Markup::Document from `found`, `klasses` and `includes`

## method_type(selector) [](#method-i-method_type)
Returns the type of method (:both, :instance, :class) for `selector`

## name_regexp(name) [](#method-i-name_regexp)
Returns a regular expression for `name` that will match an RDoc::AnyMethod's
name.

## page() [](#method-i-page)
Paginates output through a pager program.

## paging?() [](#method-i-paging?)
Are we using a pager?

**@return** [Boolean] 

## parse_name(name) [](#method-i-parse_name)
Extracts the class, selector and method name parts from `name` like
Foo::Bar#baz.

NOTE: Given Foo::Bar, Bar is considered a class even though it may be a method

## render_class(out, store, klass, also_in) [](#method-i-render_class)
Renders the `klass` from `store` to `out`.  If the klass has no documentable
items the class is added to `also_in` instead.

## render_method(out, store, method, name) [](#method-i-render_method)
:nodoc:

## render_method_arguments(out, arglists) [](#method-i-render_method_arguments)
:nodoc:

## render_method_comment(out, method, alias_fornil) [](#method-i-render_method_comment)
:nodoc:

## render_method_superclass(out, method) [](#method-i-render_method_superclass)
:nodoc:

## run() [](#method-i-run)
Looks up and displays ri data according to the options given.

## setup_pager() [](#method-i-setup_pager)
Sets up a pager program to pass output through.  Tries the RI_PAGER and PAGER
environment variables followed by pager, less then more.

## start_server() [](#method-i-start_server)
Starts a WEBrick server for ri.

