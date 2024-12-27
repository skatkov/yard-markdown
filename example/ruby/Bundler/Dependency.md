# Class: Bundler::Dependency
**Inherits:** Gem::Dependency
    



# Attributes
## autorequire[RW] [](#attribute-i-autorequire)
Returns the value of attribute autorequire.

## branch[RW] [](#attribute-i-branch)
Returns the value of attribute branch.

## gemfile[RW] [](#attribute-i-gemfile)
Returns the value of attribute gemfile.

## git[RW] [](#attribute-i-git)
Returns the value of attribute git.

## github[RW] [](#attribute-i-github)
Returns the value of attribute github.

## glob[RW] [](#attribute-i-glob)
Returns the value of attribute glob.

## groups[RW] [](#attribute-i-groups)
Returns the value of attribute groups.

## path[RW] [](#attribute-i-path)
Returns the value of attribute path.

## platforms[RW] [](#attribute-i-platforms)
Returns the value of attribute platforms.

## ref[RW] [](#attribute-i-ref)
Returns the value of attribute ref.


#Instance Methods
## current_env?() [](#method-i-current_env?)

**@return** [Boolean] 

## current_platform?() [](#method-i-current_platform?)

**@return** [Boolean] 

## expanded_platforms() [](#method-i-expanded_platforms)

## gem_platforms(valid_platforms) [](#method-i-gem_platforms)
Returns the platforms this dependency is valid for, in the same order as
passed in the `valid_platforms` parameter

## gemspec_dev_dep?() [](#method-i-gemspec_dev_dep?)

**@return** [Boolean] 

## initialize(name, version, options{}, &blk) [](#method-i-initialize)

**@return** [Dependency] a new instance of Dependency

## should_include?() [](#method-i-should_include?)

**@return** [Boolean] 

## specific?() [](#method-i-specific?)

**@return** [Boolean] 

## to_lock() [](#method-i-to_lock)

