# Class: Reline::Unicode
**Inherits:** Object
    



# Class Methods
## calculate_width(str , allow_escape_code false) [](#method-c-calculate_width)
## common_prefix(list , ignore_case: false) [](#method-c-common_prefix)
## ed_transpose_words(line , byte_pointer ) [](#method-c-ed_transpose_words)
## em_backward_word(line , byte_pointer ) [](#method-c-em_backward_word)
## em_big_backward_word(line , byte_pointer ) [](#method-c-em_big_backward_word)
## em_forward_word(line , byte_pointer ) [](#method-c-em_forward_word)
## em_forward_word_with_capitalization(line , byte_pointer ) [](#method-c-em_forward_word_with_capitalization)
## escape_for_print(str ) [](#method-c-escape_for_print)
## get_mbchar_width(mbchar ) [](#method-c-get_mbchar_width)
## get_next_mbchar_size(line , byte_pointer ) [](#method-c-get_next_mbchar_size)
## get_prev_mbchar_size(line , byte_pointer ) [](#method-c-get_prev_mbchar_size)
## safe_encode(str , encoding ) [](#method-c-safe_encode)
## space_character?(s ) [](#method-c-space_character?)
**@return** [Boolean] 

## split_by_width(str , max_width ) [](#method-c-split_by_width)
This method is used by IRB
## split_line_by_width(str , max_width , encoding str.encoding, offset: 0) [](#method-c-split_line_by_width)
## strip_non_printing_start_end(prompt ) [](#method-c-strip_non_printing_start_end)
## take_mbchar_range(str , start_col , width , cover_begin: false, cover_end: false, padding: false) [](#method-c-take_mbchar_range)
## take_range(str , start_col , max_width ) [](#method-c-take_range)
Take a chunk of a String cut by width with escape sequences.
## vi_backward_word(line , byte_pointer ) [](#method-c-vi_backward_word)
## vi_big_backward_word(line , byte_pointer ) [](#method-c-vi_big_backward_word)
## vi_big_forward_end_word(line , byte_pointer ) [](#method-c-vi_big_forward_end_word)
## vi_big_forward_word(line , byte_pointer ) [](#method-c-vi_big_forward_word)
## vi_first_print(line ) [](#method-c-vi_first_print)
## vi_forward_end_word(line , byte_pointer ) [](#method-c-vi_forward_end_word)
## vi_forward_word(line , byte_pointer , drop_terminate_spaces false) [](#method-c-vi_forward_word)
## word_character?(s ) [](#method-c-word_character?)
**@return** [Boolean] 


