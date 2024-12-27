# Class: TestRubyOptimization
**Inherits:** Test::Unit::TestCase
    



# Class Methods
## tailcall(klass , src , file nil, path nil, line nil, tailcall: true) [](#method-c-tailcall)

#Instance Methods
## assert_performance_warning(klass, method) [](#method-i-assert_performance_warning)

## assert_redefine_method(klass, method, code, msgnil) [](#method-i-assert_redefine_method)

## bptest_binding(&b) [](#method-i-bptest_binding)

## bptest_bp_pass_bp_value(&b) [](#method-i-bptest_bp_pass_bp_value)

## bptest_bp_value(&b) [](#method-i-bptest_bp_value)

## bptest_set(&b) [](#method-i-bptest_set)

## bptest_yield(&b) [](#method-i-bptest_yield)

## bptest_yield_pass(&b) [](#method-i-bptest_yield_pass)

## disasm(name) [](#method-i-disasm)

## do_raise() [](#method-i-do_raise)

## errinfo() [](#method-i-errinfo)

## just_yield() [](#method-i-just_yield)

## tailcall(*args) [](#method-i-tailcall)

## test_array_empty?() [](#method-i-test_array_empty?)

**@return** [Boolean] 

## test_array_hash() [](#method-i-test_array_hash)

## test_array_length() [](#method-i-test_array_length)

## test_array_max() [](#method-i-test_array_max)

## test_array_min() [](#method-i-test_array_min)

## test_array_minus() [](#method-i-test_array_minus)

## test_array_plus() [](#method-i-test_array_plus)

## test_block_given_aset_aref() [](#method-i-test_block_given_aset_aref)

## test_block_parameter() [](#method-i-test_block_parameter)

## test_block_parameter_should_not_create_objects() [](#method-i-test_block_parameter_should_not_create_objects)

## test_blockparam_in_rescue() [](#method-i-test_blockparam_in_rescue)

## test_branch_condition_backquote() [](#method-i-test_branch_condition_backquote)

## test_branch_condition_def() [](#method-i-test_branch_condition_def)

## test_branch_condition_defs() [](#method-i-test_branch_condition_defs)

## test_c_func_with_sp_offset_under_tailcall() [](#method-i-test_c_func_with_sp_offset_under_tailcall)

## test_callinfo_unreachable_path() [](#method-i-test_callinfo_unreachable_path)

## test_clear_unreachable_keyword_args() [](#method-i-test_clear_unreachable_keyword_args)

## test_eq() [](#method-i-test_eq)

## test_eqq() [](#method-i-test_eqq)

## test_fixnum_and() [](#method-i-test_fixnum_and)

## test_fixnum_div() [](#method-i-test_fixnum_div)

## test_fixnum_ge() [](#method-i-test_fixnum_ge)

## test_fixnum_gt() [](#method-i-test_fixnum_gt)

## test_fixnum_le() [](#method-i-test_fixnum_le)

## test_fixnum_lt() [](#method-i-test_fixnum_lt)

## test_fixnum_minus() [](#method-i-test_fixnum_minus)

## test_fixnum_mod() [](#method-i-test_fixnum_mod)

## test_fixnum_mul() [](#method-i-test_fixnum_mul)

## test_fixnum_or() [](#method-i-test_fixnum_or)

## test_fixnum_plus() [](#method-i-test_fixnum_plus)

## test_float_div() [](#method-i-test_float_div)

## test_float_ge() [](#method-i-test_float_ge)

## test_float_gt() [](#method-i-test_float_gt)

## test_float_le() [](#method-i-test_float_le)

## test_float_lt() [](#method-i-test_float_lt)

## test_float_minus() [](#method-i-test_float_minus)

## test_float_mul() [](#method-i-test_float_mul)

## test_float_plus() [](#method-i-test_float_plus)

## test_hash_aref_with() [](#method-i-test_hash_aref_with)

## test_hash_aset_with() [](#method-i-test_hash_aset_with)

