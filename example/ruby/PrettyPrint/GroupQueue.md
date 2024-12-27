# Class: PrettyPrint::GroupQueue
**Inherits:** Object
    

The GroupQueue class is used for managing the queue of Group to be pretty
printed.

This queue groups the Group objects, based on their depth.

This class is intended for internal use of the PrettyPrint buffers.



#Instance Methods
## delete(group) [](#method-i-delete)
Remote `group` from this queue

## deq() [](#method-i-deq)
Returns the outer group of the queue

## enq(group) [](#method-i-enq)
Enqueue `group`

This does not strictly append the group to the end of the queue, but instead
adds it in line, base on the `group.depth`

## initialize(*groups) [](#method-i-initialize)
Create a GroupQueue object

Arguments:
*   `groups` - one or more PrettyPrint::Group objects

**@return** [GroupQueue] a new instance of GroupQueue

