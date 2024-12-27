# Class: TestIOWaitUncommon
**Inherits:** Test::Unit::TestCase
    

test uncommon device types to check portability problems We may optimize
IO#wait_*able for non-Linux kernels in the future



#Instance Methods
## check_dev(dev, m:wait_readable, mode:m == :wait_readable ? 'r' : 'w', &block) [](#method-i-check_dev)
used to find portability problems because some ppoll implementations are
incomplete and do not work for certain "file" types

## test_fifo_wait() [](#method-i-test_fifo_wait)

## test_tty_wait() [](#method-i-test_tty_wait)

## test_wait_readable_random() [](#method-i-test_wait_readable_random)

## test_wait_readable_urandom() [](#method-i-test_wait_readable_urandom)

## test_wait_readable_zero() [](#method-i-test_wait_readable_zero)

## test_wait_writable_null() [](#method-i-test_wait_writable_null)

