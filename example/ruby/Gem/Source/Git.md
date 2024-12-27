# Class: Gem::Source::Git
**Inherits:** Gem::Source
    

A git gem for use in a gem dependencies file.

Example:

    source =
      Gem::Source::Git.new 'rake', 'git@example:rake.git', 'rake-10.1.0', false

    source.specs


# Attributes
## name[RW] [](#attribute-i-name)
The name of the gem created by this git gem.

## need_submodules[RW] [](#attribute-i-need_submodules)
Does this repository need submodules checked out too?

## reference[RW] [](#attribute-i-reference)
The commit reference used for checking out this git gem.

## remote[RW] [](#attribute-i-remote)
When false the cache for this repository will not be updated.

## repository[RW] [](#attribute-i-repository)
The git repository this gem is sourced from.

## root_dir[RW] [](#attribute-i-root_dir)
The directory for cache and git gem installation


#Instance Methods
## <=>(other) [](#method-i-<=>)

## ==(other) [](#method-i-==)
:nodoc:

## base_dir() [](#method-i-base_dir)
Directory where git gems get unpacked and so-forth.

## cache() [](#method-i-cache)
Creates a local cache repository for the git gem.

## checkout() [](#method-i-checkout)
Checks out the files for the repository into the install_dir.

## dir_shortref() [](#method-i-dir_shortref)
A short reference for use in git gem directories

## download(full_spec, path) [](#method-i-download)
Nothing to download for git gems

## git_command() [](#method-i-git_command)

## initialize(name, repository, reference, submodulesfalse) [](#method-i-initialize)
Creates a new git gem source for a gems from loaded from `repository` at the
given `reference`.  The `name` is only used to track the repository back to a
gem dependencies file, it has no real significance as a git repository may
contain multiple gems.  If `submodules` is true, submodules will be checked
out when the gem is installed.

**@return** [Git] a new instance of Git

## install_dir() [](#method-i-install_dir)
The directory where the git gem will be installed.

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## repo_cache_dir() [](#method-i-repo_cache_dir)
The directory where the git gem's repository will be cached.

## rev_parse() [](#method-i-rev_parse)
Converts the git reference for the repository into a commit hash.

**@raise** [Gem::Exception] 

## specs() [](#method-i-specs)
Loads all gemspecs in the repository

## uri_hash() [](#method-i-uri_hash)
A hash for the git gem based on the git repository Gem::URI.

