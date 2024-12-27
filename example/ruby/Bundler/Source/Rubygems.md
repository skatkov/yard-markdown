# Class: Bundler::Source::Rubygems
**Inherits:** Bundler::Source
    



# Class Methods
## from_lock(options ) [](#method-c-from_lock)
# Attributes
## remotes[RW] [](#attribute-i-remotes)
Returns the value of attribute remotes.


#Instance Methods
## add_remote(source) [](#method-i-add_remote)

## cache(spec, custom_pathnil) [](#method-i-cache)

## cached!() [](#method-i-cached!)

## cached_built_in_gem(spec, local:false) [](#method-i-cached_built_in_gem)

## caches() [](#method-i-caches)

## can_lock?(spec) [](#method-i-can_lock?)

**@return** [Boolean] 

## dependency_api_available?() [](#method-i-dependency_api_available?)

**@return** [Boolean] 

## dependency_names_to_double_check() [](#method-i-dependency_names_to_double_check)

## double_check_for(unmet_dependency_names) [](#method-i-double_check_for)

## eql?(other) [](#method-i-eql?)

**@return** [Boolean] 

## fetchers() [](#method-i-fetchers)

## hash() [](#method-i-hash)

## identifier() [](#method-i-identifier)

## include?(o) [](#method-i-include?)

**@return** [Boolean] 

## initialize(options{}) [](#method-i-initialize)

**@return** [Rubygems] a new instance of Rubygems

## install(spec, options{}) [](#method-i-install)

**@raise** [GemNotFound] 

## local!() [](#method-i-local!)

## local_only!() [](#method-i-local_only!)

## multiple_remotes?() [](#method-i-multiple_remotes?)

**@return** [Boolean] 

## no_remotes?() [](#method-i-no_remotes?)

**@return** [Boolean] 

## options() [](#method-i-options)

## remote!() [](#method-i-remote!)

## remote_fetchers() [](#method-i-remote_fetchers)

## spec_names() [](#method-i-spec_names)

## specs() [](#method-i-specs)

## to_lock() [](#method-i-to_lock)

## to_s() [](#method-i-to_s)

## unmet_deps() [](#method-i-unmet_deps)

