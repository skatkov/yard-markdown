# Class: Bundler::ConnectionPool
**Inherits:** Object
    
**Includes:** Bundler::ConnectionPool::ForkTracker
  

Generic connection pool class for sharing a limited number of objects or
network connections among many threads.  Note: pool elements are lazily
created.

Example usage with block (faster):

    @pool = Bundler::ConnectionPool.new { Redis.new }
    @pool.with do |redis|
      redis.lpop('my-list') if redis.llen('my-list') > 0
    end

Using optional timeout override (for that single invocation)

    @pool.with(timeout: 2.0) do |redis|
      redis.lpop('my-list') if redis.llen('my-list') > 0
    end

Example usage replacing an existing connection (slower):

    $redis = Bundler::ConnectionPool.wrap { Redis.new }

    def do_work
      $redis.lpop('my-list') if $redis.llen('my-list') > 0
    end

Accepts the following options:
*   :size - number of connections to pool, defaults to 5
*   :timeout - amount of time to wait for a connection if none currently
    available, defaults to 5 seconds
*   :auto_reload_after_fork - automatically drop all connections after fork,
    defaults to true


# Class Methods
## after_fork() [](#method-c-after_fork)
## wrap(options , &block ) [](#method-c-wrap)
# Attributes
## auto_reload_after_fork[RW] [](#attribute-i-auto_reload_after_fork)
Automatically drop all connections after fork

## size[RW] [](#attribute-i-size)
Size of this connection pool


#Instance Methods
## _fork() [](#method-i-_fork)

## available() [](#method-i-available)
Number of pool entries available for checkout at this instant.

## checkin(force:false) [](#method-i-checkin)

## checkout(options{}) [](#method-i-checkout)

## initialize(options{}, &block) [](#method-i-initialize)

**@raise** [ArgumentError] 

**@return** [ConnectionPool] a new instance of ConnectionPool

## reload(&block) [](#method-i-reload)
Reloads the Bundler::ConnectionPool by passing each connection to `block` and
then removing it the pool. Subsequent checkouts will create new connections as
needed.

## shutdown(&block) [](#method-i-shutdown)
Shuts down the Bundler::ConnectionPool by passing each connection to `block`
and then removing it from the pool. Attempting to checkout a connection after
shutdown will raise `Bundler::ConnectionPool::PoolShuttingDownError`.

## with(options{}) [](#method-i-with)

