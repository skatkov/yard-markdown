# Module: Signal
    



# Class Methods
## list() [](#method-c-list)
Returns a list of signal names mapped to the corresponding underlying signal
numbers.

    Signal.list   #=> {"EXIT"=>0, "HUP"=>1, "INT"=>2, "QUIT"=>3, "ILL"=>4, "TRAP"=>5, "IOT"=>6, "ABRT"=>6, "FPE"=>8, "KILL"=>9, "BUS"=>7, "SEGV"=>11, "SYS"=>31, "PIPE"=>13, "ALRM"=>14, "TERM"=>15, "URG"=>23, "STOP"=>19, "TSTP"=>20, "CONT"=>18, "CHLD"=>17, "CLD"=>17, "TTIN"=>21, "TTOU"=>22, "IO"=>29, "XCPU"=>24, "XFSZ"=>25, "VTALRM"=>26, "PROF"=>27, "WINCH"=>28, "USR1"=>10, "USR2"=>12, "PWR"=>30, "POLL"=>29}
**@overload** [] 

## signame(signo ) [](#method-c-signame)
Convert signal number to signal name.
    Returns +nil+ if the signo is an invalid signal number.

       Signal.trap("INT") { |signo| puts Signal.signame(signo) }
       Process.kill("INT", 0)

    <em>produces:</em>

       INT
**@overload** [] 

## trap(*args ) [](#method-c-trap)
Specifies the handling of signals. The first parameter is a signal name (a
string such as ``SIGALRM'', ``SIGUSR1'', and so on) or a signal number. The
characters ``SIG'' may be omitted from the signal name. The command or block
specifies code to be run when the signal is raised. If the command is the
string ``IGNORE'' or ``SIG_IGN'', the signal will be ignored. If the command
is ``DEFAULT'' or ``SIG_DFL'', the Ruby's default handler will be invoked. If
the command is ``EXIT'', the script will be terminated by the signal. If the
command is ``SYSTEM_DEFAULT'', the operating system's default handler will be
invoked. Otherwise, the given command or block will be run. The special signal
name ``EXIT'' or signal number zero will be invoked just prior to program
termination. trap returns the previous handler for the given signal.

    Signal.trap(0, proc { puts "Terminating: #{$$}" })
    Signal.trap("CLD")  { puts "Child died" }
    fork && Process.wait

*produces:*
    Terminating: 27461
    Child died
    Terminating: 27460
**@overload** [] 

**@overload** [] 


