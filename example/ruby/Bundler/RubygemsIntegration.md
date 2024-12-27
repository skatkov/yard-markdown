# Class: Bundler::RubygemsIntegration
**Inherits:** Object
    




#Instance Methods
## add_default_gems_to(specs) [](#method-i-add_default_gems_to)
Add default gems not already present in specs, and return them as a hash.

## all_specs() [](#method-i-all_specs)

## bin_path(gem, bin, ver) [](#method-i-bin_path)

## build(spec, skip_validationfalse) [](#method-i-build)

## build_args() [](#method-i-build_args)

## build_args=(args) [](#method-i-build_args=)

## build_gem(gem_dir, spec) [](#method-i-build_gem)

## clear_paths() [](#method-i-clear_paths)

## default_specs() [](#method-i-default_specs)

## default_stubs() [](#method-i-default_stubs)

## download_gem(spec, uri, cache_dir, fetcher) [](#method-i-download_gem)

## ext_lock() [](#method-i-ext_lock)

## fetch_all_remote_specs(remote, gem_remote_fetcher) [](#method-i-fetch_all_remote_specs)

## fetch_specs(remote, name, fetcher) [](#method-i-fetch_specs)

## find_bundler(version) [](#method-i-find_bundler)

## find_name(name) [](#method-i-find_name)

## gem_bindir() [](#method-i-gem_bindir)

## gem_cache() [](#method-i-gem_cache)

## gem_dir() [](#method-i-gem_dir)

## gem_path() [](#method-i-gem_path)

## inflate(obj) [](#method-i-inflate)

## initialize() [](#method-i-initialize)

**@return** [RubygemsIntegration] a new instance of RubygemsIntegration

## installed_specs() [](#method-i-installed_specs)

## load_env_plugins() [](#method-i-load_env_plugins)

## load_plugin_files(plugin_files) [](#method-i-load_plugin_files)

## load_plugins() [](#method-i-load_plugins)

## loaded_gem_paths() [](#method-i-loaded_gem_paths)

## loaded_specs(name) [](#method-i-loaded_specs)

## mark_loaded(spec) [](#method-i-mark_loaded)

## marshal_spec_dir() [](#method-i-marshal_spec_dir)

## method_visibility(klass, method) [](#method-i-method_visibility)

## path(obj) [](#method-i-path)

## path_separator() [](#method-i-path_separator)

## plain_specs() [](#method-i-plain_specs)

## plain_specs=(specs) [](#method-i-plain_specs=)

## post_reset_hooks() [](#method-i-post_reset_hooks)

## provides?(req_str) [](#method-i-provides?)

**@return** [Boolean] 

## read_binary(path) [](#method-i-read_binary)

## redefine_method(klass, method, unbound_methodnil, &block) [](#method-i-redefine_method)

## replace_bin_path(specs_by_name) [](#method-i-replace_bin_path)
Used to give better error messages when activating specs outside of the
current bundle

## replace_entrypoints(specs) [](#method-i-replace_entrypoints)
Replace or hook into RubyGems to provide a bundlerized view of the world.

## replace_gem(specs, specs_by_name) [](#method-i-replace_gem)

## reset() [](#method-i-reset)

## reverse_rubygems_kernel_mixin() [](#method-i-reverse_rubygems_kernel_mixin)

## ruby_engine() [](#method-i-ruby_engine)

## security_policies() [](#method-i-security_policies)

## security_policy_keys() [](#method-i-security_policy_keys)

## set_target_rbconfig(path) [](#method-i-set_target_rbconfig)

## spec_cache_dirs() [](#method-i-spec_cache_dirs)

## spec_from_gem(path) [](#method-i-spec_from_gem)

## stub_rubygems(specs) [](#method-i-stub_rubygems)

## stub_set_spec(stub, spec) [](#method-i-stub_set_spec)

## suffix_pattern() [](#method-i-suffix_pattern)

## ui=(obj) [](#method-i-ui=)

## undo_replacements() [](#method-i-undo_replacements)

## user_home() [](#method-i-user_home)

## validate(spec) [](#method-i-validate)

## version() [](#method-i-version)

