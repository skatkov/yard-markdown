# Class: Fiber::Scheduler
**Inherits:** Object
    

This is not an existing class, but documentation of the interface that
Scheduler object should comply to in order to be used as argument to
Fiber.scheduler and handle non-blocking fibers. See also the "Non-blocking
fibers" section in Fiber class docs for explanations of some concepts.

Scheduler's behavior and usage are expected to be as follows:

*   When the execution in the non-blocking Fiber reaches some blocking
    operation (like sleep, wait for a process, or a non-ready I/O), it calls
    some of the scheduler's hook methods, listed below.
*   Scheduler somehow registers what the current fiber is waiting on, and
    yields control to other fibers with Fiber.yield (so the fiber would be
    suspended while expecting its wait to end, and other fibers in the same
    thread can perform)
*   At the end of the current thread execution, the scheduler's method
    #scheduler_close is called
*   The scheduler runs into a wait loop, checking all the blocked fibers
    (which it has registered on hook calls) and resuming them when the awaited
    resource is ready (e.g. I/O ready or sleep time elapsed).

This way concurrent execution will be achieved transparently for every
individual Fiber's code.

Scheduler implementations are provided by gems, like
[Async](https://github.com/socketry/async).

Hook methods are:

*   #io_wait, #io_read, #io_write, #io_pread, #io_pwrite, and #io_select,
    #io_close
*   #process_wait
*   #kernel_sleep
*   #timeout_after
*   #address_resolve
*   #block and #unblock
*   #blocking_operation_wait
*   (the list is expanded as Ruby developers make more methods having
    non-blocking calls)

When not specified otherwise, the hook implementations are mandatory: if they
are not implemented, the methods trying to call hook will fail. To provide
backward compatibility, in the future hooks will be optional (if they are not
implemented, due to the scheduler being created for the older Ruby version,
the code which needs this hook will not fail, and will just behave in a
blocking fashion).

It is also strongly recommended that the scheduler implements the #fiber
method, which is delegated to by Fiber.schedule.

Sample *toy* implementation of the scheduler can be found in Ruby's code, in
`test/fiber/scheduler.rb`



#Instance Methods
## address_resolve() [](#method-i-address_resolve)

## block() [](#method-i-block)

## blocking_operation_wait() [](#method-i-blocking_operation_wait)

## close() [](#method-i-close)

## fiber() [](#method-i-fiber)

## io_pread() [](#method-i-io_pread)

## io_pwrite() [](#method-i-io_pwrite)

## io_read() [](#method-i-io_read)

## io_select() [](#method-i-io_select)

## io_wait() [](#method-i-io_wait)

## io_write() [](#method-i-io_write)

## kernel_sleep() [](#method-i-kernel_sleep)

## process_wait() [](#method-i-process_wait)

## timeout_after() [](#method-i-timeout_after)

## unblock() [](#method-i-unblock)

