# Class: Spec::CommandExecution
**Inherits:** Object
    



# Attributes
## command[RW] [](#attribute-i-command)
Returns the value of attribute command.

## exitstatus[RW] [](#attribute-i-exitstatus)
Returns the value of attribute exitstatus.

## failure_reason=[R] [](#attribute-i-failure_reason=)
Sets the attribute failure_reason

**@param** [] the value to set the attribute failure_reason to.

## original_stderr[RW] [](#attribute-i-original_stderr)
Returns the value of attribute original_stderr.

## original_stdout[RW] [](#attribute-i-original_stdout)
Returns the value of attribute original_stdout.

## timeout[RW] [](#attribute-i-timeout)
Returns the value of attribute timeout.


#Instance Methods
## failure?() [](#method-i-failure?)

**@return** [Boolean] 

## initialize(command, working_directory:, timeout:) [](#method-i-initialize)

**@return** [CommandExecution] a new instance of CommandExecution

## raise_error!() [](#method-i-raise_error!)

## stdboth() [](#method-i-stdboth)

## stderr() [](#method-i-stderr)

## stdout() [](#method-i-stdout)

## success?() [](#method-i-success?)

**@return** [Boolean] 

## to_s() [](#method-i-to_s)

## to_s_verbose() [](#method-i-to_s_verbose)

