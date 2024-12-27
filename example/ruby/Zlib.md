# Module: Zlib
    

This module provides access to the [zlib library](http://zlib.net). Zlib is
designed to be a portable, free, general-purpose, legally unencumbered -- that
is, not covered by any patents -- lossless data-compression library for use on
virtually any computer hardware and operating system.

The zlib compression library provides in-memory compression and decompression
functions, including integrity checks of the uncompressed data.

The zlib compressed data format is described in RFC 1950, which is a wrapper
around a deflate stream which is described in RFC 1951.

The library also supports reading and writing files in gzip (.gz) format with
an interface similar to that of IO. The gzip format is described in RFC 1952
which is also a wrapper around a deflate stream.

The zlib format was designed to be compact and fast for use in memory and on
communications channels. The gzip format was designed for single-file
compression on file systems, has a larger header than zlib to maintain
directory information, and uses a different, slower check method than zlib.

See your system's zlib.h for further information about zlib

## Sample usage

Using the wrapper to compress strings with default parameters is quite simple:

    require "zlib"

    data_to_compress = File.read("don_quixote.txt")

    puts "Input size: #{data_to_compress.size}"
    #=> Input size: 2347740

    data_compressed = Zlib::Deflate.deflate(data_to_compress)

    puts "Compressed size: #{data_compressed.size}"
    #=> Compressed size: 887238

    uncompressed_data = Zlib::Inflate.inflate(data_compressed)

    puts "Uncompressed data is: #{uncompressed_data}"
    #=> Uncompressed data is: The Project Gutenberg EBook of Don Quixote...

## Class tree

*   Zlib::Deflate
*   Zlib::Inflate
*   Zlib::ZStream
*   Zlib::Error
    *   Zlib::StreamEnd
    *   Zlib::NeedDict
    *   Zlib::DataError
    *   Zlib::StreamError
    *   Zlib::MemError
    *   Zlib::BufError
    *   Zlib::VersionError
    *   Zlib::InProgressError

(if you have GZIP_SUPPORT)
*   Zlib::GzipReader
*   Zlib::GzipWriter
*   Zlib::GzipFile
*   Zlib::GzipFile::Error
    *   Zlib::GzipFile::LengthError
    *   Zlib::GzipFile::CRCError
    *   Zlib::GzipFile::NoFooter


# Class Methods
## adler32(*args ) [](#method-c-adler32)
call-seq: Zlib.adler32(string, adler)

Calculates Adler-32 checksum for `string`, and returns updated value of
`adler`. If `string` is omitted, it returns the Adler-32 initial value. If
`adler` is omitted, it assumes that the initial value is given to `adler`. If
`string` is an IO instance, reads from the IO until the IO returns nil and
returns Adler-32 of all read data.

Example usage:

    require "zlib"

    data = "foo"
    puts "Adler32 checksum: #{Zlib.adler32(data).to_s(16)}"
    #=> Adler32 checksum: 2820145
## adler32_combine(adler1 , adler2 , len2 ) [](#method-c-adler32_combine)
call-seq: Zlib.adler32_combine(adler1, adler2, len2)

Combine two Adler-32 check values in to one.  `adler1` is the first Adler-32
value, `adler2` is the second Adler-32 value.  `len2` is the length of the
string used to generate `adler2`.
## crc32(*args ) [](#method-c-crc32)
call-seq: Zlib.crc32(string, crc)

Calculates CRC checksum for `string`, and returns updated value of `crc`. If
`string` is omitted, it returns the CRC initial value. If `crc` is omitted, it
assumes that the initial value is given to `crc`. If `string` is an IO
instance, reads from the IO until the IO returns nil and returns CRC checksum
of all read data.

FIXME: expression.
## crc32_combine(crc1 , crc2 , len2 ) [](#method-c-crc32_combine)
call-seq: Zlib.crc32_combine(crc1, crc2, len2)

Combine two CRC-32 check values in to one.  `crc1` is the first CRC-32 value,
`crc2` is the second CRC-32 value.  `len2` is the length of the string used to
generate `crc2`.
## crc_table() [](#method-c-crc_table)
Returns the table for calculating CRC checksum as an array.
## deflate(*args ) [](#method-c-deflate)
call-seq:
    Zlib.deflate(string[, level])
    Zlib::Deflate.deflate(string[, level])

Compresses the given `string`. Valid values of level are Zlib::NO_COMPRESSION,
Zlib::BEST_SPEED, Zlib::BEST_COMPRESSION, Zlib::DEFAULT_COMPRESSION, or an
integer from 0 to 9.

This method is almost equivalent to the following code:

    def deflate(string, level)
      z = Zlib::Deflate.new(level)
      dst = z.deflate(string, Zlib::FINISH)
      z.close
      dst
    end

See also Zlib.inflate
## gunzip(src ) [](#method-c-gunzip)
Decode the given gzipped `string`.

This method is almost equivalent to the following code:

    def gunzip(string)
      sio = StringIO.new(string)
      gz = Zlib::GzipReader.new(sio, encoding: Encoding::ASCII_8BIT)
      gz.read
    ensure
      gz&.close
    end

See also Zlib.gzip
**@overload** [] 

## gzip(*args ) [](#method-c-gzip)
Gzip the given `string`. Valid values of level are Zlib::NO_COMPRESSION,
Zlib::BEST_SPEED, Zlib::BEST_COMPRESSION, Zlib::DEFAULT_COMPRESSION (default),
or an integer from 0 to 9.

This method is almost equivalent to the following code:

    def gzip(string, level: nil, strategy: nil)
      sio = StringIO.new
      sio.binmode
      gz = Zlib::GzipWriter.new(sio, level, strategy)
      gz.write(string)
      gz.close
      sio.string
    end

See also Zlib.gunzip
**@overload** [] 

## inflate(src ) [](#method-c-inflate)
call-seq:
    Zlib.inflate(string)
    Zlib::Inflate.inflate(string)

Decompresses `string`. Raises a Zlib::NeedDict exception if a preset
dictionary is needed for decompression.

This method is almost equivalent to the following code:

    def inflate(string)
      zstream = Zlib::Inflate.new
      buf = zstream.inflate(string)
      zstream.finish
      zstream.close
      buf
    end

See also Zlib.deflate
## zlib_version() [](#method-c-zlib_version)
Returns the string which represents the version of zlib library.

