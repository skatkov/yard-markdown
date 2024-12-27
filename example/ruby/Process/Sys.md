# Module: Process::Sys
    



# Class Methods
## getegid() [](#method-c-getegid)
Returns the effective group ID for the current process:

    Process.egid # => 500

Not available on all platforms.
**@overload** [] 

**@overload** [] 

**@overload** [] 

## geteuid() [](#method-c-geteuid)
Returns the effective user ID for the current process.

    Process.euid # => 501
**@overload** [] 

**@overload** [] 

**@overload** [] 

## getgid() [](#method-c-getgid)
Returns the (real) group ID for the current process:

    Process.gid # => 1000
**@overload** [] 

**@overload** [] 

**@overload** [] 

## getuid() [](#method-c-getuid)
Returns the (real) user ID of the current process.

    Process.uid # => 1000
**@overload** [] 

**@overload** [] 

**@overload** [] 

## issetugid() [](#method-c-issetugid)
Returns `true` if the process was created as a result of an execve(2) system
call which had either of the setuid or setgid bits set (and extra privileges
were given as a result) or if it has changed any of its real, effective or
saved user or group IDs since it began execution.
**@overload** [] 

## setegid(id ) [](#method-c-setegid)
Set the effective group ID of the calling process to *group*.  Not available
on all platforms.
**@overload** [] 

## seteuid(id ) [](#method-c-seteuid)
Set the effective user ID of the calling process to *user*.  Not available on
all platforms.
**@overload** [] 

## setgid(id ) [](#method-c-setgid)
Set the group ID of the current process to *group*. Not available on all
platforms.
**@overload** [] 

## setregid(rid , eid ) [](#method-c-setregid)
Sets the (group) real and/or effective group IDs of the current process to
*rid* and *eid*, respectively. A value of `-1` for either means to leave that
ID unchanged. Not available on all platforms.
**@overload** [] 

## setresgid(rid , eid , sid ) [](#method-c-setresgid)
Sets the (group) real, effective, and saved user IDs of the current process to
*rid*, *eid*, and *sid* respectively. A value of `-1` for any value means to
leave that ID unchanged. Not available on all platforms.
**@overload** [] 

## setresuid(rid , eid , sid ) [](#method-c-setresuid)
Sets the (user) real, effective, and saved user IDs of the current process to
*rid*, *eid*, and *sid* respectively. A value of `-1` for any value means to
leave that ID unchanged. Not available on all platforms.
**@overload** [] 

## setreuid(rid , eid ) [](#method-c-setreuid)
Sets the (user) real and/or effective user IDs of the current process to *rid*
and *eid*, respectively. A value of `-1` for either means to leave that ID
unchanged. Not available on all platforms.
**@overload** [] 

## setrgid(id ) [](#method-c-setrgid)
Set the real group ID of the calling process to *group*. Not available on all
platforms.
**@overload** [] 

## setruid(id ) [](#method-c-setruid)
Set the real user ID of the calling process to *user*. Not available on all
platforms.
**@overload** [] 

## setuid(id ) [](#method-c-setuid)
Set the user ID of the current process to *user*. Not available on all
platforms.
**@overload** [] 


