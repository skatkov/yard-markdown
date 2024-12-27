# Class: Gem::TempIO
**Inherits:** Tempfile
    

A StringIO duck-typed class that uses Tempfile instead of String as the
backing store.

This class was added to flush out problems in Rubinius' IO implementation.



#Instance Methods
## initialize(string"") [](#method-i-initialize)
Creates a new TempIO that will be initialized to contain `string`.

**@return** [TempIO] a new instance of TempIO

## string() [](#method-i-string)
The content of the TempIO as a String.

