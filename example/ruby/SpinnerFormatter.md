# Class: SpinnerFormatter
**Inherits:** BaseFormatter
    



# Attributes
## length[RW] [](#attribute-i-length)
Returns the value of attribute length.


#Instance Methods
## after(statenil) [](#method-i-after)
Callback for the MSpec :after event. Updates the spinner.

## clear_progress_line() [](#method-i-clear_progress_line)

## compute_etr() [](#method-i-compute_etr)

## compute_percentage() [](#method-i-compute_percentage)

## compute_progress() [](#method-i-compute_progress)

## exception(exception) [](#method-i-exception)
Callback for the MSpec :exception event. Changes the color used to display the
tally of errors and failures

## initialize(outnil) [](#method-i-initialize)

**@return** [SpinnerFormatter] a new instance of SpinnerFormatter

## progress_line() [](#method-i-progress_line)

## register() [](#method-i-register)

## start() [](#method-i-start)
Callback for the MSpec :start event. Stores the total number of files that
will be processed.

## unload() [](#method-i-unload)
Callback for the MSpec :unload event. Increments the number of files that have
been run.

