# Class: TestWin32OLE
**Inherits:** Test::Unit::TestCase
    
**Includes:** TestCaseForDict
  




#Instance Methods
## setup() [](#method-i-setup)

## test__invoke() [](#method-i-test__invoke)

## test_add() [](#method-i-test_add)

## test_bracket() [](#method-i-test_bracket)

## test_bracket_equal() [](#method-i-test_bracket_equal)

## test_bracket_with_numkey() [](#method-i-test_bracket_with_numkey)

## test_const_CP_ACP() [](#method-i-test_const_CP_ACP)

## test_const_CP_MACCP() [](#method-i-test_const_CP_MACCP)

## test_const_CP_OEMCP() [](#method-i-test_const_CP_OEMCP)

## test_const_CP_SYMBOL() [](#method-i-test_const_CP_SYMBOL)

## test_const_CP_THREAD_ACP() [](#method-i-test_const_CP_THREAD_ACP)

## test_const_CP_UTF7() [](#method-i-test_const_CP_UTF7)

## test_const_CP_UTF8() [](#method-i-test_const_CP_UTF8)

## test_const_LOCALE_SYSTEM_DEFAULT() [](#method-i-test_const_LOCALE_SYSTEM_DEFAULT)

## test_const_LOCALE_USER_DEFAULT() [](#method-i-test_const_LOCALE_USER_DEFAULT)

## test_convert_bignum() [](#method-i-test_convert_bignum)

## test_cp51932() [](#method-i-test_cp51932)

## test_each() [](#method-i-test_each)

## test_get_win32ole_object() [](#method-i-test_get_win32ole_object)

## test_invoke() [](#method-i-test_invoke)

## test_invoke_accept_multi_hash_key() [](#method-i-test_invoke_accept_multi_hash_key)

## test_invoke_accept_symbol_hash_key() [](#method-i-test_invoke_accept_symbol_hash_key)

## test_invoke_hash_key_non_str_sym() [](#method-i-test_invoke_hash_key_non_str_sym)

## test_invoke_with_array() [](#method-i-test_invoke_with_array)

## test_method_missing() [](#method-i-test_method_missing)

## test_methods() [](#method-i-test_methods)

## test_no_method_error() [](#method-i-test_no_method_error)

## test_non_exist_property() [](#method-i-test_non_exist_property)

## test_ole_func_methods() [](#method-i-test_ole_func_methods)

## test_ole_get_methods() [](#method-i-test_ole_get_methods)

## test_ole_invoke_with_named_arg_last() [](#method-i-test_ole_invoke_with_named_arg_last)

## test_ole_method_help() [](#method-i-test_ole_method_help)

## test_ole_methods() [](#method-i-test_ole_methods)

## test_ole_obj_help() [](#method-i-test_ole_obj_help)

## test_ole_put_methods() [](#method-i-test_ole_put_methods)

## test_ole_query_interface() [](#method-i-test_ole_query_interface)

## test_ole_respond_to() [](#method-i-test_ole_respond_to)

## test_ole_type() [](#method-i-test_ole_type)

## test_ole_typelib() [](#method-i-test_ole_typelib)

## test_raise_message() [](#method-i-test_raise_message)

## test_s_codepage_changed() [](#method-i-test_s_codepage_changed)

## test_s_codepage_set() [](#method-i-test_s_codepage_set)
WIN32OLE.codepage is initialized according to Encoding.default_external.

def test_s_codepage
    assert_equal(WIN32OLE::CP_ACP, WIN32OLE.codepage)

end

## test_s_connect() [](#method-i-test_s_connect)

## test_s_connect_exc() [](#method-i-test_s_connect_exc)

## test_s_const_load() [](#method-i-test_s_const_load)

## test_s_create_guid() [](#method-i-test_s_create_guid)

## test_s_locale() [](#method-i-test_s_locale)

## test_s_locale_change() [](#method-i-test_s_locale_change)

## test_s_locale_set() [](#method-i-test_s_locale_set)

## test_s_new() [](#method-i-test_s_new)

## test_s_new_DCOM() [](#method-i-test_s_new_DCOM)

## test_s_new_exc() [](#method-i-test_s_new_exc)

## test_s_new_from_clsid() [](#method-i-test_s_new_from_clsid)

## test_setproperty() [](#method-i-test_setproperty)

## test_setproperty_equal_ended() [](#method-i-test_setproperty_equal_ended)

