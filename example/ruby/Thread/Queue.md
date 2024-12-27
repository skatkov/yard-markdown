# Class: Thread::Queue
**Inherits:** Object
    

The Thread::Queue class implements multi-producer, multi-consumer queues.  It
is especially useful in threaded programming when information must be
exchanged safely between multiple threads. The Thread::Queue class implements
all the required locking semantics.

The class implements FIFO (first in, first out) type of queue. In a FIFO
queue, the first tasks added are the first retrieved.

Example:

queue = Thread::Queue.new

producer = Thread.new do
    5.times do |i|
      sleep rand(i) # simulate expense
      queue << i
      puts "#{i} produced"
    end

end

consumer = Thread.new do
    5.times do |i|
      value = queue.pop
      sleep rand(i/2) # simulate expense
      puts "consumed #{value}"
    end

end

consumer.join



#Instance Methods
## clear() [](#method-i-clear)
Removes all objects from the queue.

## close() [](#method-i-close)
Closes the queue. A closed queue cannot be re-opened.

After the call to close completes, the following are true:

*   `closed?` will return true

*   `close` will be ignored.

*   calling enq/push/<< will raise a `ClosedQueueError`.

*   when `empty?` is false, calling deq/pop/shift will return an object from
    the queue as usual.
*   when `empty?` is true, deq(false) will not suspend the thread and will
    return nil. deq(true) will raise a `ThreadError`.

ClosedQueueError is inherited from StopIteration, so that you can break loop
block.

Example:

    	q = Thread::Queue.new
      Thread.new{
        while e = q.deq # wait for nil to break loop
          # ...
        end
      }
      q.close

**@overload** [] 

## closed?() [](#method-i-closed?)
Returns `true` if the queue is closed.

**@overload** [] 

**@return** [Boolean] 

## empty?() [](#method-i-empty?)
Returns `true` if the queue is empty.

**@overload** [] 

**@return** [Boolean] 

## freeze() [](#method-i-freeze)
The queue can't be frozen, so this method raises an exception:
    Thread::Queue.new.freeze # Raises TypeError (cannot freeze #<Thread::Queue:0x...>)

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
call-seq:
    Thread::Queue.new -> empty_queue
    Thread::Queue.new(enumerable) -> queue

Creates a new queue instance, optionally using the contents of an `enumerable`
for its initial state.

Example:

    	q = Thread::Queue.new
      #=> #<Thread::Queue:0x00007ff7501110d0>
      q.empty?
      #=> true

    	q = Thread::Queue.new([1, 2, 3])
    	#=> #<Thread::Queue:0x00007ff7500ec500>
      q.empty?
      #=> false
      q.pop
      #=> 1

## length() [](#method-i-length)
Returns the length of the queue.

**@overload** [] 

**@overload** [] 

## marshal_dump() [](#method-i-marshal_dump)
:nodoc:

## num_waiting() [](#method-i-num_waiting)
Returns the number of threads waiting on the queue.

## pop(non_blockfalse, timeout:nil) [](#method-i-pop)
call-seq:
    pop(non_block=false, timeout: nil)

Retrieves data from the queue.

If the queue is empty, the calling thread is suspended until data is pushed
onto the queue. If `non_block` is true, the thread isn't suspended, and
`ThreadError` is raised.

If `timeout` seconds have passed and no data is available `nil` is returned.
If `timeout` is `0` it returns immediately.

## push(obj) [](#method-i-push)
Pushes the given `object` to the queue.

**@overload** [] 

**@overload** [] 

**@overload** [] 

