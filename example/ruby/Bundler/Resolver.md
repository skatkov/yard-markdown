# Class: Bundler::Resolver
**Inherits:** Object
    
**Includes:** Bundler::GemHelpers
  

This class implements the interface needed by PubGrub for resolution. It is
equivalent to the `PubGrub::BasicPackageSource` class provided by PubGrub by
default and used by the most simple PubGrub consumers.



#Instance Methods
## all_versions_for(package) [](#method-i-all_versions_for)

## bundler_pinned_to_current_version?() [](#method-i-bundler_pinned_to_current_version?)

**@return** [Boolean] 

## debug?() [](#method-i-debug?)

**@return** [Boolean] 

## default_bundler_source() [](#method-i-default_bundler_source)

## find_names_to_relax(incompatibility) [](#method-i-find_names_to_relax)

## incompatibilities_for(package, version) [](#method-i-incompatibilities_for)

## initialize(base, gem_version_promoter, most_specific_locked_platformnil) [](#method-i-initialize)

**@return** [Resolver] a new instance of Resolver

## name_for_explicit_dependency_source() [](#method-i-name_for_explicit_dependency_source)

## no_versions_incompatibility_for(package, unsatisfied_term) [](#method-i-no_versions_incompatibility_for)

## parse_dependency(package, dependency) [](#method-i-parse_dependency)

## raise_not_found!(package) [](#method-i-raise_not_found!)

**@raise** [GemNotFound] 

## setup_solver() [](#method-i-setup_solver)

## solve_versions(root:, logger:) [](#method-i-solve_versions)

## source_for(name) [](#method-i-source_for)

## start() [](#method-i-start)

## versions_for(package, rangeVersionRange.any) [](#method-i-versions_for)