## test_hash_empty?() [](#method-i-test_hash_empty?)

**@return** [Boolean] 

## test_hash_length() [](#method-i-test_hash_length)

## test_jump_elimination_with_optimized_out_block() [](#method-i-test_jump_elimination_with_optimized_out_block)

## test_jump_elimination_with_optimized_out_block_2() [](#method-i-test_jump_elimination_with_optimized_out_block_2)

## test_nil_safe_conditional_assign() [](#method-i-test_nil_safe_conditional_assign)

## test_objtostring() [](#method-i-test_objtostring)

## test_opt_case_dispatch() [](#method-i-test_opt_case_dispatch)

## test_opt_case_dispatch_inf() [](#method-i-test_opt_case_dispatch_inf)

## test_opt_duparray_send_include_p() [](#method-i-test_opt_duparray_send_include_p)

## test_opt_newarray_send_include_p() [](#method-i-test_opt_newarray_send_include_p)

## test_optimized_empty_ensure() [](#method-i-test_optimized_empty_ensure)

## test_optimized_rescue() [](#method-i-test_optimized_rescue)

## test_overwritten_blockparam() [](#method-i-test_overwritten_blockparam)

## test_peephole_array_freeze() [](#method-i-test_peephole_array_freeze)

## test_peephole_array_freeze_empty() [](#method-i-test_peephole_array_freeze_empty)

## test_peephole_dstr() [](#method-i-test_peephole_dstr)

## test_peephole_hash_freeze() [](#method-i-test_peephole_hash_freeze)

## test_peephole_hash_freeze_empty() [](#method-i-test_peephole_hash_freeze_empty)

## test_peephole_jump_after_newarray() [](#method-i-test_peephole_jump_after_newarray)

## test_peephole_optimization_without_trace() [](#method-i-test_peephole_optimization_without_trace)

## test_peephole_string_literal_range() [](#method-i-test_peephole_string_literal_range)

## test_retry_label_in_unreachable_chunk() [](#method-i-test_retry_label_in_unreachable_chunk)

## test_side_effect_in_popped_splat() [](#method-i-test_side_effect_in_popped_splat)

## test_string_empty?() [](#method-i-test_string_empty?)

**@return** [Boolean] 

## test_string_eq_neq() [](#method-i-test_string_eq_neq)

## test_string_format() [](#method-i-test_string_format)

## test_string_freeze() [](#method-i-test_string_freeze)

## test_string_freeze_block() [](#method-i-test_string_freeze_block)

## test_string_freeze_saves_memory() [](#method-i-test_string_freeze_saves_memory)

## test_string_length() [](#method-i-test_string_length)

## test_string_ltlt() [](#method-i-test_string_ltlt)

## test_string_plus() [](#method-i-test_string_plus)

## test_string_size() [](#method-i-test_string_size)

## test_string_succ() [](#method-i-test_string_succ)

## test_string_uminus() [](#method-i-test_string_uminus)

## test_tailcall() [](#method-i-test_tailcall)

## test_tailcall_and_post_arg() [](#method-i-test_tailcall_and_post_arg)

## test_tailcall_condition_block() [](#method-i-test_tailcall_condition_block)

## test_tailcall_inhibited_by_block() [](#method-i-test_tailcall_inhibited_by_block)

## test_tailcall_inhibited_by_rescue() [](#method-i-test_tailcall_inhibited_by_rescue)

## test_tailcall_interrupted_by_sigint() [](#method-i-test_tailcall_interrupted_by_sigint)

## test_tailcall_not_to_grow_stack() [](#method-i-test_tailcall_not_to_grow_stack)

## test_tailcall_symbol_block_arg() [](#method-i-test_tailcall_symbol_block_arg)

## test_tailcall_with_block() [](#method-i-test_tailcall_with_block)

## test_trace_optimized_methods() [](#method-i-test_trace_optimized_methods)

## test_unconditional_branch_to_leave_block() [](#method-i-test_unconditional_branch_to_leave_block)

