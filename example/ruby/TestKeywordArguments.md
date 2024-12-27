# Class: TestKeywordArguments
**Inherits:** Test::Unit::TestCase
    



# Class Methods
## a(b: 1) [](#method-c-a)
## a0() [](#method-c-a0)
## kws(**a ) [](#method-c-kws)
## method_missing(_ , **kw ) [](#method-c-method_missing)
## o(x 1) [](#method-c-o)
## s(*a ) [](#method-c-s)
## skws(*a , **kw ) [](#method-c-skws)
## yo(kw ) [](#method-c-yo)
## yoa(*kw ) [](#method-c-yoa)

#Instance Methods
## assert_equal_not_same(kw, res) [](#method-i-assert_equal_not_same)

## f1(str:"foo", num:424242) [](#method-i-f1)

## f10(a:1) [](#method-i-f10)

## f11() [](#method-i-f11)

## f13(a) [](#method-i-f13)

## f2(x, str:"foo", num:424242) [](#method-i-f2)

## f3(str:"foo", num:424242, **h) [](#method-i-f3)

## f6(str:"foo", num:424242, **h, &blk) [](#method-i-f6)

## f7(*r, str:"foo", num:424242, **h) [](#method-i-f7)

## f9(r, o42, *args, p, k::key, **kw, &b) [](#method-i-f9)

## m(a) [](#method-i-m)

**@yield** [a] 

## m1(*args, **options) [](#method-i-m1)

**@yield** [args, options] 

## many_kwargs(a0:'', a1:'', a2:'', a3:'', a4:'', a5:'', a6:'', a7:'', b0:'', b1:'', b2:'', b3:'', b4:'', b5:'', b6:'', b7:'', c0:'', c1:'', c2:'', c3:'', c4:'', c5:'', c6:'', c7:'', d0:'', d1:'', d2:'', d3:'', d4:'', d5:'', d6:'', d7:'', e0:'') [](#method-i-many_kwargs)

## method_for_test_to_hash_call_during_setup_complex_parameters(k1:, k2:, **rest_kw) [](#method-i-method_for_test_to_hash_call_during_setup_complex_parameters)

## opt_plus_keyword(x1, **h) [](#method-i-opt_plus_keyword)

## p1() [](#method-i-p1)

## p2() [](#method-i-p2)

## p3() [](#method-i-p3)

## p4() [](#method-i-p4)

## p5() [](#method-i-p5)

## p6() [](#method-i-p6)

## req_plus_keyword(x, **h) [](#method-i-req_plus_keyword)

## rest_keyrest(*args, **opt) [](#method-i-rest_keyrest)

## splat_plus_keyword(*a, **h) [](#method-i-splat_plus_keyword)

## test_Class_new_kwsplat_call() [](#method-i-test_Class_new_kwsplat_call)

## test_Class_new_method_kwsplat_call() [](#method-i-test_Class_new_method_kwsplat_call)

## test_Enumerator_Generator_each_kwsplat() [](#method-i-test_Enumerator_Generator_each_kwsplat)

## test_Enumerator_Yielder_yield_kwsplat() [](#method-i-test_Enumerator_Yielder_yield_kwsplat)

## test_Fiber_resume_kwsplat() [](#method-i-test_Fiber_resume_kwsplat)

## test_Method_call_kwsplat_call() [](#method-i-test_Method_call_kwsplat_call)

## test_Thread_new_kwsplat() [](#method-i-test_Thread_new_kwsplat)

## test_UnboundMethod_bindcall_kwsplat_call() [](#method-i-test_UnboundMethod_bindcall_kwsplat_call)

## test_anon_splat_ruby2_keywords() [](#method-i-test_anon_splat_ruby2_keywords)

## test_anon_splat_ruby2_keywords_bug_20388() [](#method-i-test_anon_splat_ruby2_keywords_bug_20388)

## test_arity_error_message() [](#method-i-test_arity_error_message)

## test_attr_reader_kwsplat() [](#method-i-test_attr_reader_kwsplat)

## test_attr_reader_method_kwsplat() [](#method-i-test_attr_reader_method_kwsplat)

## test_attr_set_method_cache() [](#method-i-test_attr_set_method_cache)

## test_attr_writer_kwsplat() [](#method-i-test_attr_writer_kwsplat)

## test_attr_writer_method_kwsplat() [](#method-i-test_attr_writer_method_kwsplat)

## test_bare_kwrest() [](#method-i-test_bare_kwrest)

## test_block() [](#method-i-test_block)

## test_block_required_keyword() [](#method-i-test_block_required_keyword)

## test_define_method_kwsplat() [](#method-i-test_define_method_kwsplat)

## test_define_method_method_kwsplat() [](#method-i-test_define_method_method_kwsplat)

## test_dig_kwsplat() [](#method-i-test_dig_kwsplat)

## test_dig_method_missing_kwsplat() [](#method-i-test_dig_method_missing_kwsplat)

## test_do_not_use_newarraykwsplat() [](#method-i-test_do_not_use_newarraykwsplat)

## test_dynamic_symbol_keyword() [](#method-i-test_dynamic_symbol_keyword)

## test_enumerator_size_kwsplat() [](#method-i-test_enumerator_size_kwsplat)

## test_explicit_super_kwsplat() [](#method-i-test_explicit_super_kwsplat)

## test_f1() [](#method-i-test_f1)

## test_f10() [](#method-i-test_f10)

## test_f11() [](#method-i-test_f11)

## test_f12() [](#method-i-test_f12)

## test_f13() [](#method-i-test_f13)

## test_f2() [](#method-i-test_f2)

## test_f3() [](#method-i-test_f3)

## test_f4() [](#method-i-test_f4)

## test_f5() [](#method-i-test_f5)

