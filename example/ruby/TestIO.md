# Class: TestIO
**Inherits:** Test::Unit::TestCase
  
**Extended by:** TestIO::Feature
    
**Includes:** TestIO::Feature
  



# Class Methods
## have_close_on_exec?() [](#method-c-have_close_on_exec?)
**@return** [Boolean] 

## have_nonblock?() [](#method-c-have_nonblock?)
**@return** [Boolean] 


#Instance Methods
## assert_buffer_not_raise_shared_string_error() [](#method-i-assert_buffer_not_raise_shared_string_error)

## can_seek_data(f) [](#method-i-can_seek_data)

## have_close_on_exec?() [](#method-i-have_close_on_exec?)

**@return** [Boolean] 

## have_nonblock?() [](#method-i-have_nonblock?)

**@return** [Boolean] 

## make_tempfile() [](#method-i-make_tempfile)

## make_tempfile_for_encoding() [](#method-i-make_tempfile_for_encoding)

## mkcdtmpdir() [](#method-i-mkcdtmpdir)

## os_and_fs(path) [](#method-i-os_and_fs)

## pipe(wp, rp) [](#method-i-pipe)

## ruby(*args) [](#method-i-ruby)

## test_DATA_binmode() [](#method-i-test_DATA_binmode)

## test_advise() [](#method-i-test_advise)

## test_advise_pipe() [](#method-i-test_advise_pipe)

## test_autoclose() [](#method-i-test_autoclose)

## test_autoclose_false_closed_by_finalizer() [](#method-i-test_autoclose_false_closed_by_finalizer)

## test_autoclose_true_closed_by_finalizer() [](#method-i-test_autoclose_true_closed_by_finalizer)

## test_binmode_after_closed() [](#method-i-test_binmode_after_closed)

## test_binmode_pipe() [](#method-i-test_binmode_pipe)

## test_cloexec() [](#method-i-test_cloexec)

## test_close_on_exec() [](#method-i-test_close_on_exec)

## test_close_read() [](#method-i-test_close_read)

## test_close_read_non_readable() [](#method-i-test_close_read_non_readable)

## test_close_read_pipe() [](#method-i-test_close_read_pipe)

## test_close_read_write_separately() [](#method-i-test_close_read_write_separately)

## test_close_twice() [](#method-i-test_close_twice)

## test_close_uninitialized() [](#method-i-test_close_uninitialized)

## test_close_write() [](#method-i-test_close_write)

## test_close_write_non_readable() [](#method-i-test_close_write_non_readable)

## test_closed_stream_in_rescue() [](#method-i-test_closed_stream_in_rescue)

## test_copy_stream_append() [](#method-i-test_copy_stream_append)

## test_copy_stream_append_to_nonempty() [](#method-i-test_copy_stream_append_to_nonempty)

## test_copy_stream_bigcontent() [](#method-i-test_copy_stream_bigcontent)

## test_copy_stream_bigcontent_chop() [](#method-i-test_copy_stream_bigcontent_chop)

## test_copy_stream_bigcontent_fpos() [](#method-i-test_copy_stream_bigcontent_fpos)

## test_copy_stream_bigcontent_mid() [](#method-i-test_copy_stream_bigcontent_mid)

## test_copy_stream_broken_src_read_eof() [](#method-i-test_copy_stream_broken_src_read_eof)

## test_copy_stream_closed_pipe() [](#method-i-test_copy_stream_closed_pipe)

## test_copy_stream_dst_rbuf() [](#method-i-test_copy_stream_dst_rbuf)

## test_copy_stream_file_to_pipe() [](#method-i-test_copy_stream_file_to_pipe)

## test_copy_stream_fname_to_strio() [](#method-i-test_copy_stream_fname_to_strio)

## test_copy_stream_io_to_rot13() [](#method-i-test_copy_stream_io_to_rot13)

## test_copy_stream_io_to_strio() [](#method-i-test_copy_stream_io_to_strio)

## test_copy_stream_megacontent_file_to_pipe() [](#method-i-test_copy_stream_megacontent_file_to_pipe)

## test_copy_stream_megacontent_nonblock() [](#method-i-test_copy_stream_megacontent_nonblock)

## test_copy_stream_megacontent_pipe_to_file() [](#method-i-test_copy_stream_megacontent_pipe_to_file)

## test_copy_stream_no_busy_wait() [](#method-i-test_copy_stream_no_busy_wait)

