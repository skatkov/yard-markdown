# Class: TestPathname
**Inherits:** Test::Unit::TestCase
    



# Class Methods
## defassert(name , result , *args ) [](#method-c-defassert)
## defassert_raise(name , exc , *args ) [](#method-c-defassert_raise)
## define_assertion(name , linenum , &block ) [](#method-c-define_assertion)
## get_linenum() [](#method-c-get_linenum)

#Instance Methods
## add_trailing_separator(path) [](#method-i-add_trailing_separator)

## ascend(path) [](#method-i-ascend)

## assert_mode(val, mask, path, mesgnil) [](#method-i-assert_mode)

## assert_pathname_cmp(e, s1, s2) [](#method-i-assert_pathname_cmp)

## cleanpath_aggressive(path) [](#method-i-cleanpath_aggressive)

## cleanpath_conservative(path) [](#method-i-cleanpath_conservative)

## del_trailing_separator(path) [](#method-i-del_trailing_separator)

## descend(path) [](#method-i-descend)

## has_hardlink?() [](#method-i-has_hardlink?)

**@return** [Boolean] 

## has_symlink?() [](#method-i-has_symlink?)

**@return** [Boolean] 

## has_trailing_separator?(path) [](#method-i-has_trailing_separator?)
has_trailing_separator?(path) -> bool

**@return** [Boolean] 

## parent(path) [](#method-i-parent)
-> path

## pathsub(path, pat, repl) [](#method-i-pathsub)

## pathsubext(path, repl) [](#method-i-pathsubext)

## plus(path1, path2) [](#method-i-plus)
-> path

## realdirpath(path) [](#method-i-realdirpath)

## realpath(path, basedirnil) [](#method-i-realpath)

## relative?(path) [](#method-i-relative?)

**@return** [Boolean] 

## relative_path_from(dest_directory, base_directory) [](#method-i-relative_path_from)

## root?(path) [](#method-i-root?)

**@return** [Boolean] 

## test_absolute() [](#method-i-test_absolute)

## test_atime() [](#method-i-test_atime)

## test_basename() [](#method-i-test_basename)

## test_binread() [](#method-i-test_binread)

## test_binwrite() [](#method-i-test_binwrite)

## test_binwrite_opts() [](#method-i-test_binwrite_opts)

## test_birthtime() [](#method-i-test_birthtime)

## test_blockdev?() [](#method-i-test_blockdev?)

**@return** [Boolean] 

## test_blockless_ascend_is_enumerator() [](#method-i-test_blockless_ascend_is_enumerator)

## test_blockless_descend_is_enumerator() [](#method-i-test_blockless_descend_is_enumerator)

## test_chardev?() [](#method-i-test_chardev?)

**@return** [Boolean] 

## test_children() [](#method-i-test_children)

## test_chmod() [](#method-i-test_chmod)

## test_chown() [](#method-i-test_chown)

## test_comparison() [](#method-i-test_comparison)

## test_comparison_string() [](#method-i-test_comparison_string)

## test_ctime() [](#method-i-test_ctime)

## test_destructive_update() [](#method-i-test_destructive_update)

## test_directory?() [](#method-i-test_directory?)

**@return** [Boolean] 

## test_dirname() [](#method-i-test_dirname)

## test_each_child() [](#method-i-test_each_child)

## test_each_entry() [](#method-i-test_each_entry)

## test_each_entry_enumerator() [](#method-i-test_each_entry_enumerator)

## test_each_filename() [](#method-i-test_each_filename)

## test_each_line() [](#method-i-test_each_line)

## test_each_line_opts() [](#method-i-test_each_line_opts)

## test_empty?() [](#method-i-test_empty?)

**@return** [Boolean] 

## test_entries() [](#method-i-test_entries)

## test_equality() [](#method-i-test_equality)

## test_executable?() [](#method-i-test_executable?)

**@return** [Boolean] 

## test_executable_real?() [](#method-i-test_executable_real?)

**@return** [Boolean] 

## test_exist?() [](#method-i-test_exist?)

**@return** [Boolean] 

## test_expand_path() [](#method-i-test_expand_path)

## test_extname() [](#method-i-test_extname)

## test_file?() [](#method-i-test_file?)

**@return** [Boolean] 

## test_file_basename() [](#method-i-test_file_basename)

## test_file_dirname() [](#method-i-test_file_dirname)

## test_file_extname() [](#method-i-test_file_extname)

## test_file_fnmatch() [](#method-i-test_file_fnmatch)

## test_file_split() [](#method-i-test_file_split)

## test_find() [](#method-i-test_find)

## test_fnmatch() [](#method-i-test_fnmatch)

## test_fnmatch?() [](#method-i-test_fnmatch?)

