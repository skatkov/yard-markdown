# Class: TestM17N
**Inherits:** Test::Unit::TestCase
  
**Extended by:** TestM17N::AESU
    
**Includes:** TestM17N::AESU
  



# Class Methods
## a(str ) [](#method-c-a)
## e(str ) [](#method-c-e)
## s(str ) [](#method-c-s)
## u(str ) [](#method-c-u)
## ua(str ) [](#method-c-ua)

#Instance Methods
## a(str) [](#method-i-a)

## assert_encoding(encname, actual, messagenil) [](#method-i-assert_encoding)

## assert_regexp_fixed_ascii8bit(r) [](#method-i-assert_regexp_fixed_ascii8bit)

## assert_regexp_fixed_encoding(r) [](#method-i-assert_regexp_fixed_encoding)

## assert_regexp_fixed_eucjp(r) [](#method-i-assert_regexp_fixed_eucjp)

## assert_regexp_fixed_sjis(r) [](#method-i-assert_regexp_fixed_sjis)

## assert_regexp_fixed_utf8(r) [](#method-i-assert_regexp_fixed_utf8)

## assert_regexp_generic_ascii(r) [](#method-i-assert_regexp_generic_ascii)

## assert_regexp_generic_encoding(r) [](#method-i-assert_regexp_generic_encoding)

## assert_regexp_usascii_literal(r, enc, exnil) [](#method-i-assert_regexp_usascii_literal)

## assert_same_result(expected_proc, actual_proc) [](#method-i-assert_same_result)

## assert_str_enc_propagation(t, s1, s2) [](#method-i-assert_str_enc_propagation)

## assert_strenc(bytes, enc, actual, messagenil) [](#method-i-assert_strenc)

## e(str) [](#method-i-e)

## each_encoding(*strings) [](#method-i-each_encoding)

## encdump(str) [](#method-i-encdump)

## encdumpargs(args) [](#method-i-encdumpargs)

## s(str) [](#method-i-s)

## str_enc_compatible?(*strs) [](#method-i-str_enc_compatible?)

**@return** [Boolean] 

## test_array_to_s() [](#method-i-test_array_to_s)

## test_aset() [](#method-i-test_aset)

## test_begin_end_offset() [](#method-i-test_begin_end_offset)

## test_begin_end_offset_sjis() [](#method-i-test_begin_end_offset_sjis)

## test_bignum_to_s() [](#method-i-test_bignum_to_s)

## test_casecmp() [](#method-i-test_casecmp)

## test_chomp() [](#method-i-test_chomp)

## test_chr() [](#method-i-test_chr)

## test_combchar_codepoint() [](#method-i-test_combchar_codepoint)

## test_compatible() [](#method-i-test_compatible)

## test_count() [](#method-i-test_count)

## test_count_sjis_trailing_byte() [](#method-i-test_count_sjis_trailing_byte)

## test_delete() [](#method-i-test_delete)

## test_dup_aref() [](#method-i-test_dup_aref)

## test_dup_scan() [](#method-i-test_dup_scan)

## test_dynamic_ascii_regexp() [](#method-i-test_dynamic_ascii_regexp)

## test_dynamic_eucjp_regexp() [](#method-i-test_dynamic_eucjp_regexp)

## test_dynamic_sjis_regexp() [](#method-i-test_dynamic_sjis_regexp)

## test_dynamic_utf8_regexp() [](#method-i-test_dynamic_utf8_regexp)

## test_each_char() [](#method-i-test_each_char)

## test_each_line() [](#method-i-test_each_line)

## test_empty_string() [](#method-i-test_empty_string)

## test_encoding_find() [](#method-i-test_encoding_find)

## test_encoding_names_of_default_internal() [](#method-i-test_encoding_names_of_default_internal)

## test_encoding_to_s() [](#method-i-test_encoding_to_s)

## test_end_with() [](#method-i-test_end_with)

## test_env() [](#method-i-test_env)

## test_escaped_metachar() [](#method-i-test_escaped_metachar)

## test_euc_tw() [](#method-i-test_euc_tw)

## test_false_to_s() [](#method-i-test_false_to_s)

## test_fixnum_to_s() [](#method-i-test_fixnum_to_s)

## test_float_to_s() [](#method-i-test_float_to_s)

## test_force_encoding() [](#method-i-test_force_encoding)

## test_gbk() [](#method-i-test_gbk)

## test_getbyte() [](#method-i-test_getbyte)

## test_greek_capital_gap() [](#method-i-test_greek_capital_gap)

## test_gsub() [](#method-i-test_gsub)

## test_hash_to_s() [](#method-i-test_hash_to_s)

## test_include?() [](#method-i-test_include?)

**@return** [Boolean] 

## test_index() [](#method-i-test_index)

## test_insert() [](#method-i-test_insert)

## test_inspect_with_default_internal() [](#method-i-test_inspect_with_default_internal)

## test_magic_comment() [](#method-i-test_magic_comment)

## test_magic_comment_at_various_positions() [](#method-i-test_magic_comment_at_various_positions)

## test_magic_comment_vim() [](#method-i-test_magic_comment_vim)

## test_marshal() [](#method-i-test_marshal)

## test_next() [](#method-i-test_next)

## test_nil_inspect() [](#method-i-test_nil_inspect)

## test_nil_to_s() [](#method-i-test_nil_to_s)

## test_nonascii_method_name() [](#method-i-test_nonascii_method_name)