## test_copy_stream_noent() [](#method-i-test_copy_stream_noent)

## test_copy_stream_pathname_to_pathname() [](#method-i-test_copy_stream_pathname_to_pathname)

## test_copy_stream_pipe() [](#method-i-test_copy_stream_pipe)

## test_copy_stream_pipe_nonblock() [](#method-i-test_copy_stream_pipe_nonblock)

## test_copy_stream_pipe_to_file() [](#method-i-test_copy_stream_pipe_to_file)

## test_copy_stream_rbuf() [](#method-i-test_copy_stream_rbuf)

## test_copy_stream_read_in_binmode() [](#method-i-test_copy_stream_read_in_binmode)

## test_copy_stream_read_pipe() [](#method-i-test_copy_stream_read_pipe)

## test_copy_stream_rot13_to_io() [](#method-i-test_copy_stream_rot13_to_io)

## test_copy_stream_rot13_to_rot13() [](#method-i-test_copy_stream_rot13_to_rot13)

## test_copy_stream_small() [](#method-i-test_copy_stream_small)

## test_copy_stream_smaller() [](#method-i-test_copy_stream_smaller)

## test_copy_stream_socket1() [](#method-i-test_copy_stream_socket1)

## test_copy_stream_socket2() [](#method-i-test_copy_stream_socket2)

## test_copy_stream_socket3() [](#method-i-test_copy_stream_socket3)

## test_copy_stream_socket4() [](#method-i-test_copy_stream_socket4)

## test_copy_stream_socket5() [](#method-i-test_copy_stream_socket5)

## test_copy_stream_socket6() [](#method-i-test_copy_stream_socket6)

## test_copy_stream_socket7() [](#method-i-test_copy_stream_socket7)

## test_copy_stream_src_wbuf() [](#method-i-test_copy_stream_src_wbuf)

## test_copy_stream_strio() [](#method-i-test_copy_stream_strio)

## test_copy_stream_strio_flush() [](#method-i-test_copy_stream_strio_flush)

## test_copy_stream_strio_len() [](#method-i-test_copy_stream_strio_len)

## test_copy_stream_strio_off() [](#method-i-test_copy_stream_strio_off)

## test_copy_stream_strio_rbuf() [](#method-i-test_copy_stream_strio_rbuf)

## test_copy_stream_strio_to_fname() [](#method-i-test_copy_stream_strio_to_fname)

## test_copy_stream_strio_to_io() [](#method-i-test_copy_stream_strio_to_io)

## test_copy_stream_strio_to_tempfile() [](#method-i-test_copy_stream_strio_to_tempfile)

## test_copy_stream_to_duplex_io() [](#method-i-test_copy_stream_to_duplex_io)

## test_copy_stream_write_in_binmode() [](#method-i-test_copy_stream_write_in_binmode)

## test_copy_stream_write_pipe() [](#method-i-test_copy_stream_write_pipe)

## test_cross_thread_close_fd() [](#method-i-test_cross_thread_close_fd)

## test_cross_thread_close_stdio() [](#method-i-test_cross_thread_close_stdio)

## test_display() [](#method-i-test_display)

## test_dup() [](#method-i-test_dup)

## test_dup_many() [](#method-i-test_dup_many)

## test_dup_timeout() [](#method-i-test_dup_timeout)

## test_each_byte() [](#method-i-test_each_byte)

## test_each_byte2() [](#method-i-test_each_byte2)

## test_each_byte_closed() [](#method-i-test_each_byte_closed)

## test_each_byte_with_seek() [](#method-i-test_each_byte_with_seek)

## test_each_char() [](#method-i-test_each_char)

## test_each_char2() [](#method-i-test_each_char2)

## test_each_codepoint() [](#method-i-test_each_codepoint)

## test_each_codepoint_closed() [](#method-i-test_each_codepoint_closed)

## test_each_line() [](#method-i-test_each_line)

## test_each_line_limit_0() [](#method-i-test_each_line_limit_0)

## test_exception_at_close() [](#method-i-test_exception_at_close)

## test_exclusive_mode() [](#method-i-test_exclusive_mode)

## test_explicit_path() [](#method-i-test_explicit_path)

## test_external_encoding_index() [](#method-i-test_external_encoding_index)

## test_fcntl_dupfd() [](#method-i-test_fcntl_dupfd)

## test_fcntl_lock_freebsd() [](#method-i-test_fcntl_lock_freebsd)

## test_fcntl_lock_linux() [](#method-i-test_fcntl_lock_linux)

