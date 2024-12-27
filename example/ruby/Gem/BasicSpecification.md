# Class: Gem::BasicSpecification
**Inherits:** Object
  
**Extended by:** Gem::Deprecate
    

BasicSpecification is an abstract class which implements some common code used
by both Specification and StubSpecification.


# Class Methods
## default_specifications_dir() [](#method-c-default_specifications_dir)
## deprecate(name , repl , year , month ) [](#method-c-deprecate)
Simple deprecation method that deprecates `name` by wrapping it up in a dummy
method. It warns on each call to the dummy method telling the user of `repl`
(unless `repl` is :none) and the year/month that it is planned to go away.
# Attributes
## base_dir[RW] [](#attribute-i-base_dir)
Returns the full path to the base gem directory.

eg: /usr/local/lib/ruby/gems/1.8

**@raise** [NotImplementedError] 

## extension_dir[RW] [](#attribute-i-extension_dir)
Returns full path to the directory where gem's extensions are installed.

## full_gem_path[RW] [](#attribute-i-full_gem_path)
The full path to the gem (install path + full name).

TODO: This is duplicated with #gem_dir. Eventually either of them should be
deprecated.

## ignored=[R] [](#attribute-i-ignored=)
Is this specification ignored for activation purposes?

## loaded_from[RW] [](#attribute-i-loaded_from)
The path this gemspec was loaded from.  This attribute is not persisted.


#Instance Methods
## activated?() [](#method-i-activated?)
True when the gem has been activated

**@raise** [NotImplementedError] 

**@return** [Boolean] 

## base_dir_priority(gem_path) [](#method-i-base_dir_priority)
Gems higher up in `gem_path` take precedence

## contains_requirable_file?(file) [](#method-i-contains_requirable_file?)
Return true if this spec can require `file`.

**@return** [Boolean] 

## datadir() [](#method-i-datadir)
The path to the data directory for this gem.

## default_gem?() [](#method-i-default_gem?)

**@return** [Boolean] 

## default_gem_priority() [](#method-i-default_gem_priority)
Regular gems take precedence over default gems

## extensions_dir() [](#method-i-extensions_dir)
Returns path to the extensions directory.

## full_name() [](#method-i-full_name)
Returns the full name (name-version) of this Gem.  Platform information is
included (name-version-platform) if it is specified and not the default Ruby
platform.

## full_name_with_location() [](#method-i-full_name_with_location)
Returns the full name of this Gem (see `Gem::BasicSpecification#full_name`).
Information about where the gem is installed is also included if not installed
in the default GEM_HOME.

## full_require_paths() [](#method-i-full_require_paths)
Full paths in the gem to add to `$LOAD_PATH` when this gem is activated.

## gem_build_complete_path() [](#method-i-gem_build_complete_path)
The path to the gem.build_complete file within the extension install
directory.

## gem_dir() [](#method-i-gem_dir)
Returns the full path to this spec's gem directory. eg:
/usr/local/lib/ruby/1.8/gems/mygem-1.0

TODO: This is duplicated with #full_gem_path. Eventually either of them should
be deprecated.

## gems_dir() [](#method-i-gems_dir)
Returns the full path to the gems directory containing this spec's gem
directory. eg: /usr/local/lib/ruby/1.8/gems

**@raise** [NotImplementedError] 

## ignored?() [](#method-i-ignored?)
Return true if this spec should be ignored because it's missing extensions.

**@return** [Boolean] 

## initialize() [](#method-i-initialize)

**@return** [BasicSpecification] a new instance of BasicSpecification

## internal_init() [](#method-i-internal_init)
:nodoc:

## lib_dirs_glob() [](#method-i-lib_dirs_glob)
Returns a string usable in Dir.glob to match all requirable paths for this
spec.

## matches_for_glob(glob) [](#method-i-matches_for_glob)
Return all files in this gem that match for `glob`.

## name() [](#method-i-name)
Name of the gem

**@raise** [NotImplementedError] 

## platform() [](#method-i-platform)
Platform of the gem

**@raise** [NotImplementedError] 

## plugins() [](#method-i-plugins)
Returns the list of plugins in this spec.

## raw_require_paths() [](#method-i-raw_require_paths)
:nodoc:

**@raise** [NotImplementedError] 

## require_paths() [](#method-i-require_paths)
Paths in the gem to add to `$LOAD_PATH` when this gem is activated.

See also #require_paths=

If you have an extension you do not need to add `"ext"` to the require path,
the extension build process will copy the extension files into "lib" for you.

The default value is `"lib"`

Usage:

    # If all library files are in the root directory...
    spec.require_path = '.'

## source_paths() [](#method-i-source_paths)
Returns the paths to the source files for use with analysis and documentation
tools.  These paths are relative to full_gem_path.

## stubbed?() [](#method-i-stubbed?)
Whether this specification is stubbed - i.e. we have information about the gem
from a stub line, without having to evaluate the entire gemspec file.

**@raise** [NotImplementedError] 

**@return** [Boolean] 

## this() [](#method-i-this)

## to_fullpath(path) [](#method-i-to_fullpath)
Full path of the target library file. If the file is not in this gem, return
nil.

## to_spec() [](#method-i-to_spec)
Return a Gem::Specification from this gem

**@raise** [NotImplementedError] 

## version() [](#method-i-version)
Version of the gem

**@raise** [NotImplementedError] 

