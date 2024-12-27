# Class: Gem::Package::TarReader::Entry
**Inherits:** Object
    
**Includes:** Gem::FixFullNameEncoding
  

Class for reading entries out of a tar file


# Class Methods
## open(header , io , &block ) [](#method-c-open)
Creates a new tar entry for `header` that will be read from `io` If a block is
given, the entry is yielded and then closed.
# Attributes
## header[RW] [](#attribute-i-header)
Header for this tar entry


#Instance Methods
## bytes_read() [](#method-i-bytes_read)
Number of bytes read out of the tar entry

## check_closed() [](#method-i-check_closed)
:nodoc:

**@raise** [IOError] 

## close() [](#method-i-close)
Closes the tar entry

## closed?() [](#method-i-closed?)
Is the tar entry closed?

**@return** [Boolean] 

## directory?() [](#method-i-directory?)
Is this tar entry a directory?

**@return** [Boolean] 

## eof?() [](#method-i-eof?)
Are we at the end of the tar entry?

**@return** [Boolean] 

## file?() [](#method-i-file?)
Is this tar entry a file?

**@return** [Boolean] 

## full_name() [](#method-i-full_name)
Full name of the tar entry

## getc() [](#method-i-getc)
Read one byte from the tar entry

## initialize(header, io) [](#method-i-initialize)
Creates a new tar entry for `header` that will be read from `io`

**@return** [Entry] a new instance of Entry

## pos() [](#method-i-pos)
The position in the tar entry

## pos=(new_pos) [](#method-i-pos=)
Seek to the position in the tar entry

## read(maxlennil) [](#method-i-read)
Reads `maxlen` bytes from the tar file entry, or the rest of the entry if nil

## readpartial(maxlen, outbuf"".b) [](#method-i-readpartial)

## rewind() [](#method-i-rewind)
Rewinds to the beginning of the tar file entry

## seek(offset, whenceIO::SEEK_SET) [](#method-i-seek)
Seeks to `offset` bytes into the tar file entry `whence` can be IO::SEEK_SET,
IO::SEEK_CUR, or IO::SEEK_END

## size() [](#method-i-size)

## symlink?() [](#method-i-symlink?)
Is this tar entry a symlink?

**@return** [Boolean] 

