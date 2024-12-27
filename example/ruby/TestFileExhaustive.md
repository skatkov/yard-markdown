# Class: TestFileExhaustive
**Inherits:** Test::Unit::TestCase
    




#Instance Methods
## assert_bool_equal(expected, result, *messages) [](#method-i-assert_bool_equal)

## assert_incompatible_encoding() [](#method-i-assert_incompatible_encoding)

## assert_integer(n) [](#method-i-assert_integer)

## assert_integer_or_nil(n) [](#method-i-assert_integer_or_nil)

## assert_no_memory_leak_at_expand_path_home(arg, message) [](#method-i-assert_no_memory_leak_at_expand_path_home)

## blockdev() [](#method-i-blockdev)

## chardev() [](#method-i-chardev)

## fifo() [](#method-i-fifo)

## grpownedfile() [](#method-i-grpownedfile)

## hardlinkfile() [](#method-i-hardlinkfile)

## io_open(file_name) [](#method-i-io_open)

## make_file(content, file) [](#method-i-make_file)

## make_tmp_filename(prefix) [](#method-i-make_tmp_filename)

## nofile() [](#method-i-nofile)

## notownedfile() [](#method-i-notownedfile)

## path_identical_p(file) [](#method-i-path_identical_p)

## regular_file() [](#method-i-regular_file)

## root_without_capabilities?() [](#method-i-root_without_capabilities?)

**@return** [Boolean] 

## rootdir() [](#method-i-rootdir)

## setup() [](#method-i-setup)

## sgidfile() [](#method-i-sgidfile)

## socket() [](#method-i-socket)

## stickyfile() [](#method-i-stickyfile)

## suidfile() [](#method-i-suidfile)

## symlinkfile() [](#method-i-symlinkfile)

## teardown() [](#method-i-teardown)

## test_absolute_path() [](#method-i-test_absolute_path)

## test_atime() [](#method-i-test_atime)

## test_basename() [](#method-i-test_basename)

## test_basename_backslash() [](#method-i-test_basename_backslash)

## test_basename_encoding() [](#method-i-test_basename_encoding)

## test_basename_strip() [](#method-i-test_basename_strip)

## test_birthtime() [](#method-i-test_birthtime)

## test_blockdev_p() [](#method-i-test_blockdev_p)

## test_chardev_p() [](#method-i-test_chardev_p)

## test_chmod() [](#method-i-test_chmod)

## test_chown() [](#method-i-test_chown)
xxx

## test_closed_io_identical_p() [](#method-i-test_closed_io_identical_p)

## test_ctime() [](#method-i-test_ctime)

## test_directory_p() [](#method-i-test_directory_p)

## test_dirname() [](#method-i-test_dirname)

## test_dirname_backslash() [](#method-i-test_dirname_backslash)

## test_dirname_encoding() [](#method-i-test_dirname_encoding)

## test_empty_p() [](#method-i-test_empty_p)

## test_executable_p() [](#method-i-test_executable_p)

## test_executable_real_p() [](#method-i-test_executable_real_p)

## test_exist_p() [](#method-i-test_exist_p)

## test_expand_path() [](#method-i-test_expand_path)

## test_expand_path_absolute() [](#method-i-test_expand_path_absolute)

## test_expand_path_accepts_objects_that_have_a_to_path_method() [](#method-i-test_expand_path_accepts_objects_that_have_a_to_path_method)

## test_expand_path_cleanup_dots_file_name() [](#method-i-test_expand_path_cleanup_dots_file_name)

## test_expand_path_compose() [](#method-i-test_expand_path_compose)

## test_expand_path_converts_a_dot_with_unc_dir() [](#method-i-test_expand_path_converts_a_dot_with_unc_dir)

## test_expand_path_converts_a_pathname_to_an_absolute_pathname_using_a_complete_path() [](#method-i-test_expand_path_converts_a_pathname_to_an_absolute_pathname_using_a_complete_path)

## test_expand_path_converts_a_pathname_to_an_absolute_pathname_using_home_as_base() [](#method-i-test_expand_path_converts_a_pathname_to_an_absolute_pathname_using_home_as_base)

## test_expand_path_converts_a_pathname_to_an_absolute_pathname_using_unc_home() [](#method-i-test_expand_path_converts_a_pathname_to_an_absolute_pathname_using_unc_home)

## test_expand_path_converts_a_pathname_which_starts_with_a_slash_and_unc_pathname() [](#method-i-test_expand_path_converts_a_pathname_which_starts_with_a_slash_and_unc_pathname)

