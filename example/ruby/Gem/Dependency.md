# Class: Gem::Dependency
**Inherits:** Object
    
**Includes:** Bundler::ForcePlatform, Gem::Dependency::FilterIgnoredSpecs
  

The Dependency class holds a Gem name and a Gem::Requirement.


# Attributes
## force_ruby_platform[RW] [](#attribute-i-force_ruby_platform)
Returns the value of attribute force_ruby_platform.

## groups[RW] [](#attribute-i-groups)
Returns the value of attribute groups.

## name[RW] [](#attribute-i-name)
Dependency name or regular expression.

## prerelease=[R] [](#attribute-i-prerelease=)
Allows you to force this dependency to be a prerelease.

## source[RW] [](#attribute-i-source)
Returns the value of attribute source.


#Instance Methods
## <=>(other) [](#method-i-<=>)
Dependencies are ordered by name.

## ==(other) [](#method-i-==)
:nodoc:

## =~(other) [](#method-i-=~)
Uses this dependency as a pattern to compare to `other`. This dependency will
match if the name matches the other's name, and other has only an equal
version requirement that satisfies this dependency.

## default_force_ruby_platform() [](#method-i-default_force_ruby_platform)
The `:force_ruby_platform` value used by dependencies for resolution, and by
locked specifications for materialization is `false` by default, except for
TruffleRuby. TruffleRuby generally needs to force the RUBY platform variant
unless the name is explicitly allowlisted.

## encode_with(coder) [](#method-i-encode_with)
:nodoc:

## hash() [](#method-i-hash)
A dependency's hash is the XOR of the hashes of `name`, `type`, and
`requirement`.

## identity() [](#method-i-identity)

## initialize(name, *requirements) [](#method-i-initialize)
Constructs a dependency with `name` and `requirements`. The last argument can
optionally be the dependency type, which defaults to `:runtime`.

**@return** [Dependency] a new instance of Dependency

## inspect() [](#method-i-inspect)
:nodoc:

## latest_version?() [](#method-i-latest_version?)
Is this dependency simply asking for the latest version of a gem?

**@return** [Boolean] 

## match?(obj, versionnil, allow_prereleasefalse) [](#method-i-match?)
:call-seq:
    dep.match? name          => true or false
    dep.match? name, version => true or false
    dep.match? spec          => true or false

Does this dependency match the specification described by `name` and `version`
or match `spec`?

NOTE:  Unlike #matches_spec? this method does not return true when the version
is a prerelease version unless this is a prerelease dependency.

**@return** [Boolean] 

## matches_spec?(spec) [](#method-i-matches_spec?)
Does this dependency match `spec`?

NOTE:  This is not a convenience method.  Unlike #match? this method returns
true when `spec` is a prerelease version even if this dependency is not a
prerelease dependency.

**@return** [Boolean] 

## matching_specs(platform_onlyfalse) [](#method-i-matching_specs)

## merge(other) [](#method-i-merge)
Merges the requirements of `other` into this dependency

## prerelease?() [](#method-i-prerelease?)
Does this dependency require a prerelease?

**@return** [Boolean] 

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## requirement() [](#method-i-requirement)
What does this dependency require?

## requirements_list() [](#method-i-requirements_list)

## runtime?() [](#method-i-runtime?)

**@return** [Boolean] 

## specific?() [](#method-i-specific?)
True if the dependency will not always match the latest version.

**@return** [Boolean] 

## to_lock() [](#method-i-to_lock)

## to_s() [](#method-i-to_s)
:nodoc:

## to_spec() [](#method-i-to_spec)

## to_specs() [](#method-i-to_specs)

## type() [](#method-i-type)
Dependency type.

