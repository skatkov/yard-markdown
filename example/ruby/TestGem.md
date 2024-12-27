# Class: TestGem
**Inherits:** Gem::TestCase
    




#Instance Methods
## assert_self_install_permissions(format_executable:false, data_mode:0o640) [](#method-i-assert_self_install_permissions)

## setup() [](#method-i-setup)

## test_activate_bin_path_does_not_error_if_a_gem_thats_not_finally_activated_has_orphaned_dependencies() [](#method-i-test_activate_bin_path_does_not_error_if_a_gem_thats_not_finally_activated_has_orphaned_dependencies)

## test_activate_bin_path_gives_proper_error_for_bundler_when_underscore_selection_given() [](#method-i-test_activate_bin_path_gives_proper_error_for_bundler_when_underscore_selection_given)

## test_activate_bin_path_in_debug_mode() [](#method-i-test_activate_bin_path_in_debug_mode)

## test_activate_bin_path_raises_a_meaningful_error_if_a_gem_thats_finally_activated_has_orphaned_dependencies() [](#method-i-test_activate_bin_path_raises_a_meaningful_error_if_a_gem_thats_finally_activated_has_orphaned_dependencies)

## test_activate_bin_path_resolves_eagerly() [](#method-i-test_activate_bin_path_resolves_eagerly)

## test_activate_bin_path_respects_underscore_selection_if_given() [](#method-i-test_activate_bin_path_respects_underscore_selection_if_given)

## test_activate_bin_path_selects_exact_bundler_version_if_present() [](#method-i-test_activate_bin_path_selects_exact_bundler_version_if_present)

## test_activated_specs_does_not_cause_duplicates_when_looping_through_specs() [](#method-i-test_activated_specs_does_not_cause_duplicates_when_looping_through_specs)

## test_data_home_default() [](#method-i-test_data_home_default)

## test_data_home_from_env() [](#method-i-test_data_home_from_env)

## test_default_path() [](#method-i-test_default_path)

## test_default_path_missing_vendor() [](#method-i-test_default_path_missing_vendor)

## test_default_path_user_home() [](#method-i-test_default_path_user_home)

## test_default_path_vendor_dir() [](#method-i-test_default_path_vendor_dir)

## test_default_source_date_epoch_doesnt_change() [](#method-i-test_default_source_date_epoch_doesnt_change)
Ensure that `Gem.source_date_epoch` is consistent even if $SOURCE_DATE_EPOCH
has not been set.

## test_deprecated_paths=() [](#method-i-test_deprecated_paths=)

## test_gem_path_ordering() [](#method-i-test_gem_path_ordering)

## test_gem_path_ordering_short() [](#method-i-test_gem_path_ordering_short)

## test_load_env_plugins() [](#method-i-test_load_env_plugins)

## test_load_plugins() [](#method-i-test_load_plugins)

## test_load_user_installed_plugins() [](#method-i-test_load_user_installed_plugins)

## test_operating_system_defaults() [](#method-i-test_operating_system_defaults)

## test_platform_defaults() [](#method-i-test_platform_defaults)

## test_register_default_spec() [](#method-i-test_register_default_spec)

## test_register_default_spec_old_style_with_folder_starting_with_lib() [](#method-i-test_register_default_spec_old_style_with_folder_starting_with_lib)

## test_require_does_not_glob() [](#method-i-test_require_does_not_glob)

## test_require_missing() [](#method-i-test_require_missing)

## test_self_activate_bin_path_no_exec_name() [](#method-i-test_self_activate_bin_path_no_exec_name)

## test_self_bin_path_active() [](#method-i-test_self_bin_path_active)

## test_self_bin_path_bin_file_gone_in_latest() [](#method-i-test_self_bin_path_bin_file_gone_in_latest)

## test_self_bin_path_bin_name() [](#method-i-test_self_bin_path_bin_name)

## test_self_bin_path_bin_name_version() [](#method-i-test_self_bin_path_bin_name_version)

## test_self_bin_path_no_bin_file() [](#method-i-test_self_bin_path_no_bin_file)

## test_self_bin_path_no_exec_name() [](#method-i-test_self_bin_path_no_exec_name)

## test_self_bin_path_nonexistent_binfile() [](#method-i-test_self_bin_path_nonexistent_binfile)

