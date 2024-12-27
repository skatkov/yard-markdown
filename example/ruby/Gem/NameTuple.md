# Class: Gem::NameTuple
**Inherits:** Object
    
**Includes:** Comparable
  

Represents a gem of name `name` at `version` of `platform`. These wrap the
data returned from the indexes.


# Class Methods
## from_list(list ) [](#method-c-from_list)
Turn an array of [name, version, platform] into an array of NameTuple objects.
## null() [](#method-c-null)
A null NameTuple, ie name=nil, version=0
## to_basic(list ) [](#method-c-to_basic)
Turn an array of NameTuple objects back into an array of
name, version, platform
:   tuples.

# Attributes
## name[RW] [](#attribute-i-name)
Returns the value of attribute name.

## platform[RW] [](#attribute-i-platform)
Returns the value of attribute platform.

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

## ==(other) [](#method-i-==)
Compare with `other`. Supports another NameTuple or an Array in the [name,
version, platform] format.

## >(y) [](#method-i->)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than 0.

**@overload** [] 

## >=(y) [](#method-i->=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than or equal to 0.

**@overload** [] 

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

## full_name() [](#method-i-full_name)
Returns the full name (name-version) of this Gem.  Platform information is
included if it is not the default Ruby platform.  This mimics the behavior of
Gem::Specification#full_name.

## hash() [](#method-i-hash)

## initialize(name, version, platformGem::Platform::RUBY) [](#method-i-initialize)

**@return** [NameTuple] a new instance of NameTuple

## initialize_with_platform() [](#method-i-initialize_with_platform)

**@return** [NameTuple] a new instance of NameTuple

## inspect() [](#method-i-inspect)
:nodoc:

## lock_name() [](#method-i-lock_name)

## match_platform?() [](#method-i-match_platform?)
Indicate if this NameTuple matches the current platform.

**@return** [Boolean] 

## prerelease?() [](#method-i-prerelease?)
Indicate if this NameTuple is for a prerelease version.

**@return** [Boolean] 

## spec_name() [](#method-i-spec_name)
Return the name that the gemspec file would be

## to_a() [](#method-i-to_a)
Convert back to the [name, version, platform] tuple

