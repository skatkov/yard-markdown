# Class: TestYJIT
**Inherits:** Test::Unit::TestCase
    

Tests for YJIT with assertions on compilation and side exits insipired by the
RJIT tests in test/ruby/test_rjit.rb



#Instance Methods
## test_bug_19316() [](#method-i-test_bug_19316)

## test_build_large_struct() [](#method-i-test_build_large_struct)
Tests calling a variadic cfunc with many args

## test_byteslice_sp_invalidation() [](#method-i-test_byteslice_sp_invalidation)

## test_cfunc_kwarg() [](#method-i-test_cfunc_kwarg)

## test_checkkeyword() [](#method-i-test_checkkeyword)

## test_code_gc() [](#method-i-test_code_gc)

## test_code_gc_partial_last_page() [](#method-i-test_code_gc_partial_last_page)

## test_code_gc_with_auto_compact() [](#method-i-test_code_gc_with_auto_compact)

## test_code_gc_with_many_iseqs() [](#method-i-test_code_gc_with_many_iseqs)

## test_command_line_switches() [](#method-i-test_command_line_switches)

## test_compile_attr_set() [](#method-i-test_compile_attr_set)

## test_compile_duphash() [](#method-i-test_compile_duphash)

## test_compile_dynamic_symbol() [](#method-i-test_compile_dynamic_symbol)

## test_compile_eq_arbitrary_class() [](#method-i-test_compile_eq_arbitrary_class)

## test_compile_eq_fixnum() [](#method-i-test_compile_eq_fixnum)

## test_compile_eq_object() [](#method-i-test_compile_eq_object)

## test_compile_eq_string() [](#method-i-test_compile_eq_string)

## test_compile_eq_symbol() [](#method-i-test_compile_eq_symbol)

## test_compile_getclassvariable() [](#method-i-test_compile_getclassvariable)

## test_compile_getconstant() [](#method-i-test_compile_getconstant)

## test_compile_getconstant_with_sp_offset() [](#method-i-test_compile_getconstant_with_sp_offset)

## test_compile_newhash() [](#method-i-test_compile_newhash)

## test_compile_newrange() [](#method-i-test_compile_newrange)

## test_compile_opt_and() [](#method-i-test_compile_opt_and)

## test_compile_opt_aset() [](#method-i-test_compile_opt_aset)

## test_compile_opt_duparray() [](#method-i-test_compile_opt_duparray)

## test_compile_opt_ge() [](#method-i-test_compile_opt_ge)

## test_compile_opt_getconstant_path() [](#method-i-test_compile_opt_getconstant_path)

## test_compile_opt_gt() [](#method-i-test_compile_opt_gt)

## test_compile_opt_le() [](#method-i-test_compile_opt_le)

## test_compile_opt_lt() [](#method-i-test_compile_opt_lt)

## test_compile_opt_minus() [](#method-i-test_compile_opt_minus)

## test_compile_opt_newarray() [](#method-i-test_compile_opt_newarray)

## test_compile_opt_nil_p() [](#method-i-test_compile_opt_nil_p)

## test_compile_opt_not() [](#method-i-test_compile_opt_not)

## test_compile_opt_or() [](#method-i-test_compile_opt_or)

## test_compile_opt_plus() [](#method-i-test_compile_opt_plus)

## test_compile_opt_succ() [](#method-i-test_compile_opt_succ)

## test_compile_putnil() [](#method-i-test_compile_putnil)

## test_compile_putobject() [](#method-i-test_compile_putobject)

## test_compile_putspecialobject() [](#method-i-test_compile_putspecialobject)

## test_compile_regexp() [](#method-i-test_compile_regexp)

## test_compile_set_and_get_global() [](#method-i-test_compile_set_and_get_global)

## test_compile_setclassvariable() [](#method-i-test_compile_setclassvariable)

## test_compile_tostring() [](#method-i-test_compile_tostring)

## test_ctx_different_mappings() [](#method-i-test_ctx_different_mappings)
regression test simplified from URI::Generic#hostname=

## test_disable_code_gc_with_many_iseqs() [](#method-i-test_disable_code_gc_with_many_iseqs)

## test_disable_stats() [](#method-i-test_disable_stats)

## test_empty_splat() [](#method-i-test_empty_splat)

## test_enable_from_env_var() [](#method-i-test_enable_from_env_var)

## test_expandarray() [](#method-i-test_expandarray)

## test_expandarray_nil() [](#method-i-test_expandarray_nil)

## test_fib_recursion() [](#method-i-test_fib_recursion)

## test_gc_compact_cyclic_branch() [](#method-i-test_gc_compact_cyclic_branch)

## test_getblockparam() [](#method-i-test_getblockparam)

## test_getblockparamproxy() [](#method-i-test_getblockparamproxy)

## test_getivar_opt_plus() [](#method-i-test_getivar_opt_plus)

## test_getlocal_with_level() [](#method-i-test_getlocal_with_level)

## test_getspecial_backref() [](#method-i-test_getspecial_backref)

## test_ifunc_getblockparamproxy() [](#method-i-test_ifunc_getblockparamproxy)

## test_int_equal() [](#method-i-test_int_equal)

## test_invalidate_cyclic_branch() [](#method-i-test_invalidate_cyclic_branch)

## test_invokeblock_many_locals() [](#method-i-test_invokeblock_many_locals)

## test_io_reopen_clobbering_singleton_class() [](#method-i-test_io_reopen_clobbering_singleton_class)

## test_kw_splat_nil() [](#method-i-test_kw_splat_nil)

## test_kwrest() [](#method-i-test_kwrest)