## test_object_inspect_external() [](#method-i-test_object_inspect_external)

## test_object_utf16_32_inspect() [](#method-i-test_object_utf16_32_inspect)

## test_plus() [](#method-i-test_plus)

## test_quote() [](#method-i-test_quote)

## test_regexp_ascii() [](#method-i-test_regexp_ascii)

## test_regexp_ascii_none() [](#method-i-test_regexp_ascii_none)

## test_regexp_embed() [](#method-i-test_regexp_embed)

## test_regexp_embed_preprocess() [](#method-i-test_regexp_embed_preprocess)

## test_regexp_euc() [](#method-i-test_regexp_euc)

## test_regexp_generic() [](#method-i-test_regexp_generic)

## test_regexp_match() [](#method-i-test_regexp_match)

## test_regexp_mixed_unicode() [](#method-i-test_regexp_mixed_unicode)

## test_regexp_named_class() [](#method-i-test_regexp_named_class)

## test_regexp_property() [](#method-i-test_regexp_property)

## test_regexp_sjis() [](#method-i-test_regexp_sjis)

## test_regexp_source() [](#method-i-test_regexp_source)

## test_regexp_too_short_multibyte_character() [](#method-i-test_regexp_too_short_multibyte_character)

## test_regexp_unicode() [](#method-i-test_regexp_unicode)

## test_regexp_usascii() [](#method-i-test_regexp_usascii)

## test_regexp_windows_31j() [](#method-i-test_regexp_windows_31j)

## test_reverse() [](#method-i-test_reverse)

## test_reverse_bang() [](#method-i-test_reverse_bang)

## test_scan() [](#method-i-test_scan)

## test_scrub_bang() [](#method-i-test_scrub_bang)

## test_scrub_dummy_encoding() [](#method-i-test_scrub_dummy_encoding)

## test_scrub_modification_inside_block() [](#method-i-test_scrub_modification_inside_block)

## test_scrub_replace_argument() [](#method-i-test_scrub_replace_argument)

## test_scrub_replace_block() [](#method-i-test_scrub_replace_block)

## test_scrub_replace_default() [](#method-i-test_scrub_replace_default)

## test_scrub_valid_string() [](#method-i-test_scrub_valid_string)

## test_scrub_widechar() [](#method-i-test_scrub_widechar)

## test_setbyte() [](#method-i-test_setbyte)

## test_setbyte_range() [](#method-i-test_setbyte_range)

## test_split() [](#method-i-test_split)

## test_sprintf_c() [](#method-i-test_sprintf_c)

## test_sprintf_p() [](#method-i-test_sprintf_p)

## test_sprintf_s() [](#method-i-test_sprintf_s)

## test_squeeze() [](#method-i-test_squeeze)

## test_str_String() [](#method-i-test_str_String)

## test_str_allocate() [](#method-i-test_str_allocate)

## test_str_aref() [](#method-i-test_str_aref)

## test_str_aref_force_encoding() [](#method-i-test_str_aref_force_encoding)

## test_str_aref_len() [](#method-i-test_str_aref_len)

## test_str_aref_substr() [](#method-i-test_str_aref_substr)

## test_str_b() [](#method-i-test_str_b)

## test_str_center() [](#method-i-test_str_center)

## test_str_concat() [](#method-i-test_str_concat)

## test_str_dump() [](#method-i-test_str_dump)

## test_str_lt() [](#method-i-test_str_lt)

## test_str_multiply() [](#method-i-test_str_multiply)

## test_string_ascii_literal() [](#method-i-test_string_ascii_literal)
tests start

## test_string_eucjp_literal() [](#method-i-test_string_eucjp_literal)

## test_string_inspect_encoding() [](#method-i-test_string_inspect_encoding)

## test_string_inspect_invalid() [](#method-i-test_string_inspect_invalid)

## test_string_mixed_unicode() [](#method-i-test_string_mixed_unicode)

## test_sub() [](#method-i-test_sub)

## test_sub2() [](#method-i-test_sub2)

## test_sub3() [](#method-i-test_sub3)

## test_symbol() [](#method-i-test_symbol)

## test_symbol_op() [](#method-i-test_symbol_op)

## test_tr() [](#method-i-test_tr)

## test_tr_s() [](#method-i-test_tr_s)

## test_true_to_s() [](#method-i-test_true_to_s)

## test_union_0() [](#method-i-test_union_0)

## test_union_1_asciionly_string() [](#method-i-test_union_1_asciionly_string)

## test_union_1_nonascii_string() [](#method-i-test_union_1_nonascii_string)

## test_union_1_regexp() [](#method-i-test_union_1_regexp)

## test_union_2() [](#method-i-test_union_2)

## test_upto() [](#method-i-test_upto)

## test_utf8_literal() [](#method-i-test_utf8_literal)

## test_utf8str_aref() [](#method-i-test_utf8str_aref)

## test_utf_dummy_are_like_regular_dummy_encodings() [](#method-i-test_utf_dummy_are_like_regular_dummy_encodings)

## test_utf_without_bom_asciionly() [](#method-i-test_utf_without_bom_asciionly)

## test_utf_without_bom_valid() [](#method-i-test_utf_without_bom_valid)

## test_valid_encoding() [](#method-i-test_valid_encoding)

## test_validate_redundant_utf8() [](#method-i-test_validate_redundant_utf8)

## test_validate_surrogate() [](#method-i-test_validate_surrogate)

## u(str) [](#method-i-u)

## ua(str) [](#method-i-ua)

