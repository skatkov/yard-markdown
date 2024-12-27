# Class: Gem::Platform
**Inherits:** Object
  
**Extended by:** Gem::Deprecate
    

Available list of platforms for targeting Gem installations.

See `gem help platform` for information on platform matching.


# Class Methods
## deprecate(name , repl , year , month ) [](#method-c-deprecate)
Simple deprecation method that deprecates `name` by wrapping it up in a dummy
method. It warns on each call to the dummy method telling the user of `repl`
(unless `repl` is :none) and the year/month that it is planned to go away.
## installable?(spec ) [](#method-c-installable?)
**@return** [Boolean] 

## local(refresh: false) [](#method-c-local)
## match(platform ) [](#method-c-match)
## match_gem?(platform , gem_name ) [](#method-c-match_gem?)
**@return** [Boolean] 

## match_spec?(spec ) [](#method-c-match_spec?)
**@return** [Boolean] 

## new(arch ) [](#method-c-new)
:nodoc:
## sort_priority(platform ) [](#method-c-sort_priority)
# Attributes
## cpu[RW] [](#attribute-i-cpu)
Returns the value of attribute cpu.

## os[RW] [](#attribute-i-os)
Returns the value of attribute os.

## version[RW] [](#attribute-i-version)
Returns the value of attribute version.


#Instance Methods
## ==(other) [](#method-i-==)
Is `other` equal to this platform?  Two platforms are equal if they have the
same CPU, OS and version.

## ===(other) [](#method-i-===)
Does `other` match this platform?  Two platforms match if they have the same
CPU, or either has a CPU of 'universal', they have the same OS, and they have
the same version, or either one has no version

Additionally, the platform will match if the local CPU is 'arm' and the other
CPU starts with "armv" (for generic 32-bit ARM family support).

Of note, this method is not commutative. Indeed the OS 'linux' has a special
case: the version is the libc name, yet while "no version" stands as a
wildcard for a binary gem platform (as for other OSes), for the runtime
platform "no version" stands for 'gnu'. To be able to distinguish these, the
method receiver is the gem platform, while the argument is the runtime
platform.

-- NOTE: Until it can be removed, changes to this method must also be
reflected in `bundler/lib/bundler/rubygems_ext.rb`

## =~(other) [](#method-i-=~)
Does `other` match this platform?  If `other` is a String it will be converted
to a Gem::Platform first.  See #=== for matching rules.

## hash() [](#method-i-hash)
:nodoc:

## initialize(arch) [](#method-i-initialize)

**@return** [Platform] a new instance of Platform

## normalized_linux_version() [](#method-i-normalized_linux_version)
-- NOTE: Until it can be removed, changes to this method must also be
reflected in `bundler/lib/bundler/rubygems_ext.rb`

## normalized_linux_version_ext() [](#method-i-normalized_linux_version_ext)
This is a copy of RubyGems 3.3.23 or higher `normalized_linux_method`. Once
only 3.3.23 is supported, we can use the method in RubyGems.

## to_a() [](#method-i-to_a)

## to_s() [](#method-i-to_s)

