# Class: Scheduler
**Inherits:** Object
    



# Attributes
## readable[RW] [](#attribute-i-readable)
Returns the value of attribute readable.

## waiting[RW] [](#attribute-i-waiting)
Returns the value of attribute waiting.

## writable[RW] [](#attribute-i-writable)
Returns the value of attribute writable.


#Instance Methods
## address_resolve(hostname) [](#method-i-address_resolve)
This hook is invoked by `Addrinfo.getaddrinfo`. Using a thread ensures that
the operation does not block the fiber scheduler, since `getaddrinfo` is
usually provided by `libc` and is blocking.

## block(blocker, timeoutnil) [](#method-i-block)
This hook is invoked by blocking options such as `Thread::Mutex#lock`,
`Thread::Queue#pop` and `Thread::SizedQueue#push`, which are unblocked by
other threads/fibers. To unblock a blocked fiber, you should call `unblock`
with the same `blocker` and `fiber` arguments.

## blocking_operation_wait(work) [](#method-i-blocking_operation_wait)

## close(internalfalse) [](#method-i-close)
If the `scheduler_close` hook does not exist, this method `close` will be
invoked instead when the fiber scheduler goes out of scope. This is legacy
behaviour, you should almost certainly use `scheduler_close`. The reason for
this, is `scheduler_close` is called when the scheduler goes out of scope,
while `close` may be called by the user.

## closed?() [](#method-i-closed?)

**@return** [Boolean] 

## current_time() [](#method-i-current_time)

## fiber(&block) [](#method-i-fiber)
This hook is invoked by `Fiber.schedule`. Strictly speaking, you should use it
to create scheduled fibers, but it is not required in practice; `Fiber.new` is
usually sufficient.

## initialize(fiberFiber.current) [](#method-i-initialize)

**@return** [Scheduler] a new instance of Scheduler

## io_select() [](#method-i-io_select)
This hook is invoked by `IO.select`. Using a thread ensures that the operation
does not block the fiber scheduler.

## io_wait(io, events, duration) [](#method-i-io_wait)
This hook is invoked by `IO#read` and `IO#write` in the case that `io_read`
and `io_write` hooks are not available. This implementation is not completely
general, in the sense that calling `io_wait` multiple times with the same `io`
and `events` will not work, which is okay for tests but not for real code.
Correct fiber schedulers should not have this limitation.

## kernel_sleep(durationnil) [](#method-i-kernel_sleep)
This hook is invoked by `Kernel#sleep` and `Thread::Mutex#sleep`.

## next_timeout() [](#method-i-next_timeout)

## process_wait(pid, flags) [](#method-i-process_wait)
This hook is invoked by `Process.wait`, `system`, and backticks.

## run() [](#method-i-run)

## scheduler_close() [](#method-i-scheduler_close)
A fiber scheduler hook, invoked when the scheduler goes out of scope.

## timeout_after(duration, klass, message, &block) [](#method-i-timeout_after)
This hook is invoked by `Timeout.timeout` and related code.

## transfer() [](#method-i-transfer)

## unblock(blocker, fiber) [](#method-i-unblock)
This method is invoked from a thread or fiber to unblock a fiber that is
blocked by `block`. It is expected to be thread safe.

