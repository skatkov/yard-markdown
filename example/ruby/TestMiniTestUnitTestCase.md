# Class: TestMiniTestUnitTestCase
**Inherits:** Test::Unit::TestCase
    




#Instance Methods
## assert_triggered(expected, klassTest::Unit::AssertionFailedError) [](#method-i-assert_triggered)

## non_verbose() [](#method-i-non_verbose)

## setup() [](#method-i-setup)
do not call parallelize_me! - teardown accesses @tc._assertions which is not
threadsafe. Nearly every method in here is an assertion test so it isn't worth
splitting it out further.

## teardown() [](#method-i-teardown)

## test_assert() [](#method-i-test_assert)

## test_assert__triggered() [](#method-i-test_assert__triggered)

## test_assert__triggered_message() [](#method-i-test_assert__triggered_message)

## test_assert_empty() [](#method-i-test_assert_empty)

## test_assert_empty_triggered() [](#method-i-test_assert_empty_triggered)

## test_assert_equal() [](#method-i-test_assert_equal)

## test_assert_equal_different_collection_array_hex_invisible() [](#method-i-test_assert_equal_different_collection_array_hex_invisible)

## test_assert_equal_different_collection_hash_hex_invisible() [](#method-i-test_assert_equal_different_collection_hash_hex_invisible)

## test_assert_equal_different_diff_deactivated() [](#method-i-test_assert_equal_different_diff_deactivated)

## test_assert_equal_different_escaped_newline() [](#method-i-test_assert_equal_different_escaped_newline)

## test_assert_equal_different_hex() [](#method-i-test_assert_equal_different_hex)

## test_assert_equal_different_hex_invisible() [](#method-i-test_assert_equal_different_hex_invisible)

## test_assert_equal_different_long() [](#method-i-test_assert_equal_different_long)

## test_assert_equal_different_long_invisible() [](#method-i-test_assert_equal_different_long_invisible)

## test_assert_equal_different_long_msg() [](#method-i-test_assert_equal_different_long_msg)

## test_assert_equal_different_short() [](#method-i-test_assert_equal_different_short)

## test_assert_equal_different_short_msg() [](#method-i-test_assert_equal_different_short_msg)

## test_assert_equal_different_short_multiline() [](#method-i-test_assert_equal_different_short_multiline)

## test_assert_in_delta() [](#method-i-test_assert_in_delta)

## test_assert_in_delta_triggered() [](#method-i-test_assert_in_delta_triggered)

## test_assert_in_epsilon() [](#method-i-test_assert_in_epsilon)

## test_assert_in_epsilon_triggered() [](#method-i-test_assert_in_epsilon_triggered)

## test_assert_in_epsilon_triggered_negative_case() [](#method-i-test_assert_in_epsilon_triggered_negative_case)

## test_assert_includes() [](#method-i-test_assert_includes)

## test_assert_includes_triggered() [](#method-i-test_assert_includes_triggered)

## test_assert_instance_of() [](#method-i-test_assert_instance_of)

## test_assert_instance_of_triggered() [](#method-i-test_assert_instance_of_triggered)

## test_assert_kind_of() [](#method-i-test_assert_kind_of)

## test_assert_kind_of_triggered() [](#method-i-test_assert_kind_of_triggered)

## test_assert_match() [](#method-i-test_assert_match)

## test_assert_match_matchee_to_str() [](#method-i-test_assert_match_matchee_to_str)

## test_assert_match_matcher_object() [](#method-i-test_assert_match_matcher_object)

## test_assert_match_object_triggered() [](#method-i-test_assert_match_object_triggered)

## test_assert_match_triggered() [](#method-i-test_assert_match_triggered)

## test_assert_nil() [](#method-i-test_assert_nil)

## test_assert_nil_triggered() [](#method-i-test_assert_nil_triggered)

## test_assert_operator() [](#method-i-test_assert_operator)

## test_assert_operator_bad_object() [](#method-i-test_assert_operator_bad_object)

## test_assert_operator_triggered() [](#method-i-test_assert_operator_triggered)

## test_assert_output_both() [](#method-i-test_assert_output_both)

## test_assert_output_both_regexps() [](#method-i-test_assert_output_both_regexps)

## test_assert_output_err() [](#method-i-test_assert_output_err)

## test_assert_output_neither() [](#method-i-test_assert_output_neither)

## test_assert_output_out() [](#method-i-test_assert_output_out)

## test_assert_output_triggered_both() [](#method-i-test_assert_output_triggered_both)

## test_assert_output_triggered_err() [](#method-i-test_assert_output_triggered_err)

## test_assert_output_triggered_out() [](#method-i-test_assert_output_triggered_out)

## test_assert_predicate() [](#method-i-test_assert_predicate)

## test_assert_predicate_triggered() [](#method-i-test_assert_predicate_triggered)

## test_assert_raise() [](#method-i-test_assert_raise)

## test_assert_raise_module() [](#method-i-test_assert_raise_module)

