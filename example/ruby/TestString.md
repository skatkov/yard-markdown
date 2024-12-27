# Class: TestString
**Inherits:** Test::Unit::TestCase
    



# Class Methods
## to_str() [](#method-c-to_str)

#Instance Methods
## S(*args, **kw) [](#method-i-S)

## casetest(a, b, revfalse) [](#method-i-casetest)

## check_sum(str, bits16) [](#method-i-check_sum)

## crypt_supports_des_crypt?() [](#method-i-crypt_supports_des_crypt?)

**@return** [Boolean] 

## initialize(*args) [](#method-i-initialize)

**@return** [TestString] a new instance of TestString

## test_AREF() [](#method-i-test_AREF)
'[]'

## test_AREF_invalid_encoding() [](#method-i-test_AREF_invalid_encoding)

## test_AREF_underflow() [](#method-i-test_AREF_underflow)

## test_ASET() [](#method-i-test_ASET)
'[]='

## test_CMP() [](#method-i-test_CMP)
'<=>'

## test_EQUAL() [](#method-i-test_EQUAL)
'=='

## test_LSHIFT() [](#method-i-test_LSHIFT)
'<<'

## test_LSHIFT_neary_long_max() [](#method-i-test_LSHIFT_neary_long_max)

## test_MATCH() [](#method-i-test_MATCH)
'=~'

## test_MOD() [](#method-i-test_MOD)
'%'

## test_MUL() [](#method-i-test_MUL)
'*'

## test_PLUS() [](#method-i-test_PLUS)
'+'

## test_VERY_EQUAL() [](#method-i-test_VERY_EQUAL)
'==='

## test_append_bytes_into_binary() [](#method-i-test_append_bytes_into_binary)

## test_append_bytes_into_utf32() [](#method-i-test_append_bytes_into_utf32)

## test_append_bytes_into_utf8() [](#method-i-test_append_bytes_into_utf8)

## test_ascii_incomat_inspect() [](#method-i-test_ascii_incomat_inspect)

## test_byteindex() [](#method-i-test_byteindex)

## test_byterindex() [](#method-i-test_byterindex)

## test_bytes() [](#method-i-test_bytes)

## test_byteslice() [](#method-i-test_byteslice)

## test_byteslice_grapheme_clusters() [](#method-i-test_byteslice_grapheme_clusters)

## test_bytesplice() [](#method-i-test_bytesplice)

## test_capitalize() [](#method-i-test_capitalize)

## test_capitalize!() [](#method-i-test_capitalize!)

## test_casecmp() [](#method-i-test_casecmp)
def test_compare_different_encoding_string
      s1 = S("\xff".force_encoding("UTF-8"))
      s2 = S("\xff".force_encoding("ISO-2022-JP"))
      assert_equal([-1, 1], [s1 <=> s2, s2 <=> s1].sort)
    end

## test_casecmp?() [](#method-i-test_casecmp?)

**@return** [Boolean] 

## test_center() [](#method-i-test_center)

## test_chars() [](#method-i-test_chars)

## test_chilled_string() [](#method-i-test_chilled_string)

## test_chilled_string_setivar() [](#method-i-test_chilled_string_setivar)

## test_chilled_string_substring() [](#method-i-test_chilled_string_substring)

## test_chomp() [](#method-i-test_chomp)

## test_chomp!() [](#method-i-test_chomp!)

## test_chop() [](#method-i-test_chop)

## test_chop!() [](#method-i-test_chop!)

## test_chr() [](#method-i-test_chr)

## test_clear() [](#method-i-test_clear)

## test_clear_nonasciicompat() [](#method-i-test_clear_nonasciicompat)

## test_clone() [](#method-i-test_clone)

## test_codepoints() [](#method-i-test_codepoints)

## test_concat() [](#method-i-test_concat)

## test_concat_literals() [](#method-i-test_concat_literals)

## test_count() [](#method-i-test_count)

## test_crypt() [](#method-i-test_crypt)

