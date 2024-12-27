# Class: Bundler::Resolver::Package
**Inherits:** Object
    

Represents a gem being resolved, in a format PubGrub likes.

The class holds the following information:

*   Platforms this gem will be resolved on.
*   The locked version of this gem resolution should favor (if any).
*   Whether the gem should be unlocked to its latest version.
*   The dependency explicit set in the Gemfile for this gem (if any).


# Attributes
## dependency[RW] [](#attribute-i-dependency)
Returns the value of attribute dependency.

## locked_version[RW] [](#attribute-i-locked_version)
Returns the value of attribute locked_version.

## name[RW] [](#attribute-i-name)
Returns the value of attribute name.

## platforms[RW] [](#attribute-i-platforms)
Returns the value of attribute platforms.


#Instance Methods
## ==(other) [](#method-i-==)

## consider_prereleases!() [](#method-i-consider_prereleases!)

## consider_remote_versions!() [](#method-i-consider_remote_versions!)

## current_platform?() [](#method-i-current_platform?)

**@return** [Boolean] 

## force_ruby_platform?() [](#method-i-force_ruby_platform?)

**@return** [Boolean] 

## hash() [](#method-i-hash)

## ignores_prereleases?() [](#method-i-ignores_prereleases?)

**@return** [Boolean] 

## initialize(name, platforms, locked_specs:, unlock:, prerelease:false, prefer_local:false, dependency:nil) [](#method-i-initialize)

**@return** [Package] a new instance of Package

## meta?() [](#method-i-meta?)

**@return** [Boolean] 

## platform_specs(specs) [](#method-i-platform_specs)

## prefer_local?() [](#method-i-prefer_local?)

**@return** [Boolean] 

## prerelease_specified?() [](#method-i-prerelease_specified?)

**@return** [Boolean] 

## root?() [](#method-i-root?)

**@return** [Boolean] 

## to_s() [](#method-i-to_s)

## top_level?() [](#method-i-top_level?)

**@return** [Boolean] 

## unlock?() [](#method-i-unlock?)

**@return** [Boolean] 

