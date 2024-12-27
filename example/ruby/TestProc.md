# Class: TestProc
**Inherits:** Test::Unit::TestCase
    



# Class Methods
## a() [](#method-c-a)
**@yield** [arg] 

## capture(&block ) [](#method-c-capture)
## respond_to?(m ) [](#method-c-respond_to?)
**@return** [Boolean] 

## yielder(splat ) [](#method-c-yielder)
**@yield** [splat] 

## yielder_ab(splat ) [](#method-c-yielder_ab)
**@yield** [[:a, :b], splat] 

# Attributes
## attr_accessor_source_location_test[RW] [](#attribute-i-attr_accessor_source_location_test)
Returns the value of attribute attr_accessor_source_location_test.

## attr_reader_source_location_test[RW] [](#attribute-i-attr_reader_source_location_test)
Returns the value of attribute attr_reader_source_location_test.

## attr_writer_source_location_test=[R] [](#attribute-i-attr_writer_source_location_test=)
Sets the attribute attr_writer_source_location_test

**@param** [] the value to set the attribute attr_writer_source_location_test to.


#Instance Methods
## assert_arity(n, &block) [](#method-i-assert_arity)

## block() [](#method-i-block)

## block_source_location_test(*args, &block) [](#method-i-block_source_location_test)

## foo() [](#method-i-foo)

## get_binding(if:1, case:2, when:3, begin:4, end:5) [](#method-i-get_binding)

## helper_test_warn_lambda_with_passed_block(&b) [](#method-i-helper_test_warn_lambda_with_passed_block)

## local_variables_of(bind) [](#method-i-local_variables_of)

## m(x) [](#method-i-m)

## m1(var) [](#method-i-m1)

## m2() [](#method-i-m2)

## m_block_given?() [](#method-i-m_block_given?)

**@return** [Boolean] 

## m_nest(&block) [](#method-i-m_nest)

## m_nest0(&block) [](#method-i-m_nest0)

## pm0() [](#method-i-pm0)

## pm1(a) [](#method-i-pm1)

## pm2(a, b) [](#method-i-pm2)

## pma1(a, &b) [](#method-i-pma1)

## pmk1() [](#method-i-pmk1)

## pmk2(**o) [](#method-i-pmk2)

## pmk3(a, **o) [](#method-i-pmk3)

## pmk4(anil, **o) [](#method-i-pmk4)

## pmk5(a, bnil, **o) [](#method-i-pmk5)

## pmk6(a, bnil, c, **o) [](#method-i-pmk6)

## pmk7(a, bnil, *c, d, **o) [](#method-i-pmk7)

## pmo1(a:a, &b) [](#method-i-pmo1)

## pmo2(a, b:b) [](#method-i-pmo2)

## pmo3(*a) [](#method-i-pmo3)

## pmo4(a, *b, &c) [](#method-i-pmo4)

## pmo5(a, *b, c) [](#method-i-pmo5)

## pmo6(a, *b, c, &d) [](#method-i-pmo6)

## pmo7(a, b:b, *c, d, &e) [](#method-i-pmo7)

## setup() [](#method-i-setup)

## source_location_test(a1, b2) [](#method-i-source_location_test)

## teardown() [](#method-i-teardown)

## test_arity() [](#method-i-test_arity)

## test_arity2() [](#method-i-test_arity2)

## test_attr_source_location() [](#method-i-test_attr_source_location)

## test_binding() [](#method-i-test_binding)

## test_binding_error_unless_ruby_frame() [](#method-i-test_binding_error_unless_ruby_frame)

## test_binding_receiver() [](#method-i-test_binding_receiver)

## test_binding_source_location() [](#method-i-test_binding_source_location)

## test_block_given_method() [](#method-i-test_block_given_method)

## test_block_given_method_to_proc() [](#method-i-test_block_given_method_to_proc)

## test_block_par() [](#method-i-test_block_par)

## test_block_persist_between_calls() [](#method-i-test_block_persist_between_calls)

## test_block_propagation() [](#method-i-test_block_propagation)

