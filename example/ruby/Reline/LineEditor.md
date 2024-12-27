# Class: Reline::LineEditor
**Inherits:** Object
    



# Attributes
## auto_indent_proc[RW] [](#attribute-i-auto_indent_proc)
Returns the value of attribute auto_indent_proc.

## byte_pointer[RW] [](#attribute-i-byte_pointer)
TODO: Use "private alias_method" idiom after drop Ruby 2.5.

## completion_append_character[RW] [](#attribute-i-completion_append_character)
Returns the value of attribute completion_append_character.

## completion_proc[RW] [](#attribute-i-completion_proc)
Returns the value of attribute completion_proc.

## confirm_multiline_termination_proc[RW] [](#attribute-i-confirm_multiline_termination_proc)
Returns the value of attribute confirm_multiline_termination_proc.

## dig_perfect_match_proc[RW] [](#attribute-i-dig_perfect_match_proc)
Returns the value of attribute dig_perfect_match_proc.

## output_modifier_proc[RW] [](#attribute-i-output_modifier_proc)
Returns the value of attribute output_modifier_proc.

## prompt_proc[RW] [](#attribute-i-prompt_proc)
Returns the value of attribute prompt_proc.


#Instance Methods
## add_dialog_proc(name, p, contextnil) [](#method-i-add_dialog_proc)

## calculate_overlay_levels(overlay_levels) [](#method-i-calculate_overlay_levels)

## call_completion_proc(pre, target, post, quote) [](#method-i-call_completion_proc)

## call_completion_proc_with_checking_args(pre, target, post) [](#method-i-call_completion_proc_with_checking_args)

## clear_dialogs() [](#method-i-clear_dialogs)

## confirm_multiline_termination() [](#method-i-confirm_multiline_termination)

## current_byte_pointer_cursor() [](#method-i-current_byte_pointer_cursor)

## current_line() [](#method-i-current_line)

## delete_text(startnil, lengthnil) [](#method-i-delete_text)

## dialog_proc_scope_completion_journey_data() [](#method-i-dialog_proc_scope_completion_journey_data)

## editing_mode() [](#method-i-editing_mode)

## encoding() [](#method-i-encoding)

## eof?() [](#method-i-eof?)

**@return** [Boolean] 

## finalize() [](#method-i-finalize)

## finish() [](#method-i-finish)

## finished?() [](#method-i-finished?)

**@return** [Boolean] 

## handle_signal() [](#method-i-handle_signal)

## initialize(config) [](#method-i-initialize)

**@return** [LineEditor] a new instance of LineEditor

## input_key(key) [](#method-i-input_key)

## insert_multiline_text(text) [](#method-i-insert_multiline_text)

## insert_text(text) [](#method-i-insert_text)

## io_gate() [](#method-i-io_gate)

## line() [](#method-i-line)

## modified_lines() [](#method-i-modified_lines)

## multiline_off() [](#method-i-multiline_off)

## multiline_on() [](#method-i-multiline_on)

## print_nomultiline_prompt() [](#method-i-print_nomultiline_prompt)

## prompt_list() [](#method-i-prompt_list)

## push_input_lines() [](#method-i-push_input_lines)

## render() [](#method-i-render)

## render_finished() [](#method-i-render_finished)

## render_line_differential(old_items, new_items) [](#method-i-render_line_differential)

## rerender() [](#method-i-rerender)

## reset(prompt'') [](#method-i-reset)

## reset_line() [](#method-i-reset_line)

## reset_variables(prompt'') [](#method-i-reset_variables)

## rest_height(wrapped_cursor_y) [](#method-i-rest_height)

## retrieve_completion_block() [](#method-i-retrieve_completion_block)

## save_old_buffer() [](#method-i-save_old_buffer)

## screen_height() [](#method-i-screen_height)

## screen_scroll_top() [](#method-i-screen_scroll_top)

## screen_width() [](#method-i-screen_width)

## scroll_into_view() [](#method-i-scroll_into_view)

## set_current_line(line, byte_pointernil) [](#method-i-set_current_line)

## set_pasting_state(in_pasting) [](#method-i-set_pasting_state)

## set_signal_handlers() [](#method-i-set_signal_handlers)

## test_menu_info_format() [](#method-i-test_menu_info_format)

## trim_input_lines() [](#method-i-trim_input_lines)

## update(key) [](#method-i-update)

## update_dialogs(keynil) [](#method-i-update_dialogs)

## upper_space_height(wrapped_cursor_y) [](#method-i-upper_space_height)

## whole_buffer() [](#method-i-whole_buffer)

## whole_lines() [](#method-i-whole_lines)

## with_cache(key, *deps) [](#method-i-with_cache)

## wrap_method_call(method_symbol, method_obj, key, with_operatorfalse) [](#method-i-wrap_method_call)

## wrapped_cursor_position() [](#method-i-wrapped_cursor_position)
Calculate cursor position in word wrapped content.

## wrapped_prompt_and_input_lines() [](#method-i-wrapped_prompt_and_input_lines)

