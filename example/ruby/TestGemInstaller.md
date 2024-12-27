# Class: TestGemInstaller
**Inherits:** Gem::InstallerTestCase
    



# Attributes
## plugin_loaded[RW] [](#attribute-c-plugin_loaded)
Returns the value of attribute plugin_loaded.

## post_install_is_called[RW] [](#attribute-c-post_install_is_called)
Returns the value of attribute post_install_is_called.


#Instance Methods
## get_bin_env() [](#method-i-get_bin_env)

## setup() [](#method-i-setup)

## teardown() [](#method-i-teardown)

## test_app_script_text() [](#method-i-test_app_script_text)

## test_check_executable_overwrite() [](#method-i-test_check_executable_overwrite)

## test_check_executable_overwrite_default_bin_dir() [](#method-i-test_check_executable_overwrite_default_bin_dir)

## test_check_executable_overwrite_format_executable() [](#method-i-test_check_executable_overwrite_format_executable)

## test_check_executable_overwrite_other_gem() [](#method-i-test_check_executable_overwrite_other_gem)

## test_check_executable_overwrite_other_gem_force() [](#method-i-test_check_executable_overwrite_other_gem_force)

## test_check_executable_overwrite_other_non_gem() [](#method-i-test_check_executable_overwrite_other_non_gem)

## test_check_that_user_bin_dir_is_in_path() [](#method-i-test_check_that_user_bin_dir_is_in_path)

## test_check_that_user_bin_dir_is_in_path_not_in_path() [](#method-i-test_check_that_user_bin_dir_is_in_path_not_in_path)

## test_check_that_user_bin_dir_is_in_path_tilde() [](#method-i-test_check_that_user_bin_dir_is_in_path_tilde)

## test_conflicting_binstubs() [](#method-i-test_conflicting_binstubs)

## test_default_gem_loaded_from() [](#method-i-test_default_gem_loaded_from)

## test_default_gem_to_specific_install_dir() [](#method-i-test_default_gem_to_specific_install_dir)

## test_default_gem_with_exe_as_bindir() [](#method-i-test_default_gem_with_exe_as_bindir)

## test_default_gem_with_wrappers() [](#method-i-test_default_gem_with_wrappers)

## test_default_gem_without_wrappers() [](#method-i-test_default_gem_without_wrappers)

## test_dir() [](#method-i-test_dir)

## test_ensure_dependency() [](#method-i-test_ensure_dependency)

## test_ensure_loadable_spec() [](#method-i-test_ensure_loadable_spec)

## test_ensure_loadable_spec_security_policy() [](#method-i-test_ensure_loadable_spec_security_policy)

## test_extract_files() [](#method-i-test_extract_files)

## test_find_lib_file_after_install() [](#method-i-test_find_lib_file_after_install)

## test_gem_attribute() [](#method-i-test_gem_attribute)

## test_generate_bin_bindir() [](#method-i-test_generate_bin_bindir)

## test_generate_bin_bindir_with_user_install_warning() [](#method-i-test_generate_bin_bindir_with_user_install_warning)

## test_generate_bin_script() [](#method-i-test_generate_bin_script)

## test_generate_bin_script_format() [](#method-i-test_generate_bin_script_format)

## test_generate_bin_script_format_disabled() [](#method-i-test_generate_bin_script_format_disabled)

## test_generate_bin_script_install_dir() [](#method-i-test_generate_bin_script_install_dir)

## test_generate_bin_script_no_execs() [](#method-i-test_generate_bin_script_no_execs)

## test_generate_bin_script_no_perms() [](#method-i-test_generate_bin_script_no_perms)

## test_generate_bin_script_no_shebang() [](#method-i-test_generate_bin_script_no_shebang)

## test_generate_bin_script_wrappers() [](#method-i-test_generate_bin_script_wrappers)

## test_generate_bin_symlink() [](#method-i-test_generate_bin_symlink)

## test_generate_bin_symlink_no_execs() [](#method-i-test_generate_bin_symlink_no_execs)

## test_generate_bin_symlink_no_perms() [](#method-i-test_generate_bin_symlink_no_perms)

## test_generate_bin_symlink_update_newer() [](#method-i-test_generate_bin_symlink_update_newer)

