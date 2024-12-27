# Class: IRB::FileInputMethod
**Inherits:** IRB::InputMethod
    

Use a File for IO with irb, see InputMethod


# Class Methods
## open(file , &block ) [](#method-c-open)

#Instance Methods
## close() [](#method-i-close)

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

## initialize(file) [](#method-i-initialize)
Creates a new input method object

**@return** [FileInputMethod] a new instance of FileInputMethod

## inspect() [](#method-i-inspect)
For debug message

