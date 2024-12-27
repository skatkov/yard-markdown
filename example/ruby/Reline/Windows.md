# Class: Reline::Windows
**Inherits:** Reline::IO
    



# Attributes
## output=[R] [](#attribute-i-output=)
Sets the attribute output

**@param** [] the value to set the attribute output to.


#Instance Methods
## buffered_output() [](#method-i-buffered_output)

## check_input_event() [](#method-i-check_input_event)

## clear_screen() [](#method-i-clear_screen)

## cursor_pos() [](#method-i-cursor_pos)

## deprep(otio) [](#method-i-deprep)

## disable_auto_linewrap(settingtrue, &block) [](#method-i-disable_auto_linewrap)

## empty_buffer?() [](#method-i-empty_buffer?)

**@return** [Boolean] 

## encoding() [](#method-i-encoding)

## erase_after_cursor() [](#method-i-erase_after_cursor)

## get_console_screen_buffer_info() [](#method-i-get_console_screen_buffer_info)

## get_screen_size() [](#method-i-get_screen_size)

## getc(_timeout_second) [](#method-i-getc)

## hide_cursor() [](#method-i-hide_cursor)

## in_pasting?() [](#method-i-in_pasting?)

**@return** [Boolean] 

## initialize() [](#method-i-initialize)

**@return** [Windows] a new instance of Windows

## move_cursor_column(val) [](#method-i-move_cursor_column)

## move_cursor_down(val) [](#method-i-move_cursor_down)

## move_cursor_up(val) [](#method-i-move_cursor_up)

## msys_tty?(io@hConsoleInputHandle) [](#method-i-msys_tty?)
if @legacy_console
    setconsolemode(getconsolemode() | ENABLE_VIRTUAL_TERMINAL_PROCESSING)
    @legacy_console = (getconsolemode() & ENABLE_VIRTUAL_TERMINAL_PROCESSING == 0)

end

**@return** [Boolean] 

## prep() [](#method-i-prep)

## process_key_event(repeat_count, virtual_key_code, virtual_scan_code, char_code, control_key_state) [](#method-i-process_key_event)

## scroll_down(x) [](#method-i-scroll_down)
This only works when the cursor is at the bottom of the scroll range For more
details, see https://github.com/ruby/reline/pull/577#issuecomment-1646679623

## set_default_key_bindings(config) [](#method-i-set_default_key_bindings)

## set_screen_size(rows, columns) [](#method-i-set_screen_size)

**@raise** [NotImplementedError] 

## set_winch_handler(&handler) [](#method-i-set_winch_handler)

## show_cursor() [](#method-i-show_cursor)

## ungetc(c) [](#method-i-ungetc)

## win?() [](#method-i-win?)

**@return** [Boolean] 

## win_legacy_console?() [](#method-i-win_legacy_console?)

**@return** [Boolean] 

## with_raw_input() [](#method-i-with_raw_input)

## write(string) [](#method-i-write)