## test_self_bin_path_not_found() [](#method-i-test_self_bin_path_not_found)

## test_self_bin_path_picking_newest() [](#method-i-test_self_bin_path_picking_newest)

## test_self_bindir() [](#method-i-test_self_bindir)

## test_self_bindir_default_dir() [](#method-i-test_self_bindir_default_dir)

## test_self_clear_paths() [](#method-i-test_self_clear_paths)

## test_self_configuration() [](#method-i-test_self_configuration)

## test_self_datadir() [](#method-i-test_self_datadir)

## test_self_datadir_nonexistent_package() [](#method-i-test_self_datadir_nonexistent_package)

## test_self_default_exec_format() [](#method-i-test_self_default_exec_format)

## test_self_default_exec_format_18() [](#method-i-test_self_default_exec_format_18)

## test_self_default_exec_format_jruby() [](#method-i-test_self_default_exec_format_jruby)

## test_self_default_sources() [](#method-i-test_self_default_sources)

## test_self_dir() [](#method-i-test_self_dir)

## test_self_done_installing() [](#method-i-test_self_done_installing)

## test_self_ensure_gem_directories() [](#method-i-test_self_ensure_gem_directories)

## test_self_ensure_gem_directories_missing_parents() [](#method-i-test_self_ensure_gem_directories_missing_parents)

## test_self_ensure_gem_directories_non_existent_paths() [](#method-i-test_self_ensure_gem_directories_non_existent_paths)

## test_self_ensure_gem_directories_permissions() [](#method-i-test_self_ensure_gem_directories_permissions)

## test_self_ensure_gem_directories_safe_permissions() [](#method-i-test_self_ensure_gem_directories_safe_permissions)

## test_self_ensure_gem_directories_write_protected() [](#method-i-test_self_ensure_gem_directories_write_protected)

## test_self_ensure_gem_directories_write_protected_parents() [](#method-i-test_self_ensure_gem_directories_write_protected_parents)

## test_self_env_requirement() [](#method-i-test_self_env_requirement)

## test_self_extension_dir_shared() [](#method-i-test_self_extension_dir_shared)

## test_self_extension_dir_static() [](#method-i-test_self_extension_dir_static)

## test_self_find_files() [](#method-i-test_self_find_files)

## test_self_find_latest_files() [](#method-i-test_self_find_latest_files)

## test_self_finish_resolve() [](#method-i-test_self_finish_resolve)

## test_self_finish_resolve_respects_loaded_specs() [](#method-i-test_self_finish_resolve_respects_loaded_specs)

## test_self_finish_resolve_wtf() [](#method-i-test_self_finish_resolve_wtf)

## test_self_gunzip() [](#method-i-test_self_gunzip)

## test_self_gzip() [](#method-i-test_self_gzip)

## test_self_install() [](#method-i-test_self_install)

## test_self_install_in_rescue() [](#method-i-test_self_install_in_rescue)

## test_self_install_permissions() [](#method-i-test_self_install_permissions)

## test_self_install_permissions_umask_0() [](#method-i-test_self_install_permissions_umask_0)

## test_self_install_permissions_umask_077() [](#method-i-test_self_install_permissions_umask_077)

## test_self_install_permissions_with_format_executable() [](#method-i-test_self_install_permissions_with_format_executable)

## test_self_install_permissions_with_format_executable_and_non_standard_ruby_install_name() [](#method-i-test_self_install_permissions_with_format_executable_and_non_standard_ruby_install_name)

## test_self_latest_rubygems_version() [](#method-i-test_self_latest_rubygems_version)

## test_self_latest_spec_for() [](#method-i-test_self_latest_spec_for)

## test_self_latest_spec_for_multiple_sources() [](#method-i-test_self_latest_spec_for_multiple_sources)

## test_self_latest_version_for() [](#method-i-test_self_latest_version_for)

## test_self_latest_version_for_multiple_sources() [](#method-i-test_self_latest_version_for_multiple_sources)

## test_self_loaded_specs() [](#method-i-test_self_loaded_specs)

## test_self_needs() [](#method-i-test_self_needs)

## test_self_needs_picks_up_unresolved_deps() [](#method-i-test_self_needs_picks_up_unresolved_deps)

## test_self_path() [](#method-i-test_self_path)

## test_self_path_ENV_PATH() [](#method-i-test_self_path_ENV_PATH)

