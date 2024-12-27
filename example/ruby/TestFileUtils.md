# Class: TestFileUtils
**Inherits:** Test::Unit::TestCase
    
**Includes:** FileUtils, Test::Unit::FileAssertions
  




#Instance Methods
## apply_mask(mode, user_mask, op, mode_mask) [](#method-i-apply_mask)
:nodoc:

## assert_directory(path, messagenil) [](#method-i-assert_directory)

## assert_equal_filemode(file1, file2, messagenil, mask:07777) [](#method-i-assert_equal_filemode)

## assert_equal_time(expected, actual, messagenil) [](#method-i-assert_equal_time)

## assert_equal_timestamp(expected, actual, messagenil) [](#method-i-assert_equal_timestamp)

## assert_file_exist(path, messagenil) [](#method-i-assert_file_exist)

## assert_file_not_exist(path, messagenil) [](#method-i-assert_file_not_exist)

## assert_filemode(expected, file, messagenil, mask:07777) [](#method-i-assert_filemode)

## assert_not_symlink(path, messagenil) [](#method-i-assert_not_symlink)

## assert_output_lines(expected, fuself, messagenil) [](#method-i-assert_output_lines)

## assert_ownership_group(expected, file) [](#method-i-assert_ownership_group)

## assert_ownership_user(expected, file) [](#method-i-assert_ownership_user)

## assert_same_entry(from, to, messagenil) [](#method-i-assert_same_entry)

## assert_same_file(from, to, messagenil) [](#method-i-assert_same_file)

## assert_symlink(path, messagenil) [](#method-i-assert_symlink)

## check_singleton(name) [](#method-i-check_singleton)

## each_srcdest() [](#method-i-each_srcdest)

## fu_get_gid(group) [](#method-i-fu_get_gid)
:nodoc:

## fu_get_uid(user) [](#method-i-fu_get_uid)
:nodoc:

## fu_have_symlink?() [](#method-i-fu_have_symlink?)
:nodoc:

**@return** [Boolean] 

## fu_mkdir(path, mode) [](#method-i-fu_mkdir)
:nodoc:

## fu_mode(mode, path) [](#method-i-fu_mode)
:nodoc:

## fu_stat_identical_entry?(a, b) [](#method-i-fu_stat_identical_entry?)
:nodoc:

**@return** [Boolean] 

## mode_to_s(mode) [](#method-i-mode_to_s)
:nodoc:

## my_rm_rf(path) [](#method-i-my_rm_rf)

## mymkdir(path) [](#method-i-mymkdir)

## prepare_big_file() [](#method-i-prepare_big_file)

## prepare_data_file() [](#method-i-prepare_data_file)

## prepare_time_data() [](#method-i-prepare_time_data)

## remove_trailing_slash(dir) [](#method-i-remove_trailing_slash)
:nodoc:

## setup() [](#method-i-setup)

## symbolic_modes_to_i(mode_sym, path) [](#method-i-symbolic_modes_to_i)
:nodoc:

## teardown() [](#method-i-teardown)

## test_assert_output_lines() [](#method-i-test_assert_output_lines)
Test Cases

## test_cd() [](#method-i-test_cd)

## test_cd_result() [](#method-i-test_cd_result)

## test_chdir() [](#method-i-test_chdir)

## test_chdir_verbose() [](#method-i-test_chdir_verbose)

## test_chdir_verbose_frozen() [](#method-i-test_chdir_verbose_frozen)

## test_chmod() [](#method-i-test_chmod)

## test_chmod_R() [](#method-i-test_chmod_R)

## test_chmod_symbol_mode() [](#method-i-test_chmod_symbol_mode)

## test_chmod_symbol_mode_R() [](#method-i-test_chmod_symbol_mode_R)

## test_chmod_verbose() [](#method-i-test_chmod_verbose)

## test_chown() [](#method-i-test_chown)

## test_chown_R() [](#method-i-test_chown_R)

