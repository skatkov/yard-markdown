# Class: SleepingBlockingScheduler
**Inherits:** Scheduler
    

This scheduler has a broken implementation of `kernel_sleep` in the sense that
it invokes a blocking sleep which can cause a deadlock in some cases.



#Instance Methods
## kernel_sleep(durationnil) [](#method-i-kernel_sleep)

