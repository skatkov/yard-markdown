# Class: Bundler::ConnectionPool::TimedStack
**Inherits:** Object
    

Examples:

    ts = TimedStack.new(1) { MyConnection.new }

    # fetch a connection
    conn = ts.pop

    # return a connection
    ts.push conn

    conn = ts.pop
    ts.pop timeout: 5
    #=> raises Bundler::ConnectionPool::TimeoutError after 5 seconds


# Attributes
## max[RW] [](#attribute-i-max)
Returns the value of attribute max.


#Instance Methods
## empty?() [](#method-i-empty?)
Returns `true` if there are no available connections.

**@return** [Boolean] 

## initialize(size0, &block) [](#method-i-initialize)
Creates a new pool with `size` connections that are created from the given
`block`.

**@return** [TimedStack] a new instance of TimedStack

## length() [](#method-i-length)
The number of connections available on the stack.

## pop(timeout0.5, options{}) [](#method-i-pop)
Retrieves a connection from the stack.  If a connection is available it is
immediately returned.  If no connection is available within the given timeout
a Bundler::ConnectionPool::TimeoutError is raised.

`:timeout` is the only checked entry in `options` and is preferred over the
`timeout` argument (which will be removed in a future release).  Other options
may be used by subclasses that extend TimedStack.

## push(obj, options{}) [](#method-i-push)
Returns `obj` to the stack.  `options` is ignored in TimedStack but may be
used by subclasses that extend TimedStack.

## shutdown(reload:false, &block) [](#method-i-shutdown)
Shuts down the TimedStack by passing each connection to `block` and then
removing it from the pool. Attempting to checkout a connection after shutdown
will raise `Bundler::ConnectionPool::PoolShuttingDownError` unless `:reload`
is `true`.

**@raise** [ArgumentError] 