## test_flag() [](#method-i-test_flag)

## test_flush_in_finalizer1() [](#method-i-test_flush_in_finalizer1)

## test_flush_in_finalizer2() [](#method-i-test_flush_in_finalizer2)

## test_foreach() [](#method-i-test_foreach)

## test_foreach_limit_conversion() [](#method-i-test_foreach_limit_conversion)

## test_foreach_limit_invalid() [](#method-i-test_foreach_limit_invalid)

## test_foreach_rs_conversion() [](#method-i-test_foreach_rs_conversion)

## test_foreach_rs_invalid() [](#method-i-test_foreach_rs_invalid)

## test_frozen_autoclose() [](#method-i-test_frozen_autoclose)

## test_frozen_fileno() [](#method-i-test_frozen_fileno)

## test_gets() [](#method-i-test_gets)

## test_gets_chomp_default_rs() [](#method-i-test_gets_chomp_default_rs)

## test_gets_chomp_paragraph() [](#method-i-test_gets_chomp_paragraph)

## test_gets_chomp_rs() [](#method-i-test_gets_chomp_rs)

## test_gets_chomp_rs_nil() [](#method-i-test_gets_chomp_rs_nil)

## test_gets_default_rs() [](#method-i-test_gets_default_rs)

## test_gets_limit_extra_arg() [](#method-i-test_gets_limit_extra_arg)

## test_gets_paragraph() [](#method-i-test_gets_paragraph)

## test_gets_rs() [](#method-i-test_gets_rs)

## test_gets_rs_377() [](#method-i-test_gets_rs_377)

## test_gets_rs_nil() [](#method-i-test_gets_rs_nil)

## test_initialize() [](#method-i-test_initialize)

## test_inspect() [](#method-i-test_inspect)

## test_invalid_advise() [](#method-i-test_invalid_advise)

## test_io_select_with_many_files() [](#method-i-test_io_select_with_many_files)

## test_ioctl_linux() [](#method-i-test_ioctl_linux)

## test_ioctl_linux2() [](#method-i-test_ioctl_linux2)

## test_marshal_closed_io() [](#method-i-test_marshal_closed_io)

## test_new_with_block() [](#method-i-test_new_with_block)

## test_nofollow() [](#method-i-test_nofollow)

## test_open_fifo_does_not_block_other_threads() [](#method-i-test_open_fifo_does_not_block_other_threads)

## test_open_fifo_restart_at_signal_intterupt() [](#method-i-test_open_fifo_restart_at_signal_intterupt)

## test_open_flag() [](#method-i-test_open_flag)

## test_open_flag_binary() [](#method-i-test_open_flag_binary)

## test_open_mode() [](#method-i-test_open_mode)

## test_open_pipe() [](#method-i-test_open_pipe)

## test_open_redirect() [](#method-i-test_open_redirect)

## test_open_redirect_keyword() [](#method-i-test_open_redirect_keyword)

## test_pid() [](#method-i-test_pid)

## test_pid_after_close_read() [](#method-i-test_pid_after_close_read)

## test_pipe() [](#method-i-test_pipe)

## test_pipe_block() [](#method-i-test_pipe_block)

## test_pipe_block_close() [](#method-i-test_pipe_block_close)

## test_pos() [](#method-i-test_pos)

## test_pos_with_getc() [](#method-i-test_pos_with_getc)

## test_pread() [](#method-i-test_pread)

## test_print() [](#method-i-test_print)

## test_print_separators() [](#method-i-test_print_separators)

## test_printf() [](#method-i-test_printf)

## test_putc() [](#method-i-test_putc)

## test_puts_old_write() [](#method-i-test_puts_old_write)

## test_puts_parallel() [](#method-i-test_puts_parallel)

## test_puts_recursive_array() [](#method-i-test_puts_recursive_array)

## test_puts_recursive_ary() [](#method-i-test_puts_recursive_ary)

## test_pwrite() [](#method-i-test_pwrite)

## test_race_between_read() [](#method-i-test_race_between_read)

## test_race_closed_stream() [](#method-i-test_race_closed_stream)

## test_race_gets_and_close() [](#method-i-test_race_gets_and_close)

## test_read() [](#method-i-test_read)

## test_read_32bit_boundary() [](#method-i-test_read_32bit_boundary)

## test_read_buffer_error() [](#method-i-test_read_buffer_error)

