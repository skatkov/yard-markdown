# Class: Bundler::Source::Git
**Inherits:** Path
    



# Class Methods
## from_lock(options ) [](#method-c-from_lock)
# Attributes
## branch[RW] [](#attribute-i-branch)
Returns the value of attribute branch.

## glob[RW] [](#attribute-i-glob)
Returns the value of attribute glob.

## options[RW] [](#attribute-i-options)
Returns the value of attribute options.

## ref[RW] [](#attribute-i-ref)
Returns the value of attribute ref.

## submodules[RW] [](#attribute-i-submodules)
Returns the value of attribute submodules.

## uri[RW] [](#attribute-i-uri)
Returns the value of attribute uri.


#Instance Methods
## allow_git_ops?() [](#method-i-allow_git_ops?)

**@return** [Boolean] 

## app_cache_dirname() [](#method-i-app_cache_dirname)

## cache(spec, custom_pathnil) [](#method-i-cache)

## cache_path() [](#method-i-cache_path)
This is the path which is going to contain a cache of the git repository. When
using the same git repository across different projects, this cache will be
shared. When using local git repos, this is set to the local repo.

## cached!() [](#method-i-cached!)

## current_branch() [](#method-i-current_branch)

## eql?(other) [](#method-i-eql?)

**@return** [Boolean] 

## extension_dir_name() [](#method-i-extension_dir_name)

## hash() [](#method-i-hash)

## identifier() [](#method-i-identifier)

## include?(other) [](#method-i-include?)

**@return** [Boolean] 

## initialize(options) [](#method-i-initialize)

**@return** [Git] a new instance of Git

## install(spec, options{}) [](#method-i-install)

## install_path() [](#method-i-install_path)
This is the path which is going to contain a specific checkout of the git
repository. When using local git repos, this is set to the local repo.

## load_spec_files() [](#method-i-load_spec_files)

## local?() [](#method-i-local?)

**@return** [Boolean] 

## local_override!(path) [](#method-i-local_override!)

## migrate_cache(custom_pathnil, local:false) [](#method-i-migrate_cache)

## name() [](#method-i-name)

## remote!() [](#method-i-remote!)

## revision() [](#method-i-revision)

## specs() [](#method-i-specs)

## to_gemfile() [](#method-i-to_gemfile)

## to_lock() [](#method-i-to_lock)

## to_s() [](#method-i-to_s)

## unlock!() [](#method-i-unlock!)

## uri_with_specifiers(specifiers) [](#method-i-uri_with_specifiers)

