# Class: SpecdocFormatter
**Inherits:** BaseFormatter
    




#Instance Methods
## after(statenil) [](#method-i-after)
Callback for the MSpec :after event. Prints a newline to finish the
description string output.

## before(state) [](#method-i-before)
Callback for the MSpec :before event. Prints the `it` block string.

## enter(describe) [](#method-i-enter)
Callback for the MSpec :enter event. Prints the `describe` block string.

## exception(exception) [](#method-i-exception)
Callback for the MSpec :exception event. Prints either 'ERROR - X' or 'FAILED
- X' where *X* is the sequential number of the exception raised. If there has
already been an exception raised while evaluating this example, it prints
another `it` block description string so that each description string has an
associated 'ERROR' or 'FAILED'

## register() [](#method-i-register)

