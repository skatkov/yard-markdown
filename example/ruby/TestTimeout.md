# Class: TestTimeout
**Inherits:** Test::Unit::TestCase
    



# Class Methods
## zero?() [](#method-c-zero?)
**@return** [Boolean] 


#Instance Methods
## test_allows_nil_seconds() [](#method-i-test_allows_nil_seconds)

## test_allows_zero_seconds() [](#method-i-test_allows_zero_seconds)

## test_cannot_convert_into_time_interval() [](#method-i-test_cannot_convert_into_time_interval)

## test_custom_exception() [](#method-i-test_custom_exception)

## test_enumerator_next() [](#method-i-test_enumerator_next)

## test_exit_exception() [](#method-i-test_exit_exception)

## test_fork() [](#method-i-test_fork)

## test_handle_interrupt() [](#method-i-test_handle_interrupt)

## test_handling_enclosed_threadgroup() [](#method-i-test_handling_enclosed_threadgroup)
https://github.com/ruby/timeout/issues/24

## test_included() [](#method-i-test_included)

## test_nested_timeout() [](#method-i-test_nested_timeout)

## test_nested_timeout_error_identity() [](#method-i-test_nested_timeout_error_identity)
DOES NOT fail with
*   raise new(message) if exc.equal?(e)
+        raise new(message) if exc.class == e.class

## test_nested_timeout_which_error_bubbles_up() [](#method-i-test_nested_timeout_which_error_bubbles_up)
DOES fail with
*   raise new(message) if exc.equal?(e)
+        raise new(message) if exc.class == e.class

## test_non_timing_out_code_is_successful() [](#method-i-test_non_timing_out_code_is_successful)

## test_queue() [](#method-i-test_queue)

## test_raise_for_neg_second() [](#method-i-test_raise_for_neg_second)

## test_raise_with_message() [](#method-i-test_raise_with_message)

## test_raises_exception_internally() [](#method-i-test_raises_exception_internally)

## test_rescue_exit() [](#method-i-test_rescue_exit)

## test_skip_rescue_standarderror() [](#method-i-test_skip_rescue_standarderror)

## test_threadgroup() [](#method-i-test_threadgroup)

## test_timeout() [](#method-i-test_timeout)

## test_work_is_done_in_same_fiber_as_caller() [](#method-i-test_work_is_done_in_same_fiber_as_caller)

## test_work_is_done_in_same_thread_as_caller() [](#method-i-test_work_is_done_in_same_thread_as_caller)

## test_yield_param() [](#method-i-test_yield_param)

