# Exception: OptionParser::ParseError
**Inherits:** RuntimeError
    

Base class of exceptions from OptionParser.


# Class Methods
## filter_backtrace(array ) [](#method-c-filter_backtrace)
# Attributes
## additional[RW] [](#attribute-i-additional)
Returns the value of attribute additional.

## args[RW] [](#attribute-i-args)
Returns the value of attribute args.

## reason[RW] [](#attribute-i-reason)
Returns error reason. Override this for I18N.


#Instance Methods
## initialize(*args, additional:nil) [](#method-i-initialize)
:nodoc:

**@return** [ParseError] a new instance of ParseError

## inspect() [](#method-i-inspect)

## message() [](#method-i-message)
Default stringizing method to emit standard error message.

## recover(argv) [](#method-i-recover)
Pushes back erred argument(s) to `argv`.

## set_backtrace(array) [](#method-i-set_backtrace)

## set_option(opt, eq) [](#method-i-set_option)

