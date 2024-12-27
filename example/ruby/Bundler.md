# Module: Bundler
    

module Bundler::URI


# Class Methods
## URI(uri ) [](#method-c-URI)
Returns a Bundler::URI object derived from the given `uri`, which may be a
Bundler::URI string or an existing Bundler::URI object:

    # Returns a new Bundler::URI.
    uri = Bundler::URI('http://github.com/ruby/ruby')
    # => #<Bundler::URI::HTTP http://github.com/ruby/ruby>
    # Returns the given Bundler::URI.
    Bundler::URI(uri)
    # => #<Bundler::URI::HTTP http://github.com/ruby/ruby>
## app_cache(custom_path nil) [](#method-c-app_cache)
## app_config_path() [](#method-c-app_config_path)
## auto_install() [](#method-c-auto_install)
Automatically install dependencies if [Bundler.settings](:auto_install)
exists. This is set through config cmd `bundle config set --global
auto_install 1`.

Note that this method `nil`s out the global Definition object, so it should be
called first, before you instantiate anything like an `Installer` that'll keep
a reference to the old one instead.
## auto_switch() [](#method-c-auto_switch)
## bin_path() [](#method-c-bin_path)
Returns absolute location of where binstubs are installed to.
## bundle_path() [](#method-c-bundle_path)
Returns absolute path of where gems are installed on the filesystem.
## bundler_major_version() [](#method-c-bundler_major_version)
## clean_env() [](#method-c-clean_env)
**@deprecated** [] Use `unbundled_env` instead

## clean_exec(*args ) [](#method-c-clean_exec)
**@deprecated** [] Use `unbundled_exec` instead

## clean_system(*args ) [](#method-c-clean_system)
**@deprecated** [] Use `unbundled_system` instead

## clear_gemspec_cache() [](#method-c-clear_gemspec_cache)
## configure() [](#method-c-configure)
## configure_gem_home_and_path(path bundle_path) [](#method-c-configure_gem_home_and_path)
## configured_bundle_path() [](#method-c-configured_bundle_path)
## create_bundle_path() [](#method-c-create_bundle_path)
## current_ruby() [](#method-c-current_ruby)
Returns current version of Ruby
**@return** [CurrentRuby] Current version of Ruby

## default_bundle_dir() [](#method-c-default_bundle_dir)
## default_gemfile() [](#method-c-default_gemfile)
## default_lockfile() [](#method-c-default_lockfile)
## definition(unlock nil, lockfile default_lockfile) [](#method-c-definition)
Returns an instance of Bundler::Definition for given Gemfile and lockfile
**@param** [Hash, Boolean, nil] Gems that have been requested
to be updated or true if all gems should be updated

**@param** [Pathname] Path to Gemfile.lock

**@return** [Bundler::Definition] 

## environment() [](#method-c-environment)
## feature_flag() [](#method-c-feature_flag)
## find_executable(path ) [](#method-c-find_executable)
## frozen_bundle?() [](#method-c-frozen_bundle?)
**@return** [Boolean] 

## gem_version() [](#method-c-gem_version)
## git_present?() [](#method-c-git_present?)
**@return** [Boolean] 

## home() [](#method-c-home)
## install_path() [](#method-c-install_path)
## load() [](#method-c-load)
## load_gemspec(file , validate false) [](#method-c-load_gemspec)
## load_gemspec_uncached(file , validate false) [](#method-c-load_gemspec_uncached)
## load_plugins(definition Bundler.definition) [](#method-c-load_plugins)
## local_platform() [](#method-c-local_platform)
## locked_gems() [](#method-c-locked_gems)
## mkdir_p(path ) [](#method-c-mkdir_p)
## original_env() [](#method-c-original_env)
**@return** [Hash] Environment present before Bundler was activated

## original_exec(*args ) [](#method-c-original_exec)
Run a `Kernel.exec` to a subcommand with the environment present before
Bundler was activated
## original_system(*args ) [](#method-c-original_system)
Run subcommand with the environment present before Bundler was activated
## preferred_gemfile_name() [](#method-c-preferred_gemfile_name)
## read_file(file ) [](#method-c-read_file)
## require(*groups ) [](#method-c-require)
Setups Bundler environment (see Bundler.setup) if it is not already set, and
loads all gems from groups specified. Unlike ::setup, can be called multiple
times with different groups (if they were allowed by setup).

Assuming Gemfile

    gem 'first_gem', '= 1.0'
    group :test do
      gem 'second_gem', '= 1.0'
    end

The code will work as follows:

    Bundler.setup # allow all groups
    Bundler.require(:default) # requires only first_gem
    # ...later
    Bundler.require(:test)   # requires second_gem
## require_thor_actions() [](#method-c-require_thor_actions)
## reset!() [](#method-c-reset!)
## reset_paths!() [](#method-c-reset_paths!)
## reset_rubygems!() [](#method-c-reset_rubygems!)
## reset_settings_and_root!() [](#method-c-reset_settings_and_root!)
## rm_rf(path ) [](#method-c-rm_rf)
## root() [](#method-c-root)
## ruby_scope() [](#method-c-ruby_scope)
## rubygems() [](#method-c-rubygems)
## safe_load_marshal(data ) [](#method-c-safe_load_marshal)
## self_manager() [](#method-c-self_manager)
## settings() [](#method-c-settings)
## setup(*groups ) [](#method-c-setup)
Turns on the Bundler runtime. After `Bundler.setup` call, all `load` or
`require` of the gems would be allowed only if they are part of the Gemfile or
Ruby's standard library. If the versions specified in Gemfile, only those
versions would be loaded.

Assuming Gemfile

    gem 'first_gem', '= 1.0'
    group :test do
      gem 'second_gem', '= 1.0'
    end

The code using Bundler.setup works as follows:

    require 'third_gem' # allowed, required from global gems
    require 'first_gem' # allowed, loads the last installed version
    Bundler.setup
    require 'fourth_gem' # fails with LoadError
    require 'second_gem' # loads exactly version 1.0

`Bundler.setup` can be called only once, all subsequent calls are no-op.

If *groups* list is provided, only gems from specified groups would be allowed
(gems specified outside groups belong to special `:default` group).

To require all gems from Gemfile (or only some groups), see Bundler.require.
## specs_path() [](#method-c-specs_path)
## system_bindir() [](#method-c-system_bindir)
## tmp(name Process.pid.to_s) [](#method-c-tmp)
## ui() [](#method-c-ui)
## ui=(ui ) [](#method-c-ui=)
## unbundle_env!() [](#method-c-unbundle_env!)
Remove all bundler-related variables from ENV
## unbundled_env() [](#method-c-unbundled_env)
**@return** [Hash] Environment with all bundler-related variables removed

## unbundled_exec(*args ) [](#method-c-unbundled_exec)
Run a `Kernel.exec` to a subcommand in an environment with all bundler related
variables removed
## unbundled_system(*args ) [](#method-c-unbundled_system)
Run subcommand in an environment with all bundler related variables removed
## use_system_gems?() [](#method-c-use_system_gems?)
**@return** [Boolean] 

## user_bundle_path(dir "home") [](#method-c-user_bundle_path)
## user_cache() [](#method-c-user_cache)
## user_home() [](#method-c-user_home)
## which(executable ) [](#method-c-which)
## with_clean_env() [](#method-c-with_clean_env)
**@deprecated** [] Use `with_unbundled_env` instead

## with_friendly_errors() [](#method-c-with_friendly_errors)
## with_original_env() [](#method-c-with_original_env)
Run block with environment present before Bundler was activated
## with_unbundled_env() [](#method-c-with_unbundled_env)
Run block with all bundler-related variables removed

