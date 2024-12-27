# Class: Gem::Resolver::VendorSet
**Inherits:** Gem::Resolver::Set
    

A VendorSet represents gems that have been unpacked into a specific directory
that contains a gemspec.

This is used for gem dependency file support.

Example:

    set = Gem::Resolver::VendorSet.new

    set.add_vendor_gem 'rake', 'vendor/rake'

The directory vendor/rake must contain an unpacked rake gem along with a
rake.gemspec (watching the given name).


# Attributes
## specs[RW] [](#attribute-i-specs)
The specifications for this set.


#Instance Methods
## add_vendor_gem(name, directory) [](#method-i-add_vendor_gem)
Adds a specification to the set with the given `name` which has been unpacked
into the given `directory`.

**@raise** [Gem::GemNotFoundException] 

## find_all(req) [](#method-i-find_all)
Returns an Array of VendorSpecification objects matching the DependencyRequest
`req`.

## initialize() [](#method-i-initialize)
:nodoc:

**@return** [VendorSet] a new instance of VendorSet

## load_spec(name, version, platform, source) [](#method-i-load_spec)
Loads a spec with the given `name`. `version`, `platform` and `source` are
ignored.

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