## test_generate_bin_symlink_update_older() [](#method-i-test_generate_bin_symlink_update_older)

## test_generate_bin_symlink_update_remove_wrapper() [](#method-i-test_generate_bin_symlink_update_remove_wrapper)

## test_generate_bin_symlink_win32() [](#method-i-test_generate_bin_symlink_win32)

## test_generate_bin_uses_default_shebang() [](#method-i-test_generate_bin_uses_default_shebang)

## test_generate_bin_with_dangling_symlink() [](#method-i-test_generate_bin_with_dangling_symlink)

## test_generate_plugins() [](#method-i-test_generate_plugins)

## test_generate_plugins_with_build_root() [](#method-i-test_generate_plugins_with_build_root)

## test_generate_plugins_with_install_dir() [](#method-i-test_generate_plugins_with_install_dir)

## test_generate_plugins_with_user_install() [](#method-i-test_generate_plugins_with_user_install)

## test_generates_plugins_dir_under_install_dir_if_not_there() [](#method-i-test_generates_plugins_dir_under_install_dir_if_not_there)

## test_initialize() [](#method-i-test_initialize)

## test_initialize_user_install() [](#method-i-test_initialize_user_install)

## test_initialize_user_install_bin_dir() [](#method-i-test_initialize_user_install_bin_dir)

## test_install() [](#method-i-test_install)

## test_install_build_root() [](#method-i-test_install_build_root)

## test_install_build_root_when_gem_home_not_writable_does_not_fallback_to_user_install_inside_build_root() [](#method-i-test_install_build_root_when_gem_home_not_writable_does_not_fallback_to_user_install_inside_build_root)

## test_install_creates_binstub_that_dont_trust_encoding() [](#method-i-test_install_creates_binstub_that_dont_trust_encoding)

## test_install_creates_binstub_that_prefers_user_installed_gem_to_default() [](#method-i-test_install_creates_binstub_that_prefers_user_installed_gem_to_default)

## test_install_creates_binstub_that_understand_version() [](#method-i-test_install_creates_binstub_that_understand_version)

## test_install_creates_working_binstub() [](#method-i-test_install_creates_working_binstub)

## test_install_dir_takes_precedence_to_user_install() [](#method-i-test_install_dir_takes_precedence_to_user_install)

## test_install_does_not_leave_lockfile_for_binstub() [](#method-i-test_install_does_not_leave_lockfile_for_binstub)

## test_install_extension_and_script() [](#method-i-test_install_extension_and_script)

## test_install_extension_clean_intermediate_files() [](#method-i-test_install_extension_clean_intermediate_files)

## test_install_extension_dir() [](#method-i-test_install_extension_dir)

## test_install_extension_dir_is_removed_on_reinstall() [](#method-i-test_install_extension_dir_is_removed_on_reinstall)

## test_install_extension_flat() [](#method-i-test_install_extension_flat)

## test_install_force() [](#method-i-test_install_force)

## test_install_missing_dirs() [](#method-i-test_install_missing_dirs)

## test_install_post_build_false() [](#method-i-test_install_post_build_false)

## test_install_post_build_nil() [](#method-i-test_install_post_build_nil)

## test_install_pre_install_false() [](#method-i-test_install_pre_install_false)

## test_install_pre_install_nil() [](#method-i-test_install_pre_install_nil)

## test_install_user_extension_dir() [](#method-i-test_install_user_extension_dir)

## test_install_with_message() [](#method-i-test_install_with_message)

## test_install_with_no_prior_files() [](#method-i-test_install_with_no_prior_files)

## test_install_with_skipped_message() [](#method-i-test_install_with_skipped_message)

## test_installation_satisfies_dependency_eh() [](#method-i-test_installation_satisfies_dependency_eh)

## test_installation_satisfies_dependency_eh_development() [](#method-i-test_installation_satisfies_dependency_eh_development)

## test_keeps_plugins_up_to_date() [](#method-i-test_keeps_plugins_up_to_date)

## test_leaves_no_empty_cached_spec_when_no_more_disk_space() [](#method-i-test_leaves_no_empty_cached_spec_when_no_more_disk_space)

## test_package_attribute() [](#method-i-test_package_attribute)

