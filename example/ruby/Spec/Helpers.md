# Module: Spec::Helpers
    
**Includes:** Spec::Options, Spec::Path, Spec::Subprocess
  



# Class Methods
## extended(mod ) [](#method-c-extended)
**@private** [] 

## install_dev_bundler() [](#method-c-install_dev_bundler)

#Instance Methods
## all_commands_output() [](#method-i-all_commands_output)

## base_system_gem_path() [](#method-i-base_system_gem_path)

## base_system_gems() [](#method-i-base_system_gems)

## bindir() [](#method-i-bindir)

## break_git!() [](#method-i-break_git!)

## build_ruby_cmd(options{}) [](#method-i-build_ruby_cmd)

## bundle(cmd, options{}, &block) [](#method-i-bundle)

## bundled_app(*path) [](#method-i-bundled_app)

## bundled_app2(*path) [](#method-i-bundled_app2)

## bundled_app_gemfile() [](#method-i-bundled_app_gemfile)

## bundled_app_lock() [](#method-i-bundled_app_lock)

## bundler(cmd, options{}) [](#method-i-bundler)

## cache_gems(*gems, gem_repo:gem_repo1) [](#method-i-cache_gems)

## cached_gem(path) [](#method-i-cached_gem)

## command_executions() [](#method-i-command_executions)

## config(confignil, pathbundled_app(".bundle/config")) [](#method-i-config)

## create_file(path, contents"") [](#method-i-create_file)

## current_ruby_minor() [](#method-i-current_ruby_minor)

## default_bundle_path(*path) [](#method-i-default_bundle_path)

## default_cache_path(*path) [](#method-i-default_cache_path)

## deprecations() [](#method-i-deprecations)

## dev_gemfile() [](#method-i-dev_gemfile)

## err() [](#method-i-err)

## err_without_deprecations() [](#method-i-err_without_deprecations)

## exit_status_for_signal(signal_number) [](#method-i-exit_status_for_signal)

## exitstatus() [](#method-i-exitstatus)

## file_uri_for(path) [](#method-i-file_uri_for)

## find_unused_port() [](#method-i-find_unused_port)

## gem_bin() [](#method-i-gem_bin)

## gem_cmd() [](#method-i-gem_cmd)

## gem_command(command, options{}) [](#method-i-gem_command)

## gem_repo1(*args) [](#method-i-gem_repo1)

## gem_repo2(*args) [](#method-i-gem_repo2)

## gem_repo3(*args) [](#method-i-gem_repo3)

## gem_repo4(*args) [](#method-i-gem_repo4)

## gem_repo_missing(*args) [](#method-i-gem_repo_missing)

## gembin(cmd, options{}) [](#method-i-gembin)

## gemfile(*args) [](#method-i-gemfile)

## gemspec() [](#method-i-gemspec)

## gemspec_dir() [](#method-i-gemspec_dir)

## git(cmd, pathDir.pwd, options{}) [](#method-i-git)

## git_root() [](#method-i-git_root)

## global_config(confignil) [](#method-i-global_config)

## global_plugin_gem(*args) [](#method-i-global_plugin_gem)

## home(*path) [](#method-i-home)

## install_gem(path, install_dir, defaultfalse) [](#method-i-install_gem)

## install_gemfile(*args) [](#method-i-install_gemfile)

## installed_bindir() [](#method-i-installed_bindir)

## last_command() [](#method-i-last_command)

## lib_dir() [](#method-i-lib_dir)

## lib_path(*args) [](#method-i-lib_path)

## lib_tracked_files() [](#method-i-lib_tracked_files)

## load_error_ruby(ruby, name, opts{}) [](#method-i-load_error_ruby)

## load_error_run(ruby, name, *args) [](#method-i-load_error_run)

## loaded_gemspec() [](#method-i-loaded_gemspec)

## local_gem_path(*path, base:bundled_app) [](#method-i-local_gem_path)

## local_plugin_gem(*args) [](#method-i-local_plugin_gem)

## lock_gemfile(*args) [](#method-i-lock_gemfile)

## lockfile(*args) [](#method-i-lockfile)

## main_source(dir) [](#method-i-main_source)

## man_dir() [](#method-i-man_dir)

## man_tracked_files() [](#method-i-man_tracked_files)

## next_ruby_minor() [](#method-i-next_ruby_minor)

## opt_add(option, options) [](#method-i-opt_add)

