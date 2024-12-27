# Class: Gem::MockTCPServer
**Inherits:** Object
    

The MockTCPServer for use in tests or to avoid real TCPServer instances to be
created when testing code related to the WebAuthn listener.

Example:

    server = Gem::MockTCPServer
    port = server.addr[1].to_s

    # this mocks waiting for a request by calling sleep
    server.accept

    # this mocks the server closing
    server.close


# Attributes
## port[RW] [](#attribute-i-port)
Returns the value of attribute port.


#Instance Methods
## accept() [](#method-i-accept)

## addr() [](#method-i-addr)

## close() [](#method-i-close)

## initialize(port5678) [](#method-i-initialize)

**@return** [MockTCPServer] a new instance of MockTCPServer

