# Class: Thread::ConditionVariable
**Inherits:** Object
    

ConditionVariable objects augment class Mutex. Using condition variables, it
is possible to suspend while in the middle of a critical section until a
resource becomes available.

Example:

    mutex = Thread::Mutex.new
    resource = Thread::ConditionVariable.new

    a = Thread.new {

mutex.synchronize {
    # Thread 'a' now needs the resource
    resource.wait(mutex)
    # 'a' can now have the resource

}
    }

    b = Thread.new {

mutex.synchronize {
    # Thread 'b' has finished using the resource
    resource.signal

}
    }



#Instance Methods
## broadcast() [](#method-i-broadcast)
Wakes up all threads waiting for this lock.

## initialize() [](#method-i-initialize)
Creates a new condition variable instance.

## marshal_dump() [](#method-i-marshal_dump)
:nodoc:

## signal() [](#method-i-signal)
Wakes up the first thread in line waiting for this lock.

## wait(*args) [](#method-i-wait)
Releases the lock held in `mutex` and waits; reacquires the lock on wakeup.

If `timeout` is given, this method returns after `timeout` seconds passed,
even if no other thread doesn't signal.

Returns the slept result on `mutex`.

**@overload** [] 

