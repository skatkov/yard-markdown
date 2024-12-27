# Class: SyntaxSuggest::MiniStringIO
**Inherits:** Object
    

Mini String IO [Private]

Acts like a StringIO with reduced API, but without having to require that
class.

The original codebase emitted directly to $stderr, but now
SyntaxError#detailed_message needs a string output. To accomplish that we kept
the original print infrastructure in place and added this class to accumulate
the print output into a string.


# Attributes
## isatty[RW] [](#attribute-i-isatty)
Returns the value of attribute isatty.

## string[RW] [](#attribute-i-string)
Returns the value of attribute string.


#Instance Methods
## initialize(isatty:$stderr.isatty) [](#method-i-initialize)

**@return** [MiniStringIO] a new instance of MiniStringIO

## puts(valueEMPTY_ARG) [](#method-i-puts)

