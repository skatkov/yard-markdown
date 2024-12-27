# Class: Bundler::SourceList
**Inherits:** Object
    



# Attributes
## git_sources[RW] [](#attribute-i-git_sources)
Returns the value of attribute git_sources.

## global_path_source[RW] [](#attribute-i-global_path_source)
Returns the value of attribute global_path_source.

## metadata_source[RW] [](#attribute-i-metadata_source)
Returns the value of attribute metadata_source.

## path_sources[RW] [](#attribute-i-path_sources)
Returns the value of attribute path_sources.

## plugin_sources[RW] [](#attribute-i-plugin_sources)
Returns the value of attribute plugin_sources.


#Instance Methods
## add_git_source(options{}) [](#method-i-add_git_source)

## add_global_rubygems_remote(uri) [](#method-i-add_global_rubygems_remote)

## add_path_source(options{}) [](#method-i-add_path_source)

## add_plugin_source(source, options{}) [](#method-i-add_plugin_source)

## add_rubygems_source(options{}) [](#method-i-add_rubygems_source)

## aggregate_global_source?() [](#method-i-aggregate_global_source?)

**@return** [Boolean] 

## all_sources() [](#method-i-all_sources)

## cached!() [](#method-i-cached!)

## default_source() [](#method-i-default_source)

## expired_sources?(replacement_sources) [](#method-i-expired_sources?)
Returns true if there are changes

**@return** [Boolean] 

## get(source) [](#method-i-get)

## global_rubygems_source() [](#method-i-global_rubygems_source)

## implicit_global_source?() [](#method-i-implicit_global_source?)

**@return** [Boolean] 

## initialize() [](#method-i-initialize)

**@return** [SourceList] a new instance of SourceList

## local!() [](#method-i-local!)

## local_mode?() [](#method-i-local_mode?)

**@return** [Boolean] 

## local_only!() [](#method-i-local_only!)

## lock_other_sources() [](#method-i-lock_other_sources)

## lock_rubygems_sources() [](#method-i-lock_rubygems_sources)

## lock_sources() [](#method-i-lock_sources)

## merged_gem_lockfile_sections!(replacement_source) [](#method-i-merged_gem_lockfile_sections!)

## merged_gem_lockfile_sections?() [](#method-i-merged_gem_lockfile_sections?)

**@return** [Boolean] 

## non_default_explicit_sources() [](#method-i-non_default_explicit_sources)

## non_global_rubygems_sources() [](#method-i-non_global_rubygems_sources)

## remote!() [](#method-i-remote!)

## replace_sources!(replacement_sources) [](#method-i-replace_sources!)
Returns true if there are changes

## rubygems_remotes() [](#method-i-rubygems_remotes)

## rubygems_sources() [](#method-i-rubygems_sources)