## test_expand_path_converts_a_pathname_which_starts_with_a_slash_using_a_current_drive() [](#method-i-test_expand_path_converts_a_pathname_which_starts_with_a_slash_using_a_current_drive)

## test_expand_path_converts_a_pathname_which_starts_with_a_slash_using_dir_s_drive() [](#method-i-test_expand_path_converts_a_pathname_which_starts_with_a_slash_using_dir_s_drive)

## test_expand_path_converts_a_pathname_which_starts_with_a_slash_using_host_share() [](#method-i-test_expand_path_converts_a_pathname_which_starts_with_a_slash_using_host_share)

## test_expand_path_does_not_expand_wildcards() [](#method-i-test_expand_path_does_not_expand_wildcards)

## test_expand_path_does_not_modify_a_home_string_argument() [](#method-i-test_expand_path_does_not_modify_a_home_string_argument)

## test_expand_path_does_not_modify_the_string_argument() [](#method-i-test_expand_path_does_not_modify_the_string_argument)

## test_expand_path_encoding() [](#method-i-test_expand_path_encoding)

## test_expand_path_encoding_filesystem() [](#method-i-test_expand_path_encoding_filesystem)

## test_expand_path_error_for_non_absolute_home() [](#method-i-test_expand_path_error_for_non_absolute_home)

## test_expand_path_error_for_nonexistent_username() [](#method-i-test_expand_path_error_for_nonexistent_username)

## test_expand_path_expands_dot_dir() [](#method-i-test_expand_path_expands_dot_dir)

## test_expand_path_for_existent_username() [](#method-i-test_expand_path_for_existent_username)

## test_expand_path_home() [](#method-i-test_expand_path_home)

## test_expand_path_home_dir_string() [](#method-i-test_expand_path_home_dir_string)

## test_expand_path_home_memory_leak_in_base() [](#method-i-test_expand_path_home_memory_leak_in_base)

## test_expand_path_home_memory_leak_in_path() [](#method-i-test_expand_path_home_memory_leak_in_path)

## test_expand_path_ignores_supplied_dir_if_path_contains_a_drive_letter() [](#method-i-test_expand_path_ignores_supplied_dir_if_path_contains_a_drive_letter)

## test_expand_path_memsize() [](#method-i-test_expand_path_memsize)

## test_expand_path_ntfs() [](#method-i-test_expand_path_ntfs)

## test_expand_path_preserves_unc_path_root() [](#method-i-test_expand_path_preserves_unc_path_root)

## test_expand_path_raises_a_type_error_if_not_passed_a_string_type() [](#method-i-test_expand_path_raises_a_type_error_if_not_passed_a_string_type)

## test_expand_path_raises_argument_error_for_any_supplied_username() [](#method-i-test_expand_path_raises_argument_error_for_any_supplied_username)

## test_expand_path_remove_trailing_alternative_data() [](#method-i-test_expand_path_remove_trailing_alternative_data)

## test_expand_path_removes_trailing_slashes_from_absolute_path() [](#method-i-test_expand_path_removes_trailing_slashes_from_absolute_path)

## test_expand_path_removes_trailing_spaces_from_absolute_path() [](#method-i-test_expand_path_removes_trailing_spaces_from_absolute_path)

## test_expand_path_resolve_dot_current_directory() [](#method-i-test_expand_path_resolve_dot_current_directory)

## test_expand_path_resolve_empty_string_current_directory() [](#method-i-test_expand_path_resolve_empty_string_current_directory)

## test_expand_path_resolve_file_name_and_dir_string_relative() [](#method-i-test_expand_path_resolve_file_name_and_dir_string_relative)

## test_expand_path_resolve_file_name_relative_current_directory() [](#method-i-test_expand_path_resolve_file_name_relative_current_directory)

## test_expand_path_returns_a_string_when_passed_a_string_subclass() [](#method-i-test_expand_path_returns_a_string_when_passed_a_string_subclass)

## test_expand_path_with_drive_letter() [](#method-i-test_expand_path_with_drive_letter)

## test_extname() [](#method-i-test_extname)

## test_file_p() [](#method-i-test_file_p)

## test_flock_exclusive() [](#method-i-test_flock_exclusive)

## test_flock_shared() [](#method-i-test_flock_shared)

## test_ftype() [](#method-i-test_ftype)

## test_grpowned_p() [](#method-i-test_grpowned_p)
xxx

## test_hardlink() [](#method-i-test_hardlink)

## test_ignore_nil_dir_string() [](#method-i-test_ignore_nil_dir_string)

## test_io_identical_p() [](#method-i-test_io_identical_p)

## test_join() [](#method-i-test_join)

## test_join_alt_separator() [](#method-i-test_join_alt_separator)

