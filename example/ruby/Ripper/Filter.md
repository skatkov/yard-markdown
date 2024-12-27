# Class: Ripper::Filter
**Inherits:** Object
    

This class handles only scanner events, which are dispatched in the 'right'
order (same with input).



#Instance Methods
## column() [](#method-i-column)
The column number of the current token. This value starts from 0. This method
is valid only in event handlers.

## filename() [](#method-i-filename)
The file name of the input.

## initialize(src, filename'-', lineno1) [](#method-i-initialize)
Creates a new Ripper::Filter instance, passes parameters `src`, `filename`,
and `lineno` to Ripper::Lexer.new

The lexer is for internal use only.

**@return** [Filter] a new instance of Filter

## lineno() [](#method-i-lineno)
The line number of the current token. This value starts from 1. This method is
valid only in event handlers.

## parse(initnil) [](#method-i-parse)
Starts the parser. `init` is a data accumulator and is passed to the next
event handler (as of Enumerable#inject).

## state() [](#method-i-state)
The scanner's state of the current token. This value is the bitwise OR of zero
or more of the `Ripper::EXPR_*` constants.

