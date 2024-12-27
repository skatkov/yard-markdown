# Exception: Socket::ResolutionError
**Inherits:** SocketError
    




#Instance Methods
## error_code() [](#method-i-error_code)
Returns the raw error code indicating the cause of the hostname resolution
failure.

    begin
      Addrinfo.getaddrinfo("ruby-lang.org", nil)
    rescue Socket::ResolutionError => e
      if e.error_code == Socket::EAI_AGAIN
        puts "Temporary failure in name resolution."
      end
    end

Note that error codes depend on the operating system.

**@overload** [] 

