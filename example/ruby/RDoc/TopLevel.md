# Class: RDoc::TopLevel
**Inherits:** RDoc::Context
    

A TopLevel context is a representation of the contents of a single file


# Attributes
## absolute_name[RW] [](#attribute-i-absolute_name)
Absolute name of this file

## classes_or_modules[RW] [](#attribute-i-classes_or_modules)
All the classes or modules that were declared in this file. These are assigned
to either `#classes_hash` or `#modules_hash` once we know what they really
are.

## diagram[RW] [](#attribute-i-diagram)
:nodoc:

## file_stat[RW] [](#attribute-i-file_stat)
This TopLevel's File::Stat struct

## parser[RW] [](#attribute-i-parser)
The parser class that processed this file

## relative_name[RW] [](#attribute-i-relative_name)
Relative name of this file


#Instance Methods
## ==(other) [](#method-i-==)
An RDoc::TopLevel is equal to another with the same relative_name

## add_alias(an_alias) [](#method-i-add_alias)
Adds `an_alias` to `Object` instead of `self`.

## add_constant(constant) [](#method-i-add_constant)
Adds `constant` to `Object` instead of `self`.

## add_include(include) [](#method-i-add_include)
Adds `include` to `Object` instead of `self`.

## add_method(method) [](#method-i-add_method)
Adds `method` to `Object` instead of `self`.

## add_to_classes_or_modules(mod) [](#method-i-add_to_classes_or_modules)
Adds class or module `mod`. Used in the building phase by the Ruby parser.

## base_name() [](#method-i-base_name)
Base name of this file

## cvs_url() [](#method-i-cvs_url)
Returns a URL for this source file on some web repository.  Use the -W command
line option to set.

## display?() [](#method-i-display?)
Only a TopLevel that contains text file) will be displayed.  See also
RDoc::CodeObject#display?

**@return** [Boolean] 

## find_class_or_module(name) [](#method-i-find_class_or_module)
See RDoc::TopLevel::find_class_or_module -- TODO Why do we search through all
classes/modules found, not just the
    ones of this instance?

## find_local_symbol(symbol) [](#method-i-find_local_symbol)
Finds a class or module named `symbol`

## find_module_named(name) [](#method-i-find_module_named)
Finds a module or class with `name`

## full_name() [](#method-i-full_name)
Returns the relative name of this file

## hash() [](#method-i-hash)
An RDoc::TopLevel has the same hash as another with the same relative_name

## http_url(prefix) [](#method-i-http_url)
URL for this with a `prefix`

## initialize(absolute_name, relative_nameabsolute_name) [](#method-i-initialize)
Creates a new TopLevel for the file at `absolute_name`.  If documentation is
being generated outside the source dir `relative_name` is relative to the
source directory.

**@return** [TopLevel] a new instance of TopLevel

## inspect() [](#method-i-inspect)
:nodoc:

## last_modified() [](#method-i-last_modified)
Time this file was last modified, if known

## marshal_dump() [](#method-i-marshal_dump)
Dumps this TopLevel for use by ri.  See also #marshal_load

## marshal_load(array) [](#method-i-marshal_load)
Loads this TopLevel from `array`.

## object_class() [](#method-i-object_class)
Returns the NormalClass "Object", creating it if not found.

Records `self` as a location in "Object".

## page_name() [](#method-i-page_name)
Base name of this file without the extension

## path() [](#method-i-path)
Path to this file for use with HTML generator output.

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## search_record() [](#method-i-search_record)
Search record used by RDoc::Generator::JsonIndex

## text?() [](#method-i-text?)
Is this TopLevel from a text file instead of a source code file?

**@return** [Boolean] 

## to_s() [](#method-i-to_s)
:nodoc:

