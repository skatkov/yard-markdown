# Class: TestSetTraceFunc
**Inherits:** Test::Unit::TestCase
    




#Instance Methods
## assert_consistent_call_return(message'', check_events:nil) [](#method-i-assert_consistent_call_return)

## check_with_events(trace_point_events, expected_eventstrace_point_events) [](#method-i-check_with_events)

## f_break_in_iter() [](#method-i-f_break_in_iter)

## f_break_in_rescue() [](#method-i-f_break_in_rescue)

## f_iter() [](#method-i-f_iter)

## f_iter1() [](#method-i-f_iter1)

## f_iter2() [](#method-i-f_iter2)

## f_raise() [](#method-i-f_raise)

## f_return_in_iter() [](#method-i-f_return_in_iter)

## foo() [](#method-i-foo)

## helper_can_rescue() [](#method-i-helper_can_rescue)

## helper_can_rescue_empty_body() [](#method-i-helper_can_rescue_empty_body)

## helper_cant_rescue() [](#method-i-helper_cant_rescue)

## m1_for_test_trace_point_binding_in_ifunc(arg) [](#method-i-m1_for_test_trace_point_binding_in_ifunc)

## m1_test_trace_point_at_return_when_exception() [](#method-i-m1_test_trace_point_at_return_when_exception)

## m2_for_test_trace_point_binding_in_ifunc(arg) [](#method-i-m2_for_test_trace_point_binding_in_ifunc)

## m2_test_trace_point_at_return_when_exception() [](#method-i-m2_test_trace_point_at_return_when_exception)

**@raise** [BAR_ERROR] 

## method_for_enable_target1() [](#method-i-method_for_enable_target1)

## method_for_enable_target2() [](#method-i-method_for_enable_target2)

## method_for_test_thread_add_trace_func() [](#method-i-method_for_test_thread_add_trace_func)

## method_for_test_tracepoint_block() [](#method-i-method_for_test_tracepoint_block)

## method_label(tp) [](#method-i-method_label)

## method_prefix(event) [](#method-i-method_prefix)

## method_test_ensure_should_not_cause_b_return() [](#method-i-method_test_ensure_should_not_cause_b_return)

## method_test_rescue_should_not_cause_b_return() [](#method-i-method_test_rescue_should_not_cause_b_return)

## method_test_tracepoint_raised_exception(err) [](#method-i-method_test_tracepoint_raised_exception)

## method_test_tracepoint_return_value(obj) [](#method-i-method_test_tracepoint_return_value)

## parameter_test(a, b, c) [](#method-i-parameter_test)

## setup() [](#method-i-setup)

## target_thread?() [](#method-i-target_thread?)

**@return** [Boolean] 

## teardown() [](#method-i-teardown)

## test_a_call() [](#method-i-test_a_call)

## test_a_return() [](#method-i-test_a_return)

## test_aliased_c_method() [](#method-i-test_aliased_c_method)

## test_aliased_ruby_method() [](#method-i-test_aliased_ruby_method)

## test_allow_reentry() [](#method-i-test_allow_reentry)

## test_argument_error_on_bmethod() [](#method-i-test_argument_error_on_bmethod)

## test_b_call_with_redo() [](#method-i-test_b_call_with_redo)

## test_b_tracepoints_going_away() [](#method-i-test_b_tracepoints_going_away)

## test_break() [](#method-i-test_break)
    Bug #2610
:       


## test_break_with_rescue() [](#method-i-test_break_with_rescue)

## test_c_call() [](#method-i-test_c_call)

## test_c_call_aliased_method() [](#method-i-test_c_call_aliased_method)

## test_c_call_no_binding() [](#method-i-test_c_call_no_binding)

## test_c_call_removed_method() [](#method-i-test_c_call_removed_method)

## test_c_return_no_binding() [](#method-i-test_c_return_no_binding)

## test_call() [](#method-i-test_call)

## test_class() [](#method-i-test_class)

## test_const_missing() [](#method-i-test_const_missing)

## test_define_method_on_exception() [](#method-i-test_define_method_on_exception)

## test_define_method_on_return() [](#method-i-test_define_method_on_return)

## test_disable_local_tracepoint_in_trace() [](#method-i-test_disable_local_tracepoint_in_trace)

## test_elsif_line_event() [](#method-i-test_elsif_line_event)

## test_enable_target_thread() [](#method-i-test_enable_target_thread)

## test_fiber_switch() [](#method-i-test_fiber_switch)

## test_invalid_proc() [](#method-i-test_invalid_proc)

## test_isolated_raise_in_trace() [](#method-i-test_isolated_raise_in_trace)

## test_lineno_in_optimized_insn() [](#method-i-test_lineno_in_optimized_insn)

## test_method_missing() [](#method-i-test_method_missing)

## test_multiple_enable() [](#method-i-test_multiple_enable)

## test_multiple_tracepoints_same_bmethod() [](#method-i-test_multiple_tracepoints_same_bmethod)

## test_no_duplicate_line_events() [](#method-i-test_no_duplicate_line_events)

## test_non_local_return_across_multiple_define_methods() [](#method-i-test_non_local_return_across_multiple_define_methods)

## test_raise() [](#method-i-test_raise)

## test_raise_in_trace() [](#method-i-test_raise_in_trace)

## test_raising_from_b_return_tp_tracing_bmethod() [](#method-i-test_raising_from_b_return_tp_tracing_bmethod)

## test_rb_rescue() [](#method-i-test_rb_rescue)

## test_recursive() [](#method-i-test_recursive)