## test_delete() [](#method-i-test_delete)

## test_delete!() [](#method-i-test_delete!)

## test_delete_prefix() [](#method-i-test_delete_prefix)

## test_delete_prefix_argument_conversion() [](#method-i-test_delete_prefix_argument_conversion)

## test_delete_prefix_bang() [](#method-i-test_delete_prefix_bang)

## test_delete_prefix_bang_argument_conversion() [](#method-i-test_delete_prefix_bang_argument_conversion)

## test_delete_prefix_bang_broken_encoding() [](#method-i-test_delete_prefix_bang_broken_encoding)

## test_delete_prefix_bang_clear_coderange() [](#method-i-test_delete_prefix_bang_clear_coderange)

## test_delete_prefix_bang_frozen_error() [](#method-i-test_delete_prefix_bang_frozen_error)

## test_delete_prefix_bang_type_error() [](#method-i-test_delete_prefix_bang_type_error)

## test_delete_prefix_broken_encoding() [](#method-i-test_delete_prefix_broken_encoding)

## test_delete_prefix_clear_coderange() [](#method-i-test_delete_prefix_clear_coderange)

## test_delete_prefix_type_error() [](#method-i-test_delete_prefix_type_error)

## test_delete_suffix() [](#method-i-test_delete_suffix)

## test_delete_suffix_argument_conversion() [](#method-i-test_delete_suffix_argument_conversion)

## test_delete_suffix_bang() [](#method-i-test_delete_suffix_bang)

## test_delete_suffix_bang_argument_conversion() [](#method-i-test_delete_suffix_bang_argument_conversion)

## test_delete_suffix_bang_broken_encoding() [](#method-i-test_delete_suffix_bang_broken_encoding)

## test_delete_suffix_bang_clear_coderange() [](#method-i-test_delete_suffix_bang_clear_coderange)

## test_delete_suffix_bang_frozen_error() [](#method-i-test_delete_suffix_bang_frozen_error)

## test_delete_suffix_bang_newline() [](#method-i-test_delete_suffix_bang_newline)

## test_delete_suffix_bang_type_error() [](#method-i-test_delete_suffix_bang_type_error)

## test_delete_suffix_broken_encoding() [](#method-i-test_delete_suffix_broken_encoding)

## test_delete_suffix_clear_coderange() [](#method-i-test_delete_suffix_clear_coderange)

## test_delete_suffix_newline() [](#method-i-test_delete_suffix_newline)

## test_delete_suffix_type_error() [](#method-i-test_delete_suffix_type_error)

## test_downcase() [](#method-i-test_downcase)

## test_downcase!() [](#method-i-test_downcase!)

## test_downcase2() [](#method-i-test_downcase2)

## test_dummy_inspect() [](#method-i-test_dummy_inspect)

## test_dump() [](#method-i-test_dump)

## test_dup() [](#method-i-test_dup)

## test_each() [](#method-i-test_each)

## test_each_byte() [](#method-i-test_each_byte)

## test_each_char() [](#method-i-test_each_char)

## test_each_codepoint() [](#method-i-test_each_codepoint)

## test_each_grapheme_cluster() [](#method-i-test_each_grapheme_cluster)

## test_each_line() [](#method-i-test_each_line)

## test_each_line_chomp() [](#method-i-test_each_line_chomp)

## test_empty?() [](#method-i-test_empty?)

**@return** [Boolean] 

## test_end_with?() [](#method-i-test_end_with?)

**@return** [Boolean] 

## test_eq_tilde_can_be_overridden() [](#method-i-test_eq_tilde_can_be_overridden)

## test_eql?() [](#method-i-test_eql?)

**@return** [Boolean] 

## test_frozen_check() [](#method-i-test_frozen_check)

## test_fs() [](#method-i-test_fs)

## test_fs_setter() [](#method-i-test_fs_setter)

## test_grapheme_clusters() [](#method-i-test_grapheme_clusters)

