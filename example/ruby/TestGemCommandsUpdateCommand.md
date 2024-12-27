# Class: TestGemCommandsUpdateCommand
**Inherits:** Gem::TestCase
    




#Instance Methods
## setup() [](#method-i-setup)

## test_execute() [](#method-i-test_execute)

## test_execute_dependencies() [](#method-i-test_execute_dependencies)
before:
    a1 -> c1.2

after:
    a2 -> b2 # new dependency
    a2 -> c2

## test_execute_multiple() [](#method-i-test_execute_multiple)

## test_execute_named() [](#method-i-test_execute_named)

## test_execute_named_not_installed_and_no_update() [](#method-i-test_execute_named_not_installed_and_no_update)

## test_execute_named_some_up_to_date() [](#method-i-test_execute_named_some_up_to_date)

## test_execute_named_up_to_date() [](#method-i-test_execute_named_up_to_date)

## test_execute_named_up_to_date_prerelease() [](#method-i-test_execute_named_up_to_date_prerelease)

## test_execute_rdoc() [](#method-i-test_execute_rdoc)

## test_execute_system() [](#method-i-test_execute_system)

## test_execute_system_at_latest() [](#method-i-test_execute_system_at_latest)

## test_execute_system_multiple() [](#method-i-test_execute_system_multiple)

## test_execute_system_silent() [](#method-i-test_execute_system_silent)

## test_execute_system_silent_passed_to_setuprb() [](#method-i-test_execute_system_silent_passed_to_setuprb)
The other style of `gem update --system` tests don't actually run setup.rb, so
we just check that setup.rb gets the `--silent` flag.

## test_execute_system_specific() [](#method-i-test_execute_system_specific)

## test_execute_system_specific_newer_than_or_equal_to_3_2_leaves_plugins_dir_alone() [](#method-i-test_execute_system_specific_newer_than_or_equal_to_3_2_leaves_plugins_dir_alone)

## test_execute_system_specific_older_than_3_2_removes_plugins_dir() [](#method-i-test_execute_system_specific_older_than_3_2_removes_plugins_dir)

## test_execute_system_specific_older_than_minimum_supported_rubygems() [](#method-i-test_execute_system_specific_older_than_minimum_supported_rubygems)

## test_execute_system_specifically_to_latest_version() [](#method-i-test_execute_system_specifically_to_latest_version)

## test_execute_system_update_installed() [](#method-i-test_execute_system_update_installed)

## test_execute_system_update_installed_in_non_default_gem_path() [](#method-i-test_execute_system_update_installed_in_non_default_gem_path)

## test_execute_system_when_latest_does_not_support_your_ruby() [](#method-i-test_execute_system_when_latest_does_not_support_your_ruby)

## test_execute_system_when_latest_does_not_support_your_ruby_but_previous_one_does() [](#method-i-test_execute_system_when_latest_does_not_support_your_ruby_but_previous_one_does)

## test_execute_system_with_disabled_update() [](#method-i-test_execute_system_with_disabled_update)

## test_execute_system_with_gems() [](#method-i-test_execute_system_with_gems)

## test_execute_up_to_date() [](#method-i-test_execute_up_to_date)

## test_execute_user_install() [](#method-i-test_execute_user_install)

## test_explain() [](#method-i-test_explain)

## test_explain_platform_local() [](#method-i-test_explain_platform_local)

## test_explain_platform_ruby() [](#method-i-test_explain_platform_ruby)

## test_fetch_remote_gems() [](#method-i-test_fetch_remote_gems)

## test_fetch_remote_gems_error() [](#method-i-test_fetch_remote_gems_error)

## test_fetch_remote_gems_mismatch() [](#method-i-test_fetch_remote_gems_mismatch)

## test_fetch_remote_gems_prerelease() [](#method-i-test_fetch_remote_gems_prerelease)

## test_handle_options_system() [](#method-i-test_handle_options_system)

## test_handle_options_system_non_version() [](#method-i-test_handle_options_system_non_version)

## test_handle_options_system_specific() [](#method-i-test_handle_options_system_specific)

## test_update_gem_prerelease() [](#method-i-test_update_gem_prerelease)

## test_update_gem_unresolved_dependency() [](#method-i-test_update_gem_unresolved_dependency)

## test_update_rubygems_arguments() [](#method-i-test_update_rubygems_arguments)

