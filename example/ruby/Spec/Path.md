# Module: Spec::Path
  
**Extended by:** Spec::Path
    
**Includes:** Spec::Env
  



# Class Methods
## base_system_gem_path() [](#method-c-base_system_gem_path)
## base_system_gems() [](#method-c-base_system_gems)
## bindir() [](#method-c-bindir)
## bundled_app(*path ) [](#method-c-bundled_app)
## bundled_app2(*path ) [](#method-c-bundled_app2)
## bundled_app_gemfile() [](#method-c-bundled_app_gemfile)
## bundled_app_lock() [](#method-c-bundled_app_lock)
## cached_gem(path ) [](#method-c-cached_gem)
## default_bundle_path(*path ) [](#method-c-default_bundle_path)
## default_cache_path(*path ) [](#method-c-default_cache_path)
## dev_gemfile() [](#method-c-dev_gemfile)
## file_uri_for(path ) [](#method-c-file_uri_for)
## gem_bin() [](#method-c-gem_bin)
## gem_cmd() [](#method-c-gem_cmd)
## gem_repo1(*args ) [](#method-c-gem_repo1)
## gem_repo2(*args ) [](#method-c-gem_repo2)
## gem_repo3(*args ) [](#method-c-gem_repo3)
## gem_repo4(*args ) [](#method-c-gem_repo4)
## gem_repo_missing(*args ) [](#method-c-gem_repo_missing)
## gemspec() [](#method-c-gemspec)
## gemspec_dir() [](#method-c-gemspec_dir)
## git_root() [](#method-c-git_root)
## global_plugin_gem(*args ) [](#method-c-global_plugin_gem)
## home(*path ) [](#method-c-home)
## installed_bindir() [](#method-c-installed_bindir)
## lib_dir() [](#method-c-lib_dir)
## lib_path(*args ) [](#method-c-lib_path)
## lib_tracked_files() [](#method-c-lib_tracked_files)
## loaded_gemspec() [](#method-c-loaded_gemspec)
## local_gem_path(*path , base: bundled_app) [](#method-c-local_gem_path)
## local_plugin_gem(*args ) [](#method-c-local_plugin_gem)
## man_dir() [](#method-c-man_dir)
## man_tracked_files() [](#method-c-man_tracked_files)
## path() [](#method-c-path)
## pristine_system_gem_path() [](#method-c-pristine_system_gem_path)
## rake_path() [](#method-c-rake_path)
## relative_gemspec() [](#method-c-relative_gemspec)
## replace_required_ruby_version(version , dir: ) [](#method-c-replace_required_ruby_version)
## replace_version_file(version , dir: source_root) [](#method-c-replace_version_file)
## root() [](#method-c-root)
## rubocop_gemfile() [](#method-c-rubocop_gemfile)
## rubocop_gems() [](#method-c-rubocop_gems)
## ruby_core?() [](#method-c-ruby_core?)
**@return** [Boolean] 

## scope() [](#method-c-scope)
## scoped_gem_path(base ) [](#method-c-scoped_gem_path)
## security_repo(*args ) [](#method-c-security_repo)
## shipped_files() [](#method-c-shipped_files)
## source_lib_dir() [](#method-c-source_lib_dir)
## source_root() [](#method-c-source_root)
## spec_dir() [](#method-c-spec_dir)
## standard_gemfile() [](#method-c-standard_gemfile)
## standard_gems() [](#method-c-standard_gems)
## system_gem_path(*path ) [](#method-c-system_gem_path)
## test_env_version() [](#method-c-test_env_version)
Bump this version whenever you make a breaking change to the spec setup that
requires regenerating tmp/.
## test_gemfile() [](#method-c-test_gemfile)
## tmp(*path ) [](#method-c-tmp)
## tmp_root(scope ) [](#method-c-tmp_root)
## tmpdir(*args ) [](#method-c-tmpdir)
## tracked_files() [](#method-c-tracked_files)
## vendored_gems(path nil) [](#method-c-vendored_gems)

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

## installed_bindir() [](#method-i-installed_bindir)

## lib_dir() [](#method-i-lib_dir)

## lib_path(*args) [](#method-i-lib_path)

## lib_tracked_files() [](#method-i-lib_tracked_files)

## loaded_gemspec() [](#method-i-loaded_gemspec)

## local_gem_path(*path, base:bundled_app) [](#method-i-local_gem_path)

## local_plugin_gem(*args) [](#method-i-local_plugin_gem)

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

## tracked_files() [](#method-i-tracked_files)

## vendored_gems(pathnil) [](#method-i-vendored_gems)

