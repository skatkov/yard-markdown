# Class: BaseFormatter
**Inherits:** Object
    



# Attributes
## exceptions[RW] [](#attribute-i-exceptions)
Returns the value of attribute exceptions.

## tally[RW] [](#attribute-i-tally)
Returns the value of attribute tally.

## timer[RW] [](#attribute-i-timer)
Returns the value of attribute timer.


#Instance Methods
## abort() [](#method-i-abort)

## after(statenil) [](#method-i-after)
Callback for the MSpec :after event.

## before(statenil) [](#method-i-before)
Callback for the MSpec :before event. Resets the `#exception?` and `#failure`
flags.

## exception(exception) [](#method-i-exception)
Callback for the MSpec :exception event. Stores the `ExceptionState` object to
generate the list of backtraces after all the specs are run. Also updates the
internal `#exception?` and `#failure?` flags.

## exception?() [](#method-i-exception?)
Returns true if any exception is raised while running an example. This flag is
reset before each example is evaluated.

**@return** [Boolean] 

## failure?() [](#method-i-failure?)
Returns true if all exceptions during the evaluation of an example are
failures rather than errors. See `ExceptionState#failure`. This flag is reset
before each example is evaluated.

**@return** [Boolean] 

## finish() [](#method-i-finish)
Callback for the MSpec :finish event. Prints a description and backtrace for
every exception that occurred while evaluating the examples.

## initialize(outnil) [](#method-i-initialize)

**@return** [BaseFormatter] a new instance of BaseFormatter

## print(*args) [](#method-i-print)
A convenience method to allow printing to different outputs.

## print_exception(exc, count) [](#method-i-print_exception)

## register() [](#method-i-register)
Creates the `TimerAction` and `TallyAction` instances and registers them.

## start() [](#method-i-start)
Callback for the MSpec :start event. Calls :after event. Defined here, in the
base class, and used by MultiFormatter.

## unload() [](#method-i-unload)
Callback for the MSpec :unload event. Calls :after event. Defined here, in the
base class, and used by MultiFormatter.