## opt_remove(option, options) [](#method-i-opt_remove)

## out() [](#method-i-out)

## path() [](#method-i-path)

## prepare_gemspec(pathname) [](#method-i-prepare_gemspec)
Simulate replacing TODOs with real values

## previous_ruby_minor() [](#method-i-previous_ruby_minor)

## pristine_system_gem_path() [](#method-i-pristine_system_gem_path)

## pristine_system_gems(*gems) [](#method-i-pristine_system_gems)

## process_file(pathname) [](#method-i-process_file)

## rake() [](#method-i-rake)

## rake_path() [](#method-i-rake_path)

## read_bundled_app_file(file) [](#method-i-read_bundled_app_file)

## read_gemfile(file"Gemfile") [](#method-i-read_gemfile)

## read_lockfile(file"Gemfile.lock") [](#method-i-read_lockfile)

## read_stream(stream, handler, timeout:) [](#method-i-read_stream)
Mostly copied from
https://github.com/piotrmurach/tty-command/blob/49c37a895ccea107e8b78d20e4cb29
de6a1a53c8/lib/tty/command/process_runner.rb#L165-L193

## realworld_system_gems(*gems) [](#method-i-realworld_system_gems)

## relative_gemspec() [](#method-i-relative_gemspec)

## replace_required_ruby_version(version, dir:) [](#method-i-replace_required_ruby_version)

## replace_version_file(version, dir:source_root) [](#method-i-replace_version_file)

## require_rack() [](#method-i-require_rack)

## reset!() [](#method-i-reset!)

## reset_paths!() [](#method-i-reset_paths!)

## revision_for(path) [](#method-i-revision_for)

## root() [](#method-i-root)

## rubocop_gemfile() [](#method-i-rubocop_gemfile)

## rubocop_gems() [](#method-i-rubocop_gems)

## ruby(ruby, options{}) [](#method-i-ruby)

## ruby_core?() [](#method-i-ruby_core?)

**@return** [Boolean] 

## ruby_major_minor() [](#method-i-ruby_major_minor)

## run(cmd, *args) [](#method-i-run)

## scope() [](#method-i-scope)

## scoped_gem_path(base) [](#method-i-scoped_gem_path)

## security_repo(*args) [](#method-i-security_repo)

## sh(cmd, options{}) [](#method-i-sh)

## shipped_files() [](#method-i-shipped_files)

## simulate_new_machine() [](#method-i-simulate_new_machine)

## simulate_platform(platform) [](#method-i-simulate_platform)

## simulate_ruby_platform(ruby_platform) [](#method-i-simulate_ruby_platform)

## simulate_windows(platformx86_mswin32) [](#method-i-simulate_windows)

## source_lib_dir() [](#method-i-source_lib_dir)

## source_root() [](#method-i-source_root)

## spec_dir() [](#method-i-spec_dir)

## standard_gemfile() [](#method-i-standard_gemfile)

## standard_gems() [](#method-i-standard_gems)

## strip_whitespace(str) [](#method-i-strip_whitespace)

## sys_exec(cmd, options{}, &block) [](#method-i-sys_exec)

## system_gem_path(*path) [](#method-i-system_gem_path)

## system_gems(*gems) [](#method-i-system_gems)

## test_env_version() [](#method-i-test_env_version)
Bump this version whenever you make a breaking change to the spec setup that
requires regenerating tmp/.

## test_gemfile() [](#method-i-test_gemfile)

## the_bundle(*args) [](#method-i-the_bundle)

## tmp(*path) [](#method-i-tmp)

## tmp_root(scope) [](#method-i-tmp_root)

## tmpdir(*args) [](#method-i-tmpdir)

## tracked_files() [](#method-i-tracked_files)

## vendored_gems(pathnil) [](#method-i-vendored_gems)

## wait_for_server(host, port, seconds15) [](#method-i-wait_for_server)

## with_built_bundler(versionnil, &block) [](#method-i-with_built_bundler)

## with_env_vars(env_hash, &block) [](#method-i-with_env_vars)

## with_fake_man() [](#method-i-with_fake_man)

## with_gem_path_as(path) [](#method-i-with_gem_path_as)

## with_path_added(path) [](#method-i-with_path_added)

## with_path_as(path) [](#method-i-with_path_as)

## with_read_only(pattern) [](#method-i-with_read_only)

## without_env_side_effects() [](#method-i-without_env_side_effects)

