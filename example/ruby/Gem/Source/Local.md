# Class: Gem::Source::Local
**Inherits:** Gem::Source
    

The local source finds gems in the current directory for fulfilling
dependencies.



#Instance Methods
## <=>(other) [](#method-i-<=>)
Local sorts before Gem::Source and after Gem::Source::Installed

## download(spec, cache_dirnil) [](#method-i-download)
:nodoc:

**@raise** [Gem::Exception] 

## fetch_spec(name) [](#method-i-fetch_spec)
:nodoc:

## find_gem(gem_name, versionGem::Requirement.default, prereleasefalse) [](#method-i-find_gem)
:nodoc:

## initialize() [](#method-i-initialize)
:nodoc:

**@return** [Local] a new instance of Local

## inspect() [](#method-i-inspect)
:nodoc:

## load_specs(type) [](#method-i-load_specs)
:nodoc:

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

