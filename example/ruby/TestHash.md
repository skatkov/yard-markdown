# Class: TestHash
**Inherits:** Test::Unit::TestCase
    




#Instance Methods
## hash_hint(hv) [](#method-i-hash_hint)

## hrec(h, n, &b) [](#method-i-hrec)

## setup() [](#method-i-setup)
From rubicon

## teardown() [](#method-i-teardown)

## test_AREF() [](#method-i-test_AREF)
'[]'

## test_ASET() [](#method-i-test_ASET)
'[]='

## test_EQUAL() [](#method-i-test_EQUAL)
'=='

## test_assoc() [](#method-i-test_assoc)

## test_assoc_compare_by_identity() [](#method-i-test_assoc_compare_by_identity)

## test_callcc() [](#method-i-test_callcc)

## test_callcc_escape() [](#method-i-test_callcc_escape)

## test_callcc_iter_level() [](#method-i-test_callcc_iter_level)

## test_callcc_reenter() [](#method-i-test_callcc_reenter)

## test_clear() [](#method-i-test_clear)

## test_clear2() [](#method-i-test_clear2)

## test_clear_initialize_copy() [](#method-i-test_clear_initialize_copy)

## test_clone() [](#method-i-test_clone)

## test_cmp() [](#method-i-test_cmp)

## test_cmp_samekeys() [](#method-i-test_cmp_samekeys)

## test_compact() [](#method-i-test_compact)

## test_compare_by_identity() [](#method-i-test_compare_by_identity)

## test_compare_by_identy_memory_leak() [](#method-i-test_compare_by_identy_memory_leak)

## test_create() [](#method-i-test_create)

## test_default() [](#method-i-test_default)

## test_default=() [](#method-i-test_default=)

## test_default_proc() [](#method-i-test_default_proc)

## test_delete() [](#method-i-test_delete)

## test_delete_if() [](#method-i-test_delete_if)

## test_dig() [](#method-i-test_dig)

## test_dig_with_respond_to() [](#method-i-test_dig_with_respond_to)

## test_dup() [](#method-i-test_dup)

## test_dup_equality() [](#method-i-test_dup_equality)

## test_each() [](#method-i-test_each)

## test_each_key() [](#method-i-test_each_key)

## test_each_pair() [](#method-i-test_each_pair)

## test_each_value() [](#method-i-test_each_value)

## test_empty?() [](#method-i-test_empty?)

**@return** [Boolean] 

## test_eql() [](#method-i-test_eql)

## test_equal2() [](#method-i-test_equal2)

## test_except() [](#method-i-test_except)

## test_except_on_identhash() [](#method-i-test_except_on_identhash)

## test_fetch() [](#method-i-test_fetch)

## test_fetch2() [](#method-i-test_fetch2)

## test_fetch_error() [](#method-i-test_fetch_error)

## test_fetch_values() [](#method-i-test_fetch_values)

## test_filter() [](#method-i-test_filter)

## test_filter!() [](#method-i-test_filter!)

## test_flatten() [](#method-i-test_flatten)

## test_flatten_arity() [](#method-i-test_flatten_arity)

## test_hash() [](#method-i-test_hash)

## test_hash2() [](#method-i-test_hash2)

## test_hash_bignum_hash() [](#method-i-test_hash_bignum_hash)

## test_hash_hash() [](#method-i-test_hash_hash)

## test_hash_popped() [](#method-i-test_hash_popped)

## test_hash_recursion_independent_of_mid() [](#method-i-test_hash_recursion_independent_of_mid)
Previously this test would fail because rb_hash inside opt_aref would look at
the current method name

## test_huge_iter_level() [](#method-i-test_huge_iter_level)

## test_include?() [](#method-i-test_include?)

**@return** [Boolean] 

## test_inspect() [](#method-i-test_inspect)

## test_inverse_hash() [](#method-i-test_inverse_hash)

## test_invert() [](#method-i-test_invert)

## test_keep_if() [](#method-i-test_keep_if)

## test_key() [](#method-i-test_key)

## test_key2?() [](#method-i-test_key2?)

**@return** [Boolean] 

## test_key?() [](#method-i-test_key?)

**@return** [Boolean] 

## test_keys() [](#method-i-test_keys)

## test_length() [](#method-i-test_length)

## test_member?() [](#method-i-test_member?)

**@return** [Boolean] 

## test_merge() [](#method-i-test_merge)

