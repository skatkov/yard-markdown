# Class: Bundler::RubyVersion
**Inherits:** Object
    



# Class Methods
## from_string(string ) [](#method-c-from_string)
Returns a RubyVersion from the given string.
**@param** [String] version string to match.

**@return** [RubyVersion, Nil] The version if the string is a valid RubyVersion
description, and nil otherwise.

## system() [](#method-c-system)
# Attributes
## engine[RW] [](#attribute-i-engine)
Returns the value of attribute engine.

## engine_gem_version[RW] [](#attribute-i-engine_gem_version)
Returns the value of attribute engine_gem_version.

## engine_versions[RW] [](#attribute-i-engine_versions)
Returns the value of attribute engine_versions.

## gem_version[RW] [](#attribute-i-gem_version)
Returns the value of attribute gem_version.

## patchlevel[RW] [](#attribute-i-patchlevel)
Returns the value of attribute patchlevel.

## versions[RW] [](#attribute-i-versions)
Returns the value of attribute versions.


#Instance Methods
## ==(other) [](#method-i-==)

## diff(other) [](#method-i-diff)
Returns a tuple of these things:
    [diff, this, other]
    The priority of attributes are
    1. engine
    2. ruby_version
    3. engine_version

**@raise** [ArgumentError] 

## host() [](#method-i-host)

## initialize(versions, patchlevel, engine, engine_version) [](#method-i-initialize)

**@return** [RubyVersion] a new instance of RubyVersion

## single_version_string() [](#method-i-single_version_string)

## to_s(versionsself.versions) [](#method-i-to_s)

## versions_string(versions) [](#method-i-versions_string)

