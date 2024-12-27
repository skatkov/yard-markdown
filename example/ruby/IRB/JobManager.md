# Class: IRB::JobManager
**Inherits:** Object
    

:nodoc:


# Attributes
## current_job[RW] [](#attribute-i-current_job)
The active irb session


#Instance Methods
## delete(key) [](#method-i-delete)
Deletes the job at the given `key`.

## initialize() [](#method-i-initialize)
Creates a new JobManager object

**@return** [JobManager] a new instance of JobManager

## insert(irb) [](#method-i-insert)
Add the given `irb` session to the jobs Array.

## inspect() [](#method-i-inspect)
Outputs a list of jobs, see the irb command `irb_jobs`, or `jobs`.

## irb(key) [](#method-i-irb)
Returns the irb session for the given `key` object, see #search for more
information.

## kill(*keys) [](#method-i-kill)
Terminates the irb sessions specified by the given `keys`.

Raises an IrbAlreadyDead exception if one of the given `keys` is already
terminated.

See Thread#exit for more information.

## main_irb() [](#method-i-main_irb)
Returns the top level irb session.

## main_thread() [](#method-i-main_thread)
Returns the top level thread.

## n_jobs() [](#method-i-n_jobs)
The total number of irb sessions, used to set `irb_name` of the current
Context.

## search(key) [](#method-i-search)
Returns the associated job for the given `key`.

If given an Integer, it will return the `key` index for the jobs Array.

When an instance of Irb is given, it will return the irb session associated
with `key`.

If given an instance of Thread, it will return the associated thread `key`
using Object#=== on the jobs Array.

Otherwise returns the irb session with the same top-level binding as the given
`key`.

Raises a NoSuchJob exception if no job can be found with the given `key`.

## switch(key) [](#method-i-switch)
Changes the current active irb session to the given `key` in the jobs Array.

Raises an IrbAlreadyDead exception if the given `key` is no longer alive.

If the given irb session is already active, an IrbSwitchedToCurrentThread
exception is raised.

## thread(key) [](#method-i-thread)
Returns the thread for the given `key` object, see #search for more
information.