## test_grapheme_clusters_memory_leak() [](#method-i-test_grapheme_clusters_memory_leak)

## test_gsub() [](#method-i-test_gsub)

## test_gsub!() [](#method-i-test_gsub!)

## test_gsub_bang_gc_compact_stress() [](#method-i-test_gsub_bang_gc_compact_stress)

## test_gsub_encoding() [](#method-i-test_gsub_encoding)

## test_gsub_enumerator() [](#method-i-test_gsub_enumerator)

## test_gsub_gc_compact_stress() [](#method-i-test_gsub_gc_compact_stress)

## test_gsub_hash() [](#method-i-test_gsub_hash)

## test_hash() [](#method-i-test_hash)

## test_hex() [](#method-i-test_hex)

## test_include?() [](#method-i-test_include?)

**@return** [Boolean] 

## test_index() [](#method-i-test_index)

## test_initialize() [](#method-i-test_initialize)

## test_initialize_memory_leak() [](#method-i-test_initialize_memory_leak)

## test_initialize_nofree_memory_leak() [](#method-i-test_initialize_nofree_memory_leak)
Bug #18154

## test_initialize_nonstring() [](#method-i-test_initialize_nonstring)

## test_initialize_shared() [](#method-i-test_initialize_shared)

## test_insert() [](#method-i-test_insert)

## test_inspect_next_line() [](#method-i-test_inspect_next_line)

## test_inspect_nul() [](#method-i-test_inspect_nul)

## test_intern() [](#method-i-test_intern)

## test_ivar_set_after_frozen_dup() [](#method-i-test_ivar_set_after_frozen_dup)

## test_length() [](#method-i-test_length)

## test_lines() [](#method-i-test_lines)

## test_ljust() [](#method-i-test_ljust)

## test_lstrip() [](#method-i-test_lstrip)

## test_lstrip_bang() [](#method-i-test_lstrip_bang)

## test_match_method() [](#method-i-test_match_method)

## test_match_p_regexp() [](#method-i-test_match_p_regexp)

## test_match_p_string() [](#method-i-test_match_p_string)

## test_mod_check() [](#method-i-test_mod_check)

## test_nesting_shared() [](#method-i-test_nesting_shared)
def test_symbol_table_overflow
      assert_in_out_err([], <<-INPUT, [], /symbol table overflow \(symbol [a-z]{8}\) \(RuntimeError\)/)
        ("aaaaaaaa".."zzzzzzzz").each {|s| s.to_sym }
      INPUT
    end

## test_nesting_shared_b() [](#method-i-test_nesting_shared_b)

## test_next() [](#method-i-test_next)

## test_next!() [](#method-i-test_next!)

## test_oct() [](#method-i-test_oct)

## test_ord() [](#method-i-test_ord)

## test_partition() [](#method-i-test_partition)

## test_prepend() [](#method-i-test_prepend)

## test_rb_str_new4() [](#method-i-test_rb_str_new4)

## test_rb_str_shared_replace() [](#method-i-test_rb_str_shared_replace)

## test_rb_str_to_str() [](#method-i-test_rb_str_to_str)

## test_regexp_match_subclass() [](#method-i-test_regexp_match_subclass)

## test_replace() [](#method-i-test_replace)

## test_respond_to() [](#method-i-test_respond_to)

## test_reverse() [](#method-i-test_reverse)

## test_reverse!() [](#method-i-test_reverse!)

## test_rindex() [](#method-i-test_rindex)

## test_rjust() [](#method-i-test_rjust)

## test_rpartition() [](#method-i-test_rpartition)

## test_rstrip() [](#method-i-test_rstrip)

## test_rstrip_bang() [](#method-i-test_rstrip_bang)

## test_s_new() [](#method-i-test_s_new)

## test_scan() [](#method-i-test_scan)

## test_scan_gc_compact_stress() [](#method-i-test_scan_gc_compact_stress)

## test_scan_segv() [](#method-i-test_scan_segv)

