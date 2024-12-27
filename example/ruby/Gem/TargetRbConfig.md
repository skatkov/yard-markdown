# Class: Gem::TargetRbConfig
**Inherits:** Object
    

A TargetConfig is a wrapper around an RbConfig object that provides a
consistent interface for querying configuration for *deployment target
platform*, where the gem being installed is intended to run on.

The TargetConfig is typically created from the RbConfig of the running Ruby
process, but can also be created from an RbConfig file on disk for cross-
compiling gems.


# Class Methods
## for_running_ruby() [](#method-c-for_running_ruby)
Creates a TargetRbConfig for the platform that RubyGems is running on.
## from_path(rbconfig_path ) [](#method-c-from_path)
Creates a TargetRbConfig from the RbConfig file at the given path. Typically
used for cross-compiling gems.
# Attributes
## path[RW] [](#attribute-i-path)
Returns the value of attribute path.


#Instance Methods
## [](key) [](#method-i-[])
Queries the configuration for the given key.

## initialize(rbconfig, path) [](#method-i-initialize)

**@return** [TargetRbConfig] a new instance of TargetRbConfig