**@return** [Boolean] 

## test_freeze() [](#method-i-test_freeze)

## test_ftype() [](#method-i-test_ftype)

## test_glob() [](#method-i-test_glob)

## test_global_constructor() [](#method-i-test_global_constructor)

## test_grpowned?() [](#method-i-test_grpowned?)

**@return** [Boolean] 

## test_hashkey() [](#method-i-test_hashkey)

## test_initialize() [](#method-i-test_initialize)

## test_initialize_nul() [](#method-i-test_initialize_nul)

## test_join() [](#method-i-test_join)

## test_kernel_open() [](#method-i-test_kernel_open)

## test_kernel_pathname() [](#method-i-test_kernel_pathname)

## test_lchmod() [](#method-i-test_lchmod)

## test_lchown() [](#method-i-test_lchown)

## test_lstat() [](#method-i-test_lstat)

## test_lutime() [](#method-i-test_lutime)

## test_make_link() [](#method-i-test_make_link)

## test_make_symlink() [](#method-i-test_make_symlink)

## test_matchop() [](#method-i-test_matchop)

## test_mkdir() [](#method-i-test_mkdir)

## test_mkpath() [](#method-i-test_mkpath)

## test_mktmpdir() [](#method-i-test_mktmpdir)

## test_mountpoint?() [](#method-i-test_mountpoint?)

**@return** [Boolean] 

## test_mountpoint_enoent() [](#method-i-test_mountpoint_enoent)

## test_mtime() [](#method-i-test_mtime)

## test_null_character() [](#method-i-test_null_character)

## test_open() [](#method-i-test_open)

## test_opendir() [](#method-i-test_opendir)

## test_owned?() [](#method-i-test_owned?)

**@return** [Boolean] 

## test_parent() [](#method-i-test_parent)

## test_pipe?() [](#method-i-test_pipe?)

**@return** [Boolean] 

## test_plus() [](#method-i-test_plus)

## test_read() [](#method-i-test_read)

## test_readable?() [](#method-i-test_readable?)

**@return** [Boolean] 

## test_readable_real?() [](#method-i-test_readable_real?)

**@return** [Boolean] 

## test_readlines() [](#method-i-test_readlines)

## test_readlines_opts() [](#method-i-test_readlines_opts)

## test_readlink() [](#method-i-test_readlink)

## test_realdirpath() [](#method-i-test_realdirpath)

## test_realpath() [](#method-i-test_realpath)

## test_relative_path_from_casefold() [](#method-i-test_relative_path_from_casefold)

## test_relative_path_from_mock() [](#method-i-test_relative_path_from_mock)

## test_rename() [](#method-i-test_rename)

## test_rmdir() [](#method-i-test_rmdir)

## test_rmtree() [](#method-i-test_rmtree)

## test_s_getwd() [](#method-i-test_s_getwd)

## test_s_glob() [](#method-i-test_s_glob)

## test_s_glob_3args() [](#method-i-test_s_glob_3args)

## test_s_pwd() [](#method-i-test_s_pwd)

## test_setgid?() [](#method-i-test_setgid?)

**@return** [Boolean] 

## test_setuid?() [](#method-i-test_setuid?)

**@return** [Boolean] 

## test_size() [](#method-i-test_size)

## test_size?() [](#method-i-test_size?)

**@return** [Boolean] 

## test_slash() [](#method-i-test_slash)

## test_socket?() [](#method-i-test_socket?)

**@return** [Boolean] 

## test_split() [](#method-i-test_split)

## test_stat() [](#method-i-test_stat)

## test_sticky?() [](#method-i-test_sticky?)

**@return** [Boolean] 

## test_sub_matchdata() [](#method-i-test_sub_matchdata)

## test_symlink?() [](#method-i-test_symlink?)

**@return** [Boolean] 

## test_sysopen() [](#method-i-test_sysopen)

## test_to_s() [](#method-i-test_to_s)

## test_truncate() [](#method-i-test_truncate)

## test_unlink() [](#method-i-test_unlink)

## test_utime() [](#method-i-test_utime)

## test_world_readable?() [](#method-i-test_world_readable?)

**@return** [Boolean] 

## test_world_writable?() [](#method-i-test_world_writable?)

**@return** [Boolean] 

## test_writable?() [](#method-i-test_writable?)

**@return** [Boolean] 

## test_writable_real?() [](#method-i-test_writable_real?)

**@return** [Boolean] 

## test_write() [](#method-i-test_write)

## test_write_opts() [](#method-i-test_write_opts)

## test_zero?() [](#method-i-test_zero?)

**@return** [Boolean] 

## with_tmpchdir(basenil) [](#method-i-with_tmpchdir)

