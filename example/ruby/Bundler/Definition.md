# Class: Bundler::Definition
**Inherits:** Object
    
**Includes:** Bundler::GemHelpers
  



# Class Methods
## build(gemfile , lockfile , unlock ) [](#method-c-build)
Given a gemfile and lockfile creates a Bundler definition
**@param** [Pathname] Path to Gemfile

**@param** [Pathname, nil] Path to Gemfile.lock

**@param** [Hash, Boolean, nil] Gems that have been requested
to be updated or true if all gems should be updated

**@raise** [GemfileNotFound] 

**@return** [Bundler::Definition] 

# Attributes
## no_lock[RW] [](#attribute-c-no_lock)
Do not create or modify a lockfile (Makes #lock a noop)

## dependencies[RW] [](#attribute-i-dependencies)
Returns the value of attribute dependencies.

## gemfiles[RW] [](#attribute-i-gemfiles)
Returns the value of attribute gemfiles.

## locked_checksums[RW] [](#attribute-i-locked_checksums)
Returns the value of attribute locked_checksums.

## locked_deps[RW] [](#attribute-i-locked_deps)
Returns the value of attribute locked_deps.

## locked_gems[RW] [](#attribute-i-locked_gems)
Returns the value of attribute locked_gems.

## lockfile[RW] [](#attribute-i-lockfile)
Returns the value of attribute lockfile.

## platforms[RW] [](#attribute-i-platforms)
Returns the value of attribute platforms.

## ruby_version[RW] [](#attribute-i-ruby_version)
Returns the value of attribute ruby_version.

## source_requirements=[R] [](#attribute-i-source_requirements=)
Sets the attribute source_requirements

**@param** [] the value to set the attribute source_requirements to.

## sources[RW] [](#attribute-i-sources)
Returns the value of attribute sources.


#Instance Methods
## add_checksums() [](#method-i-add_checksums)

## add_platform(platform) [](#method-i-add_platform)

## bundler_version_to_lock() [](#method-i-bundler_version_to_lock)

## check!() [](#method-i-check!)

## current_dependencies() [](#method-i-current_dependencies)

## current_locked_dependencies() [](#method-i-current_locked_dependencies)

## deleted_deps() [](#method-i-deleted_deps)

## dependencies_for(groups) [](#method-i-dependencies_for)

## ensure_equivalent_gemfile_and_lockfile(explicit_flagfalse) [](#method-i-ensure_equivalent_gemfile_and_lockfile)

**@raise** [ProductionError] 

## filter_relevant(dependencies) [](#method-i-filter_relevant)

## gem_version_promoter() [](#method-i-gem_version_promoter)

## groups() [](#method-i-groups)

## initialize(lockfile, dependencies, sources, unlock, ruby_versionnil, optional_groups[], gemfiles[]) [](#method-i-initialize)
How does the new system work?

*   Load information from Gemfile and Lockfile
*   Invalidate stale locked specs
*   All specs from stale source are stale
*   All specs that are reachable only through a stale dependency are stale.
*   If all fresh dependencies are satisfied by the locked
    specs, then we can try to resolve locally.

**@param** [Pathname] Path to Gemfile.lock

**@param** [Array(Bundler::Dependency)] array of dependencies from Gemfile

**@param** [Bundler::SourceList] 

**@param** [Hash, Boolean, nil] Gems that have been requested
to be updated or true if all gems should be updated

**@param** [Bundler::RubyVersion, nil] Requested Ruby Version

**@param** [Array(String)] A list of optional groups

**@return** [Definition] a new instance of Definition

## lock(file_or_preserve_unknown_sectionsfalse, preserve_unknown_sections_or_unusedfalse) [](#method-i-lock)

## locked_dependencies() [](#method-i-locked_dependencies)

## locked_ruby_version() [](#method-i-locked_ruby_version)

## locked_ruby_version_object() [](#method-i-locked_ruby_version_object)

## missing_specs() [](#method-i-missing_specs)

## missing_specs?() [](#method-i-missing_specs?)

**@return** [Boolean] 

## new_deps() [](#method-i-new_deps)

## new_specs() [](#method-i-new_specs)

## no_resolve_needed?() [](#method-i-no_resolve_needed?)

**@return** [Boolean] 

## normalize_platforms() [](#method-i-normalize_platforms)

## nothing_changed?() [](#method-i-nothing_changed?)

**@return** [Boolean] 

## prefer_local!() [](#method-i-prefer_local!)

## remotely!() [](#method-i-remotely!)

## remove_platform(platform) [](#method-i-remove_platform)

**@raise** [InvalidOption] 

## removed_specs() [](#method-i-removed_specs)

## requested_dependencies() [](#method-i-requested_dependencies)

## requested_specs() [](#method-i-requested_specs)

## resolve() [](#method-i-resolve)
Resolve all the dependencies specified in Gemfile. It ensures that
dependencies that have been already resolved via locked file and are fresh are
reused when resolving dependencies

**@return** [SpecSet] resolved dependencies

## resolve_remotely!() [](#method-i-resolve_remotely!)

## resolve_with_cache!() [](#method-i-resolve_with_cache!)

## setup_domain!(options{}) [](#method-i-setup_domain!)
Setup sources according to the given options and the state of the definition.

**@return** [Boolean] Whether fetching remote information will be necessary or not

## spec_git_paths() [](#method-i-spec_git_paths)

## specs() [](#method-i-specs)
For given dependency list returns a SpecSet with Gemspec of all the required
dependencies.
    1. The method first resolves the dependencies specified in Gemfile
    2. After that it tries and fetches gemspec of resolved dependencies

**@return** [Bundler::SpecSet] 

## specs_for(groups) [](#method-i-specs_for)

## to_lock() [](#method-i-to_lock)

## unlocking?() [](#method-i-unlocking?)

**@return** [Boolean] 

## validate_platforms!() [](#method-i-validate_platforms!)

**@raise** [ProductionError] 

## validate_ruby!() [](#method-i-validate_ruby!)

## validate_runtime!() [](#method-i-validate_runtime!)

## with_cache!() [](#method-i-with_cache!)

