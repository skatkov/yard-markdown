# Class: TestFile
**Inherits:** Test::Unit::TestCase
    
**Includes:** TestEOF, TestEOF::Seek
  




#Instance Methods
## assert_bom(bytes, name) [](#method-i-assert_bom)

## measure_time() [](#method-i-measure_time)

## open_file(content) [](#method-i-open_file)

## open_file_seek(content, pos) [](#method-i-open_file_seek)

## test_absolute_path?() [](#method-i-test_absolute_path?)

**@return** [Boolean] 

## test_bom_16be() [](#method-i-test_bom_16be)

## test_bom_16le() [](#method-i-test_bom_16le)

## test_bom_32be() [](#method-i-test_bom_32be)

## test_bom_32le() [](#method-i-test_bom_32le)

## test_bom_8() [](#method-i-test_bom_8)

## test_chmod_m17n() [](#method-i-test_chmod_m17n)

## test_chown() [](#method-i-test_chown)

## test_conflicting_encodings() [](#method-i-test_conflicting_encodings)

## test_each_byte_extended_file() [](#method-i-test_each_byte_extended_file)

## test_each_char_extended_file() [](#method-i-test_each_char_extended_file)

## test_empty_file_bom() [](#method-i-test_empty_file_bom)

## test_eof_0() [](#method-i-test_eof_0)

## test_eof_0_rw() [](#method-i-test_eof_0_rw)

## test_eof_0_seek() [](#method-i-test_eof_0_seek)

## test_eof_1() [](#method-i-test_eof_1)

## test_eof_1_seek() [](#method-i-test_eof_1_seek)

## test_eof_2() [](#method-i-test_eof_2)

## test_eof_3() [](#method-i-test_eof_3)

## test_file_open_double_mode() [](#method-i-test_file_open_double_mode)

## test_file_open_newline_option() [](#method-i-test_file_open_newline_option)

## test_file_open_permissions() [](#method-i-test_file_open_permissions)

## test_file_share_delete() [](#method-i-test_file_share_delete)

## test_getbyte_extended_file() [](#method-i-test_getbyte_extended_file)

## test_getc_extended_file() [](#method-i-test_getc_extended_file)

## test_gets_extended_file() [](#method-i-test_gets_extended_file)

## test_gets_para_extended_file() [](#method-i-test_gets_para_extended_file)

## test_initialize() [](#method-i-test_initialize)

## test_long_unc() [](#method-i-test_long_unc)

## test_open_nul() [](#method-i-test_open_nul)

## test_open_tempfile_path() [](#method-i-test_open_tempfile_path)

## test_read_all_extended_file() [](#method-i-test_read_all_extended_file)

## test_realdirpath() [](#method-i-test_realdirpath)

## test_realdirpath_junction() [](#method-i-test_realdirpath_junction)

## test_realpath() [](#method-i-test_realpath)

## test_realpath_encoding() [](#method-i-test_realpath_encoding)

## test_realpath_special_symlink() [](#method-i-test_realpath_special_symlink)

## test_s_chown() [](#method-i-test_s_chown)

## test_stat() [](#method-i-test_stat)

## test_stat_inode() [](#method-i-test_stat_inode)

## test_truncate_beyond_eof() [](#method-i-test_truncate_beyond_eof)

## test_truncate_rbuf() [](#method-i-test_truncate_rbuf)

## test_truncate_size() [](#method-i-test_truncate_size)

## test_truncate_wbuf() [](#method-i-test_truncate_wbuf)

## test_uninitialized() [](#method-i-test_uninitialized)

## test_unlink_before_close() [](#method-i-test_unlink_before_close)
I don't know Ruby's spec about "unlink-before-close" exactly. This test
asserts current behaviour.

## test_utime() [](#method-i-test_utime)

## test_utime_with_minus_time_segv() [](#method-i-test_utime_with_minus_time_segv)