## test_block_source_location() [](#method-i-test_block_source_location)

## test_bound_parameters() [](#method-i-test_bound_parameters)

## test_clone_subclass() [](#method-i-test_clone_subclass)

## test_compose() [](#method-i-test_compose)

## test_compose_with_block() [](#method-i-test_compose_with_block)

## test_compose_with_callable() [](#method-i-test_compose_with_callable)

## test_compose_with_lambda() [](#method-i-test_compose_with_lambda)

## test_compose_with_method() [](#method-i-test_compose_with_method)

## test_compose_with_multiple_args() [](#method-i-test_compose_with_multiple_args)

## test_compose_with_noncallable() [](#method-i-test_compose_with_noncallable)

## test_curry_binding() [](#method-i-test_curry_binding)

## test_curry_given_blocks() [](#method-i-test_curry_given_blocks)

## test_curry_instance_exec() [](#method-i-test_curry_instance_exec)

## test_curry_lambda() [](#method-i-test_curry_lambda)

## test_curry_lambda_splat() [](#method-i-test_curry_lambda_splat)

## test_curry_no_arguments() [](#method-i-test_curry_no_arguments)

## test_curry_optional_params() [](#method-i-test_curry_optional_params)

## test_curry_passed_block() [](#method-i-test_curry_passed_block)

## test_curry_proc() [](#method-i-test_curry_proc)

## test_curry_proc_splat() [](#method-i-test_curry_proc_splat)

## test_curry_ski_fib() [](#method-i-test_curry_ski_fib)

## test_curry_with_trace() [](#method-i-test_curry_with_trace)

## test_dup_clone() [](#method-i-test_dup_clone)

## test_dup_ifunc_proc_bug_20950() [](#method-i-test_dup_ifunc_proc_bug_20950)

## test_dup_subclass() [](#method-i-test_dup_subclass)

## test_eq() [](#method-i-test_eq)

## test_hash_does_not_change_after_compaction() [](#method-i-test_hash_does_not_change_after_compaction)

## test_hash_equal() [](#method-i-test_hash_equal)

## test_hash_uniqueness() [](#method-i-test_hash_uniqueness)

## test_isolate() [](#method-i-test_isolate)

## test_lambda?() [](#method-i-test_lambda?)

**@return** [Boolean] 

## test_lambda_warning_pass_block() [](#method-i-test_lambda_warning_pass_block)

## test_lambda_warning_pass_proc() [](#method-i-test_lambda_warning_pass_proc)

## test_local_variable_defined?() [](#method-i-test_local_variable_defined?)

**@return** [Boolean] 

## test_local_variable_get() [](#method-i-test_local_variable_get)

## test_local_variable_set() [](#method-i-test_local_variable_set)

## test_local_variable_set_wb() [](#method-i-test_local_variable_set_wb)

## test_local_variables() [](#method-i-test_local_variables)

## test_local_variables_in_other_context() [](#method-i-test_local_variables_in_other_context)

## test_local_variables_nested() [](#method-i-test_local_variables_nested)

## test_localjump_error() [](#method-i-test_localjump_error)

## test_method_to_proc() [](#method-i-test_method_to_proc)
yarv-dev:777
:   block made by Method#to_proc


## test_not_orphan_next() [](#method-i-test_not_orphan_next)

## test_orphan_break() [](#method-i-test_orphan_break)

## test_orphan_return() [](#method-i-test_orphan_return)

## test_overridden_lambda() [](#method-i-test_overridden_lambda)

## test_overridden_proc() [](#method-i-test_overridden_proc)

## test_parameters() [](#method-i-test_parameters)

## test_parameters_lambda() [](#method-i-test_parameters_lambda)

## test_prepended_call() [](#method-i-test_prepended_call)

## test_proc() [](#method-i-test_proc)

## test_proc_args_multiple_kw_autosplat() [](#method-i-test_proc_args_multiple_kw_autosplat)

## test_proc_args_multiple_kwsplat_autosplat() [](#method-i-test_proc_args_multiple_kwsplat_autosplat)

