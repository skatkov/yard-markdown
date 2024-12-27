# Class: Bundler::LazySpecification
**Inherits:** Object
    
**Includes:** Bundler::ForcePlatform, Bundler::MatchMetadata, Bundler::MatchPlatform
  



# Class Methods
## from_spec(s ) [](#method-c-from_spec)
# Attributes
## dependencies[RW] [](#attribute-i-dependencies)
Returns the value of attribute dependencies.

## force_ruby_platform[RW] [](#attribute-i-force_ruby_platform)
Returns the value of attribute force_ruby_platform.

## materialization[RW] [](#attribute-i-materialization)
Returns the value of attribute materialization.

## most_specific_locked_platform[RW] [](#attribute-i-most_specific_locked_platform)
For backwards compatibility with existing lockfiles, if the most specific
locked platform is not a specific platform like x86_64-linux or
universal-java-11, then we keep the previous behaviour of resolving the best
platform variant at materiliazation time. For previous bundler versions
(before 2.2.0) this was always the case (except when the lockfile only
included non-ruby platforms), but we're also keeping this behaviour on newer
bundlers unless users generate the lockfile from scratch or explicitly add a
more specific platform.

## name[RW] [](#attribute-i-name)
Returns the value of attribute name.

## platform[RW] [](#attribute-i-platform)
Returns the value of attribute platform.

## remote[RW] [](#attribute-i-remote)
Returns the value of attribute remote.

## required_ruby_version[RW] [](#attribute-i-required_ruby_version)
Returns the value of attribute required_ruby_version.

## required_rubygems_version[RW] [](#attribute-i-required_rubygems_version)
Returns the value of attribute required_rubygems_version.

## source[RW] [](#attribute-i-source)
Returns the value of attribute source.

## version[RW] [](#attribute-i-version)
Returns the value of attribute version.


#Instance Methods
## ==(other) [](#method-i-==)

## __materialize__(candidates, fallback_to_non_installable:Bundler.frozen_bundle?) [](#method-i-__materialize__)
If in frozen mode, we fallback to a non-installable candidate because by doing
this we avoid re-resolving and potentially end up changing the lock file,
which is not allowed. In that case, we will give a proper error about the
mismatch higher up the stack, right before trying to install the bad gem.

## default_force_ruby_platform() [](#method-i-default_force_ruby_platform)
The `:force_ruby_platform` value used by dependencies for resolution, and by
locked specifications for materialization is `false` by default, except for
TruffleRuby. TruffleRuby generally needs to force the RUBY platform variant
unless the name is explicitly allowlisted.

## eql?(other) [](#method-i-eql?)

**@return** [Boolean] 

## force_ruby_platform!() [](#method-i-force_ruby_platform!)

## full_name() [](#method-i-full_name)

## git_version() [](#method-i-git_version)

## hash() [](#method-i-hash)

## incomplete?() [](#method-i-incomplete?)

**@return** [Boolean] 

## initialize(name, version, platform, sourcenil) [](#method-i-initialize)

**@return** [LazySpecification] a new instance of LazySpecification

## inspect() [](#method-i-inspect)

## lock_name() [](#method-i-lock_name)

## match_platform(p) [](#method-i-match_platform)

## matches_current_metadata?() [](#method-i-matches_current_metadata?)

**@return** [Boolean] 

## matches_current_ruby?() [](#method-i-matches_current_ruby?)

**@return** [Boolean] 

## matches_current_rubygems?() [](#method-i-matches_current_rubygems?)

**@return** [Boolean] 

## materialize_for_installation() [](#method-i-materialize_for_installation)

## materialize_strictly() [](#method-i-materialize_strictly)

## materialized_for_installation() [](#method-i-materialized_for_installation)

## missing?() [](#method-i-missing?)

**@return** [Boolean] 

## name_tuple() [](#method-i-name_tuple)

## satisfies?(dependency) [](#method-i-satisfies?)
Does this locked specification satisfy `dependency`?

NOTE: Rubygems default requirement is ">= 0", which doesn't match prereleases
of 0 versions, like "0.0.0.dev" or "0.0.0.SNAPSHOT". However, bundler users
expect those to work. We need to make sure that Gemfile dependencies without
explicit requirements (which use ">= 0" under the hood by default) are still
valid for locked specs using this kind of versions. The method implements an
ad-hoc fix for that. A better solution might be to change default rubygems
requirement of dependencies to be ">= 0.A" but that's a major refactoring
likely to break things. Hopefully we can attempt it in the future.

**@return** [Boolean] 

## source_changed?() [](#method-i-source_changed?)

**@return** [Boolean] 

## to_lock() [](#method-i-to_lock)

## to_s() [](#method-i-to_s)