## test_read_buffer_not_raise_shared_string_error() [](#method-i-test_read_buffer_not_raise_shared_string_error)

## test_read_command() [](#method-i-test_read_command)

## test_read_lock() [](#method-i-test_read_lock)

## test_read_nonblock_error() [](#method-i-test_read_nonblock_error)

## test_read_nonblock_file() [](#method-i-test_read_nonblock_file)

## test_read_nonblock_invalid_exception() [](#method-i-test_read_nonblock_invalid_exception)

## test_read_nonblock_no_exceptions() [](#method-i-test_read_nonblock_no_exceptions)

## test_read_nonblock_with_buffer_no_exceptions() [](#method-i-test_read_nonblock_with_buffer_no_exceptions)

## test_read_nonblock_with_not_empty_buffer() [](#method-i-test_read_nonblock_with_not_empty_buffer)

## test_read_nonblock_zero_size() [](#method-i-test_read_nonblock_zero_size)

## test_read_unlocktmp_ensure() [](#method-i-test_read_unlocktmp_ensure)

## test_read_with_not_empty_buffer() [](#method-i-test_read_with_not_empty_buffer)

## test_read_zero_size() [](#method-i-test_read_zero_size)

## test_readbyte() [](#method-i-test_readbyte)

## test_readchar() [](#method-i-test_readchar)

## test_readline2() [](#method-i-test_readline2)

## test_readline_bad_param_raises() [](#method-i-test_readline_bad_param_raises)

## test_readline_chomp_true() [](#method-i-test_readline_chomp_true)

## test_readline_incompatible_rs() [](#method-i-test_readline_incompatible_rs)

## test_readline_limit_nonascii() [](#method-i-test_readline_limit_nonascii)

## test_readline_limit_without_separator() [](#method-i-test_readline_limit_without_separator)

## test_readline_raises() [](#method-i-test_readline_raises)

## test_readline_separators() [](#method-i-test_readline_separators)

## test_readline_separators_limits() [](#method-i-test_readline_separators_limits)

## test_readlines() [](#method-i-test_readlines)

## test_readlines_limit_0() [](#method-i-test_readlines_limit_0)

## test_readlines_limit_invalid() [](#method-i-test_readlines_limit_invalid)

## test_readlines_rs_invalid() [](#method-i-test_readlines_rs_invalid)

## test_readpartial() [](#method-i-test_readpartial)

## test_readpartial_bad_args() [](#method-i-test_readpartial_bad_args)

## test_readpartial_buffer_error() [](#method-i-test_readpartial_buffer_error)

## test_readpartial_buffer_not_raise_shared_string_error() [](#method-i-test_readpartial_buffer_not_raise_shared_string_error)

## test_readpartial_lock() [](#method-i-test_readpartial_lock)

## test_readpartial_locktmp() [](#method-i-test_readpartial_locktmp)

## test_readpartial_pos() [](#method-i-test_readpartial_pos)

## test_readpartial_unlocktmp_ensure() [](#method-i-test_readpartial_unlocktmp_ensure)

## test_readpartial_with_not_empty_buffer() [](#method-i-test_readpartial_with_not_empty_buffer)

## test_readpartial_zero_size() [](#method-i-test_readpartial_zero_size)

## test_recycled_fd_close() [](#method-i-test_recycled_fd_close)

## test_reinitialize() [](#method-i-test_reinitialize)

## test_reopen() [](#method-i-test_reopen)

## test_reopen_binmode() [](#method-i-test_reopen_binmode)

## test_reopen_encoding() [](#method-i-test_reopen_encoding)

## test_reopen_encoding_from_io() [](#method-i-test_reopen_encoding_from_io)

## test_reopen_inherit() [](#method-i-test_reopen_inherit)

## test_reopen_ivar() [](#method-i-test_reopen_ivar)

## test_reopen_mode() [](#method-i-test_reopen_mode)

## test_reopen_opt() [](#method-i-test_reopen_opt)

## test_reopen_opt_encoding() [](#method-i-test_reopen_opt_encoding)

## test_reopen_stdio() [](#method-i-test_reopen_stdio)

## test_rubydev33072() [](#method-i-test_rubydev33072)

## test_s_binread_does_not_leak_with_invalid_offset() [](#method-i-test_s_binread_does_not_leak_with_invalid_offset)

## test_s_binwrite() [](#method-i-test_s_binwrite)

## test_s_read() [](#method-i-test_s_read)

## test_s_readlines() [](#method-i-test_s_readlines)

