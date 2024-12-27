# Class: Bundler::Source
**Inherits:** Object
    



# Attributes
## checksum_store[RW] [](#attribute-i-checksum_store)
Returns the value of attribute checksum_store.

## dependency_names[RW] [](#attribute-i-dependency_names)
Returns the value of attribute dependency_names.


#Instance Methods
## add_dependency_names(names) [](#method-i-add_dependency_names)

## cached!() [](#method-i-cached!)

## can_lock?(spec) [](#method-i-can_lock?)

**@return** [Boolean] 

## dependency_names_to_double_check() [](#method-i-dependency_names_to_double_check)

## double_check_for() [](#method-i-double_check_for)
it's possible that gems from one source depend on gems from some other source,
so now we download gemspecs and iterate over those dependencies, looking for
gems we don't have info on yet.

## extension_cache_path(spec) [](#method-i-extension_cache_path)

## identifier() [](#method-i-identifier)

## include?(other) [](#method-i-include?)

**@return** [Boolean] 

## inspect() [](#method-i-inspect)

## local!() [](#method-i-local!)

## local_only!() [](#method-i-local_only!)

## path?() [](#method-i-path?)

**@return** [Boolean] 

## remote!() [](#method-i-remote!)

## spec_names() [](#method-i-spec_names)

## unmet_deps() [](#method-i-unmet_deps)

## version_message(spec, locked_specnil) [](#method-i-version_message)