## test_assert_raise_skip() [](#method-i-test_assert_raise_skip)
**sigh** This is quite an odd scenario, but it is from real (albeit ugly) test
code in ruby-core:

https://github.com/ruby/ruby/commit/6bab4ea9917dc05cd2c94aead2e96eb7df7d4be1

## test_assert_raise_triggered_different() [](#method-i-test_assert_raise_triggered_different)

## test_assert_raise_triggered_different_msg() [](#method-i-test_assert_raise_triggered_different_msg)

## test_assert_raise_triggered_none() [](#method-i-test_assert_raise_triggered_none)

## test_assert_raise_triggered_none_msg() [](#method-i-test_assert_raise_triggered_none_msg)

## test_assert_raise_triggered_subclass() [](#method-i-test_assert_raise_triggered_subclass)

## test_assert_respond_to() [](#method-i-test_assert_respond_to)

## test_assert_respond_to_triggered() [](#method-i-test_assert_respond_to_triggered)

## test_assert_same() [](#method-i-test_assert_same)

## test_assert_same_triggered() [](#method-i-test_assert_same_triggered)

## test_assert_send() [](#method-i-test_assert_send)

## test_assert_send_bad() [](#method-i-test_assert_send_bad)

## test_assert_silent() [](#method-i-test_assert_silent)

## test_assert_silent_triggered_err() [](#method-i-test_assert_silent_triggered_err)

## test_assert_silent_triggered_out() [](#method-i-test_assert_silent_triggered_out)

## test_assert_throws() [](#method-i-test_assert_throws)

## test_assert_throws_different() [](#method-i-test_assert_throws_different)

## test_assert_throws_unthrown() [](#method-i-test_assert_throws_unthrown)

## test_capture_output() [](#method-i-test_capture_output)

## test_delta_consistency() [](#method-i-test_delta_consistency)

## test_epsilon_consistency() [](#method-i-test_epsilon_consistency)

## test_flunk() [](#method-i-test_flunk)

## test_flunk_message() [](#method-i-test_flunk_message)

## test_message() [](#method-i-test_message)

## test_message_deferred() [](#method-i-test_message_deferred)

## test_message_lambda() [](#method-i-test_message_lambda)

## test_message_message() [](#method-i-test_message_message)

## test_omit() [](#method-i-test_omit)

## test_pass() [](#method-i-test_pass)

## test_pend() [](#method-i-test_pend)

## test_prints() [](#method-i-test_prints)

## test_refute() [](#method-i-test_refute)

## test_refute_empty() [](#method-i-test_refute_empty)

## test_refute_empty_triggered() [](#method-i-test_refute_empty_triggered)

## test_refute_equal() [](#method-i-test_refute_equal)

## test_refute_equal_triggered() [](#method-i-test_refute_equal_triggered)

## test_refute_in_delta() [](#method-i-test_refute_in_delta)

## test_refute_in_delta_triggered() [](#method-i-test_refute_in_delta_triggered)

## test_refute_in_epsilon() [](#method-i-test_refute_in_epsilon)

## test_refute_in_epsilon_triggered() [](#method-i-test_refute_in_epsilon_triggered)

## test_refute_includes() [](#method-i-test_refute_includes)

## test_refute_includes_triggered() [](#method-i-test_refute_includes_triggered)

## test_refute_instance_of() [](#method-i-test_refute_instance_of)

## test_refute_instance_of_triggered() [](#method-i-test_refute_instance_of_triggered)

## test_refute_kind_of() [](#method-i-test_refute_kind_of)

## test_refute_kind_of_triggered() [](#method-i-test_refute_kind_of_triggered)

## test_refute_match() [](#method-i-test_refute_match)

## test_refute_match_matcher_object() [](#method-i-test_refute_match_matcher_object)

## test_refute_match_object_triggered() [](#method-i-test_refute_match_object_triggered)

## test_refute_match_triggered() [](#method-i-test_refute_match_triggered)

## test_refute_nil() [](#method-i-test_refute_nil)

## test_refute_nil_triggered() [](#method-i-test_refute_nil_triggered)

## test_refute_operator() [](#method-i-test_refute_operator)

## test_refute_operator_bad_object() [](#method-i-test_refute_operator_bad_object)

## test_refute_operator_triggered() [](#method-i-test_refute_operator_triggered)

## test_refute_predicate() [](#method-i-test_refute_predicate)

## test_refute_predicate_triggered() [](#method-i-test_refute_predicate_triggered)

## test_refute_respond_to() [](#method-i-test_refute_respond_to)

## test_refute_respond_to_triggered() [](#method-i-test_refute_respond_to_triggered)

## test_refute_same() [](#method-i-test_refute_same)

## test_refute_same_triggered() [](#method-i-test_refute_same_triggered)

## test_test_methods() [](#method-i-test_test_methods)

## util_msg(exp, act, msgnil) [](#method-i-util_msg)

## without_diff() [](#method-i-without_diff)