## test_pre_install_checks_dependencies() [](#method-i-test_pre_install_checks_dependencies)

## test_pre_install_checks_dependencies_ignore() [](#method-i-test_pre_install_checks_dependencies_ignore)

## test_pre_install_checks_dependencies_install_dir() [](#method-i-test_pre_install_checks_dependencies_install_dir)

## test_pre_install_checks_malicious_dependencies_before_eval() [](#method-i-test_pre_install_checks_malicious_dependencies_before_eval)

## test_pre_install_checks_malicious_extensions_before_eval() [](#method-i-test_pre_install_checks_malicious_extensions_before_eval)

## test_pre_install_checks_malicious_name() [](#method-i-test_pre_install_checks_malicious_name)

## test_pre_install_checks_malicious_name_before_eval() [](#method-i-test_pre_install_checks_malicious_name_before_eval)

## test_pre_install_checks_malicious_platform_before_eval() [](#method-i-test_pre_install_checks_malicious_platform_before_eval)

## test_pre_install_checks_malicious_require_paths_before_eval() [](#method-i-test_pre_install_checks_malicious_require_paths_before_eval)

## test_pre_install_checks_malicious_specification_version_before_eval() [](#method-i-test_pre_install_checks_malicious_specification_version_before_eval)

## test_process_options() [](#method-i-test_process_options)

## test_process_options_build_root() [](#method-i-test_process_options_build_root)

## test_process_options_does_not_fallback_to_user_install_when_gem_home_not_writable_and_no_user_install() [](#method-i-test_process_options_does_not_fallback_to_user_install_when_gem_home_not_writable_and_no_user_install)

## test_process_options_fallback_to_user_install_when_gem_home_not_writable() [](#method-i-test_process_options_fallback_to_user_install_when_gem_home_not_writable)

## test_shebang() [](#method-i-test_shebang)

## test_shebang_arguments() [](#method-i-test_shebang_arguments)

## test_shebang_arguments_with_load_relative() [](#method-i-test_shebang_arguments_with_load_relative)

## test_shebang_custom() [](#method-i-test_shebang_custom)

## test_shebang_custom_with_expands() [](#method-i-test_shebang_custom_with_expands)

## test_shebang_custom_with_expands_and_arguments() [](#method-i-test_shebang_custom_with_expands_and_arguments)

## test_shebang_empty() [](#method-i-test_shebang_empty)

## test_shebang_env() [](#method-i-test_shebang_env)

## test_shebang_env_arguments() [](#method-i-test_shebang_env_arguments)

## test_shebang_env_arguments_with_load_relative() [](#method-i-test_shebang_env_arguments_with_load_relative)

## test_shebang_env_shebang() [](#method-i-test_shebang_env_shebang)

## test_shebang_nested() [](#method-i-test_shebang_nested)

## test_shebang_nested_arguments() [](#method-i-test_shebang_nested_arguments)

## test_shebang_nested_arguments_with_load_relative() [](#method-i-test_shebang_nested_arguments_with_load_relative)

## test_shebang_version() [](#method-i-test_shebang_version)

## test_shebang_version_arguments() [](#method-i-test_shebang_version_arguments)

## test_shebang_version_arguments_with_load_relative() [](#method-i-test_shebang_version_arguments_with_load_relative)

## test_shebang_version_env() [](#method-i-test_shebang_version_env)

## test_shebang_version_env_arguments() [](#method-i-test_shebang_version_env_arguments)

## test_shebang_version_env_arguments_with_load_relative() [](#method-i-test_shebang_version_env_arguments_with_load_relative)

## test_unpack() [](#method-i-test_unpack)

## test_use_plugin_immediately() [](#method-i-test_use_plugin_immediately)

## test_write_build_info_file() [](#method-i-test_write_build_info_file)

## test_write_build_info_file_empty() [](#method-i-test_write_build_info_file_empty)

## test_write_build_info_file_install_dir() [](#method-i-test_write_build_info_file_install_dir)

## test_write_cache_file() [](#method-i-test_write_cache_file)

## test_write_spec() [](#method-i-test_write_spec)

## test_write_spec_writes_cached_spec() [](#method-i-test_write_spec_writes_cached_spec)

