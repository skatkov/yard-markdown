# Class: TestISeq
**Inherits:** Test::Unit::TestCase
    




#Instance Methods
## anon_block() [](#method-i-anon_block)

## anon_keyrest() [](#method-i-anon_keyrest)

## anon_star() [](#method-i-anon_star)

## assert_iseq_to_binary(code, mesgnil) [](#method-i-assert_iseq_to_binary)

## block_unused_method() [](#method-i-block_unused_method)

## block_using_method() [](#method-i-block_using_method)

## collect_from_binary_tracepoint_lines(tracepoint_type, filename) [](#method-i-collect_from_binary_tracepoint_lines)

## compile(src, linenil, optnil) [](#method-i-compile)

## hexdump(bin) [](#method-i-hexdump)

## lines(src, linesnil) [](#method-i-lines)

## method_test_line_trace() [](#method-i-method_test_line_trace)

## sample_iseq() [](#method-i-sample_iseq)

## strip_lineno(source) [](#method-i-strip_lineno)

## test_allocate() [](#method-i-test_allocate)

## test_anon_block_param_in_disasm() [](#method-i-test_anon_block_param_in_disasm)

## test_anon_keyrest_param_in_disasm() [](#method-i-test_anon_keyrest_param_in_disasm)

## test_anon_rest_param_in_disasm() [](#method-i-test_anon_rest_param_in_disasm)

## test_cdhash_after_roundtrip() [](#method-i-test_cdhash_after_roundtrip)

## test_compile_error() [](#method-i-test_compile_error)
Bug #19173
:   

## test_compile_file_encoding() [](#method-i-test_compile_file_encoding)

## test_compile_file_error() [](#method-i-test_compile_file_error)

## test_compile_prism_with_file() [](#method-i-test_compile_prism_with_file)

## test_compile_prism_with_invalid_object_type() [](#method-i-test_compile_prism_with_invalid_object_type)

## test_disable_opt() [](#method-i-test_disable_opt)

## test_disasm_encoding() [](#method-i-test_disasm_encoding)

## test_each_child() [](#method-i-test_each_child)

## test_empty_iseq_lineno() [](#method-i-test_empty_iseq_lineno)

## test_ever_condition_loop() [](#method-i-test_ever_condition_loop)

## test_forwardable() [](#method-i-test_forwardable)

## test_frozen_string_literal_compile_option() [](#method-i-test_frozen_string_literal_compile_option)

## test_ibf_bignum() [](#method-i-test_ibf_bignum)

## test_inspect() [](#method-i-test_inspect)

## test_invalid_source() [](#method-i-test_invalid_source)

## test_iseq_builtin_load() [](#method-i-test_iseq_builtin_load)

## test_iseq_builtin_to_a() [](#method-i-test_iseq_builtin_to_a)

## test_iseq_of() [](#method-i-test_iseq_of)

## test_iseq_of_twice_for_same_code() [](#method-i-test_iseq_of_twice_for_same_code)

## test_iseq_option_debug_level() [](#method-i-test_iseq_option_debug_level)

## test_label_fstring() [](#method-i-test_label_fstring)

## test_lambda_with_ractor_roundtrip() [](#method-i-test_lambda_with_ractor_roundtrip)

## test_line_trace() [](#method-i-test_line_trace)

## test_load_from_binary_only_accepts_string_param() [](#method-i-test_load_from_binary_only_accepts_string_param)

## test_loaded_cdhash_mark() [](#method-i-test_loaded_cdhash_mark)

## test_loading_kwargs_memory_leak() [](#method-i-test_loading_kwargs_memory_leak)

## test_location() [](#method-i-test_location)

## test_mandatory_only() [](#method-i-test_mandatory_only)

## test_mandatory_only_redef() [](#method-i-test_mandatory_only_redef)

## test_no_linenum() [](#method-i-test_no_linenum)

## test_parent_iseq_mark() [](#method-i-test_parent_iseq_mark)

## test_ractor_shareable_value_frozen_core() [](#method-i-test_ractor_shareable_value_frozen_core)

## test_ractor_unshareable_outer_variable() [](#method-i-test_ractor_unshareable_outer_variable)

## test_safe_call_chain() [](#method-i-test_safe_call_chain)
Safe call chain is not optimized when Coverage is running. So we can test it
only when Coverage is not running.

## test_super_with_anonymous_block() [](#method-i-test_super_with_anonymous_block)

## test_super_with_block() [](#method-i-test_super_with_block)

## test_super_with_block_and_kwrest() [](#method-i-test_super_with_block_and_kwrest)

## test_super_with_block_hash_0() [](#method-i-test_super_with_block_hash_0)

## test_syntax_error_message() [](#method-i-test_syntax_error_message)

## test_to_a_lines() [](#method-i-test_to_a_lines)

## test_to_binary_b_call_tracepoint() [](#method-i-test_to_binary_b_call_tracepoint)

## test_to_binary_b_return_tracepoint() [](#method-i-test_to_binary_b_return_tracepoint)

## test_to_binary_class_tracepoint() [](#method-i-test_to_binary_class_tracepoint)

## test_to_binary_dumps_nokey() [](#method-i-test_to_binary_dumps_nokey)

## test_to_binary_end_tracepoint() [](#method-i-test_to_binary_end_tracepoint)

## test_to_binary_line_info() [](#method-i-test_to_binary_line_info)

## test_to_binary_line_tracepoint() [](#method-i-test_to_binary_line_tracepoint)

## test_to_binary_pattern_matching() [](#method-i-test_to_binary_pattern_matching)

## test_to_binary_return_tracepoint() [](#method-i-test_to_binary_return_tracepoint)

## test_to_binary_with_hidden_local_variables() [](#method-i-test_to_binary_with_hidden_local_variables)

## test_to_binary_with_objects() [](#method-i-test_to_binary_with_objects)

## test_trace_points() [](#method-i-test_trace_points)

## test_translate_by_object() [](#method-i-test_translate_by_object)

## test_unreachable_next_in_block() [](#method-i-test_unreachable_next_in_block)

## test_unreachable_pattern_matching() [](#method-i-test_unreachable_pattern_matching)

## test_unreachable_pattern_matching_in_if_condition() [](#method-i-test_unreachable_pattern_matching_in_if_condition)

## test_unreachable_syntax_error() [](#method-i-test_unreachable_syntax_error)

## test_unsupported_type() [](#method-i-test_unsupported_type)

## test_unused_param() [](#method-i-test_unused_param)

## test_while_in_until_condition() [](#method-i-test_while_in_until_condition)

