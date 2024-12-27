# Class: Gem::Resolver::InstallerSet
**Inherits:** Gem::Resolver::Set
    

A set of gems for installation sourced from remote sources and local .gem
files


# Attributes
## always_install[RW] [](#attribute-i-always_install)
List of Gem::Specification objects that must always be installed.

## force[RW] [](#attribute-i-force)
Ignore ruby & rubygems specification constraints.

## ignore_dependencies[RW] [](#attribute-i-ignore_dependencies)
Only install gems in the always_install list

## ignore_installed[RW] [](#attribute-i-ignore_installed)
Do not look in the installed set when finding specifications.  This is used by
the --install-dir option to `gem install`

## remote_set[RW] [](#attribute-i-remote_set)
The remote_set looks up remote gems for installation.


#Instance Methods
## add_always_install(dependency) [](#method-i-add_always_install)
Looks up the latest specification for `dependency` and adds it to the
always_install list.

## add_local(dep_name, spec, source) [](#method-i-add_local)
Adds a local gem requested using `dep_name` with the given `spec` that can be
loaded and installed using the `source`.

## consider_local?() [](#method-i-consider_local?)
Should local gems should be considered?

**@return** [Boolean] 

## consider_remote?() [](#method-i-consider_remote?)
Should remote gems should be considered?

**@return** [Boolean] 

## errors() [](#method-i-errors)
Errors encountered while resolving gems

## find_all(req) [](#method-i-find_all)
Returns an array of IndexSpecification objects matching DependencyRequest
`req`.

## initialize(domain) [](#method-i-initialize)
Creates a new InstallerSet that will look for gems in `domain`.

**@return** [InstallerSet] a new instance of InstallerSet

## inspect() [](#method-i-inspect)
:nodoc:

## load_spec(name, ver, platform, source) [](#method-i-load_spec)
Called from IndexSpecification to get a true Specification object.

## local?(dep_name) [](#method-i-local?)
Has a local gem for `dep_name` been added to this set?

**@return** [Boolean] 

## prefetch(reqs) [](#method-i-prefetch)

## prerelease=(allow_prerelease) [](#method-i-prerelease=)

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## remote=(remote) [](#method-i-remote=)
:nodoc:

