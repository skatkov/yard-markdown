# Class: TestEncodingConverter
**Inherits:** Test::Unit::TestCase
    




#Instance Methods
## assert_econv(converted, eres, obuf_bytesize, ec, consumed, rest, optsnil) [](#method-i-assert_econv)

## assert_errinfo(e_res, e_enc1, e_enc2, e_error_bytes, e_readagain_bytes, ec) [](#method-i-assert_errinfo)

## check_ec(edst, esrc, eres, dst, src, ec, off, len, optsnil) [](#method-i-check_ec)

## test_88591() [](#method-i-test_88591)

## test_accumulate_dst1() [](#method-i-test_accumulate_dst1)

## test_accumulate_dst2() [](#method-i-test_accumulate_dst2)

## test_after_output() [](#method-i-test_after_output)

## test_asciicompat_encoding_iso2022jp() [](#method-i-test_asciicompat_encoding_iso2022jp)

## test_convert() [](#method-i-test_convert)

## test_convpath() [](#method-i-test_convpath)

## test_cr_newline() [](#method-i-test_cr_newline)

## test_cr_newline2() [](#method-i-test_cr_newline2)

## test_crlf_newline() [](#method-i-test_crlf_newline)

## test_crlf_newline2() [](#method-i-test_crlf_newline2)

## test_default_external() [](#method-i-test_default_external)

## test_econv_new_hash() [](#method-i-test_econv_new_hash)

## test_errinfo_invalid_euc_jp() [](#method-i-test_errinfo_invalid_euc_jp)

## test_errinfo_invalid_euc_jp2() [](#method-i-test_errinfo_invalid_euc_jp2)

## test_errinfo_invalid_partial_character() [](#method-i-test_errinfo_invalid_partial_character)

## test_errinfo_invalid_utf16be() [](#method-i-test_errinfo_invalid_utf16be)

## test_errinfo_invalid_utf16le() [](#method-i-test_errinfo_invalid_utf16le)

## test_errinfo_undefined_hiragana() [](#method-i-test_errinfo_undefined_hiragana)

## test_errinfo_valid_partial_character() [](#method-i-test_errinfo_valid_partial_character)

## test_errors() [](#method-i-test_errors)

## test_errors2() [](#method-i-test_errors2)

## test_eucjp_to_utf8() [](#method-i-test_eucjp_to_utf8)

## test_exc_incomplete() [](#method-i-test_exc_incomplete)

## test_exc_invalid() [](#method-i-test_exc_invalid)

## test_exc_undef() [](#method-i-test_exc_undef)

## test_finish_incomplete_error() [](#method-i-test_finish_incomplete_error)

## test_finish_iso2022jp() [](#method-i-test_finish_iso2022jp)

## test_get_encoding() [](#method-i-test_get_encoding)

## test_get_replacement() [](#method-i-test_get_replacement)

## test_hex_charref() [](#method-i-test_hex_charref)

## test_invalid() [](#method-i-test_invalid)

## test_invalid2() [](#method-i-test_invalid2)

## test_invalid3() [](#method-i-test_invalid3)

## test_invalid4() [](#method-i-test_invalid4)

## test_invalid_ignore() [](#method-i-test_invalid_ignore)

## test_invalid_replace() [](#method-i-test_invalid_replace)

## test_invalid_replace2() [](#method-i-test_invalid_replace2)

## test_invalid_utf16be() [](#method-i-test_invalid_utf16be)

## test_invalid_utf16le() [](#method-i-test_invalid_utf16le)

## test_invalid_utf32be() [](#method-i-test_invalid_utf32be)

## test_invalid_utf32le() [](#method-i-test_invalid_utf32le)

## test_iso2022jp() [](#method-i-test_iso2022jp)

## test_iso2022jp_decode() [](#method-i-test_iso2022jp_decode)

## test_iso2022jp_encode() [](#method-i-test_iso2022jp_encode)

## test_iso2022jp_invalid_replace() [](#method-i-test_iso2022jp_invalid_replace)

## test_last_error1() [](#method-i-test_last_error1)

## test_last_error2() [](#method-i-test_last_error2)

## test_newline_converter_with_ascii_incompatible() [](#method-i-test_newline_converter_with_ascii_incompatible)

## test_newline_option() [](#method-i-test_newline_option)

## test_nil_destination_bytesize() [](#method-i-test_nil_destination_bytesize)

## test_nil_destination_bytesize2() [](#method-i-test_nil_destination_bytesize2)

## test_nil_destination_bytesize_with_nonnil_byteoffset() [](#method-i-test_nil_destination_bytesize_with_nonnil_byteoffset)

## test_nil_source_buffer() [](#method-i-test_nil_source_buffer)

## test_no_universal_newline1() [](#method-i-test_no_universal_newline1)

## test_no_universal_newline2() [](#method-i-test_no_universal_newline2)

## test_noconv() [](#method-i-test_noconv)

## test_noconv_after_output() [](#method-i-test_noconv_after_output)

## test_noconv_insert_output() [](#method-i-test_noconv_insert_output)

## test_noconv_partial() [](#method-i-test_noconv_partial)

## test_output_iso2022jp() [](#method-i-test_output_iso2022jp)

## test_output_region() [](#method-i-test_output_region)

## test_partial_input() [](#method-i-test_partial_input)

## test_putback() [](#method-i-test_putback)

## test_putback2() [](#method-i-test_putback2)

## test_result_encoding() [](#method-i-test_result_encoding)

## test_s_asciicompat_encoding() [](#method-i-test_s_asciicompat_encoding)

## test_s_new() [](#method-i-test_s_new)

## test_s_new_convpath() [](#method-i-test_s_new_convpath)

## test_s_new_fail() [](#method-i-test_s_new_fail)

## test_search_convpath() [](#method-i-test_search_convpath)

## test_set_replacement() [](#method-i-test_set_replacement)

## test_undef_ignore() [](#method-i-test_undef_ignore)

## test_undef_replace() [](#method-i-test_undef_replace)

## test_universal_newline() [](#method-i-test_universal_newline)

## test_universal_newline2() [](#method-i-test_universal_newline2)

## test_universal_newline3() [](#method-i-test_universal_newline3)

## test_us_ascii() [](#method-i-test_us_ascii)

## test_xml_escape_attr_content() [](#method-i-test_xml_escape_attr_content)

## test_xml_escape_attr_quote() [](#method-i-test_xml_escape_attr_quote)

## test_xml_escape_text() [](#method-i-test_xml_escape_text)

## test_xml_escape_with_charref() [](#method-i-test_xml_escape_with_charref)

## test_xml_hasharg() [](#method-i-test_xml_hasharg)

