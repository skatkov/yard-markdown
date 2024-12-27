# Module: PTY
    



# Class Methods
## check(*args ) [](#method-c-check)
Checks the status of the child process specified by `pid`. Returns `nil` if
the process is still alive.

If the process is not alive, and `raise` was true, a PTY::ChildExited
exception will be raised. Otherwise it will return a Process::Status instance.

`pid`
:   The process id of the process to check

`raise`
:   If `true` and the process identified by `pid` is no longer alive a
    PTY::ChildExited is raised.

**@overload** [] 

**@overload** [] 

## open() [](#method-c-open)
Allocates a pty (pseudo-terminal).

In the block form, yields an array of two elements (`master_io, slave_file`)
and the value of the block is returned from `open`.

The IO and File are both closed after the block completes if they haven't been
already closed.

    PTY.open {|master, slave|
      p master      #=> #<IO:masterpty:/dev/pts/1>
      p slave      #=> #<File:/dev/pts/1>
      p slave.path #=> "/dev/pts/1"
    }

In the non-block form, returns a two element array, `[master_io, slave_file]`.

    master, slave = PTY.open
    # do something with master for IO, or the slave file

The arguments in both forms are:

`master_io`
:   the master of the pty, as an IO.

`slave_file`
:   the slave of the pty, as a File.  The path to the

	    terminal device is available via `slave_file.path`

IO#raw! is usable to disable newline conversions:

    require 'io/console'
    PTY.open {|m, s|
      s.raw!
      # ...
    }
**@overload** [] 

**@overload** [] 

## spawn(*args ) [](#method-c-spawn)
Spawns the specified command on a newly allocated pty. You can also use the
alias ::getpty.

The command's controlling tty is set to the slave device of the pty and its
standard input/output/error is redirected to the slave device.

`env` is an optional hash that provides additional environment variables to
the spawned pty.

    # sets FOO to "bar"
    PTY.spawn({"FOO"=>"bar"}, "printenv", "FOO") do |r, w, pid|
      p r.read #=> "bar\r\n"
    ensure
      r.close; w.close; Process.wait(pid)
    end
    # unsets FOO
    PTY.spawn({"FOO"=>nil}, "printenv", "FOO") do |r, w, pid|
      p r.read #=> ""
    ensure
      r.close; w.close; Process.wait(pid)
    end

`command` and `command_line` are the full commands to run, given a String. Any
additional `arguments` will be passed to the command.

### Return values

In the non-block form this returns an array of size three, `[r, w, pid]`.

In the block form these same values will be yielded to the block:

`r`
:   A readable IO that contains the command's standard output and standard
    error

`w`
:   A writable IO that is the command's standard input

`pid`
:   The process identifier for the command.


### Clean up

This method does not clean up like closing IOs or waiting for child process,
except that the process is detached in the block form to prevent it from
becoming a zombie (see Process.detach).  Any other cleanup is the
responsibility of the caller.  If waiting for `pid`, be sure to close both `r`
and `w` before doing so; doing it in the reverse order may cause deadlock on
some OSes.
**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 


