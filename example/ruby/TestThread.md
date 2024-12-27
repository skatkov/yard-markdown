# Class: TestThread
**Inherits:** Test::Unit::TestCase
    



# Class Methods
## execute(task ) [](#method-c-execute)
## foo() [](#method-c-foo)
## p(arg ) [](#method-c-p)
## synchronize() [](#method-c-synchronize)

#Instance Methods
## for_test_handle_interrupt_with_return() [](#method-i-for_test_handle_interrupt_with_return)

## invoke_rec(script, vm_stack_size, machine_stack_size, use_lengthtrue) [](#method-i-invoke_rec)

## make_handle_interrupt_test_thread1(flag) [](#method-i-make_handle_interrupt_test_thread1)

## setup() [](#method-i-setup)

## teardown() [](#method-i-teardown)

## test_abort_on_exception() [](#method-i-test_abort_on_exception)

## test_backtrace() [](#method-i-test_backtrace)

## test_blocking_mutex_unlocked_on_fork() [](#method-i-test_blocking_mutex_unlocked_on_fork)

## test_exit() [](#method-i-test_exit)

## test_fork_in_thread() [](#method-i-test_fork_in_thread)

## test_fork_value() [](#method-i-test_fork_value)

## test_fork_while_locked() [](#method-i-test_fork_while_locked)

## test_fork_while_mutex_locked_by_forker() [](#method-i-test_fork_while_mutex_locked_by_forker)

## test_fork_while_parent_locked() [](#method-i-test_fork_while_parent_locked)

## test_handle_interrupt() [](#method-i-test_handle_interrupt)

## test_handle_interrupt_and_io() [](#method-i-test_handle_interrupt_and_io)

## test_handle_interrupt_and_p() [](#method-i-test_handle_interrupt_and_p)

## test_handle_interrupt_blocking() [](#method-i-test_handle_interrupt_blocking)

## test_handle_interrupt_invalid_argument() [](#method-i-test_handle_interrupt_invalid_argument)

## test_handle_interrupt_with_break() [](#method-i-test_handle_interrupt_with_break)

## test_handle_interrupt_with_return() [](#method-i-test_handle_interrupt_with_return)

## test_handle_interrupted?() [](#method-i-test_handle_interrupted?)

**@return** [Boolean] 

## test_ignore_deadlock() [](#method-i-test_ignore_deadlock)

## test_inspect() [](#method-i-test_inspect)

## test_inspect_with_fiber() [](#method-i-test_inspect_with_fiber)

## test_join() [](#method-i-test_join)

## test_join2() [](#method-i-test_join2)

## test_join_argument_conversion() [](#method-i-test_join_argument_conversion)

## test_kill_main_thread() [](#method-i-test_kill_main_thread)

## test_kill_thread_subclass() [](#method-i-test_kill_thread_subclass)

## test_kill_wrong_argument() [](#method-i-test_kill_wrong_argument)

## test_list() [](#method-i-test_list)

## test_local_barrier() [](#method-i-test_local_barrier)

## test_machine_stack_size() [](#method-i-test_machine_stack_size)

## test_main() [](#method-i-test_main)

## test_main_thread_status_at_exit() [](#method-i-test_main_thread_status_at_exit)

## test_main_thread_variable_in_enumerator() [](#method-i-test_main_thread_variable_in_enumerator)

## test_mutex_deadlock() [](#method-i-test_mutex_deadlock)

## test_mutex_fifo_like_lock() [](#method-i-test_mutex_fifo_like_lock)

## test_mutex_illegal_unlock() [](#method-i-test_mutex_illegal_unlock)

## test_mutex_interrupt() [](#method-i-test_mutex_interrupt)

## test_mutex_owned() [](#method-i-test_mutex_owned)

## test_mutex_owned2() [](#method-i-test_mutex_owned2)

## test_mutex_synchronize() [](#method-i-test_mutex_synchronize)

## test_mutex_synchronize_yields_no_block_params() [](#method-i-test_mutex_synchronize_yields_no_block_params)

## test_mutex_trylock() [](#method-i-test_mutex_trylock)

## test_mutex_unlock_on_trap() [](#method-i-test_mutex_unlock_on_trap)

## test_new() [](#method-i-test_new)

## test_new_symbol_proc() [](#method-i-test_new_symbol_proc)

## test_no_valid_cfp() [](#method-i-test_no_valid_cfp)

## test_pending_interrupt?() [](#method-i-test_pending_interrupt?)

**@return** [Boolean] 

## test_priority() [](#method-i-test_priority)

## test_recursive_outer() [](#method-i-test_recursive_outer)

## test_report_on_exception() [](#method-i-test_report_on_exception)

## test_select_wait() [](#method-i-test_select_wait)

## test_signal_at_join() [](#method-i-test_signal_at_join)

## test_stack_size() [](#method-i-test_stack_size)

## test_status_and_stop_p() [](#method-i-test_status_and_stop_p)

## test_stop() [](#method-i-test_stop)

## test_subclass_no_initialize() [](#method-i-test_subclass_no_initialize)

## test_switch_while_busy_loop() [](#method-i-test_switch_while_busy_loop)

## test_thread_instance_variable() [](#method-i-test_thread_instance_variable)

## test_thread_interrupt_for_killed_thread() [](#method-i-test_thread_interrupt_for_killed_thread)

## test_thread_invalid_name() [](#method-i-test_thread_invalid_name)

## test_thread_invalid_object() [](#method-i-test_thread_invalid_object)

## test_thread_join_current() [](#method-i-test_thread_join_current)

## test_thread_join_in_trap() [](#method-i-test_thread_join_in_trap)

## test_thread_join_main_thread() [](#method-i-test_thread_join_main_thread)

## test_thread_local() [](#method-i-test_thread_local)

## test_thread_local_dynamic_symbol() [](#method-i-test_thread_local_dynamic_symbol)

## test_thread_local_fetch() [](#method-i-test_thread_local_fetch)

## test_thread_local_security() [](#method-i-test_thread_local_security)

## test_thread_name() [](#method-i-test_thread_name)

## test_thread_native_thread_id() [](#method-i-test_thread_native_thread_id)

## test_thread_native_thread_id_across_fork_on_linux() [](#method-i-test_thread_native_thread_id_across_fork_on_linux)

## test_thread_setname_in_initialize() [](#method-i-test_thread_setname_in_initialize)

## test_thread_status_in_trap() [](#method-i-test_thread_status_in_trap)

## test_thread_status_raise_after_kill() [](#method-i-test_thread_status_raise_after_kill)
Bug #7450

## test_thread_timer_and_ensure() [](#method-i-test_thread_timer_and_ensure)

## test_thread_timer_and_interrupt() [](#method-i-test_thread_timer_and_interrupt)

## test_thread_value_in_trap() [](#method-i-test_thread_value_in_trap)

## test_thread_variable?() [](#method-i-test_thread_variable?)

**@return** [Boolean] 

## test_thread_variable_frozen() [](#method-i-test_thread_variable_frozen)

## test_thread_variable_in_enumerator() [](#method-i-test_thread_variable_in_enumerator)

## test_thread_variable_strings_and_symbols_are_the_same_key() [](#method-i-test_thread_variable_strings_and_symbols_are_the_same_key)

## test_thread_variables() [](#method-i-test_thread_variables)

## test_uninitialized() [](#method-i-test_uninitialized)

## test_vm_machine_stack_size() [](#method-i-test_vm_machine_stack_size)

## test_wakeup() [](#method-i-test_wakeup)

## test_yield_across_thread_through_enum() [](#method-i-test_yield_across_thread_through_enum)

