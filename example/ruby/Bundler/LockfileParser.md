# Class: Bundler::LockfileParser
**Inherits:** Object
    
**Includes:** Bundler::GemHelpers
  



# Class Methods
## bundled_with() [](#method-c-bundled_with)
## sections_in_lockfile(lockfile_contents ) [](#method-c-sections_in_lockfile)
## sections_to_ignore(base_version nil) [](#method-c-sections_to_ignore)
## unknown_sections_in_lockfile(lockfile_contents ) [](#method-c-unknown_sections_in_lockfile)
# Attributes
## bundler_version[RW] [](#attribute-i-bundler_version)
Returns the value of attribute bundler_version.

## dependencies[RW] [](#attribute-i-dependencies)
Returns the value of attribute dependencies.

## most_specific_locked_platform[RW] [](#attribute-i-most_specific_locked_platform)
Returns the value of attribute most_specific_locked_platform.

## platforms[RW] [](#attribute-i-platforms)
Returns the value of attribute platforms.

## ruby_version[RW] [](#attribute-i-ruby_version)
Returns the value of attribute ruby_version.

## sources[RW] [](#attribute-i-sources)
Returns the value of attribute sources.

## specs[RW] [](#attribute-i-specs)
Returns the value of attribute specs.


#Instance Methods
## initialize(lockfile) [](#method-i-initialize)

**@return** [LockfileParser] a new instance of LockfileParser

## may_include_redundant_platform_specific_gems?() [](#method-i-may_include_redundant_platform_specific_gems?)

**@return** [Boolean] 

