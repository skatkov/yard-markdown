# Class: Zlib::GzipFile
**Inherits:** Object
    

Zlib::GzipFile is an abstract class for handling a gzip formatted compressed
file. The operations are defined in the subclasses, Zlib::GzipReader for
reading, and Zlib::GzipWriter for writing.

GzipReader should be used by associating an IO, or IO-like, object.

## Method Catalogue

*   ::wrap
*   ::open (Zlib::GzipReader::open and Zlib::GzipWriter::open)
*   #close
*   #closed?
*   #comment
*   comment= (Zlib::GzipWriter#comment=)
*   #crc
*   eof? (Zlib::GzipReader#eof?)
*   #finish
*   #level
*   lineno (Zlib::GzipReader#lineno)
*   lineno= (Zlib::GzipReader#lineno=)
*   #mtime
*   mtime= (Zlib::GzipWriter#mtime=)
*   #orig_name
*   orig_name (Zlib::GzipWriter#orig_name=)
*   #os_code
*   path (when the underlying IO supports #path)
*   #sync
*   #sync=
*   #to_io

(due to internal structure, documentation may appear under Zlib::GzipReader or
Zlib::GzipWriter)


# Class Methods
## wrap(*args ) [](#method-c-wrap)
call-seq:
    Zlib::GzipReader.wrap(io, ...) { |gz| ... }
    Zlib::GzipWriter.wrap(io, ...) { |gz| ... }

Creates a GzipReader or GzipWriter associated with `io`, passing in any
necessary extra options, and executes the block with the newly created object
just like File.open.

The GzipFile object will be closed automatically after executing the block. If
you want to keep the associated IO object open, you may call
Zlib::GzipFile#finish method in the block.

#Instance Methods
## close() [](#method-i-close)
Closes the GzipFile object. This method calls close method of the associated
IO object. Returns the associated IO object.

## closed?() [](#method-i-closed?)
Same as IO#closed?

**@return** [Boolean] 

## comment() [](#method-i-comment)
Returns comments recorded in the gzip file header, or nil if the comments is
not present.

## crc() [](#method-i-crc)
Returns CRC value of the uncompressed data.

## finish() [](#method-i-finish)
Closes the GzipFile object. Unlike Zlib::GzipFile#close, this method never
calls the close method of the associated IO object. Returns the associated IO
object.

## level() [](#method-i-level)
Returns compression level.

## mtime() [](#method-i-mtime)
Returns last modification time recorded in the gzip file header.

## orig_name() [](#method-i-orig_name)
Returns original filename recorded in the gzip file header, or `nil` if
original filename is not present.

## os_code() [](#method-i-os_code)
Returns OS code number recorded in the gzip file header.

## sync() [](#method-i-sync)
Same as IO#sync

## sync=(mode) [](#method-i-sync=)
call-seq: sync = flag

Same as IO.  If flag is `true`, the associated IO object must respond to the
`flush` method.  While `sync` mode is `true`, the compression ratio decreases
sharply.

## to_io() [](#method-i-to_io)
Same as IO.

