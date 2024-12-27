# Class: Thread::SizedQueue
**Inherits:** Object
    

This class represents queues of specified size capacity.  The push operation
may be blocked if the capacity is full.

See Thread::Queue for an example of how a Thread::SizedQueue works.



#Instance Methods
## clear() [](#method-i-clear)
Removes all objects from the queue.

## close() [](#method-i-close)
Similar to Thread::Queue#close.

The difference is behavior with waiting enqueuing threads.

If there are waiting enqueuing threads, they are interrupted by raising
ClosedQueueError('queue closed').

**@overload** [] 

## empty?() [](#method-i-empty?)
Returns `true` if the queue is empty.

**@overload** [] 

**@return** [Boolean] 

## initialize(vmax) [](#method-i-initialize)
Creates a fixed-length queue with a maximum size of `max`.

**@overload** [] 

## length() [](#method-i-length)
Returns the length of the queue.

**@overload** [] 

**@overload** [] 

## max() [](#method-i-max)
Returns the maximum size of the queue.

## max=(vmax) [](#method-i-max=)
Sets the maximum size of the queue to the given `number`.

**@overload** [] 

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

## push(object, non_blockfalse, timeout:nil) [](#method-i-push)
call-seq:
    push(object, non_block=false, timeout: nil)
    enq(object, non_block=false, timeout: nil)
    <<(object)

Pushes `object` to the queue.

If there is no space left in the queue, waits until space becomes available,
unless `non_block` is true.  If `non_block` is true, the thread isn't
suspended, and `ThreadError` is raised.

If `timeout` seconds have passed and no space is available `nil` is returned.
If `timeout` is `0` it returns immediately. Otherwise it returns `self`.