## test_self_path_default() [](#method-i-test_self_path_default)

## test_self_path_duplicate() [](#method-i-test_self_path_duplicate)

## test_self_path_overlap() [](#method-i-test_self_path_overlap)

## test_self_paths_eq() [](#method-i-test_self_paths_eq)

## test_self_paths_eq_nonexistent_home() [](#method-i-test_self_paths_eq_nonexistent_home)

## test_self_platforms() [](#method-i-test_self_platforms)

## test_self_post_build() [](#method-i-test_self_post_build)

## test_self_post_install() [](#method-i-test_self_post_install)

## test_self_post_reset() [](#method-i-test_self_post_reset)

## test_self_post_uninstall() [](#method-i-test_self_post_uninstall)

## test_self_pre_install() [](#method-i-test_self_pre_install)

## test_self_pre_reset() [](#method-i-test_self_pre_reset)

## test_self_pre_uninstall() [](#method-i-test_self_pre_uninstall)

## test_self_prefix() [](#method-i-test_self_prefix)

## test_self_prefix_libdir() [](#method-i-test_self_prefix_libdir)

## test_self_prefix_sitelibdir() [](#method-i-test_self_prefix_sitelibdir)

## test_self_read_binary() [](#method-i-test_self_read_binary)

## test_self_refresh() [](#method-i-test_self_refresh)

## test_self_refresh_keeps_loaded_specs_activated() [](#method-i-test_self_refresh_keeps_loaded_specs_activated)

## test_self_ruby_api_version() [](#method-i-test_self_ruby_api_version)

## test_self_ruby_escaping_spaces_in_path() [](#method-i-test_self_ruby_escaping_spaces_in_path)

## test_self_ruby_path_without_spaces() [](#method-i-test_self_ruby_path_without_spaces)

## test_self_ruby_version_with_git_master() [](#method-i-test_self_ruby_version_with_git_master)

## test_self_ruby_version_with_git_prerelease() [](#method-i-test_self_ruby_version_with_git_prerelease)

## test_self_ruby_version_with_non_mri_implementations() [](#method-i-test_self_ruby_version_with_non_mri_implementations)

## test_self_ruby_version_with_non_mri_implementations_with_mri_prerelase_compatibility() [](#method-i-test_self_ruby_version_with_non_mri_implementations_with_mri_prerelase_compatibility)

## test_self_ruby_version_with_svn_prerelease() [](#method-i-test_self_ruby_version_with_svn_prerelease)

## test_self_ruby_version_with_svn_trunk() [](#method-i-test_self_ruby_version_with_svn_trunk)

## test_self_rubygems_version() [](#method-i-test_self_rubygems_version)

## test_self_sources() [](#method-i-test_self_sources)

## test_self_try_activate_missing_dep() [](#method-i-test_self_try_activate_missing_dep)

## test_self_try_activate_missing_extensions() [](#method-i-test_self_try_activate_missing_extensions)

## test_self_try_activate_missing_prerelease() [](#method-i-test_self_try_activate_missing_prerelease)

## test_self_use_paths() [](#method-i-test_self_use_paths)

## test_self_use_paths_with_nils() [](#method-i-test_self_use_paths_with_nils)

## test_self_user_dir() [](#method-i-test_self_user_dir)

## test_self_user_home() [](#method-i-test_self_user_home)

## test_self_vendor_dir() [](#method-i-test_self_vendor_dir)

## test_self_vendor_dir_ENV_GEM_VENDOR() [](#method-i-test_self_vendor_dir_ENV_GEM_VENDOR)

## test_self_vendor_dir_missing() [](#method-i-test_self_vendor_dir_missing)

## test_setting_paths_does_not_mutate_parameter_object() [](#method-i-test_setting_paths_does_not_mutate_parameter_object)

## test_setting_paths_does_not_warn_about_unknown_keys() [](#method-i-test_setting_paths_does_not_warn_about_unknown_keys)

## test_spec_order_is_consistent() [](#method-i-test_spec_order_is_consistent)

## test_state_home_default() [](#method-i-test_state_home_default)

## test_state_home_from_env() [](#method-i-test_state_home_from_env)

## test_try_activate_returns_true_for_activated_specs() [](#method-i-test_try_activate_returns_true_for_activated_specs)

