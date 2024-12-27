# Class: Thread::Mutex
**Inherits:** Object
    

Thread::Mutex implements a simple semaphore that can be used to coordinate
access to shared data from multiple concurrent threads.

Example:

    semaphore = Thread::Mutex.new

    a = Thread.new {
      semaphore.synchronize {
        # access shared resource
      }
    }

    b = Thread.new {
      semaphore.synchronize {
        # access shared resource
      }
    }



#Instance Methods
## initialize() [](#method-i-initialize)
Creates a new Mutex

**@overload** [] 

## lock() [](#method-i-lock)
Attempts to grab the lock and waits if it isn't available. Raises
`ThreadError` if `mutex` was locked by the current thread.

**@overload** [] 

## locked?() [](#method-i-locked?)
Returns `true` if this lock is currently held by some thread.

**@overload** [] 

## owned?() [](#method-i-owned?)
Returns `true` if this lock is currently held by current thread.

**@overload** [] 

## sleep(*args) [](#method-i-sleep)
Releases the lock and sleeps `timeout` seconds if it is given and non-nil or
forever.  Raises `ThreadError` if `mutex` wasn't locked by the current thread.

When the thread is next woken up, it will attempt to reacquire the lock.

Note that this method can wakeup without explicit Thread#wakeup call. For
example, receiving signal and so on.

Returns the slept time in seconds if woken up, or `nil` if timed out.

**@overload** [] 

## synchronize() [](#method-i-synchronize)
Obtains a lock, runs the block, and releases the lock when the block
completes.  See the example under Thread::Mutex.

**@overload** [] 

## try_lock() [](#method-i-try_lock)
Attempts to obtain the lock and returns immediately. Returns `true` if the
lock was granted.

**@overload** [] 

## unlock() [](#method-i-unlock)
Releases the lock. Raises `ThreadError` if `mutex` wasn't locked by the
current thread.

**@overload** [] 

