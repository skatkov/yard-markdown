# Class: Reline::ANSI
**Inherits:** Reline::IO
    



# Attributes
## input=[R] [](#attribute-i-input=)
Sets the attribute input

**@param** [] the value to set the attribute input to.

## output=[R] [](#attribute-i-output=)
Sets the attribute output

**@param** [] the value to set the attribute output to.


#Instance Methods
## both_tty?() [](#method-i-both_tty?)

**@return** [Boolean] 

## buffered_output() [](#method-i-buffered_output)

## clear_screen() [](#method-i-clear_screen)

## cursor_pos() [](#method-i-cursor_pos)

## deprep(otio) [](#method-i-deprep)

## empty_buffer?() [](#method-i-empty_buffer?)

**@return** [Boolean] 

## encoding() [](#method-i-encoding)

## erase_after_cursor() [](#method-i-erase_after_cursor)

## get_screen_size() [](#method-i-get_screen_size)

## getc(timeout_second) [](#method-i-getc)
if the usage expects to wait indefinitely, use Float::INFINITY for
timeout_second

## hide_cursor() [](#method-i-hide_cursor)

## in_pasting?() [](#method-i-in_pasting?)

**@return** [Boolean] 

## initialize() [](#method-i-initialize)

**@return** [ANSI] a new instance of ANSI

## inner_getc(timeout_second) [](#method-i-inner_getc)

## move_cursor_column(x) [](#method-i-move_cursor_column)

## move_cursor_down(x) [](#method-i-move_cursor_down)

## move_cursor_up(x) [](#method-i-move_cursor_up)

## prep() [](#method-i-prep)

## read_bracketed_paste() [](#method-i-read_bracketed_paste)

## retrieve_keybuffer() [](#method-i-retrieve_keybuffer)

## scroll_down(x) [](#method-i-scroll_down)
This only works when the cursor is at the bottom of the scroll range For more
details, see https://github.com/ruby/reline/pull/577#issuecomment-1646679623

## set_bracketed_paste_key_bindings(config) [](#method-i-set_bracketed_paste_key_bindings)

## set_default_key_bindings(config) [](#method-i-set_default_key_bindings)

## set_default_key_bindings_ansi_cursor(config) [](#method-i-set_default_key_bindings_ansi_cursor)

## set_default_key_bindings_comprehensive_list(config) [](#method-i-set_default_key_bindings_comprehensive_list)

## set_screen_size(rows, columns) [](#method-i-set_screen_size)

## set_winch_handler(&handler) [](#method-i-set_winch_handler)

## show_cursor() [](#method-i-show_cursor)

## ungetc(c) [](#method-i-ungetc)

## with_raw_input() [](#method-i-with_raw_input)

## write(string) [](#method-i-write)

