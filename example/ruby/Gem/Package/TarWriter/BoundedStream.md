# Class: Gem::Package::TarWriter::BoundedStream
**Inherits:** Object
    

IO wrapper that allows writing a limited amount of data


# Attributes
## limit[RW] [](#attribute-i-limit)
Maximum number of bytes that can be written

## written[RW] [](#attribute-i-written)
Number of bytes written


#Instance Methods
## initialize(io, limit) [](#method-i-initialize)
Wraps `io` and allows up to `limit` bytes to be written

**@return** [BoundedStream] a new instance of BoundedStream

## write(data) [](#method-i-write)
Writes `data` onto the IO, raising a FileOverflow exception if the number of
bytes will be more than #limit

