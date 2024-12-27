# Class: Gem::Resolver::GitSet
**Inherits:** Gem::Resolver::Set
    

A GitSet represents gems that are sourced from git repositories.

This is used for gem dependency file support.

Example:

    set = Gem::Resolver::GitSet.new
    set.add_git_gem 'rake', 'git://example/rake.git', tag: 'rake-10.1.0'


# Attributes
## need_submodules[RW] [](#attribute-i-need_submodules)
Contains repositories needing submodules

## repositories[RW] [](#attribute-i-repositories)
A Hash containing git gem names for keys and a Hash of repository and git
commit reference as values.

## root_dir[RW] [](#attribute-i-root_dir)
The root directory for git gems in this set.  This is usually Gem.dir, the
installation directory for regular gems.

## specs[RW] [](#attribute-i-specs)
A hash of gem names to Gem::Resolver::GitSpecifications


#Instance Methods
## add_git_gem(name, repository, reference, submodules) [](#method-i-add_git_gem)
:nodoc:

## add_git_spec(name, version, repository, reference, submodules) [](#method-i-add_git_spec)
Adds and returns a GitSpecification with the given `name` and `version` which
came from a `repository` at the given `reference`.  If `submodules` is true
they are checked out along with the repository.

This fills in the prefetch information as enough information about the gem is
present in the arguments.

## find_all(req) [](#method-i-find_all)
Finds all git gems matching `req`

## initialize() [](#method-i-initialize)
:nodoc:

**@return** [GitSet] a new instance of GitSet

## prefetch(reqs) [](#method-i-prefetch)
Prefetches specifications from the git repositories in this set.

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

