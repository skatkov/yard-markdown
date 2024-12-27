# Class: Gem::PathSupport
**Inherits:** Object
    

Gem::PathSupport facilitates the GEM_HOME and GEM_PATH environment settings to
the rest of RubyGems.


# Attributes
## home[RW] [](#attribute-i-home)
The default system path for managing Gems.

## path[RW] [](#attribute-i-path)
Array of paths to search for Gems.

## spec_cache_dir[RW] [](#attribute-i-spec_cache_dir)
Directory with spec cache


#Instance Methods
## initialize(env) [](#method-i-initialize)
Constructor. Takes a single argument which is to be treated like a hashtable,
or defaults to ENV, the system environment.

**@return** [PathSupport] a new instance of PathSupport

