# Module: Bundler::Plugin::API::Source
    

This class provides the base to build source plugins All the method here are
required to build a source plugin (except `uri_hash`, `gem_install_dir`; they
are helpers).

Defaults for methods, where ever possible are provided which is expected to
work. But, all source plugins have to override `fetch_gemspec_files` and
`install`. Defaults are also not provided for `remote!`, `cache!` and
`unlock!`.

The defaults shall work for most situations but nevertheless they can be
(preferably should be) overridden as per the plugins' needs safely (as long as
they behave as expected). On overriding `initialize` you should call super
first.

If required plugin should override `hash`, `==` and `eql?` methods to be able
to match objects representing same sources, but may be created in different
situation (like form gemfile and lockfile). The default ones checks only for
class and uri, but elaborate source plugins may need more comparisons (e.g.
git checking on branch or tag).


# Attributes
## checksum_store[RW] [](#attribute-i-checksum_store)
Returns the value of attribute checksum_store.

## dependency_names[RW] [](#attribute-i-dependency_names)

**@return** [Array<String>] Names of dependencies that the source should
try to resolve. It is not necessary to use this list internally. This
is present to be compatible with `Definition` and is used by
rubygems source.

## name[RW] [](#attribute-i-name)

**@return** [String] name that can be used to uniquely identify a source

## options[RW] [](#attribute-i-options)

**@return** [String] options passed during initialization (either from
lockfile or Gemfile)

## uri[RW] [](#attribute-i-uri)

**@return** [String] the remote specified with `source` block in Gemfile


#Instance Methods
## ==(other) [](#method-i-==)
This shall check if two source object represent the same source.

The comparison shall take place only on the attribute that can be inferred
from the options passed from Gemfile and not on attributes that are used to
pin down the gem to specific version (e.g. Git sources should compare on
branch and tag but not on commit hash)

The sources objects are constructed from Gemfile as well as from lockfile. To
converge the sources, it is necessary that they match.

The same applies for `eql?` and `hash`

## add_dependency_names(names) [](#method-i-add_dependency_names)
Used by definition.

Note: Do not override if you don't know what you are doing.

## app_cache_dirname() [](#method-i-app_cache_dirname)
Name of directory where plugin the is expected to cache the gems when #cache
is called.

Also this name is matched against the directories in cache for pruning

This is used by `app_cache_path`

## app_cache_path(custom_pathnil) [](#method-i-app_cache_path)
The full path where the plugin should cache the gem so that it can be
installed latter.

Note: Do not override if you don't know what you are doing.

## cache(spec, custom_pathnil) [](#method-i-cache)
This method is called while caching to save copy of the gems that the source
can resolve to path provided by `app_cache_app`so that they can be reinstalled
from the cache without querying the remote (i.e. an alternative to remote)

This is stored with the app and source plugins should try to provide specs and
install only from this cache when `cached!` is called.

This cache is different from the internal caching that can be done at sub
paths of `cache_path` (from API). This can be though as caching by bundler.

## cached!() [](#method-i-cached!)
Set internal representation to fetch the gems/specs from app cache.

When this is called, the source should try to fetch the specs and install from
the path provided by `app_cache_path`.

## can_lock?(spec) [](#method-i-can_lock?)
NOTE: Do not override if you don't know what you are doing.

**@return** [Boolean] 

## double_check_for() [](#method-i-double_check_for)
This API on source might not be stable, and for now we expect plugins to
download all specs in `#specs`, so we implement the method for compatibility
purposes and leave it undocumented (and don't support) overriding it)

**@private** [] 

## fetch_gemspec_files() [](#method-i-fetch_gemspec_files)
This is used by the default `spec` method to constructs the Specification
objects for the gems and versions that can be installed by this source plugin.

Note: If the spec method is overridden, this function is not necessary

**@return** [Array<String>] paths of the gemspec files for gems that can
be installed

## gem_install_dir() [](#method-i-gem_install_dir)
NOTE: Do not override if you don't know what you are doing.

## hash() [](#method-i-hash)
When overriding `hash` please preserve the behaviour as mentioned in docstring
for `==` method, i.e. two methods equal by above comparison should have same
hash.

## include?(other) [](#method-i-include?)
NOTE: Do not override if you don't know what you are doing.

**@return** [Boolean] 

## initialize(opts) [](#method-i-initialize)

## install(spec, opts) [](#method-i-install)
Install the gem specified by the spec at appropriate path. `install_path`
provides a sufficient default, if the source can only satisfy one gem,  but is
not binding.

**@raise** [MalformattedPlugin] 

**@return** [String] post installation message (if any)

## install_path() [](#method-i-install_path)
A default installation path to install a single gem. If the source servers
multiple gems, it's not of much use and the source should one of its own.

## installed?() [](#method-i-installed?)
A helper method, not necessary if not used internally.

**@return** [Boolean] 

## local!() [](#method-i-local!)
Set internal representation to fetch the gems/specs locally.

When this is called, the source should try to fetch the specs and install from
the local system.

## options_to_lock() [](#method-i-options_to_lock)
Options to be saved in the lockfile so that the source plugin is able to check
out same version of gem later.

There options are passed when the source plugin is created from the lock file.

**@return** [Hash] 

## post_install(spec, disable_extsfalse) [](#method-i-post_install)
It builds extensions, generates bins and installs them for the spec provided.

It depends on `spec.loaded_from` to get full_gem_path. The source plugins
should set that.

It should be called in `install` after the plugin is done placing the gem at
correct install location.

It also runs Gem hooks `pre_install`, `post_build` and `post_install`

Note: Do not override if you don't know what you are doing.

## remote!() [](#method-i-remote!)
Set internal representation to fetch the gems/specs from remote.

When this is called, the source should try to fetch the specs and install from
remote path.

## root() [](#method-i-root)
It is used to obtain the full_gem_path.

spec's loaded_from path is expanded against this to get full_gem_path

Note: Do not override if you don't know what you are doing.

## spec_names() [](#method-i-spec_names)
Used by definition.

Note: Do not override if you don't know what you are doing.

## specs() [](#method-i-specs)
Parses the gemspec files to find the specs for the gems that can be satisfied
by the source.

Few important points to keep in mind:
    - If the gems are not installed then it shall return specs for all
    the gems it can satisfy
    - If gem is installed (that is to be detected by the plugin itself)
    then it shall return at least the specs that are installed.
    - The `loaded_from` for each of the specs shall be correct (it is
    used to find the load path)

**@return** [Bundler::Index] index containing the specs

## to_lock() [](#method-i-to_lock)
Generates the content to be entered into the lockfile. Saves type and remote
and also calls to `options_to_lock`.

Plugin should use `options_to_lock` to save information in lockfile and not
override this.

Note: Do not override if you don't know what you are doing.

## to_s() [](#method-i-to_s)

## unlock!() [](#method-i-unlock!)
This is called to update the spec and installation.

If the source plugin is loaded from lockfile or otherwise, it shall refresh
the cache/specs (e.g. git sources can make a fresh clone).

## unmet_deps() [](#method-i-unmet_deps)
Used by definition.

Note: Do not override if you don't know what you are doing.

## uri_hash() [](#method-i-uri_hash)

