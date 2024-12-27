# Class: Spec::TheBundle
**Inherits:** Object
    
**Includes:** Spec::Path
  



# Attributes
## bundle_dir[RW] [](#attribute-i-bundle_dir)
Returns the value of attribute bundle_dir.


#Instance Methods
## base_system_gem_path() [](#method-i-base_system_gem_path)

## base_system_gems() [](#method-i-base_system_gems)

## bindir() [](#method-i-bindir)

## bundled_app(*path) [](#method-i-bundled_app)

## bundled_app2(*path) [](#method-i-bundled_app2)

## bundled_app_gemfile() [](#method-i-bundled_app_gemfile)

## bundled_app_lock() [](#method-i-bundled_app_lock)

## cached_gem(path) [](#method-i-cached_gem)

## default_bundle_path(*path) [](#method-i-default_bundle_path)

## default_cache_path(*path) [](#method-i-default_cache_path)

## dev_gemfile() [](#method-i-dev_gemfile)

## file_uri_for(path) [](#method-i-file_uri_for)

## gem_bin() [](#method-i-gem_bin)

## gem_cmd() [](#method-i-gem_cmd)

## gem_repo1(*args) [](#method-i-gem_repo1)

## gem_repo2(*args) [](#method-i-gem_repo2)

## gem_repo3(*args) [](#method-i-gem_repo3)

## gem_repo4(*args) [](#method-i-gem_repo4)

## gem_repo_missing(*args) [](#method-i-gem_repo_missing)

## gemspec() [](#method-i-gemspec)

## gemspec_dir() [](#method-i-gemspec_dir)

## git_root() [](#method-i-git_root)

## global_plugin_gem(*args) [](#method-i-global_plugin_gem)

## home(*path) [](#method-i-home)

## initialize(opts{}) [](#method-i-initialize)

**@return** [TheBundle] a new instance of TheBundle

## installed_bindir() [](#method-i-installed_bindir)

## lib_dir() [](#method-i-lib_dir)

## lib_path(*args) [](#method-i-lib_path)

## lib_tracked_files() [](#method-i-lib_tracked_files)

## loaded_gemspec() [](#method-i-loaded_gemspec)

## local_gem_path(*path, base:bundled_app) [](#method-i-local_gem_path)

## local_plugin_gem(*args) [](#method-i-local_plugin_gem)

## locked?() [](#method-i-locked?)

**@return** [Boolean] 

## locked_gems() [](#method-i-locked_gems)

## lockfile() [](#method-i-lockfile)

## man_dir() [](#method-i-man_dir)

## man_tracked_files() [](#method-i-man_tracked_files)

## path() [](#method-i-path)

## pristine_system_gem_path() [](#method-i-pristine_system_gem_path)

## rake_path() [](#method-i-rake_path)

## relative_gemspec() [](#method-i-relative_gemspec)

## replace_required_ruby_version(version, dir:) [](#method-i-replace_required_ruby_version)

## replace_version_file(version, dir:source_root) [](#method-i-replace_version_file)

## root() [](#method-i-root)

## rubocop_gemfile() [](#method-i-rubocop_gemfile)

## rubocop_gems() [](#method-i-rubocop_gems)

## ruby_core?() [](#method-i-ruby_core?)

**@return** [Boolean] 

## scope() [](#method-i-scope)

## scoped_gem_path(base) [](#method-i-scoped_gem_path)

## security_repo(*args) [](#method-i-security_repo)

## shipped_files() [](#method-i-shipped_files)

## source_lib_dir() [](#method-i-source_lib_dir)

## source_root() [](#method-i-source_root)

## spec_dir() [](#method-i-spec_dir)

## standard_gemfile() [](#method-i-standard_gemfile)

## standard_gems() [](#method-i-standard_gems)

## system_gem_path(*path) [](#method-i-system_gem_path)

## test_env_version() [](#method-i-test_env_version)
Bump this version whenever you make a breaking change to the spec setup that
requires regenerating tmp/.

## test_gemfile() [](#method-i-test_gemfile)

## tmp(*path) [](#method-i-tmp)

## tmp_root(scope) [](#method-i-tmp_root)

## tmpdir(*args) [](#method-i-tmpdir)

## to_s() [](#method-i-to_s)

## tracked_files() [](#method-i-tracked_files)

## vendored_gems(pathnil) [](#method-i-vendored_gems)

