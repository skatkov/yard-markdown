# Class: Process::Status
**Inherits:** Object
    

*******************************************************************

    A Process::Status contains information about a system process.

    Thread-local variable <tt>$?</tt> is initially +nil+.
    Some methods assign to it a Process::Status object
    that represents a system process (either running or terminated):

      `ruby -e "exit 99"`
      stat = $?       # => #<Process::Status: pid 1262862 exit 99>
      stat.class      # => Process::Status
      stat.to_i       # => 25344
      stat.stopped?   # => false
      stat.exited?    # => true
      stat.exitstatus # => 99


# Class Methods
## wait(*args ) [](#method-c-wait)
Like Process.wait, but returns a Process::Status object (instead of an integer
pid or nil); see Process.wait for the values of `pid` and `flags`.

If there are child processes, waits for a child process to exit and returns a
Process::Status object containing information on that process; sets
thread-local variable `$?`:

    Process.spawn('cat /nop') # => 1155880
    Process::Status.wait      # => #<Process::Status: pid 1155880 exit 1>
    $?                        # => #<Process::Status: pid 1155508 exit 1>

If there is no child process, returns an "empty" Process::Status object that
does not represent an actual process; does not set thread-local variable `$?`:

    Process::Status.wait # => #<Process::Status: pid -1 exit 0>
    $?                   # => #<Process::Status: pid 1155508 exit 1> # Unchanged.

May invoke the scheduler hook Fiber::Scheduler#process_wait.

Not available on all platforms.
**@overload** [] 


#Instance Methods
## ==(st2) [](#method-i-==)
Returns whether the value of #to_i == `other`:

    `cat /nop`
    stat = $?                # => #<Process::Status: pid 1170366 exit 1>
    sprintf('%x', stat.to_i) # => "100"
    stat == 0x100            # => true

**@overload** [] 

## coredump?() [](#method-i-coredump?)
Returns `true` if the process generated a coredump when it terminated, `false`
if not.

Not available on all platforms.

**@overload** [] 

## exited?() [](#method-i-exited?)
Returns `true` if the process exited normally (for example using an `exit()`
call or finishing the program), `false` if not.

**@overload** [] 

## exitstatus() [](#method-i-exitstatus)
Returns the least significant eight bits of the return code of the process if
it has exited; `nil` otherwise:

    `exit 99`
    $?.exitstatus # => 99

**@overload** [] 

## inspect() [](#method-i-inspect)
Returns a string representation of `self`:

    system("false")
    $?.inspect # => "#<Process::Status: pid 1303494 exit 1>"

**@overload** [] 

## pid() [](#method-i-pid)
Returns the process ID of the process:

    system("false")
    $?.pid # => 1247002

**@overload** [] 

## signaled?() [](#method-i-signaled?)
Returns `true` if the process terminated because of an uncaught signal,
`false` otherwise.

**@overload** [] 

## stopped?() [](#method-i-stopped?)
Returns `true` if this process is stopped, and if the corresponding #wait call
had the Process::WUNTRACED flag set, `false` otherwise.

**@overload** [] 

## stopsig() [](#method-i-stopsig)
Returns the number of the signal that caused the process to stop, or `nil` if
the process is not stopped.

**@overload** [] 

## success?() [](#method-i-success?)
Returns:

*   `true` if the process has completed successfully and exited.
*   `false` if the process has completed unsuccessfully and exited.
*   `nil` if the process has not exited.

**@overload** [] 

## termsig() [](#method-i-termsig)
Returns the number of the signal that caused the process to terminate or `nil`
if the process was not terminated by an uncaught signal.

**@overload** [] 

## to_i() [](#method-i-to_i)
Returns the system-dependent integer status of `self`:

    `cat /nop`
    $?.to_i # => 256

**@overload** [] 

## to_s() [](#method-i-to_s)
Returns a string representation of `self`:

    `cat /nop`
    $?.to_s # => "pid 1262141 exit 1"

**@overload** [] 

