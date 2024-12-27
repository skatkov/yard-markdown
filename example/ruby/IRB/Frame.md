# Class: IRB::Frame
**Inherits:** Object
    



# Class Methods
## bottom(n 0) [](#method-c-bottom)
Convenience method for Frame#bottom
## sender() [](#method-c-sender)
Returns the binding context of the caller from the last frame initialized
## top(n 0) [](#method-c-top)
Convenience method for Frame#top

#Instance Methods
## bottom(n0) [](#method-i-bottom)
Returns the `n` number of frames on the call stack from the first frame
initialized.

Raises FrameOverflow if there are no frames in the given stack range.

## initialize() [](#method-i-initialize)
Creates a new stack frame

**@return** [Frame] a new instance of Frame

## top(n0) [](#method-i-top)
Returns the `n` number of frames on the call stack from the last frame
initialized.

Raises FrameUnderflow if there are no frames in the given stack range.

## trace_func(event, file, line, id, binding) [](#method-i-trace_func)
Used by Kernel#set_trace_func to register each event in the call stack

