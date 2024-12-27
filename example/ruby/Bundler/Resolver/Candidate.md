# Class: Bundler::Resolver::Candidate
**Inherits:** Object
    
**Includes:** Comparable
  

This class is a PubGrub compatible "Version" class that takes Bundler
resolution complexities into account.

Each Resolver::Candidate has a underlying `Gem::Version` plus a set of
platforms. For example, 1.1.0-x86_64-linux is a different resolution candidate
from 1.1.0 (generic). This is because different platform variants of the same
gem version can bring different dependencies, so they need to be considered
separately.

Some candidates may also keep some information explicitly about the package
they refer to. These candidates are referred to as "canonical" and are used
when materializing resolution results back into RubyGems specifications that
can be installed, written to lock files, and so on.


# Attributes
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

## dependencies() [](#method-i-dependencies)

## eql?(other) [](#method-i-eql?)

**@return** [Boolean] 

## hash() [](#method-i-hash)

## initialize(version, group:nil, priority:-1)) [](#method-i-initialize)

**@return** [Candidate] a new instance of Candidate

## prerelease?() [](#method-i-prerelease?)

**@return** [Boolean] 

## segments() [](#method-i-segments)

## sort_obj() [](#method-i-sort_obj)

## to_s() [](#method-i-to_s)

## to_specs(package, most_specific_locked_platform) [](#method-i-to_specs)

