# Class: SocketSpecs::ServerLoopPortFinder
**Inherits:** Socket
    

We need to find a free port for Socket.tcp_server_loop and
Socket.udp_server_loop, and the only reliable way to do that is to pass 0 as
the port, but then we need to find out which one was chosen and the API
doesn't let us find what it is. So we intercept one of the public API methods
called by these methods.


# Class Methods
## cleanup() [](#method-c-cleanup)
## port() [](#method-c-port)
## tcp_server_sockets(*args ) [](#method-c-tcp_server_sockets)
## udp_server_sockets(*args , &block ) [](#method-c-udp_server_sockets)

