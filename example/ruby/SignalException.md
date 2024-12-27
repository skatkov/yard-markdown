# Exception: SignalException
**Inherits:** Exception
    

Raised when a signal is received.

    begin
      Process.kill('HUP',Process.pid)
      sleep # wait for receiver to handle signal sent by Process.kill
    rescue SignalException => e
      puts "received Exception #{e}"
    end

*produces:*

    received Exception SIGHUP



#Instance Methods
## initialize(*args) [](#method-i-initialize)
Construct a new SignalException object.  `sig_name` should be a known
    signal name.

**@overload** [] 

**@overload** [] 

## signo() [](#method-i-signo)
Returns a signal number.

**@overload** [] 

