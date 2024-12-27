# Class: Zlib::ZStream
**Inherits:** Object
    

Zlib::ZStream is the abstract class for the stream which handles the
compressed data. The operations are defined in the subclasses: Zlib::Deflate
for compression, and Zlib::Inflate for decompression.

An instance of Zlib::ZStream has one stream (struct zstream in the source) and
two variable-length buffers which associated to the input (next_in) of the
stream and the output (next_out) of the stream. In this document, "input
buffer" means the buffer for input, and "output buffer" means the buffer for
output.

Data input into an instance of Zlib::ZStream are temporally stored into the
end of input buffer, and then data in input buffer are processed from the
beginning of the buffer until no more output from the stream is produced (i.e.
until avail_out > 0 after processing).  During processing, output buffer is
allocated and expanded automatically to hold all output data.

Some particular instance methods consume the data in output buffer and return
them as a String.

Here is an ascii art for describing above:

    +================ an instance of Zlib::ZStream ================+
    ||                                                            ||
    ||     +--------+          +-------+          +--------+      ||
    ||  +--| output |<---------|zstream|<---------| input  |<--+  ||
    ||  |  | buffer |  next_out+-------+next_in   | buffer |   |  ||
    ||  |  +--------+                             +--------+   |  ||
    ||  |                                                      |  ||
    +===|======================================================|===+
        |                                                      |
        v                                                      |
    "output data"                                         "input data"

If an error occurs during processing input buffer, an exception which is a
subclass of Zlib::Error is raised.  At that time, both input and output buffer
keep their conditions at the time when the error occurs.

## Method Catalogue

Many of the methods in this class are fairly low-level and unlikely to be of
interest to users.  In fact, users are unlikely to use this class directly;
rather they will be interested in Zlib::Inflate and Zlib::Deflate.

The higher level methods are listed below.

*   #total_in
*   #total_out
*   #data_type
*   #adler
*   #reset
*   #finish
*   #finished?
*   #close
*   #closed?



#Instance Methods
## adler() [](#method-i-adler)
Returns the adler-32 checksum.

## avail_in() [](#method-i-avail_in)
Returns bytes of data in the input buffer. Normally, returns 0.

## avail_out() [](#method-i-avail_out)
Returns number of bytes of free spaces in output buffer.  Because the free
space is allocated automatically, this method returns 0 normally.

## avail_out=(size) [](#method-i-avail_out=)
Allocates `size` bytes of free space in the output buffer. If there are more
than `size` bytes already in the buffer, the buffer is truncated. Because free
space is allocated automatically, you usually don't need to use this method.

## close() [](#method-i-close)
Closes the stream. All operations on the closed stream will raise an
exception.

## closed?() [](#method-i-closed?)
Returns true if the stream is closed.

**@return** [Boolean] 

## data_type() [](#method-i-data_type)
Guesses the type of the data which have been inputted into the stream. The
returned value is either `BINARY`, `ASCII`, or `UNKNOWN`.

## end() [](#method-i-end)
Closes the stream. All operations on the closed stream will raise an
exception.

## ended?() [](#method-i-ended?)
Returns true if the stream is closed.

**@return** [Boolean] 

## finish() [](#method-i-finish)
Finishes the stream and flushes output buffer.  If a block is given each chunk
is yielded to the block until the input buffer has been flushed to the output
buffer.

**@overload** [] 

**@overload** [] 

## finished?() [](#method-i-finished?)
Returns true if the stream is finished.

**@return** [Boolean] 

## flush_next_in() [](#method-i-flush_next_in)

**@overload** [] 

## flush_next_out() [](#method-i-flush_next_out)
Flushes output buffer and returns all data in that buffer.  If a block is
given each chunk is yielded to the block until the current output buffer has
been flushed.

**@overload** [] 

**@overload** [] 

## reset() [](#method-i-reset)
Resets and initializes the stream. All data in both input and output buffer
are discarded.

## stream_end?() [](#method-i-stream_end?)
Returns true if the stream is finished.

**@return** [Boolean] 

## total_in() [](#method-i-total_in)
Returns the total bytes of the input data to the stream.  FIXME

## total_out() [](#method-i-total_out)
Returns the total bytes of the output data from the stream.  FIXME