## test_shared_force_encoding() [](#method-i-test_shared_force_encoding)

## test_size() [](#method-i-test_size)

## test_slice() [](#method-i-test_slice)

## test_slice!() [](#method-i-test_slice!)

## test_splice!() [](#method-i-test_splice!)

## test_split() [](#method-i-test_split)

## test_split_dupped() [](#method-i-test_split_dupped)

## test_split_encoding() [](#method-i-test_split_encoding)

## test_split_invalid_argument() [](#method-i-test_split_invalid_argument)

## test_split_invalid_sequence() [](#method-i-test_split_invalid_sequence)

## test_split_lookbehind() [](#method-i-test_split_lookbehind)

## test_split_wchar() [](#method-i-test_split_wchar)

## test_split_with_block() [](#method-i-test_split_with_block)

## test_squeeze() [](#method-i-test_squeeze)

## test_squeeze!() [](#method-i-test_squeeze!)

## test_start_with?() [](#method-i-test_start_with?)

**@return** [Boolean] 

## test_start_with_regexp() [](#method-i-test_start_with_regexp)

## test_start_with_timeout_memory_leak() [](#method-i-test_start_with_timeout_memory_leak)

## test_str_new4() [](#method-i-test_str_new4)

## test_string_interpolations_across_heaps_get_embedded() [](#method-i-test_string_interpolations_across_heaps_get_embedded)

## test_strip() [](#method-i-test_strip)

## test_strip!() [](#method-i-test_strip!)

## test_sub() [](#method-i-test_sub)

## test_sub!() [](#method-i-test_sub!)

## test_sub_gc_compact_stress() [](#method-i-test_sub_gc_compact_stress)

## test_sub_hash() [](#method-i-test_sub_hash)

## test_substr_code_range() [](#method-i-test_substr_code_range)

## test_substr_negative_begin() [](#method-i-test_substr_negative_begin)

## test_succ() [](#method-i-test_succ)

## test_succ!() [](#method-i-test_succ!)

## test_sum() [](#method-i-test_sum)

## test_sum_2() [](#method-i-test_sum_2)

## test_sum_long() [](#method-i-test_sum_long)

## test_swapcase() [](#method-i-test_swapcase)

## test_swapcase!() [](#method-i-test_swapcase!)

## test_times() [](#method-i-test_times)

## test_times2() [](#method-i-test_times2)

## test_to_f() [](#method-i-test_to_f)

## test_to_i() [](#method-i-test_to_i)

## test_to_id() [](#method-i-test_to_id)

## test_to_s() [](#method-i-test_to_s)

## test_to_s_2() [](#method-i-test_to_s_2)

## test_to_str() [](#method-i-test_to_str)

## test_tr() [](#method-i-test_tr)

## test_tr!() [](#method-i-test_tr!)

## test_tr_s() [](#method-i-test_tr_s)

## test_tr_s!() [](#method-i-test_tr_s!)

## test_try_convert() [](#method-i-test_try_convert)

## test_uminus_frozen() [](#method-i-test_uminus_frozen)

## test_uminus_no_freeze_not_bare() [](#method-i-test_uminus_no_freeze_not_bare)

## test_undump() [](#method-i-test_undump)

## test_undump_gc_compact_stress() [](#method-i-test_undump_gc_compact_stress)

## test_unknown_string_option() [](#method-i-test_unknown_string_option)

## test_unpack() [](#method-i-test_unpack)

## test_upcase() [](#method-i-test_upcase)

## test_upcase!() [](#method-i-test_upcase!)

## test_upcase2() [](#method-i-test_upcase2)

## test_uplus_minus() [](#method-i-test_uplus_minus)
enable only when string size range is smaller than memory space

## test_upto() [](#method-i-test_upto)

## test_upto_nonalnum() [](#method-i-test_upto_nonalnum)

## test_upto_numeric() [](#method-i-test_upto_numeric)

## u(str) [](#method-i-u)

