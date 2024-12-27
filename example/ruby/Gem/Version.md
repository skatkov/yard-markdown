# Class: Gem::Version
**Inherits:** Object
    
**Includes:** Comparable
  

The Version class processes string versions into comparable values. A version
string should normally be a series of numbers separated by periods. Each part
(digits separated by periods) is considered its own number, and these are used
for sorting. So for instance, 3.10 sorts higher than 3.2 because ten is
greater than two.

If any part contains letters (currently only a-z are supported) then that
version is considered prerelease. Versions with a prerelease part in the Nth
part sort less than versions with N-1 parts. Prerelease parts are sorted
alphabetically using the normal Ruby string sorting rules. If a prerelease
part contains both letters and numbers, it will be broken into multiple parts
to provide expected sort behavior (1.0.a10 becomes 1.0.a.10, and is greater
than 1.0.a9).

Prereleases sort between real releases (newest to oldest):

1.  1.0
2.  1.0.b1
3.  1.0.a.2
4.  0.9

If you want to specify a version restriction that includes both prereleases
and regular releases of the 1.x series this is the best way:

    s.add_dependency 'example', '>= 1.0.0.a', '< 2.0.0'

## How Software Changes

Users expect to be able to specify a version constraint that gives them some
reasonable expectation that new versions of a library will work with their
software if the version constraint is true, and not work with their software
if the version constraint is false.  In other words, the perfect system will
accept all compatible versions of the library and reject all incompatible
versions.

Libraries change in 3 ways (well, more than 3, but stay focused here!).

1.  The change may be an implementation detail only and have no effect on the
    client software.
2.  The change may add new features, but do so in a way that client software
    written to an earlier version is still compatible.
3.  The change may change the public interface of the library in such a way
    that old software is no longer compatible.

Some examples are appropriate at this point.  Suppose I have a Stack class
that supports a `push` and a `pop` method.

### Examples of Category 1 changes:

*   Switch from an array based implementation to a linked-list based
    implementation.
*   Provide an automatic (and transparent) backing store for large stacks.

### Examples of Category 2 changes might be:

*   Add a `depth` method to return the current depth of the stack.
*   Add a `top` method that returns the current top of stack (without changing
    the stack).
*   Change `push` so that it returns the item pushed (previously it had no
    usable return value).

### Examples of Category 3 changes might be:

*   Changes `pop` so that it no longer returns a value (you must use `top` to
    get the top of the stack).
*   Rename the methods to `push_item` and `pop_item`.

## RubyGems Rational Versioning

*   Versions shall be represented by three non-negative integers, separated by
    periods (e.g. 3.1.4).  The first integers is the "major" version number,
    the second integer is the "minor" version number, and the third integer is
    the "build" number.

*   A category 1 change (implementation detail) will increment the build
    number.

*   A category 2 change (backwards compatible) will increment the minor
    version number and reset the build number.

*   A category 3 change (incompatible) will increment the major build number
    and reset the minor and build numbers.

*   Any "public" release of a gem should have a different version.  Normally
    that means incrementing the build number.  This means a developer can
    generate builds all day long, but as soon as they make a public release,
    the version must be updated.

### Examples

Let's work through a project lifecycle using our Stack example from above.

Version 0.0.1
:   The initial Stack class is release.

Version 0.0.2
:   Switched to a linked=list implementation because it is cooler.

Version 0.1.0
:   Added a `depth` method.

Version 1.0.0
:   Added `top` and made `pop` return nil (`pop` used to return the  old top
    item).

Version 1.1.0
:   `push` now returns the value pushed (it used it return nil).

Version 1.1.1
:   Fixed a bug in the linked list implementation.

Version 1.1.2
:   Fixed a bug introduced in the last fix.


Client A needs a stack with basic push/pop capability.  They write to the
original interface (no `top`), so their version constraint looks like:

    gem 'stack', '>= 0.0'

Essentially, any version is OK with Client A.  An incompatible change to the
library will cause them grief, but they are willing to take the chance (we
call Client A optimistic).

Client B is just like Client A except for two things: (1) They use the `depth`
method and (2) they are worried about future incompatibilities, so they write
their version constraint like this:

    gem 'stack', '~> 0.1'