## test_leaf_builtin() [](#method-i-test_leaf_builtin)

## test_multisend() [](#method-i-test_multisend)

## test_nested_send() [](#method-i-test_nested_send)

## test_nil_then_string() [](#method-i-test_nil_then_string)

## test_no_excessive_opt_getinlinecache_invalidation() [](#method-i-test_no_excessive_opt_getinlinecache_invalidation)

## test_odd_calls_to_attr_reader() [](#method-i-test_odd_calls_to_attr_reader)

## test_on_stack_code_gc_call() [](#method-i-test_on_stack_code_gc_call)

## test_on_stack_code_gc_twice() [](#method-i-test_on_stack_code_gc_twice)

## test_opt_aref_with() [](#method-i-test_opt_aref_with)

## test_opt_case_dispatch() [](#method-i-test_opt_case_dispatch)

## test_opt_getconstant_path_general() [](#method-i-test_opt_getconstant_path_general)

## test_opt_getconstant_path_slowpath() [](#method-i-test_opt_getconstant_path_slowpath)

## test_opt_length_in_method() [](#method-i-test_opt_length_in_method)

## test_opt_mult_overflow() [](#method-i-test_opt_mult_overflow)

## test_opt_regexpmatch2() [](#method-i-test_opt_regexpmatch2)

## test_optarg_and_kwarg() [](#method-i-test_optarg_and_kwarg)

## test_proc_block_arg() [](#method-i-test_proc_block_arg)

## test_return_to_invalidated_block() [](#method-i-test_return_to_invalidated_block)

## test_return_to_invalidated_frame() [](#method-i-test_return_to_invalidated_frame)

## test_runtime_stats_arg_error() [](#method-i-test_runtime_stats_arg_error)

## test_runtime_stats_key_arg() [](#method-i-test_runtime_stats_key_arg)

## test_runtime_stats_types() [](#method-i-test_runtime_stats_types)

## test_runtime_stats_unknown_key() [](#method-i-test_runtime_stats_unknown_key)

## test_send_block() [](#method-i-test_send_block)

## test_send_block_calling() [](#method-i-test_send_block_calling)

## test_send_block_only_receiver() [](#method-i-test_send_block_only_receiver)

## test_send_block_only_sender() [](#method-i-test_send_block_only_sender)

## test_send_blockarg() [](#method-i-test_send_blockarg)

## test_send_kwargs() [](#method-i-test_send_kwargs)

## test_send_kwargs_in_receiver_only() [](#method-i-test_send_kwargs_in_receiver_only)

## test_send_kwargs_splat() [](#method-i-test_send_kwargs_splat)

## test_send_multiarg() [](#method-i-test_send_multiarg)

## test_send_polymorphic_method_name() [](#method-i-test_send_polymorphic_method_name)

## test_send_splat() [](#method-i-test_send_splat)

## test_send_to_call() [](#method-i-test_send_to_call)

## test_send_with_underscores() [](#method-i-test_send_with_underscores)

## test_setivar_on_class() [](#method-i-test_setivar_on_class)

## test_setlocal_with_level() [](#method-i-test_setlocal_with_level)

## test_str_concat_encoding_mismatch() [](#method-i-test_str_concat_encoding_mismatch)

## test_str_uplus_subclass() [](#method-i-test_str_uplus_subclass)

## test_string_concat_ascii() [](#method-i-test_string_concat_ascii)

## test_string_concat_utf8() [](#method-i-test_string_concat_utf8)

## test_string_interpolation() [](#method-i-test_string_interpolation)

## test_string_interpolation_cast() [](#method-i-test_string_interpolation_cast)

## test_string_then_nil() [](#method-i-test_string_then_nil)

## test_struct_aref() [](#method-i-test_struct_aref)

## test_struct_aset() [](#method-i-test_struct_aset)

## test_super_cfunc() [](#method-i-test_super_cfunc)

## test_super_iseq() [](#method-i-test_super_iseq)

## test_super_with_alias() [](#method-i-test_super_with_alias)

## test_trace_b_call() [](#method-i-test_trace_b_call)
ISEQ_TRACE_EVENTS

## test_trace_script_compiled() [](#method-i-test_trace_script_compiled)
not ISEQ_TRACE_EVENTS

## test_tracing_str_uplus() [](#method-i-test_tracing_str_uplus)

## test_yjit_disable() [](#method-i-test_yjit_disable)

## test_yjit_enable() [](#method-i-test_yjit_enable)

## test_yjit_enable_preserves_array_each_monkey_patch() [](#method-i-test_yjit_enable_preserves_array_each_monkey_patch)

## test_yjit_enable_replaces_array_each() [](#method-i-test_yjit_enable_replaces_array_each)

## test_yjit_enable_stats_false() [](#method-i-test_yjit_enable_stats_false)

## test_yjit_enable_stats_quiet() [](#method-i-test_yjit_enable_stats_quiet)

## test_yjit_enable_stats_true() [](#method-i-test_yjit_enable_stats_true)

## test_yjit_enable_with_call_threshold() [](#method-i-test_yjit_enable_with_call_threshold)

## test_yjit_enable_with_monkey_patch() [](#method-i-test_yjit_enable_with_monkey_patch)

## test_yjit_in_ruby_description() [](#method-i-test_yjit_in_ruby_description)

## test_yjit_in_version() [](#method-i-test_yjit_in_version)
Check that YJIT is in the version string

## test_yjit_option_uses_array_each_in_ruby() [](#method-i-test_yjit_option_uses_array_each_in_ruby)

## test_yjit_stats_and_v_no_error() [](#method-i-test_yjit_stats_and_v_no_error)