## test_remove_in_trace() [](#method-i-test_remove_in_trace)

## test_rescue_and_ensure_should_not_cause_b_return() [](#method-i-test_rescue_and_ensure_should_not_cause_b_return)

## test_return() [](#method-i-test_return)
ruby-dev:38701
:   

## test_return2() [](#method-i-test_return2)
ruby-core:24463
:   

## test_return_bmethod_location() [](#method-i-test_return_bmethod_location)

## test_return_event_with_rescue() [](#method-i-test_return_event_with_rescue)

## test_return_value_with_rescue() [](#method-i-test_return_value_with_rescue)

## test_return_value_with_rescue_and_defined_methods() [](#method-i-test_return_value_with_rescue_and_defined_methods)

## test_script_compiled() [](#method-i-test_script_compiled)

## test_set_trace_func() [](#method-i-test_set_trace_func)

## test_set_trace_func_curry_argument_error() [](#method-i-test_set_trace_func_curry_argument_error)

## test_single_raise_inside_load() [](#method-i-test_single_raise_inside_load)

## test_stat_exists() [](#method-i-test_stat_exists)

## test_target_different_bmethod_same_iseq() [](#method-i-test_target_different_bmethod_same_iseq)

## test_thread_add_trace_func() [](#method-i-test_thread_add_trace_func)

## test_thread_trace() [](#method-i-test_thread_trace)

## test_throwing_return_with_finish_frame() [](#method-i-test_throwing_return_with_finish_frame)

## test_tp_rescue() [](#method-i-test_tp_rescue)

## test_tp_rescue_event() [](#method-i-test_tp_rescue_event)

## test_trace_defined_method() [](#method-i-test_trace_defined_method)

## test_trace_point_at_return_when_exception() [](#method-i-test_trace_point_at_return_when_exception)

## test_trace_point_binding_after_break() [](#method-i-test_trace_point_binding_after_break)

## test_trace_point_binding_in_ifunc() [](#method-i-test_trace_point_binding_in_ifunc)

## test_trace_point_raising_exception_in_bmethod_call() [](#method-i-test_trace_point_raising_exception_in_bmethod_call)

## test_trace_point_require_block() [](#method-i-test_trace_point_require_block)

## test_tracepoint() [](#method-i-test_tracepoint)

## test_tracepoint_access_from_outside() [](#method-i-test_tracepoint_access_from_outside)

## test_tracepoint_attr() [](#method-i-test_tracepoint_attr)

## test_tracepoint_b_return_with_lambda() [](#method-i-test_tracepoint_b_return_with_lambda)

## test_tracepoint_b_return_with_next() [](#method-i-test_tracepoint_b_return_with_next)

## test_tracepoint_block() [](#method-i-test_tracepoint_block)

## test_tracepoint_bmethod_memory_leak() [](#method-i-test_tracepoint_bmethod_memory_leak)

## test_tracepoint_callee_id() [](#method-i-test_tracepoint_callee_id)

## test_tracepoint_disable() [](#method-i-test_tracepoint_disable)

## test_tracepoint_enable() [](#method-i-test_tracepoint_enable)

## test_tracepoint_enable_target() [](#method-i-test_tracepoint_enable_target)

## test_tracepoint_enable_with_target_line() [](#method-i-test_tracepoint_enable_with_target_line)

## test_tracepoint_enable_with_target_line_two_times() [](#method-i-test_tracepoint_enable_with_target_line_two_times)

## test_tracepoint_enabled() [](#method-i-test_tracepoint_enabled)

## test_tracepoint_exception_at_c_return() [](#method-i-test_tracepoint_exception_at_c_return)

## test_tracepoint_exception_at_line() [](#method-i-test_tracepoint_exception_at_line)

## test_tracepoint_exception_at_return() [](#method-i-test_tracepoint_exception_at_return)

## test_tracepoint_inspect() [](#method-i-test_tracepoint_inspect)

## test_tracepoint_memory_leak() [](#method-i-test_tracepoint_memory_leak)
Bug #18264

## test_tracepoint_nested_enabled_with_target() [](#method-i-test_tracepoint_nested_enabled_with_target)

## test_tracepoint_object_id() [](#method-i-test_tracepoint_object_id)

## test_tracepoint_opt_invokebuiltin_delegate_leave() [](#method-i-test_tracepoint_opt_invokebuiltin_delegate_leave)

## test_tracepoint_parameters() [](#method-i-test_tracepoint_parameters)

## test_tracepoint_raised_exception() [](#method-i-test_tracepoint_raised_exception)

## test_tracepoint_return_value() [](#method-i-test_tracepoint_return_value)

## test_tracepoint_struct() [](#method-i-test_tracepoint_struct)

## test_tracepoint_thread() [](#method-i-test_tracepoint_thread)

## test_tracepoint_thread_begin() [](#method-i-test_tracepoint_thread_begin)

## test_tracepoint_thread_end() [](#method-i-test_tracepoint_thread_end)

## test_tracepoint_thread_end_with_exception() [](#method-i-test_tracepoint_thread_end_with_exception)

## test_tracepoint_with_multithreads() [](#method-i-test_tracepoint_with_multithreads)

## test_while_in_while() [](#method-i-test_while_in_while)

## tp_return_value(mid) [](#method-i-tp_return_value)
tests for `return_value` with non-local exit [Bug #13369]

## trace_by_set_trace_func() [](#method-i-trace_by_set_trace_func)

## trace_by_tracepoint(*trace_events) [](#method-i-trace_by_tracepoint)

