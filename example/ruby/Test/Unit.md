# Module: Test::Unit
    

Test::Unit is an implementation of the xUnit testing framework for Ruby.


# Class Methods
## location(e ) [](#method-c-location)
Extract the location where the last assertion method was called.  Returns
"<empty>" if *e* does not have backtrace, or an empty string if no assertion
method location was found.

