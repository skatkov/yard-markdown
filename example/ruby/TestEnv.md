# Class: TestEnv
**Inherits:** Test::Unit::TestCase
    




#Instance Methods
## assert_equal_env(as, bs) [](#method-i-assert_equal_env)

## assert_invalid_env(msgnil) [](#method-i-assert_invalid_env)

## ignore_case_str() [](#method-i-ignore_case_str)

## setup() [](#method-i-setup)

## str_for_assert_raise_on_yielded_exception_class(expected_error_class, ractor_var) [](#method-i-str_for_assert_raise_on_yielded_exception_class)

## str_for_yielding_exception_class(code_str, exception_var:"raised_exception") [](#method-i-str_for_yielding_exception_class)

## str_to_receive_invalid_envvar_errors(ractor_var) [](#method-i-str_to_receive_invalid_envvar_errors)

## str_to_yield_invalid_envvar_errors(var_name, code_str) [](#method-i-str_to_yield_invalid_envvar_errors)

## teardown() [](#method-i-teardown)

## test_aset() [](#method-i-test_aset)

## test_aset_in_ractor() [](#method-i-test_aset_in_ractor)

## test_assoc() [](#method-i-test_assoc)

## test_assoc_in_ractor() [](#method-i-test_assoc_in_ractor)

## test_bracket() [](#method-i-test_bracket)

## test_bracket_in_ractor() [](#method-i-test_bracket_in_ractor)

## test_clear() [](#method-i-test_clear)

## test_clear_in_ractor() [](#method-i-test_clear_in_ractor)

## test_clone() [](#method-i-test_clone)

## test_delete() [](#method-i-test_delete)

## test_delete_if() [](#method-i-test_delete_if)

## test_delete_if_in_ractor() [](#method-i-test_delete_if_in_ractor)

## test_delete_in_ractor() [](#method-i-test_delete_in_ractor)

## test_dup() [](#method-i-test_dup)

## test_dup_in_ractor() [](#method-i-test_dup_in_ractor)

## test_each_key() [](#method-i-test_each_key)

## test_each_key_in_ractor() [](#method-i-test_each_key_in_ractor)

## test_each_pair() [](#method-i-test_each_pair)

## test_each_pair_in_ractor() [](#method-i-test_each_pair_in_ractor)

## test_each_value() [](#method-i-test_each_value)

## test_each_value_in_ractor() [](#method-i-test_each_value_in_ractor)

## test_empty_p() [](#method-i-test_empty_p)

## test_empty_p_in_ractor() [](#method-i-test_empty_p_in_ractor)

## test_except() [](#method-i-test_except)

## test_except_in_ractor() [](#method-i-test_except_in_ractor)

## test_fetch() [](#method-i-test_fetch)

## test_fetch_in_ractor() [](#method-i-test_fetch_in_ractor)

## test_filter() [](#method-i-test_filter)

## test_filter_bang() [](#method-i-test_filter_bang)

## test_filter_bang_in_ractor() [](#method-i-test_filter_bang_in_ractor)

## test_filter_in_ractor() [](#method-i-test_filter_in_ractor)

## test_frozen() [](#method-i-test_frozen)

## test_frozen_env() [](#method-i-test_frozen_env)

## test_frozen_env_in_ractor() [](#method-i-test_frozen_env_in_ractor)

## test_frozen_in_ractor() [](#method-i-test_frozen_in_ractor)

## test_getenv() [](#method-i-test_getenv)

## test_getenv_in_ractor() [](#method-i-test_getenv_in_ractor)

## test_has_key() [](#method-i-test_has_key)

## test_has_key_in_ractor() [](#method-i-test_has_key_in_ractor)

## test_has_value() [](#method-i-test_has_value)

## test_has_value2() [](#method-i-test_has_value2)

## test_has_value2_in_ractor() [](#method-i-test_has_value2_in_ractor)

## test_has_value_in_ractor() [](#method-i-test_has_value_in_ractor)

