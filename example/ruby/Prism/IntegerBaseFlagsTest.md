# Class: Prism::IntegerBaseFlagsTest
**Inherits:** Prism::TestCase
    




#Instance Methods
## test_flags() [](#method-i-test_flags)
Through some bit hackery, we want to allow consumers to use the integer base
flags as the base itself. It has a nice property that the current alignment
provides them in the correct order. So here we test that our assumption holds
so that it doesn't change out from under us.

In C, this would look something like:

    ((flags & ~DECIMAL) >> 1) || 10

We have to do some other work in Ruby because 0 is truthy and ~ on an integer
doesn't have a fixed width.

