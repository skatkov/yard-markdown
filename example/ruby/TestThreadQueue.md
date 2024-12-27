# Class: TestThreadQueue
**Inherits:** Test::Unit::TestCase
    




#Instance Methods
## close_wakeup(num_items, num_threads, &qcreate) [](#method-i-close_wakeup)
test that waiting producers are woken up on close

## grind(num_threads, num_objects, num_iterations, klass, *args) [](#method-i-grind)

## sized_queue_size_close() [](#method-i-sized_queue_size_close)
size should account for waiting pushers during shutdown

## test_blocked_pushers() [](#method-i-test_blocked_pushers)

## test_blocked_pushers_empty() [](#method-i-test_blocked_pushers_empty)

## test_close() [](#method-i-test_close)

## test_close_twice() [](#method-i-test_close_twice)

## test_deny_pushers() [](#method-i-test_deny_pushers)

## test_dump() [](#method-i-test_dump)

## test_dup() [](#method-i-test_dup)

## test_empty_non_blocking() [](#method-i-test_empty_non_blocking)
make sure that shutdown state is handled properly by empty? for the
non-blocking case

## test_fork_while_queue_waiting() [](#method-i-test_fork_while_queue_waiting)

## test_freeze() [](#method-i-test_freeze)

## test_one_element_sized_queue() [](#method-i-test_one_element_sized_queue)
test thread wakeup on one-element SizedQueue with close

## test_queue() [](#method-i-test_queue)

## test_queue_clear_return_value() [](#method-i-test_queue_clear_return_value)

## test_queue_close_multi_multi() [](#method-i-test_queue_close_multi_multi)

## test_queue_close_wakeup() [](#method-i-test_queue_close_wakeup)

## test_queue_initialize() [](#method-i-test_queue_initialize)

## test_queue_initialized() [](#method-i-test_queue_initialized)

## test_queue_pop_interrupt() [](#method-i-test_queue_pop_interrupt)

## test_queue_pop_non_block() [](#method-i-test_queue_pop_non_block)

## test_queue_pop_timeout() [](#method-i-test_queue_pop_timeout)

## test_queue_push_return_value() [](#method-i-test_queue_push_return_value)

## test_queue_thread_raise() [](#method-i-test_queue_thread_raise)

## test_queue_with_trap() [](#method-i-test_queue_with_trap)

## test_size_queue_close_wakeup() [](#method-i-test_size_queue_close_wakeup)

## test_sized_queue() [](#method-i-test_sized_queue)

## test_sized_queue_assign_max() [](#method-i-test_sized_queue_assign_max)

## test_sized_queue_clear() [](#method-i-test_sized_queue_clear)

## test_sized_queue_clear_return_value() [](#method-i-test_sized_queue_clear_return_value)

## test_sized_queue_closed_push_non_blocking() [](#method-i-test_sized_queue_closed_push_non_blocking)

## test_sized_queue_initialize() [](#method-i-test_sized_queue_initialize)

## test_sized_queue_initialized() [](#method-i-test_sized_queue_initialized)

## test_sized_queue_one_closed_interrupt() [](#method-i-test_sized_queue_one_closed_interrupt)

## test_sized_queue_pop_interrupt() [](#method-i-test_sized_queue_pop_interrupt)

## test_sized_queue_pop_non_block() [](#method-i-test_sized_queue_pop_non_block)

## test_sized_queue_pop_timeout() [](#method-i-test_sized_queue_pop_timeout)

## test_sized_queue_push_interrupt() [](#method-i-test_sized_queue_push_interrupt)

## test_sized_queue_push_non_block() [](#method-i-test_sized_queue_push_non_block)

## test_sized_queue_push_return_value() [](#method-i-test_sized_queue_push_return_value)

## test_sized_queue_push_timeout() [](#method-i-test_sized_queue_push_timeout)

## test_sized_queue_throttle() [](#method-i-test_sized_queue_throttle)

## test_thr_kill() [](#method-i-test_thr_kill)