## test_huge_value() [](#method-i-test_huge_value)

## test_huge_value_in_ractor() [](#method-i-test_huge_value_in_ractor)

## test_inspect() [](#method-i-test_inspect)

## test_inspect_encoding() [](#method-i-test_inspect_encoding)

## test_inspect_in_ractor() [](#method-i-test_inspect_in_ractor)

## test_invert() [](#method-i-test_invert)

## test_invert_in_ractor() [](#method-i-test_invert_in_ractor)

## test_ivar_in_env_should_not_be_access_from_non_main_ractors() [](#method-i-test_ivar_in_env_should_not_be_access_from_non_main_ractors)

## test_keep_if() [](#method-i-test_keep_if)

## test_keep_if_in_ractor() [](#method-i-test_keep_if_in_ractor)

## test_key() [](#method-i-test_key)

## test_key_in_ractor() [](#method-i-test_key_in_ractor)

## test_keys() [](#method-i-test_keys)

## test_keys_in_ractor() [](#method-i-test_keys_in_ractor)

## test_memory_crash_select() [](#method-i-test_memory_crash_select)

## test_memory_leak_aset() [](#method-i-test_memory_leak_aset)

## test_memory_leak_select() [](#method-i-test_memory_leak_select)

## test_memory_leak_shift() [](#method-i-test_memory_leak_shift)

## test_rassoc() [](#method-i-test_rassoc)

## test_rassoc_in_ractor() [](#method-i-test_rassoc_in_ractor)

## test_rehash() [](#method-i-test_rehash)

## test_rehash_in_ractor() [](#method-i-test_rehash_in_ractor)

## test_reject() [](#method-i-test_reject)

## test_reject_bang() [](#method-i-test_reject_bang)

## test_reject_bang_in_ractor() [](#method-i-test_reject_bang_in_ractor)

## test_reject_in_ractor() [](#method-i-test_reject_in_ractor)

## test_replace() [](#method-i-test_replace)

## test_replace_in_ractor() [](#method-i-test_replace_in_ractor)

## test_select() [](#method-i-test_select)

## test_select_bang() [](#method-i-test_select_bang)

## test_select_bang_in_ractor() [](#method-i-test_select_bang_in_ractor)

## test_select_in_ractor() [](#method-i-test_select_in_ractor)

## test_shared_substring() [](#method-i-test_shared_substring)

## test_shared_substring_in_ractor() [](#method-i-test_shared_substring_in_ractor)

## test_shift() [](#method-i-test_shift)

## test_shift_in_ractor() [](#method-i-test_shift_in_ractor)

## test_size() [](#method-i-test_size)

## test_size_in_ractor() [](#method-i-test_size_in_ractor)

## test_slice() [](#method-i-test_slice)

## test_slice_in_ractor() [](#method-i-test_slice_in_ractor)

## test_to_a() [](#method-i-test_to_a)

## test_to_a_in_ractor() [](#method-i-test_to_a_in_ractor)

## test_to_h() [](#method-i-test_to_h)

## test_to_h_in_ractor() [](#method-i-test_to_h_in_ractor)

## test_to_hash() [](#method-i-test_to_hash)

## test_to_hash_in_ractor() [](#method-i-test_to_hash_in_ractor)

## test_to_s() [](#method-i-test_to_s)

## test_to_s_in_ractor() [](#method-i-test_to_s_in_ractor)

## test_update() [](#method-i-test_update)

## test_update_in_ractor() [](#method-i-test_update_in_ractor)

## test_utf8() [](#method-i-test_utf8)

## test_utf8_empty() [](#method-i-test_utf8_empty)

## test_values() [](#method-i-test_values)

## test_values_at() [](#method-i-test_values_at)

## test_values_at_in_ractor() [](#method-i-test_values_at_in_ractor)

## test_values_in_ractor() [](#method-i-test_values_in_ractor)

## test_win32_blocksize() [](#method-i-test_win32_blocksize)

## windows_version() [](#method-i-windows_version)

