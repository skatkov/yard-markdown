# Class: Zero
**Inherits:** Object
    

The goal of this is to use a synthetic (non-IO) reader to trigger the
read/write loop of IO.copy_stream, bypassing in-kernel mechanisms like
sendfile for zero copy, so we wrap the /dev/zero IO object:



#Instance Methods
## initialize() [](#method-i-initialize)

**@return** [Zero] a new instance of Zero

## read(len, buf) [](#method-i-read)

