# Class: Monitor
**Inherits:** Object
    

Use the Monitor class when you want to have a lock object for blocks with
mutual exclusion.

    require 'monitor'

    lock = Monitor.new
    lock.synchronize do
      # exclusive access
    end



#Instance Methods
## enter() [](#method-i-enter)
Enters exclusive section.

**@overload** [] 

## exit() [](#method-i-exit)
Leaves exclusive section.

**@overload** [] 

## mon_check_owner() [](#method-i-mon_check_owner)
:nodoc:

## mon_locked?() [](#method-i-mon_locked?)
:nodoc:

**@return** [Boolean] 

## mon_owned?() [](#method-i-mon_owned?)
:nodoc:

**@return** [Boolean] 

## new_cond() [](#method-i-new_cond)
Creates a new MonitorMixin::ConditionVariable associated with the Monitor
object.

## synchronize() [](#method-i-synchronize)
Enters exclusive section and executes the block.  Leaves the exclusive section
automatically when the block exits.  See example under `MonitorMixin`.

**@overload** [] 

## try_enter() [](#method-i-try_enter)
Attempts to enter exclusive section.  Returns `false` if lock fails.

**@overload** [] 

## wait_for_cond(cond, timeout) [](#method-i-wait_for_cond)
:nodoc:

