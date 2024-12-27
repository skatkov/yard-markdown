# Class: Gem::Net::BufferedIO
**Inherits:** Object
    

:nodoc: internal use only


# Attributes
## continue_timeout[RW] [](#attribute-i-continue_timeout)
Returns the value of attribute continue_timeout.

## debug_output[RW] [](#attribute-i-debug_output)
Returns the value of attribute debug_output.

## io[RW] [](#attribute-i-io)
Returns the value of attribute io.

## read_timeout[RW] [](#attribute-i-read_timeout)
Returns the value of attribute read_timeout.

## write_timeout[RW] [](#attribute-i-write_timeout)
Returns the value of attribute write_timeout.


#Instance Methods
## close() [](#method-i-close)

## closed?() [](#method-i-closed?)

**@return** [Boolean] 

## eof?() [](#method-i-eof?)

**@return** [Boolean] 

## initialize(io, read_timeout:60, write_timeout:60, continue_timeout:nil, debug_output:nil) [](#method-i-initialize)

**@return** [BufferedIO] a new instance of BufferedIO

## inspect() [](#method-i-inspect)

## read(len, dest''.b, ignore_eoffalse) [](#method-i-read)

## read_all(dest''.b) [](#method-i-read_all)

## readline() [](#method-i-readline)

## readuntil(terminator, ignore_eoffalse) [](#method-i-readuntil)

## write(*strs) [](#method-i-write)

## writeline(str) [](#method-i-writeline)

