# Class: IRB::InputMethod
**Inherits:** Object
    



# Attributes
## prompt[RW] [](#attribute-i-prompt)
The irb prompt associated with this input method


#Instance Methods
## gets() [](#method-i-gets)
Reads the next line from this input method.

See IO#gets for more information.

## inspect() [](#method-i-inspect)
For debug message

## prompting?() [](#method-i-prompting?)

**@return** [Boolean] 

## readable_after_eof?() [](#method-i-readable_after_eof?)
Whether this input method is still readable when there is no more data to
read.

See IO#eof for more information.

**@return** [Boolean] 

## support_history_saving?() [](#method-i-support_history_saving?)

**@return** [Boolean] 

## winsize() [](#method-i-winsize)