## test_f6() [](#method-i-test_f6)
ruby-core:40518
:   

## test_f7() [](#method-i-test_f7)
ruby-core:41772
:   

## test_f8() [](#method-i-test_f8)

## test_f9() [](#method-i-test_f9)

## test_gced_object_in_stack() [](#method-i-test_gced_object_in_stack)

## test_implicit_super_kwsplat() [](#method-i-test_implicit_super_kwsplat)

## test_instance_exec_define_method_kwsplat() [](#method-i-test_instance_exec_define_method_kwsplat)

## test_instance_exec_kwsplat() [](#method-i-test_instance_exec_kwsplat)

## test_instance_exec_method_kwsplat() [](#method-i-test_instance_exec_method_kwsplat)

## test_instance_exec_sym_proc_kwsplat() [](#method-i-test_instance_exec_sym_proc_kwsplat)

## test_keyword_no_split() [](#method-i-test_keyword_no_split)

## test_keyword_splat_new() [](#method-i-test_keyword_splat_new)

## test_keyword_splat_nil() [](#method-i-test_keyword_splat_nil)

## test_keyword_splat_to_non_keyword_method() [](#method-i-test_keyword_splat_to_non_keyword_method)

## test_keyword_with_anonymous_keyword_splat() [](#method-i-test_keyword_with_anonymous_keyword_splat)

## test_kwrest_overwritten() [](#method-i-test_kwrest_overwritten)

## test_lambda() [](#method-i-test_lambda)

## test_lambda_kwsplat_call() [](#method-i-test_lambda_kwsplat_call)

## test_lambda_method_kwsplat_call() [](#method-i-test_lambda_method_kwsplat_call)

## test_large_kwsplat_to_method_taking_kw_and_kwsplat() [](#method-i-test_large_kwsplat_to_method_taking_kw_and_kwsplat)

## test_many_kwargs() [](#method-i-test_many_kwargs)

## test_method_missing_kwsplat() [](#method-i-test_method_missing_kwsplat)

## test_method_parameters() [](#method-i-test_method_parameters)

## test_no_implicit_hash_conversion() [](#method-i-test_no_implicit_hash_conversion)

## test_non_keyword_hash_subclass() [](#method-i-test_non_keyword_hash_subclass)

## test_nonsymbol_key() [](#method-i-test_nonsymbol_key)

## test_p1() [](#method-i-test_p1)

## test_p2() [](#method-i-test_p2)

## test_p3() [](#method-i-test_p3)

## test_p4() [](#method-i-test_p4)

## test_p5() [](#method-i-test_p5)

## test_p6() [](#method-i-test_p6)

## test_precedence_of_keyword_arguments() [](#method-i-test_precedence_of_keyword_arguments)

## test_precedence_of_keyword_arguments_with_post_argument() [](#method-i-test_precedence_of_keyword_arguments_with_post_argument)

## test_proc_parameters() [](#method-i-test_proc_parameters)

## test_proc_ruby2_keywords() [](#method-i-test_proc_ruby2_keywords)

## test_public_send_kwsplat() [](#method-i-test_public_send_kwsplat)

## test_rb_call_super_kw_method_missing_kwsplat() [](#method-i-test_rb_call_super_kw_method_missing_kwsplat)

## test_rb_yield_block_kwsplat() [](#method-i-test_rb_yield_block_kwsplat)

## test_regular_kwsplat() [](#method-i-test_regular_kwsplat)

## test_required_keyword() [](#method-i-test_required_keyword)

## test_required_keyword_with_newline() [](#method-i-test_required_keyword_with_newline)

## test_required_keyword_with_reserved() [](#method-i-test_required_keyword_with_reserved)

## test_rest_keyrest() [](#method-i-test_rest_keyrest)

## test_ruby2_keywords() [](#method-i-test_ruby2_keywords)

## test_ruby2_keywords_bug_20679() [](#method-i-test_ruby2_keywords_bug_20679)

## test_send_kwsplat() [](#method-i-test_send_kwsplat)

## test_send_method_kwsplat() [](#method-i-test_send_method_kwsplat)

## test_splat_empty_hash_with_block_passing() [](#method-i-test_splat_empty_hash_with_block_passing)

## test_splat_hash() [](#method-i-test_splat_hash)

## test_splat_hash_conversion() [](#method-i-test_splat_hash_conversion)

## test_splat_keyword_nondestructive() [](#method-i-test_splat_keyword_nondestructive)

## test_super_method_missing_kwsplat() [](#method-i-test_super_method_missing_kwsplat)

## test_super_with_anon_restkeywords() [](#method-i-test_super_with_anon_restkeywords)

## test_super_with_keyword() [](#method-i-test_super_with_keyword)

## test_super_with_keyword_kwrest() [](#method-i-test_super_with_keyword_kwrest)

## test_sym_proc_kwsplat() [](#method-i-test_sym_proc_kwsplat)

## test_sym_proc_method_kwsplat() [](#method-i-test_sym_proc_method_kwsplat)

## test_to_hash_call_during_setup_complex_parameters() [](#method-i-test_to_hash_call_during_setup_complex_parameters)

## test_top_ruby2_keywords() [](#method-i-test_top_ruby2_keywords)

## test_unknown_keyword() [](#method-i-test_unknown_keyword)

## test_unknown_keyword_with_block() [](#method-i-test_unknown_keyword_with_block)

## test_unset_hash_flag() [](#method-i-test_unset_hash_flag)

## test_without_paren() [](#method-i-test_without_paren)

## test_zsuper_only_anonymous_kwrest() [](#method-i-test_zsuper_only_anonymous_kwrest)

## test_zsuper_only_named_kwrest() [](#method-i-test_zsuper_only_named_kwrest)