## test_merge!() [](#method-i-test_merge!)

## test_merge_on_identhash() [](#method-i-test_merge_on_identhash)

## test_rassoc() [](#method-i-test_rassoc)

## test_recursive_hash_value_array() [](#method-i-test_recursive_hash_value_array)

## test_recursive_hash_value_array_hash() [](#method-i-test_recursive_hash_value_array_hash)

## test_recursive_hash_value_hash_array() [](#method-i-test_recursive_hash_value_hash_array)

## test_recursive_hash_value_struct() [](#method-i-test_recursive_hash_value_struct)

## test_recursive_key() [](#method-i-test_recursive_key)

## test_rehash() [](#method-i-test_rehash)

## test_rehash2() [](#method-i-test_rehash2)

## test_reject() [](#method-i-test_reject)

## test_reject!() [](#method-i-test_reject!)

## test_reject_bang2() [](#method-i-test_reject_bang2)

## test_reject_on_identhash() [](#method-i-test_reject_on_identhash)

## test_replace() [](#method-i-test_replace)

## test_replace2() [](#method-i-test_replace2)

## test_replace_bug9230() [](#method-i-test_replace_bug9230)

## test_s_AREF_duplicated_key() [](#method-i-test_s_AREF_duplicated_key)

## test_s_AREF_from_hash() [](#method-i-test_s_AREF_from_hash)

## test_s_AREF_from_list() [](#method-i-test_s_AREF_from_list)

## test_s_AREF_from_pairs() [](#method-i-test_s_AREF_from_pairs)

## test_s_AREF_frozen_key_id() [](#method-i-test_s_AREF_frozen_key_id)

## test_s_AREF_key_tampering() [](#method-i-test_s_AREF_key_tampering)

## test_s_new() [](#method-i-test_s_new)

## test_same_key() [](#method-i-test_same_key)

## test_select() [](#method-i-test_select)

## test_select!() [](#method-i-test_select!)

## test_select_on_identhash() [](#method-i-test_select_on_identhash)

## test_self_initialize_copy() [](#method-i-test_self_initialize_copy)

## test_shift() [](#method-i-test_shift)

## test_shift2() [](#method-i-test_shift2)

## test_shift_for_empty_hash() [](#method-i-test_shift_for_empty_hash)

## test_shift_none() [](#method-i-test_shift_none)

## test_size() [](#method-i-test_size)

## test_size2() [](#method-i-test_size2)

## test_slice() [](#method-i-test_slice)

## test_slice_on_identhash() [](#method-i-test_slice_on_identhash)

## test_sort() [](#method-i-test_sort)

## test_st_literal_memory_leak() [](#method-i-test_st_literal_memory_leak)

## test_store() [](#method-i-test_store)

## test_threaded_iter_level() [](#method-i-test_threaded_iter_level)

## test_to_a() [](#method-i-test_to_a)

## test_to_h() [](#method-i-test_to_h)

## test_to_h_block() [](#method-i-test_to_h_block)

## test_to_h_default_proc() [](#method-i-test_to_h_default_proc)

## test_to_h_default_value() [](#method-i-test_to_h_default_value)

## test_to_h_instance_variable() [](#method-i-test_to_h_instance_variable)

## test_to_hash() [](#method-i-test_to_hash)

## test_to_proc() [](#method-i-test_to_proc)

## test_to_s() [](#method-i-test_to_s)

## test_transform_keys() [](#method-i-test_transform_keys)

## test_transform_keys_bang() [](#method-i-test_transform_keys_bang)

## test_transform_keys_on_identhash() [](#method-i-test_transform_keys_on_identhash)

## test_transform_values() [](#method-i-test_transform_values)

## test_transform_values_bang() [](#method-i-test_transform_values_bang)

## test_transform_values_on_identhash() [](#method-i-test_transform_values_on_identhash)

## test_try_convert() [](#method-i-test_try_convert)

## test_update() [](#method-i-test_update)

## test_update2() [](#method-i-test_update2)

## test_update3() [](#method-i-test_update3)

## test_update4() [](#method-i-test_update4)

## test_update5() [](#method-i-test_update5)

## test_update_on_identhash() [](#method-i-test_update_on_identhash)

## test_value2?() [](#method-i-test_value2?)

**@return** [Boolean] 

## test_value?() [](#method-i-test_value?)

**@return** [Boolean] 

## test_values() [](#method-i-test_values)

## test_values_at() [](#method-i-test_values_at)

