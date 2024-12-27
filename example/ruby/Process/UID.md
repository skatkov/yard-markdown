# Module: Process::UID
    



# Class Methods
## change_privilege(id ) [](#method-c-change_privilege)
Change the current process's real and effective user ID to that specified by
*user*. Returns the new user ID. Not available on all platforms.

    [Process.uid, Process.euid]          #=> [0, 0]
    Process::UID.change_privilege(31)    #=> 31
    [Process.uid, Process.euid]          #=> [31, 31]
**@overload** [] 

## eid() [](#method-c-eid)
Returns the effective user ID for the current process.

    Process.euid # => 501
**@overload** [] 

**@overload** [] 

**@overload** [] 

## from_name(id ) [](#method-c-from_name)
Get the user ID by the *name*. If the user is not found, `ArgumentError` will
be raised.

    Process::UID.from_name("root") #=> 0
    Process::UID.from_name("nosuchuser") #=> can't find user for nosuchuser (ArgumentError)
**@overload** [] 

## grant_privilege(id ) [](#method-c-grant_privilege)
Set the effective user ID, and if possible, the saved user ID of the process
to the given *user*. Returns the new effective user ID. Not available on all
platforms.

    [Process.uid, Process.euid]          #=> [0, 0]
    Process::UID.grant_privilege(31)     #=> 31
    [Process.uid, Process.euid]          #=> [0, 31]
**@overload** [] 

**@overload** [] 

## re_exchange() [](#method-c-re_exchange)
Exchange real and effective user IDs and return the new effective user ID. Not
available on all platforms.

    [Process.uid, Process.euid]   #=> [0, 31]
    Process::UID.re_exchange      #=> 0
    [Process.uid, Process.euid]   #=> [31, 0]
**@overload** [] 

## re_exchangeable?() [](#method-c-re_exchangeable?)
Returns `true` if the real and effective user IDs of a process may be
exchanged on the current platform.
**@overload** [] 

## rid() [](#method-c-rid)
Returns the (real) user ID of the current process.

    Process.uid # => 1000
**@overload** [] 

**@overload** [] 

**@overload** [] 

## sid_available?() [](#method-c-sid_available?)
Returns `true` if the current platform has saved user ID functionality.
**@overload** [] 

## switch() [](#method-c-switch)