The `depth` method was introduced in version 0.1.0, so that version or
anything later is fine, as long as the version stays below version 1.0 where
incompatibilities are introduced.  We call Client B pessimistic because they
are worried about incompatible future changes (it is OK to be pessimistic!).

## Preventing Version Catastrophe:

From:
https://www.zenspider.com/ruby/2008/10/rubygems-how-to-preventing-catastrophe.
html

Let's say you're depending on the fnord gem version 2.y.z. If you specify your
dependency as ">= 2.0.0" then, you're good, right? What happens if fnord 3.0
comes out and it isn't backwards compatible with 2.y.z? Your stuff will break
as a result of using ">=". The better route is to specify your dependency with
an "approximate" version specifier ("~>"). They're a tad confusing, so here is
how the dependency specifiers work:

    Specification From  ... To (exclusive)
    ">= 3.0"      3.0   ... &infin;
    "~> 3.0"      3.0   ... 4.0
    "~> 3.0.0"    3.0.0 ... 3.1
    "~> 3.5"      3.5   ... 4.0
    "~> 3.5.0"    3.5.0 ... 3.6
    "~> 3"        3.0   ... 4.0

For the last example, single-digit versions are automatically extended with a
zero to give a sensible result.


# Class Methods
## correct?(version ) [](#method-c-correct?)
True if the `version` string matches RubyGems' requirements.
**@return** [Boolean] 

## create(input ) [](#method-c-create)
Factory method to create a Version object. Input may be a Version or a String.
Intended to simplify client code.

    ver1 = Version.create('1.3.17')   # -> (Version object)
    ver2 = Version.create(ver1)       # -> (ver1)
    ver3 = Version.create(nil)        # -> nil
## new(version ) [](#method-c-new)
:nodoc:

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
Compares this version with `other` returning -1, 0, or 1 if the other version
is larger, the same, or smaller than this one. Attempts to compare to
something that's not a `Gem::Version` or a valid version String return `nil`.

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

## approximate_recommendation() [](#method-i-approximate_recommendation)
A recommended version for use with a ~> Requirement.

## between?(min, max) [](#method-i-between?)
Returns `false` if *obj* `<=>` *min* is less than zero or if *obj* `<=>` *max*
is greater than zero, `true` otherwise.

    3.between?(1, 5)               #=> true
    6.between?(1, 5)               #=> false
    'cat'.between?('ant', 'dog')   #=> true
    'gnu'.between?('ant', 'dog')   #=> false

**@overload** [] 

## bump() [](#method-i-bump)
Return a new version object where the next to the last revision number is one
greater (e.g., 5.3.1 => 5.4).

Pre-release (alpha) parts, e.g, 5.3.1.b.2 => 5.4, are ignored.

## canonical_segments() [](#method-i-canonical_segments)
remove trailing zeros segments before first letter or at the end of the
version

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

## encode_with(coder) [](#method-i-encode_with)
:nodoc:

## eql?(other) [](#method-i-eql?)
A Version is only eql? to another version if it's specified to the same
precision. Version "1.0" is not the same as version "1".

**@return** [Boolean] 

## freeze() [](#method-i-freeze)

## hash() [](#method-i-hash)
:nodoc:

## init_with(coder) [](#method-i-init_with)
:nodoc:

## initialize(version) [](#method-i-initialize)
Constructs a Version from the `version` string.  A version string is a series
of digits or ASCII letters separated by dots.

**@return** [Version] a new instance of Version

## inspect() [](#method-i-inspect)
:nodoc:

## marshal_dump() [](#method-i-marshal_dump)
Dump only the raw version string, not the complete object. It's a string for
backwards (RubyGems 1.3.5 and earlier) compatibility.

## marshal_load(array) [](#method-i-marshal_load)
Load custom marshal format. It's a string for backwards (RubyGems 1.3.5 and
earlier) compatibility.

**@raise** [TypeError] 

## prerelease?() [](#method-i-prerelease?)
A version is considered a prerelease if it contains a letter.

**@return** [Boolean] 

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## release() [](#method-i-release)
The release for this version (e.g. 1.2.0.a -> 1.2.0). Non-prerelease versions
return themselves.

## segments() [](#method-i-segments)
:nodoc:

## version() [](#method-i-version)
A string representation of this Version.

## yaml_initialize(tag, map) [](#method-i-yaml_initialize)
:nodoc:

