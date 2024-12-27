# Module: Process::GID
    



# Class Methods
## change_privilege(id ) [](#method-c-change_privilege)
Change the current process's real and effective group ID to that specified by
*group*. Returns the new group ID. Not available on all platforms.

    [Process.gid, Process.egid]          #=> [0, 0]
    Process::GID.change_privilege(33)    #=> 33
    [Process.gid, Process.egid]          #=> [33, 33]
**@overload** [] 

## eid() [](#method-c-eid)
Returns the effective group ID for the current process:

    Process.egid # => 500

Not available on all platforms.
**@overload** [] 

**@overload** [] 

**@overload** [] 

## from_name(id ) [](#method-c-from_name)
Get the group ID by the *name*. If the group is not found, `ArgumentError`
will be raised.

    Process::GID.from_name("wheel") #=> 0
    Process::GID.from_name("nosuchgroup") #=> can't find group for nosuchgroup (ArgumentError)
**@overload** [] 

## grant_privilege(id ) [](#method-c-grant_privilege)
Set the effective group ID, and if possible, the saved group ID of the process
to the given *group*. Returns the new effective group ID. Not available on all
platforms.

    [Process.gid, Process.egid]          #=> [0, 0]
    Process::GID.grant_privilege(31)     #=> 33
    [Process.gid, Process.egid]          #=> [0, 33]
**@overload** [] 

**@overload** [] 

## re_exchange() [](#method-c-re_exchange)
Exchange real and effective group IDs and return the new effective group ID.
Not available on all platforms.

    [Process.gid, Process.egid]   #=> [0, 33]
    Process::GID.re_exchange      #=> 0
    [Process.gid, Process.egid]   #=> [33, 0]
**@overload** [] 

## re_exchangeable?() [](#method-c-re_exchangeable?)
Returns `true` if the real and effective group IDs of a process may be
exchanged on the current platform.
**@overload** [] 

## rid() [](#method-c-rid)
Returns the (real) group ID for the current process:

    Process.gid # => 1000
**@overload** [] 

**@overload** [] 

**@overload** [] 

## sid_available?() [](#method-c-sid_available?)
Returns `true` if the current platform has saved group ID functionality.
**@overload** [] 

## switch() [](#method-c-switch)

