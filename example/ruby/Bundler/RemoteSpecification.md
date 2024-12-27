# Class: Bundler::RemoteSpecification
**Inherits:** Object
    
**Includes:** Bundler::MatchPlatform, Bundler::MatchRemoteMetadata, Comparable
  

Represents a lazily loaded gem specification, where the full specification is
on the source server in rubygems' "quick" index. The proxy object is to be
seeded with what we're given from the source's abbreviated index - the full
specification will only be fetched when necessary.


# Attributes
## dependencies[RW] [](#attribute-i-dependencies)

## locked_platform[RW] [](#attribute-i-locked_platform)
Returns the value of attribute locked_platform.

## name[RW] [](#attribute-i-name)
Returns the value of attribute name.

## platform[RW] [](#attribute-i-platform)
Returns the value of attribute platform.

## remote[RW] [](#attribute-i-remote)
Returns the value of attribute remote.

## source[RW] [](#attribute-i-source)
Returns the value of attribute source.

## version[RW] [](#attribute-i-version)
Returns the value of attribute version.


#Instance Methods
## <(y) [](#method-i-<)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than 0.

**@overload** [] 

## <=(y) [](#method-i-<=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than or equal to 0.

**@overload** [] 

## <=>(other) [](#method-i-<=>)
Compare this specification against another object. Using sort_obj is
compatible with Gem::Specification and other Bundler or RubyGems objects.
Otherwise, use the default Object comparison.

## ==(y) [](#method-i-==)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns 0. Also returns true if *obj* and *other* are the same object.

**@overload** [] 

## >(y) [](#method-i->)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than 0.

**@overload** [] 

## >=(y) [](#method-i->=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than or equal to 0.

**@overload** [] 

## __swap__(spec) [](#method-i-__swap__)
Because Rubyforge cannot be trusted to provide valid specifications once the
remote gem is downloaded, the backend specification will be swapped out.

**@raise** [APIResponseInvalidDependenciesError] 

## between?(min, max) [](#method-i-between?)
Returns `false` if *obj* `<=>` *min* is less than zero or if *obj* `<=>` *max*
is greater than zero, `true` otherwise.

    3.between?(1, 5)               #=> true
    6.between?(1, 5)               #=> false
    'cat'.between?('ant', 'dog')   #=> true
    'gnu'.between?('ant', 'dog')   #=> false

**@overload** [] 

## clamp(*args) [](#method-i-clamp)
In `(min, max)` form, returns *min* if *obj* `<=>` *min* is less than zero,
*max* if *obj* `<=>` *max* is greater than zero, and *obj* otherwise.

    12.clamp(0, 100)         #=> 12
    523.clamp(0, 100)        #=> 100
    -3.123.clamp(0, 100)     #=> 0

    'd'.clamp('a', 'f')      #=> 'd'
    'z'.clamp('a', 'f')      #=> 'f'

If *min* is `nil`, it is considered smaller than *obj*, and if *max* is `nil`,
it is considered greater than *obj*.

    -20.clamp(0, nil)           #=> 0
    523.clamp(nil, 100)         #=> 100

In `(range)` form, returns *range.begin* if *obj* `<=>` *range.begin* is less
than zero, *range.end* if *obj* `<=>` *range.end* is greater than zero, and
*obj* otherwise.

    12.clamp(0..100)         #=> 12
    523.clamp(0..100)        #=> 100
    -3.123.clamp(0..100)     #=> 0

    'd'.clamp('a'..'f')      #=> 'd'
    'z'.clamp('a'..'f')      #=> 'f'

If *range.begin* is `nil`, it is considered smaller than *obj*, and if
*range.end* is `nil`, it is considered greater than *obj*.

    -20.clamp(0..)           #=> 0
    523.clamp(..100)         #=> 100

When *range.end* is excluded and not `nil`, an exception is raised.

    100.clamp(0...100)       # ArgumentError

**@overload** [] 

**@overload** [] 

## fetch_platform() [](#method-i-fetch_platform)
Needed before installs, since the arch matters then and quick specs don't
bother to include the arch in the platform string

## full_name() [](#method-i-full_name)

## git_version() [](#method-i-git_version)

## initialize(name, version, platform, spec_fetcher) [](#method-i-initialize)

**@return** [RemoteSpecification] a new instance of RemoteSpecification

## insecurely_materialized?() [](#method-i-insecurely_materialized?)

**@return** [Boolean] 

## match_platform(p) [](#method-i-match_platform)

## matches_current_metadata?() [](#method-i-matches_current_metadata?)

**@return** [Boolean] 

## matches_current_ruby?() [](#method-i-matches_current_ruby?)

**@return** [Boolean] 

## matches_current_rubygems?() [](#method-i-matches_current_rubygems?)

**@return** [Boolean] 

## respond_to?(method, include_allfalse) [](#method-i-respond_to?)

**@return** [Boolean] 

## runtime_dependencies() [](#method-i-runtime_dependencies)

## sort_obj() [](#method-i-sort_obj)
Create a delegate used for sorting. This strategy is copied from RubyGems 2.23
and ensures that Bundler's specifications can be compared and sorted with
RubyGems' own specifications.

**@return** [Array] an object you can use to compare and sort this
specification against other specifications

**@see** [] 

**@see** [] 

## to_s() [](#method-i-to_s)