## test_s_write() [](#method-i-test_s_write)

## test_seek() [](#method-i-test_seek)

## test_seek_symwhence() [](#method-i-test_seek_symwhence)

## test_select_exceptfds() [](#method-i-test_select_exceptfds)

## test_select_memory_leak() [](#method-i-test_select_memory_leak)

## test_set_lineno() [](#method-i-test_set_lineno)

## test_set_lineno_gets() [](#method-i-test_set_lineno_gets)

## test_set_lineno_readline() [](#method-i-test_set_lineno_readline)

## test_set_stdout() [](#method-i-test_set_stdout)

## test_setpos() [](#method-i-test_setpos)

## test_single_exception_on_close() [](#method-i-test_single_exception_on_close)

## test_std_fileno() [](#method-i-test_std_fileno)

## test_stdout_to_closed_pipe() [](#method-i-test_stdout_to_closed_pipe)

## test_sysopen() [](#method-i-test_sysopen)

## test_sysread() [](#method-i-test_sysread)

## test_sysread_buffer_not_raise_shared_string_error() [](#method-i-test_sysread_buffer_not_raise_shared_string_error)

## test_sysread_locktmp() [](#method-i-test_sysread_locktmp)

## test_sysread_unlocktmp_ensure() [](#method-i-test_sysread_unlocktmp_ensure)

## test_sysread_with_negative_length() [](#method-i-test_sysread_with_negative_length)

## test_sysread_with_not_empty_buffer() [](#method-i-test_sysread_with_not_empty_buffer)

## test_sysseek() [](#method-i-test_sysseek)

## test_syswrite() [](#method-i-test_syswrite)

## test_threaded_flush() [](#method-i-test_threaded_flush)

## test_try_convert() [](#method-i-test_try_convert)

## test_ungetbyte() [](#method-i-test_ungetbyte)

## test_ungetbyte_with_seek() [](#method-i-test_ungetbyte_with_seek)

## test_ungetc() [](#method-i-test_ungetc)
This test cause SEGV.

## test_ungetc2() [](#method-i-test_ungetc2)

## test_ungetc_with_seek() [](#method-i-test_ungetc_with_seek)

## test_uninitialized() [](#method-i-test_uninitialized)

## test_warn() [](#method-i-test_warn)

## test_write_32bit_boundary() [](#method-i-test_write_32bit_boundary)

## test_write_buffered_with_multiple_arguments() [](#method-i-test_write_buffered_with_multiple_arguments)

## test_write_epipe_nosync() [](#method-i-test_write_epipe_nosync)

## test_write_no_args() [](#method-i-test_write_no_args)

## test_write_non_writable() [](#method-i-test_write_non_writable)

## test_write_nonblock() [](#method-i-test_write_nonblock)

## test_write_nonblock_error() [](#method-i-test_write_nonblock_error)

## test_write_nonblock_file() [](#method-i-test_write_nonblock_file)

## test_write_nonblock_invalid_exception() [](#method-i-test_write_nonblock_invalid_exception)

## test_write_nonblock_no_exceptions() [](#method-i-test_write_nonblock_no_exceptions)

## test_write_nonblock_simple_no_exceptions() [](#method-i-test_write_nonblock_simple_no_exceptions)

## test_write_with_many_arguments() [](#method-i-test_write_with_many_arguments)

## test_write_with_multiple_arguments() [](#method-i-test_write_with_multiple_arguments)

## test_write_with_multiple_arguments_and_buffer() [](#method-i-test_write_with_multiple_arguments_and_buffer)

## test_write_with_multiple_nonstring_arguments() [](#method-i-test_write_with_multiple_nonstring_arguments)

## trapping_usr2() [](#method-i-trapping_usr2)

## try_fdopen(fd, autoclosetrue, level50) [](#method-i-try_fdopen)

## with_bigcontent() [](#method-i-with_bigcontent)

**@yield** ["abc" * 123456] 

## with_bigsrc() [](#method-i-with_bigsrc)

## with_megacontent() [](#method-i-with_megacontent)

**@yield** ["abc" * 1234567] 

## with_megasrc() [](#method-i-with_megasrc)

## with_pipe() [](#method-i-with_pipe)

## with_pipecontent() [](#method-i-with_pipecontent)

## with_read_pipe(content) [](#method-i-with_read_pipe)

## with_socketpair() [](#method-i-with_socketpair)

## with_srccontent(content"baz") [](#method-i-with_srccontent)

