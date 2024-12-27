# Class: IRB::StdioInputMethod
**Inherits:** IRB::InputMethod
    




#Instance Methods
## encoding() [](#method-i-encoding)
The external encoding for standard input.

## eof?() [](#method-i-eof?)
Whether the end of this input method has been reached, returns `true` if there
is no more data to read.

See IO#eof? for more information.

**@return** [Boolean] 

## gets() [](#method-i-gets)
Reads the next line from this input method.

See IO#gets for more information.

## initialize() [](#method-i-initialize)
Creates a new input method object

**@return** [StdioInputMethod] a new instance of StdioInputMethod

## inspect() [](#method-i-inspect)
For debug message

## line(line_no) [](#method-i-line)
Returns the current line number for #io.

#line counts the number of times #gets is called.

See IO#lineno for more information.

## prompting?() [](#method-i-prompting?)

**@return** [Boolean] 

## readable_after_eof?() [](#method-i-readable_after_eof?)
Whether this input method is still readable when there is no more data to
read.

See IO#eof for more information.

**@return** [Boolean] 