## test_chown_R_force() [](#method-i-test_chown_R_force)

## test_chown_R_noop() [](#method-i-test_chown_R_noop)

## test_chown_R_verbose() [](#method-i-test_chown_R_verbose)

## test_chown_R_with_root() [](#method-i-test_chown_R_with_root)

## test_chown_R_without_permission() [](#method-i-test_chown_R_without_permission)

## test_chown_dir_group_ownership_not_recursive() [](#method-i-test_chown_dir_group_ownership_not_recursive)

## test_chown_dir_user_ownership_not_recursive_with_root() [](#method-i-test_chown_dir_user_ownership_not_recursive_with_root)

## test_chown_error() [](#method-i-test_chown_error)

## test_chown_noop() [](#method-i-test_chown_noop)

## test_chown_verbose() [](#method-i-test_chown_verbose)

## test_chown_with_root() [](#method-i-test_chown_with_root)

## test_chown_without_permission() [](#method-i-test_chown_without_permission)

## test_cmp() [](#method-i-test_cmp)

## test_collect_methods() [](#method-i-test_collect_methods)

## test_commands() [](#method-i-test_commands)

## test_compare_file() [](#method-i-test_compare_file)

## test_compare_stream() [](#method-i-test_compare_stream)

## test_copy_entry() [](#method-i-test_copy_entry)

## test_copy_entry_symlink() [](#method-i-test_copy_entry_symlink)

## test_copy_entry_symlink_remove_destination() [](#method-i-test_copy_entry_symlink_remove_destination)

## test_copy_file() [](#method-i-test_copy_file)

## test_copy_stream() [](#method-i-test_copy_stream)

## test_copy_stream_duck() [](#method-i-test_copy_stream_duck)

## test_cp() [](#method-i-test_cp)

## test_cp_lr() [](#method-i-test_cp_lr)

## test_cp_pathname() [](#method-i-test_cp_pathname)

## test_cp_preserve_permissions() [](#method-i-test_cp_preserve_permissions)

## test_cp_preserve_permissions_dir() [](#method-i-test_cp_preserve_permissions_dir)

## test_cp_r() [](#method-i-test_cp_r)

## test_cp_r_dev() [](#method-i-test_cp_r_dev)

## test_cp_r_fifo() [](#method-i-test_cp_r_fifo)

## test_cp_r_pathname() [](#method-i-test_cp_r_pathname)

## test_cp_r_symlink() [](#method-i-test_cp_r_symlink)

## test_cp_r_symlink_preserve() [](#method-i-test_cp_r_symlink_preserve)

## test_cp_r_symlink_remove_destination() [](#method-i-test_cp_r_symlink_remove_destination)

## test_cp_symlink() [](#method-i-test_cp_symlink)

## test_getwd() [](#method-i-test_getwd)

## test_have_option?() [](#method-i-test_have_option?)

**@return** [Boolean] 

## test_identical?() [](#method-i-test_identical?)

**@return** [Boolean] 

## test_install() [](#method-i-test_install)

## test_install_broken_symlink() [](#method-i-test_install_broken_symlink)

## test_install_group_option() [](#method-i-test_install_group_option)

## test_install_mode_option() [](#method-i-test_install_mode_option)

## test_install_owner_option() [](#method-i-test_install_owner_option)

## test_install_pathname() [](#method-i-test_install_pathname)

## test_install_symlink() [](#method-i-test_install_symlink)

## test_link() [](#method-i-test_link)

## test_ln() [](#method-i-test_ln)

## test_ln_broken_symlink() [](#method-i-test_ln_broken_symlink)

## test_ln_pathname() [](#method-i-test_ln_pathname)

## test_ln_s() [](#method-i-test_ln_s)

## test_ln_s_broken_symlink() [](#method-i-test_ln_s_broken_symlink)

## test_ln_s_pathname() [](#method-i-test_ln_s_pathname)

