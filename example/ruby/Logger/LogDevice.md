# Class: Logger::LogDevice
**Inherits:** Object
    
**Includes:** Logger::Period, MonitorMixin
  

Device used for logging messages.


# Attributes
## dev[RW] [](#attribute-i-dev)
Returns the value of attribute dev.

## filename[RW] [](#attribute-i-filename)
Returns the value of attribute filename.


#Instance Methods
## close() [](#method-i-close)

## initialize(lognil, shift_age:nil, shift_size:nil, shift_period_suffix:nil, binmode:false, reraise_write_errors:[]) [](#method-i-initialize)

**@return** [LogDevice] a new instance of LogDevice

## mon_enter() [](#method-i-mon_enter)
Enters exclusive section.

## mon_exit() [](#method-i-mon_exit)
Leaves exclusive section.

## mon_locked?() [](#method-i-mon_locked?)
Returns true if this monitor is locked by any thread

**@return** [Boolean] 

## mon_owned?() [](#method-i-mon_owned?)
Returns true if this monitor is locked by current thread.

**@return** [Boolean] 

## mon_synchronize(&b) [](#method-i-mon_synchronize)
Enters exclusive section and executes the block.  Leaves the exclusive section
automatically when the block exits.  See example under `MonitorMixin`.

## mon_try_enter() [](#method-i-mon_try_enter)
Attempts to enter exclusive section.  Returns `false` if lock fails.

## new_cond() [](#method-i-new_cond)
Creates a new MonitorMixin::ConditionVariable associated with the Monitor
object.

## reopen(lognil) [](#method-i-reopen)

## write(message) [](#method-i-write)