## test_proc_args_only_rest() [](#method-i-test_proc_args_only_rest)

## test_proc_args_opt() [](#method-i-test_proc_args_opt)

## test_proc_args_opt_block() [](#method-i-test_proc_args_opt_block)

## test_proc_args_opt_post() [](#method-i-test_proc_args_opt_post)

## test_proc_args_opt_post_block() [](#method-i-test_proc_args_opt_post_block)

## test_proc_args_opt_rest() [](#method-i-test_proc_args_opt_rest)

## test_proc_args_opt_rest_block() [](#method-i-test_proc_args_opt_rest_block)

## test_proc_args_opt_rest_post() [](#method-i-test_proc_args_opt_rest_post)

## test_proc_args_opt_rest_post_block() [](#method-i-test_proc_args_opt_rest_post_block)

## test_proc_args_opt_single() [](#method-i-test_proc_args_opt_single)

## test_proc_args_plain() [](#method-i-test_proc_args_plain)

## test_proc_args_pos_block() [](#method-i-test_proc_args_pos_block)

## test_proc_args_pos_opt() [](#method-i-test_proc_args_pos_opt)

## test_proc_args_pos_opt_block() [](#method-i-test_proc_args_pos_opt_block)

## test_proc_args_pos_opt_post() [](#method-i-test_proc_args_pos_opt_post)

## test_proc_args_pos_opt_post_block() [](#method-i-test_proc_args_pos_opt_post_block)

## test_proc_args_pos_opt_rest() [](#method-i-test_proc_args_pos_opt_rest)

## test_proc_args_pos_opt_rest_block() [](#method-i-test_proc_args_pos_opt_rest_block)

## test_proc_args_pos_opt_rest_post() [](#method-i-test_proc_args_pos_opt_rest_post)

## test_proc_args_pos_opt_rest_post_block() [](#method-i-test_proc_args_pos_opt_rest_post_block)

## test_proc_args_pos_rest_block() [](#method-i-test_proc_args_pos_rest_block)

## test_proc_args_pos_rest_post() [](#method-i-test_proc_args_pos_rest_post)

## test_proc_args_pos_rest_post_block() [](#method-i-test_proc_args_pos_rest_post_block)

## test_proc_args_pos_unleashed() [](#method-i-test_proc_args_pos_unleashed)

## test_proc_args_rest() [](#method-i-test_proc_args_rest)

## test_proc_args_rest_block() [](#method-i-test_proc_args_rest_block)

## test_proc_args_rest_kw() [](#method-i-test_proc_args_rest_kw)

## test_proc_args_rest_kwsplat() [](#method-i-test_proc_args_rest_kwsplat)

## test_proc_args_rest_post() [](#method-i-test_proc_args_rest_post)

## test_proc_args_rest_post_block() [](#method-i-test_proc_args_rest_post_block)

## test_proc_args_single_kw_no_autosplat() [](#method-i-test_proc_args_single_kw_no_autosplat)

## test_proc_args_single_kwsplat_no_autosplat() [](#method-i-test_proc_args_single_kwsplat_no_autosplat)

## test_proc_autosplat() [](#method-i-test_proc_autosplat)

## test_proc_autosplat_with_multiple_args_with_ruby2_keywords_splat_bug_19759() [](#method-i-test_proc_autosplat_with_multiple_args_with_ruby2_keywords_splat_bug_19759)

## test_proc_lambda() [](#method-i-test_proc_lambda)

## test_proc_location() [](#method-i-test_proc_location)

## test_proc_mark() [](#method-i-test_proc_mark)

## test_proc_single_arg_with_keywords_accepted_and_yielded() [](#method-i-test_proc_single_arg_with_keywords_accepted_and_yielded)

## test_refined_call() [](#method-i-test_refined_call)

## test_source_location() [](#method-i-test_source_location)

## test_splat_without_respond_to() [](#method-i-test_splat_without_respond_to)

## test_to_proc() [](#method-i-test_to_proc)

## test_to_s() [](#method-i-test_to_s)