## test_ln_sf() [](#method-i-test_ln_sf)

## test_ln_sf_broken_symlink() [](#method-i-test_ln_sf_broken_symlink)

## test_ln_sf_pathname() [](#method-i-test_ln_sf_pathname)

## test_ln_sr() [](#method-i-test_ln_sr)

## test_ln_sr_broken_symlink() [](#method-i-test_ln_sr_broken_symlink)

## test_ln_sr_pathname() [](#method-i-test_ln_sr_pathname)

## test_ln_symlink() [](#method-i-test_ln_symlink)

## test_makedirs() [](#method-i-test_makedirs)

## test_mkdir() [](#method-i-test_mkdir)

## test_mkdir_file_perm() [](#method-i-test_mkdir_file_perm)

## test_mkdir_lf_in_path() [](#method-i-test_mkdir_lf_in_path)

## test_mkdir_p() [](#method-i-test_mkdir_p)

## test_mkdir_p_file_perm() [](#method-i-test_mkdir_p_file_perm)

## test_mkdir_p_offline_drive() [](#method-i-test_mkdir_p_offline_drive)

## test_mkdir_p_pathname() [](#method-i-test_mkdir_p_pathname)

## test_mkdir_p_root() [](#method-i-test_mkdir_p_root)

## test_mkdir_pathname() [](#method-i-test_mkdir_pathname)

## test_mkpath() [](#method-i-test_mkpath)

## test_move() [](#method-i-test_move)

## test_mv() [](#method-i-test_mv)

## test_mv_broken_symlink() [](#method-i-test_mv_broken_symlink)

## test_mv_pathname() [](#method-i-test_mv_pathname)

## test_mv_symlink() [](#method-i-test_mv_symlink)

## test_options() [](#method-i-test_options)

## test_options_of() [](#method-i-test_options_of)

## test_pwd() [](#method-i-test_pwd)

## test_remove_dir() [](#method-i-test_remove_dir)

## test_remove_dir_file_perm() [](#method-i-test_remove_dir_file_perm)

## test_remove_entry_cjk_path() [](#method-i-test_remove_entry_cjk_path)

## test_remove_entry_multibyte_path() [](#method-i-test_remove_entry_multibyte_path)

## test_remove_entry_secure() [](#method-i-test_remove_entry_secure)

## test_remove_entry_secure_pathname() [](#method-i-test_remove_entry_secure_pathname)

## test_remove_entry_secure_symlink() [](#method-i-test_remove_entry_secure_symlink)

## test_remove_file() [](#method-i-test_remove_file)

## test_remove_file_file_perm() [](#method-i-test_remove_file_file_perm)

## test_rm() [](#method-i-test_rm)

## test_rm_f() [](#method-i-test_rm_f)

## test_rm_f_2() [](#method-i-test_rm_f_2)

## test_rm_pathname() [](#method-i-test_rm_pathname)

## test_rm_r() [](#method-i-test_rm_r)

## test_rm_r_no_permissions() [](#method-i-test_rm_r_no_permissions)

## test_rm_r_pathname() [](#method-i-test_rm_r_pathname)

## test_rm_r_symlink() [](#method-i-test_rm_r_symlink)

## test_rm_rf() [](#method-i-test_rm_rf)

## test_rm_symlink() [](#method-i-test_rm_symlink)

## test_rmdir() [](#method-i-test_rmdir)

## test_rmtree() [](#method-i-test_rmtree)

## test_s_chmod_verbose() [](#method-i-test_s_chmod_verbose)

## test_safe_unlink() [](#method-i-test_safe_unlink)

## test_symlink() [](#method-i-test_symlink)

## test_touch() [](#method-i-test_touch)

## test_uptodate?() [](#method-i-test_uptodate?)

**@return** [Boolean] 

## test_with_big_file() [](#method-i-test_with_big_file)

## user_mask(target) [](#method-i-user_mask)
:nodoc:

