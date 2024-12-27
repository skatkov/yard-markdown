# Class: Zlib::GzipWriter
**Inherits:** Zlib::GzipFile
    

Zlib::GzipWriter is a class for writing gzipped files.  GzipWriter should be
used with an instance of IO, or IO-like, object.

Following two example generate the same result.

    Zlib::GzipWriter.open('hoge.gz') do |gz|
      gz.write 'jugemu jugemu gokou no surikire...'
    end

    File.open('hoge.gz', 'w') do |f|
      gz = Zlib::GzipWriter.new(f)
      gz.write 'jugemu jugemu gokou no surikire...'
      gz.close
    end

To make like gzip(1) does, run following:

    orig = 'hoge.txt'
    Zlib::GzipWriter.open('hoge.gz') do |gz|
      gz.mtime = File.mtime(orig)
      gz.orig_name = orig
      gz.write IO.binread(orig)
    end

NOTE: Due to the limitation of Ruby's finalizer, you must explicitly close
GzipWriter objects by Zlib::GzipWriter#close etc.  Otherwise, GzipWriter will
be not able to write the gzip footer and will generate a broken gzip file.


# Class Methods
## open(*args ) [](#method-c-open)
Opens a file specified by `filename` for writing gzip compressed data, and
returns a GzipWriter object associated with that file.  Further details of
this method are found in Zlib::GzipWriter.new and Zlib::GzipFile.wrap.
**@overload** [] 


#Instance Methods
## <<() [](#method-i-<<)
Same as IO.

## comment=(str) [](#method-i-comment=)
Specify the comment (`str`) in the gzip header.

## flush(*args) [](#method-i-flush)
Flushes all the internal buffers of the GzipWriter object.  The meaning of
`flush` is same as in Zlib::Deflate#deflate.  `Zlib::SYNC_FLUSH` is used if
`flush` is omitted.  It is no use giving flush `Zlib::NO_FLUSH`.

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Creates a GzipWriter object associated with `io`. `level` and `strategy`
should be the same as the arguments of Zlib::Deflate.new.  The GzipWriter
object writes gzipped data to `io`.  `io` must respond to the `write` method
that behaves the same as IO#write.

The `options` hash may be used to set the encoding of the data.
`:external_encoding`, `:internal_encoding` and `:encoding` may be set as in
IO::new.

**@overload** [] 

## mtime=(mtime) [](#method-i-mtime=)
Specify the modification time (`mtime`) in the gzip header. Using an Integer.

Setting the mtime in the gzip header does not effect the mtime of the file
generated. Different utilities that expand the gzipped files may use the mtime
header. For example the gunzip utility can use the `-N` flag which will set
the resultant file's mtime to the value in the header. By default many tools
will set the mtime of the expanded file to the mtime of the gzipped file, not
the mtime in the header.

If you do not set an mtime, the default value will be the time when
compression started. Setting a value of 0 indicates no time stamp is
available.

## orig_name=(str) [](#method-i-orig_name=)
Specify the original name (`str`) in the gzip header.

## pos() [](#method-i-pos)
Total number of input bytes read so far.

## print() [](#method-i-print)
Same as IO.

## printf() [](#method-i-printf)
Same as IO.

## putc(ch) [](#method-i-putc)
Same as IO.

## puts() [](#method-i-puts)
Same as IO.

## tell() [](#method-i-tell)
Total number of input bytes read so far.

## write(*args) [](#method-i-write)
Same as IO.

