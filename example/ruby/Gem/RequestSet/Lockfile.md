# Class: Gem::RequestSet::Lockfile
**Inherits:** Object
    

Parses a gem.deps.rb.lock file and constructs a LockSet containing the
dependencies found inside.  If the lock file is missing no LockSet is
constructed.


# Class Methods
## build(request_set , gem_deps_file , dependencies nil) [](#method-c-build)
Creates a new Lockfile for the given `request_set` and `gem_deps_file`
location.
## requests_to_deps(requests ) [](#method-c-requests_to_deps)
:nodoc:
# Attributes
## platforms[RW] [](#attribute-i-platforms)
The platforms for this Lockfile


#Instance Methods
## add_DEPENDENCIES(out) [](#method-i-add_DEPENDENCIES)
:nodoc:

## add_GEM(out, spec_groups) [](#method-i-add_GEM)
:nodoc:

## add_GIT(out, git_requests) [](#method-i-add_GIT)

## add_PATH(out, path_requests) [](#method-i-add_PATH)
:nodoc:

## add_PLATFORMS(out) [](#method-i-add_PLATFORMS)
:nodoc:

## initialize(request_set, gem_deps_file, dependencies) [](#method-i-initialize)

**@return** [Lockfile] a new instance of Lockfile

## relative_path_from(dest, base) [](#method-i-relative_path_from)
:nodoc:

## spec_groups() [](#method-i-spec_groups)

## to_s() [](#method-i-to_s)
The contents of the lock file.

## write() [](#method-i-write)
Writes the lock file alongside the gem dependencies file

