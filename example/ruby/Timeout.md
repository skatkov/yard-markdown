# Module: Timeout
    

Timeout long-running blocks

## Synopsis

    require 'timeout'
    status = Timeout.timeout(5) {
      # Something that should be interrupted if it takes more than 5 seconds...
    }

## Description

Timeout provides a way to auto-terminate a potentially long-running operation
if it hasn't finished in a fixed amount of time.

## Copyright

Copyright
:   (C) 2000  Network Applied Communication Laboratory, Inc.

Copyright
:   (C) 2000  Information-technology Promotion Agency, Japan



# Class Methods
## ensure_timeout_thread_created() [](#method-c-ensure_timeout_thread_created)
## timeout(sec , klass nil, message nil, &block ) [](#method-c-timeout)
Perform an operation in a block, raising an error if it takes longer than
`sec` seconds to complete.

`sec`
:   Number of seconds to wait for the block to terminate. Any non-negative
    number or nil may be used, including Floats to specify fractional seconds.
    A value of 0 or `nil` will execute the block without any timeout. Any
    negative number will raise an ArgumentError.

`klass`
:   Exception Class to raise if the block fails to terminate in `sec` seconds.
     Omitting will use the default, Timeout::Error

`message`
:   Error message to raise with Exception Class. Omitting will use the
    default, "execution expired"


Returns the result of the block **if** the block completed before `sec`
seconds, otherwise throws an exception, based on the value of `klass`.

The exception thrown to terminate the given block cannot be rescued inside the
block unless `klass` is given explicitly. However, the block can use ensure to
prevent the handling of the exception.  For that reason, this method cannot be
relied on to enforce timeouts for untrusted blocks.

If a scheduler is defined, it will be used to handle the timeout by invoking
Scheduler#timeout_after.

Note that this is both a method of module Timeout, so you can `include
Timeout` into your classes so they have a #timeout method, as well as a module
method, so you can call it directly as Timeout.timeout().
**@raise** [ArgumentError] 


