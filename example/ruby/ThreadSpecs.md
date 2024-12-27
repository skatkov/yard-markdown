# Module: ThreadSpecs
    



# Class Methods
## clear_state() [](#method-c-clear_state)
## completed_thread() [](#method-c-completed_thread)
## counter() [](#method-c-counter)
## counter=(c ) [](#method-c-counter=)
## create_and_kill_critical_thread(pass_after_kill false) [](#method-c-create_and_kill_critical_thread)
## create_critical_thread() [](#method-c-create_critical_thread)
## critical_is_reset() [](#method-c-critical_is_reset)
## critical_thread1() [](#method-c-critical_thread1)
## critical_thread2(is_thread_stop ) [](#method-c-critical_thread2)
## critical_thread_yields_to_main_thread(is_thread_sleep false, is_thread_stop false) [](#method-c-critical_thread_yields_to_main_thread)
## dying_thread_ensures(kill_method_name :kill) [](#method-c-dying_thread_ensures)
## dying_thread_with_outer_ensure(kill_method_name :kill) [](#method-c-dying_thread_with_outer_ensure)
## increment_counter(incr ) [](#method-c-increment_counter)
## join_dying_thread_with_outer_ensure(kill_method_name :kill) [](#method-c-join_dying_thread_with_outer_ensure)
## main_thread1(critical_thread , is_thread_sleep , is_thread_stop ) [](#method-c-main_thread1)
## main_thread2(critical_thread ) [](#method-c-main_thread2)
## running_thread() [](#method-c-running_thread)
## sleeping_thread() [](#method-c-sleeping_thread)
## spin_until_sleeping(t ) [](#method-c-spin_until_sleeping)
## status_of_blocked_thread() [](#method-c-status_of_blocked_thread)
## status_of_completed_thread() [](#method-c-status_of_completed_thread)
## status_of_current_thread() [](#method-c-status_of_current_thread)
## status_of_dying_running_thread() [](#method-c-status_of_dying_running_thread)
## status_of_dying_sleeping_thread() [](#method-c-status_of_dying_sleeping_thread)
## status_of_dying_thread_after_sleep() [](#method-c-status_of_dying_thread_after_sleep)
## status_of_killed_thread() [](#method-c-status_of_killed_thread)
## status_of_running_thread() [](#method-c-status_of_running_thread)
## status_of_sleeping_thread() [](#method-c-status_of_sleeping_thread)
## status_of_thread_with_uncaught_exception() [](#method-c-status_of_thread_with_uncaught_exception)
## wakeup_dying_sleeping_thread(kill_method_name :kill) [](#method-c-wakeup_dying_sleeping_thread)
# Attributes
## state[RW] [](#attribute-c-state)
Returns the value of attribute state.


