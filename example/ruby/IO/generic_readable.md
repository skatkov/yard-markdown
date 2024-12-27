# Module: IO::generic_readable
    




#Instance Methods
## getch(*args) [](#method-i-getch)
See IO#getch.

**@overload** [] 

## getpass(*args) [](#method-i-getpass)
See IO#getpass.

**@overload** [] 

## read_nonblock(*args) [](#method-i-read_nonblock)
Similar to #read, but raises `EOFError` at end of string unless the
+exception: false+ option is passed in.

**@overload** [] 

## readbyte() [](#method-i-readbyte)
Like `getbyte`, but raises an exception if already at end-of-stream; see [Byte
IO](rdoc-ref:IO@Byte+IO).

**@overload** [] 

## readchar() [](#method-i-readchar)
Like `getc`, but raises an exception if already at end-of-stream; see
[Character IO](rdoc-ref:IO@Character+IO).

**@overload** [] 

## readline(*args) [](#method-i-readline)
Reads a line as with IO#gets, but raises EOFError if already at end-of-file;
see [Line IO](rdoc-ref:IO@Line+IO).

**@overload** [] 

**@overload** [] 

**@overload** [] 

## readpartial(*args) [](#method-i-readpartial)
Similar to #read, but raises `EOFError` at end of string instead of returning
`nil`, as well as IO#sysread does.

**@overload** [] 

**@overload** [] 

## sysread(*args) [](#method-i-sysread)
Similar to #read, but raises `EOFError` at end of string instead of returning
`nil`, as well as IO#sysread does.

**@overload** [] 

**@overload** [] 

