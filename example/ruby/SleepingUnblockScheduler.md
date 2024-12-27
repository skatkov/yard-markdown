# Class: SleepingUnblockScheduler
**Inherits:** Scheduler
    

This scheduler has a broken implementation of `unblock` in the sense that it
sleeps. This is used to test the behavior of the scheduler when unblock messes
with the internal thread state in an unexpected way.



#Instance Methods
## unblock(blocker, fiber) [](#method-i-unblock)
This method is invoked when the thread is exiting.

