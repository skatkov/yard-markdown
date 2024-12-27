# Class: Bundler::PubGrub::BasicPackageSource
**Inherits:** Object
    

Types:

Where possible, Bundler::PubGrub will accept user-defined types, so long as
they quack.

## "Package":

This class will be used to represent the various packages being solved for.
.to_s will be called when displaying errors and debugging info, it should
probably return the package's name. It must also have a reasonable definition
of #== and #hash

Example classes: String ("rails")

## "Version":

This class will be used to represent a single version number.

Versions don't need to store their associated package, however they will only
be compared against other versions of the same package.

It must be Comparible (and implement <=> reasonably)

Example classes: Gem::Version, Integer

## "Dependency"

This class represents the requirement one package has on another. It is
returned by dependencies_for(package, version) and will be passed to
parse_dependency to convert it to a format Bundler::PubGrub understands.

It must also have a reasonable definition of #==

Example classes: String ("~> 1.0"), Gem::Requirement



#Instance Methods
## all_versions_for(package) [](#method-i-all_versions_for)
Override me!

This is called per package to find all possible versions of a package.

It is called at most once per-package

Returns: Array of versions for a package, in preferred order of selection

**@raise** [NotImplementedError] 

## dependencies_for(package, version) [](#method-i-dependencies_for)
Override me!

Returns: Hash in the form of { package => requirement, ... }

**@raise** [NotImplementedError] 

## incompatibilities_for(package, version) [](#method-i-incompatibilities_for)

## initialize() [](#method-i-initialize)

**@return** [BasicPackageSource] a new instance of BasicPackageSource

## no_versions_incompatibility_for(_package, unsatisfied_term) [](#method-i-no_versions_incompatibility_for)

## parse_dependency(package, dependency) [](#method-i-parse_dependency)
Override me!

Convert a (user-defined) dependency into a format Bundler::PubGrub
understands.

Package is passed to this method but for many implementations is not needed.

Returns: either a Bundler::PubGrub::VersionRange,
Bundler::PubGrub::VersionUnion, or a
    Bundler::PubGrub::VersionConstraint

**@raise** [NotImplementedError] 

## root_dependencies() [](#method-i-root_dependencies)
Override me!

If not overridden, this will call dependencies_for with the root package.

Returns: Hash in the form of { package => requirement, ... } (see
dependencies_for)

## sort_versions_by_preferred(package, sorted_versions) [](#method-i-sort_versions_by_preferred)
Override me (maybe)

If not overridden, the order returned by all_versions_for will be used

Returns: Array of versions in preferred order

## versions_for(package, rangeVersionRange.any) [](#method-i-versions_for)

