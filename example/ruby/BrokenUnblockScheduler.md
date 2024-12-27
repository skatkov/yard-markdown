# Class: BrokenUnblockScheduler
**Inherits:** Scheduler
    

This scheduler has a broken implementation of `unblock`` in the sense that it
raises an exception. This is used to test the behavior of the scheduler when
unblock raises an exception.



#Instance Methods
## unblock(blocker, fiber) [](#method-i-unblock)

