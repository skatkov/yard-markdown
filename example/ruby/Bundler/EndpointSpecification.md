# Class: Bundler::EndpointSpecification
**Inherits:** Gem::Specification
    
**Includes:** Bundler::MatchRemoteMetadata
  

used for Creating Specifications from the Gemcutter Endpoint


# Attributes
## checksum[RW] [](#attribute-i-checksum)
Returns the value of attribute checksum.

## dependencies[RW] [](#attribute-i-dependencies)
Returns the value of attribute dependencies.

## locked_platform[RW] [](#attribute-i-locked_platform)
Returns the value of attribute locked_platform.

## name[RW] [](#attribute-i-name)
Returns the value of attribute name.

## platform[RW] [](#attribute-i-platform)
Returns the value of attribute platform.

## remote[RW] [](#attribute-i-remote)
Returns the value of attribute remote.

## version[RW] [](#attribute-i-version)
Returns the value of attribute version.


#Instance Methods
## __swap__(spec) [](#method-i-__swap__)

## _local_specification() [](#method-i-_local_specification)

## bindir() [](#method-i-bindir)
needed for bundle clean

## executables() [](#method-i-executables)
needed for binstubs

## extensions() [](#method-i-extensions)
needed for "with native extensions" during install

## fetch_platform() [](#method-i-fetch_platform)

## initialize(name, version, platform, spec_fetcher, dependencies, metadatanil) [](#method-i-initialize)

**@return** [EndpointSpecification] a new instance of EndpointSpecification

## insecurely_materialized?() [](#method-i-insecurely_materialized?)

**@return** [Boolean] 

## inspect() [](#method-i-inspect)

## load_paths() [](#method-i-load_paths)
needed for inline

## matches_current_metadata?() [](#method-i-matches_current_metadata?)

**@return** [Boolean] 

## matches_current_ruby?() [](#method-i-matches_current_ruby?)

**@return** [Boolean] 

## matches_current_rubygems?() [](#method-i-matches_current_rubygems?)

**@return** [Boolean] 

## metadata() [](#method-i-metadata)
needed for `bundle fund`

## post_install_message() [](#method-i-post_install_message)
needed for post_install_messages during install

## require_paths() [](#method-i-require_paths)
needed for standalone, load required_paths from local gemspec after the gem is
installed

