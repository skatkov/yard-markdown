# Class: TestMonitor::KeywordInitializeChild
**Inherits:** TestMonitor::KeywordInitializeParent
    
**Includes:** MonitorMixin
  




#Instance Methods
## initialize() [](#method-i-initialize)

**@return** [KeywordInitializeChild] a new instance of KeywordInitializeChild

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

