# Class: MonitorMixin::ConditionVariable
**Inherits:** Object
    

FIXME: This isn't documented in Nutshell.

Since MonitorMixin.new_cond returns a ConditionVariable, and the example above
calls while_wait and signal, this class should be documented.



#Instance Methods
## broadcast() [](#method-i-broadcast)
Wakes up all threads waiting for this lock.

## signal() [](#method-i-signal)
Wakes up the first thread in line waiting for this lock.

## wait(timeoutnil) [](#method-i-wait)
Releases the lock held in the associated monitor and waits; reacquires the
lock on wakeup.

If `timeout` is given, this method returns after `timeout` seconds passed,
even if no other thread doesn't signal.

## wait_until() [](#method-i-wait_until)
Calls wait repeatedly until the given block yields a truthy value.

## wait_while() [](#method-i-wait_while)
Calls wait repeatedly while the given block yields a truthy value.

