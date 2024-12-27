# Class: Thread::Backtrace
**Inherits:** Object
    



# Class Methods
## limit() [](#method-c-limit)
Returns maximum backtrace length set by `--backtrace-limit` command-line
option. The default is `-1` which means unlimited backtraces. If the value is
zero or positive, the error backtraces, produced by Exception#full_message,
are abbreviated and the extra lines are replaced by `... 3 levels... `

    $ ruby -r net/http -e "p Thread::Backtrace.limit; Net::HTTP.get(URI('http://wrong.address'))"
    - 1
    .../lib/ruby/3.1.0/socket.rb:227:in `getaddrinfo': Failed to open TCP connection to wrong.address:80 (getaddrinfo: Name or service not known) (SocketError)
        from .../lib/ruby/3.1.0/socket.rb:227:in `foreach'
        from .../lib/ruby/3.1.0/socket.rb:632:in `tcp'
        from .../lib/ruby/3.1.0/net/http.rb:998:in `connect'
        from .../lib/ruby/3.1.0/net/http.rb:976:in `do_start'
        from .../lib/ruby/3.1.0/net/http.rb:965:in `start'
        from .../lib/ruby/3.1.0/net/http.rb:627:in `start'
        from .../lib/ruby/3.1.0/net/http.rb:503:in `get_response'
        from .../lib/ruby/3.1.0/net/http.rb:474:in `get'
    .../lib/ruby/3.1.0/socket.rb:227:in `getaddrinfo': getaddrinfo: Name or service not known (SocketError)
        from .../lib/ruby/3.1.0/socket.rb:227:in `foreach'
        from .../lib/ruby/3.1.0/socket.rb:632:in `tcp'
        from .../lib/ruby/3.1.0/net/http.rb:998:in `connect'
        from .../lib/ruby/3.1.0/net/http.rb:976:in `do_start'
        from .../lib/ruby/3.1.0/net/http.rb:965:in `start'
        from .../lib/ruby/3.1.0/net/http.rb:627:in `start'
        from .../lib/ruby/3.1.0/net/http.rb:503:in `get_response'
        from .../lib/ruby/3.1.0/net/http.rb:474:in `get'
        from -e:1:in `<main>'

    $ ruby --backtrace-limit 2 -r net/http -e "p Thread::Backtrace.limit; Net::HTTP.get(URI('http://wrong.address'))"
    2
    .../lib/ruby/3.1.0/socket.rb:227:in `getaddrinfo': Failed to open TCP connection to wrong.address:80 (getaddrinfo: Name or service not known) (SocketError)
        from .../lib/ruby/3.1.0/socket.rb:227:in `foreach'
        from .../lib/ruby/3.1.0/socket.rb:632:in `tcp'
         ... 7 levels...
    .../lib/ruby/3.1.0/socket.rb:227:in `getaddrinfo': getaddrinfo: Name or service not known (SocketError)
        from .../lib/ruby/3.1.0/socket.rb:227:in `foreach'
        from .../lib/ruby/3.1.0/socket.rb:632:in `tcp'
         ... 7 levels...

    $ ruby --backtrace-limit 0 -r net/http -e "p Thread::Backtrace.limit; Net::HTTP.get(URI('http://wrong.address'))"
    0
    .../lib/ruby/3.1.0/socket.rb:227:in `getaddrinfo': Failed to open TCP connection to wrong.address:80 (getaddrinfo: Name or service not known) (SocketError)
         ... 9 levels...
    .../lib/ruby/3.1.0/socket.rb:227:in `getaddrinfo': getaddrinfo: Name or service not known (SocketError)
         ... 9 levels...
**@overload** [] 