## test_join_ascii_incompatible() [](#method-i-test_join_ascii_incompatible)

## test_join_with_changed_separator() [](#method-i-test_join_with_changed_separator)

## test_lchmod() [](#method-i-test_lchmod)

## test_lchown() [](#method-i-test_lchown)
xxx

## test_lstat() [](#method-i-test_lstat)

## test_lutime() [](#method-i-test_lutime)

## test_mtime() [](#method-i-test_mtime)

## test_owned_p() [](#method-i-test_owned_p)

## test_path() [](#method-i-test_path)

## test_path_check() [](#method-i-test_path_check)

## test_path_identical_p() [](#method-i-test_path_identical_p)

## test_pipe_p() [](#method-i-test_pipe_p)

## test_readable_p() [](#method-i-test_readable_p)

## test_readable_real_p() [](#method-i-test_readable_real_p)

## test_readlink() [](#method-i-test_readlink)

## test_readlink_junction() [](#method-i-test_readlink_junction)

## test_readlink_long_path() [](#method-i-test_readlink_long_path)

## test_realpath_mount_point() [](#method-i-test_realpath_mount_point)

## test_rename() [](#method-i-test_rename)

## test_s_size() [](#method-i-test_s_size)

## test_sgid() [](#method-i-test_sgid)

## test_size() [](#method-i-test_size)

## test_size_p() [](#method-i-test_size_p)

## test_socket_p() [](#method-i-test_socket_p)

## test_split() [](#method-i-test_split)

## test_stat() [](#method-i-test_stat)

## test_stat_blockdev_p() [](#method-i-test_stat_blockdev_p)

## test_stat_chardev_p() [](#method-i-test_stat_chardev_p)

## test_stat_directory_p() [](#method-i-test_stat_directory_p)

## test_stat_drive_root() [](#method-i-test_stat_drive_root)

## test_stat_executable_p() [](#method-i-test_stat_executable_p)

## test_stat_executable_real_p() [](#method-i-test_stat_executable_real_p)

## test_stat_file_p() [](#method-i-test_stat_file_p)

## test_stat_ftype() [](#method-i-test_stat_ftype)

## test_stat_grpowned_p() [](#method-i-test_stat_grpowned_p)
xxx

## test_stat_init() [](#method-i-test_stat_init)

## test_stat_new_utf8() [](#method-i-test_stat_new_utf8)

## test_stat_owned_p() [](#method-i-test_stat_owned_p)

## test_stat_pipe_p() [](#method-i-test_stat_pipe_p)

## test_stat_readable_p() [](#method-i-test_stat_readable_p)

## test_stat_readable_real_p() [](#method-i-test_stat_readable_real_p)

## test_stat_sgid() [](#method-i-test_stat_sgid)

## test_stat_size() [](#method-i-test_stat_size)

## test_stat_size_p() [](#method-i-test_stat_size_p)

## test_stat_socket_p() [](#method-i-test_stat_socket_p)

## test_stat_special_file() [](#method-i-test_stat_special_file)

## test_stat_sticky() [](#method-i-test_stat_sticky)

## test_stat_suid() [](#method-i-test_stat_suid)

## test_stat_symlink_p() [](#method-i-test_stat_symlink_p)

## test_stat_world_readable_p() [](#method-i-test_stat_world_readable_p)

## test_stat_world_writable_p() [](#method-i-test_stat_world_writable_p)

## test_stat_writable_p() [](#method-i-test_stat_writable_p)

## test_stat_writable_real_p() [](#method-i-test_stat_writable_real_p)

## test_stat_zero_p() [](#method-i-test_stat_zero_p)

## test_sticky() [](#method-i-test_sticky)

## test_suid() [](#method-i-test_suid)

## test_symlink() [](#method-i-test_symlink)

## test_symlink_p() [](#method-i-test_symlink_p)

## test_test() [](#method-i-test_test)

## test_truncate() [](#method-i-test_truncate)

## test_umask() [](#method-i-test_umask)

## test_unlink() [](#method-i-test_unlink)

## test_utime() [](#method-i-test_utime)

## test_utime_symlinkfile() [](#method-i-test_utime_symlinkfile)

## test_world_readable_p() [](#method-i-test_world_readable_p)

## test_world_writable_p() [](#method-i-test_world_writable_p)

## test_writable_p() [](#method-i-test_writable_p)

## test_writable_real_p() [](#method-i-test_writable_real_p)

## test_zero_p() [](#method-i-test_zero_p)

## utf8_file() [](#method-i-utf8_file)

## zerofile() [](#method-i-zerofile)

