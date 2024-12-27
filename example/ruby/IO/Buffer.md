# Class: IO::Buffer
**Inherits:** Object
    
**Includes:** Comparable
  

IO::Buffer is a efficient zero-copy buffer for input/output. There are typical
use cases:

*   Create an empty buffer with ::new, fill it with buffer using #copy or
    #set_value, #set_string, get buffer with #get_string or write it directly
    to some file with #write.
*   Create a buffer mapped to some string with ::for, then it could be used
    both for reading with #get_string or #get_value, and writing (writing will
    change the source string, too).
*   Create a buffer mapped to some file with ::map, then it could be used for
    reading and writing the underlying file.
*   Create a string of a fixed size with ::string, then #read into it, or
    modify it using #set_value.

Interaction with string and file memory is performed by efficient low-level C
mechanisms like `memcpy`.

The class is meant to be an utility for implementing more high-level
mechanisms like Fiber::Scheduler#io_read and Fiber::Scheduler#io_write and
parsing binary protocols.

## Examples of Usage

Empty buffer:

    buffer = IO::Buffer.new(8)  # create empty 8-byte buffer
    # =>
    # #<IO::Buffer 0x0000555f5d1a5c50+8 INTERNAL>
    # ...
    buffer
    # =>
    # <IO::Buffer 0x0000555f5d156ab0+8 INTERNAL>
    # 0x00000000  00 00 00 00 00 00 00 00
    buffer.set_string('test', 2) # put there bytes of the "test" string, starting from offset 2
    # => 4
    buffer.get_string  # get the result
    # => "\x00\x00test\x00\x00"

Buffer from string:

    string = 'data'
    IO::Buffer.for(string) do |buffer|
      buffer
      # =>
      # #<IO::Buffer 0x00007f3f02be9b18+4 SLICE>
      # 0x00000000  64 61 74 61                                     data

      buffer.get_string(2)  # read content starting from offset 2
      # => "ta"
      buffer.set_string('---', 1) # write content, starting from offset 1
      # => 3
      buffer
      # =>
      # #<IO::Buffer 0x00007f3f02be9b18+4 SLICE>
      # 0x00000000  64 2d 2d 2d                                     d---
      string  # original string changed, too
      # => "d---"
    end

Buffer from file:

    File.write('test.txt', 'test data')
    # => 9
    buffer = IO::Buffer.map(File.open('test.txt'))
    # =>
    # #<IO::Buffer 0x00007f3f0768c000+9 MAPPED IMMUTABLE>
    # ...
    buffer.get_string(5, 2) # read 2 bytes, starting from offset 5
    # => "da"
    buffer.set_string('---', 1) # attempt to write
    # in `set_string': Buffer is not writable! (IO::Buffer::AccessError)

    # To create writable file-mapped buffer
    # Open file for read-write, pass size, offset, and flags=0
    buffer = IO::Buffer.map(File.open('test.txt', 'r+'), 9, 0, 0)
    buffer.set_string('---', 1)
    # => 3 -- bytes written
    File.read('test.txt')
    # => "t--- data"

**The class is experimental and the interface is subject to change, this is
especially true of file mappings which may be removed entirely in the
future.**


# Class Methods
## for(string ) [](#method-c-for)
Creates a zero-copy IO::Buffer from the given string's memory. Without a block
a frozen internal copy of the string is created efficiently and used as the
buffer source. When a block is provided, the buffer is associated directly
with the string's internal buffer and updating the buffer will update the
string.

Until #free is invoked on the buffer, either explicitly or via the garbage
collector, the source string will be locked and cannot be modified.

If the string is frozen, it will create a read-only buffer which cannot be
modified. If the string is shared, it may trigger a copy-on-write when using
the block form.

    string = 'test'
    buffer = IO::Buffer.for(string)
    buffer.external? #=> true

    buffer.get_string(0, 1)
    # => "t"
    string
    # => "best"

    buffer.resize(100)
    # in `resize': Cannot resize external buffer! (IO::Buffer::AccessError)

    IO::Buffer.for(string) do |buffer|
      buffer.set_string("T")
      string
      # => "Test"
    end
**@overload** [] 

**@overload** [] 

## map(*args ) [](#method-c-map)
Create an IO::Buffer for reading from `file` by memory-mapping the file.
`file_io` should be a `File` instance, opened for reading.

Optional `size` and `offset` of mapping can be specified.

By default, the buffer would be immutable (read only); to create a writable
mapping, you need to open a file in read-write mode, and explicitly pass
`flags` argument without IO::Buffer::IMMUTABLE.

    File.write('test.txt', 'test')

    buffer = IO::Buffer.map(File.open('test.txt'), nil, 0, IO::Buffer::READONLY)
    # => #<IO::Buffer 0x00000001014a0000+4 MAPPED READONLY>

    buffer.readonly?   # => true

    buffer.get_string
    # => "test"

    buffer.set_string('b', 0)
    # `set_string': Buffer is not writable! (IO::Buffer::AccessError)

    # create read/write mapping: length 4 bytes, offset 0, flags 0
    buffer = IO::Buffer.map(File.open('test.txt', 'r+'), 4, 0)
    buffer.set_string('b', 0)
    # => 1

    # Check it
    File.read('test.txt')
    # => "best"

Note that some operating systems may not have cache coherency between mapped
buffers and file reads.
**@overload** [] 

## size_of(buffer_type ) [](#method-c-size_of)
Returns the size of the given buffer type(s) in bytes.

    IO::Buffer.size_of(:u32) # => 4
    IO::Buffer.size_of([:u32, :u32]) # => 8
**@overload** [] 

**@overload** [] 

## string(length ) [](#method-c-string)
Creates a new string of the given length and yields a zero-copy IO::Buffer
instance to the block which uses the string as a source. The block is expected
to write to the buffer and the string will be returned.

    IO::Buffer.string(4) do |buffer|
      buffer.set_string("Ruby")
    end
    # => "Ruby"
**@overload** [] 


#Instance Methods
## &(mask) [](#method-i-&)
Generate a new buffer the same size as the source by applying the binary AND
operation to the source, using the mask, repeating as necessary.

    IO::Buffer.for("1234567890") & IO::Buffer.for("\xFF\x00\x00\xFF")
    # =>
    # #<IO::Buffer 0x00005589b2758480+4 INTERNAL>
    # 0x00000000  31 00 00 34 35 00 00 38 39 00                   1..45..89.

**@overload** [] 

## <(y) [](#method-i-<)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than 0.

**@overload** [] 

## <=(y) [](#method-i-<=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than or equal to 0.

**@overload** [] 

## <=>() [](#method-i-<=>)

## ==(y) [](#method-i-==)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns 0. Also returns true if *obj* and *other* are the same object.

**@overload** [] 

## >(y) [](#method-i->)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than 0.

**@overload** [] 

## >=(y) [](#method-i->=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than or equal to 0.

**@overload** [] 

## ^(mask) [](#method-i-^)
Generate a new buffer the same size as the source by applying the binary XOR
operation to the source, using the mask, repeating as necessary.

    IO::Buffer.for("1234567890") ^ IO::Buffer.for("\xFF\x00\x00\xFF")
    # =>
    # #<IO::Buffer 0x000055a2d5d10480+10 INTERNAL>
    # 0x00000000  ce 32 33 cb ca 36 37 c7 c6 30                   .23..67..0

**@overload** [] 

## and!(mask) [](#method-i-and!)
Modify the source buffer in place by applying the binary AND operation to the
source, using the mask, repeating as necessary.

    source = IO::Buffer.for("1234567890").dup # Make a read/write copy.
    # =>
    # #<IO::Buffer 0x000056307a0d0c20+10 INTERNAL>
    # 0x00000000  31 32 33 34 35 36 37 38 39 30                   1234567890

    source.and!(IO::Buffer.for("\xFF\x00\x00\xFF"))
    # =>
    # #<IO::Buffer 0x000056307a0d0c20+10 INTERNAL>
    # 0x00000000  31 00 00 34 35 00 00 38 39 00                   1..45..89.

**@overload** [] 

## between?(min, max) [](#method-i-between?)
Returns `false` if *obj* `<=>` *min* is less than zero or if *obj* `<=>` *max*
is greater than zero, `true` otherwise.

    3.between?(1, 5)               #=> true
    6.between?(1, 5)               #=> false
    'cat'.between?('ant', 'dog')   #=> true
    'gnu'.between?('ant', 'dog')   #=> false

**@overload** [] 

## clamp(*args) [](#method-i-clamp)
In `(min, max)` form, returns *min* if *obj* `<=>` *min* is less than zero,
*max* if *obj* `<=>` *max* is greater than zero, and *obj* otherwise.

    12.clamp(0, 100)         #=> 12
    523.clamp(0, 100)        #=> 100
    -3.123.clamp(0, 100)     #=> 0

    'd'.clamp('a', 'f')      #=> 'd'
    'z'.clamp('a', 'f')      #=> 'f'

If *min* is `nil`, it is considered smaller than *obj*, and if *max* is `nil`,
it is considered greater than *obj*.

    -20.clamp(0, nil)           #=> 0
    523.clamp(nil, 100)         #=> 100

In `(range)` form, returns *range.begin* if *obj* `<=>` *range.begin* is less
than zero, *range.end* if *obj* `<=>` *range.end* is greater than zero, and
*obj* otherwise.

    12.clamp(0..100)         #=> 12
    523.clamp(0..100)        #=> 100
    -3.123.clamp(0..100)     #=> 0

    'd'.clamp('a'..'f')      #=> 'd'
    'z'.clamp('a'..'f')      #=> 'f'

If *range.begin* is `nil`, it is considered smaller than *obj*, and if
*range.end* is `nil`, it is considered greater than *obj*.

    -20.clamp(0..)           #=> 0
    523.clamp(..100)         #=> 100

When *range.end* is excluded and not `nil`, an exception is raised.

    100.clamp(0...100)       # ArgumentError

**@overload** [] 

**@overload** [] 

## clear(*args) [](#method-i-clear)
Fill buffer with `value`, starting with `offset` and going for `length` bytes.

    buffer = IO::Buffer.for('test').dup
    # =>
    #   <IO::Buffer 0x00007fca40087c38+4 INTERNAL>
    #   0x00000000  74 65 73 74         test

    buffer.clear
    # =>
    #   <IO::Buffer 0x00007fca40087c38+4 INTERNAL>
    #   0x00000000  00 00 00 00         ....

    buf.clear(1) # fill with 1
    # =>
    #   <IO::Buffer 0x00007fca40087c38+4 INTERNAL>
    #   0x00000000  01 01 01 01         ....

    buffer.clear(2, 1, 2) # fill with 2, starting from offset 1, for 2 bytes
    # =>
    #   <IO::Buffer 0x00007fca40087c38+4 INTERNAL>
    #   0x00000000  01 02 02 01         ....

    buffer.clear(2, 1) # fill with 2, starting from offset 1
    # =>
    #   <IO::Buffer 0x00007fca40087c38+4 INTERNAL>
    #   0x00000000  01 02 02 02         ....

**@overload** [] 

## copy(*args) [](#method-i-copy)
Efficiently copy from a source IO::Buffer into the buffer, at `offset` using
`memmove`. For copying String instances, see #set_string.

    buffer = IO::Buffer.new(32)
    # =>
    # #<IO::Buffer 0x0000555f5ca22520+32 INTERNAL>
    # 0x00000000  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
    # 0x00000010  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................  *

    buffer.copy(IO::Buffer.for("test"), 8)
    # => 4 -- size of buffer copied
    buffer
    # =>
    # #<IO::Buffer 0x0000555f5cf8fe40+32 INTERNAL>
    # 0x00000000  00 00 00 00 00 00 00 00 74 65 73 74 00 00 00 00 ........test....
    # 0x00000010  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................ *

#copy can be used to put buffer into strings associated with buffer:

    string = "data:    "
    # => "data:    "
    buffer = IO::Buffer.for(string) do |buffer|
      buffer.copy(IO::Buffer.for("test"), 5)
    end
    # => 4
    string
    # => "data:test"

Attempt to copy into a read-only buffer will fail:

    File.write('test.txt', 'test')
    buffer = IO::Buffer.map(File.open('test.txt'), nil, 0, IO::Buffer::READONLY)
    buffer.copy(IO::Buffer.for("test"), 8)
    # in `copy': Buffer is not writable! (IO::Buffer::AccessError)

See ::map for details of creation of mutable file mappings, this will work:

    buffer = IO::Buffer.map(File.open('test.txt', 'r+'))
    buffer.copy(IO::Buffer.for("boom"), 0)
    # => 4
    File.read('test.txt')
    # => "boom"

Attempt to copy the buffer which will need place outside of buffer's bounds
will fail:

    buffer = IO::Buffer.new(2)
    buffer.copy(IO::Buffer.for('test'), 0)
    # in `copy': Specified offset+length is bigger than the buffer size! (ArgumentError)

It is safe to copy between memory regions that overlaps each other. In such
case, the data is copied as if the data was first copied from the source
buffer to a temporary buffer, and then copied from the temporary buffer to the
destination buffer.

    buffer = IO::Buffer.new(10)
    buffer.set_string("0123456789")
    buffer.copy(buffer, 3, 7)
    # => 7
    buffer
    # =>
    # #<IO::Buffer 0x000056494f8ce440+10 INTERNAL>
    # 0x00000000  30 31 32 30 31 32 33 34 35 36                   0120123456

**@overload** [] 

## each(*args) [](#method-i-each)
Iterates over the buffer, yielding each `value` of `buffer_type` starting from
`offset`.

If `count` is given, only `count` values will be yielded.

    IO::Buffer.for("Hello World").each(:U8, 2, 2) do |offset, value|
      puts "#{offset}: #{value}"
    end
    # 2: 108
    # 3: 108

**@overload** [] 

**@overload** [] 

## each_byte(*args) [](#method-i-each_byte)
Iterates over the buffer, yielding each byte starting from `offset`.

If `count` is given, only `count` bytes will be yielded.

    IO::Buffer.for("Hello World").each_byte(2, 2) do |offset, byte|
      puts "#{offset}: #{byte}"
    end
    # 2: 108
    # 3: 108

**@overload** [] 

**@overload** [] 

## empty?() [](#method-i-empty?)

**@return** [Boolean] 

## external?() [](#method-i-external?)

**@return** [Boolean] 

## free() [](#method-i-free)

## get_string(*args) [](#method-i-get_string)
Read a chunk or all of the buffer into a string, in the specified `encoding`.
If no encoding is provided `Encoding::BINARY` is used.

    buffer = IO::Buffer.for('test')
    buffer.get_string
    # => "test"
    buffer.get_string(2)
    # => "st"
    buffer.get_string(2, 1)
    # => "s"

**@overload** [] 

## get_value(type, _offset) [](#method-i-get_value)
Read from buffer a value of `type` at `offset`. `buffer_type` should be one of
symbols:

*   `:U8`: unsigned integer, 1 byte
*   `:S8`: signed integer, 1 byte
*   `:u16`: unsigned integer, 2 bytes, little-endian
*   `:U16`: unsigned integer, 2 bytes, big-endian
*   `:s16`: signed integer, 2 bytes, little-endian
*   `:S16`: signed integer, 2 bytes, big-endian
*   `:u32`: unsigned integer, 4 bytes, little-endian
*   `:U32`: unsigned integer, 4 bytes, big-endian
*   `:s32`: signed integer, 4 bytes, little-endian
*   `:S32`: signed integer, 4 bytes, big-endian
*   `:u64`: unsigned integer, 8 bytes, little-endian
*   `:U64`: unsigned integer, 8 bytes, big-endian
*   `:s64`: signed integer, 8 bytes, little-endian
*   `:S64`: signed integer, 8 bytes, big-endian
*   `:f32`: float, 4 bytes, little-endian
*   `:F32`: float, 4 bytes, big-endian
*   `:f64`: double, 8 bytes, little-endian
*   `:F64`: double, 8 bytes, big-endian

A buffer type refers specifically to the type of binary buffer that is stored
in the buffer. For example, a `:u32` buffer type is a 32-bit unsigned integer
in little-endian format.

    string = [1.5].pack('f')
    # => "\x00\x00\xC0?"
    IO::Buffer.for(string).get_value(:f32, 0)
    # => 1.5

**@overload** [] 

## get_values(buffer_types, _offset) [](#method-i-get_values)
Similar to #get_value, except that it can handle multiple buffer types and
returns an array of values.

    string = [1.5, 2.5].pack('ff')
    IO::Buffer.for(string).get_values([:f32, :f32], 0)
    # => [1.5, 2.5]

**@overload** [] 

## hexdump() [](#method-i-hexdump)

## initialize(*args) [](#method-i-initialize)
Create a new zero-filled IO::Buffer of `size` bytes. By default, the buffer
will be *internal*: directly allocated chunk of the memory. But if the
requested `size` is more than OS-specific IO::Buffer::PAGE_SIZE, the buffer
would be allocated using the virtual memory mechanism (anonymous `mmap` on
Unix, `VirtualAlloc` on Windows). The behavior can be forced by passing
IO::Buffer::MAPPED as a second parameter.

    buffer = IO::Buffer.new(4)
    # =>
    # #<IO::Buffer 0x000055b34497ea10+4 INTERNAL>
    # 0x00000000  00 00 00 00                                     ....

    buffer.get_string(0, 1) # => "\x00"

    buffer.set_string("test")
    buffer
    # =>
    # #<IO::Buffer 0x000055b34497ea10+4 INTERNAL>
    # 0x00000000  74 65 73 74                                     test

**@overload** [] 

## initialize_copy(source) [](#method-i-initialize_copy)
Make an internal copy of the source buffer. Updates to the copy will not
affect the source buffer.

    source = IO::Buffer.for("Hello World")
    # =>
    # #<IO::Buffer 0x00007fd598466830+11 EXTERNAL READONLY SLICE>
    # 0x00000000  48 65 6c 6c 6f 20 57 6f 72 6c 64                Hello World
    buffer = source.dup
    # =>
    # #<IO::Buffer 0x0000558cbec03320+11 INTERNAL>
    # 0x00000000  48 65 6c 6c 6f 20 57 6f 72 6c 64                Hello World

**@overload** [] 

**@overload** [] 

## inspect() [](#method-i-inspect)

## internal?() [](#method-i-internal?)

**@return** [Boolean] 

## locked() [](#method-i-locked)
rb_define_method(rb_cIOBuffer, "unlock", rb_io_buffer_unlock, 0);

## locked?() [](#method-i-locked?)

**@return** [Boolean] 

## mapped?() [](#method-i-mapped?)

**@return** [Boolean] 

## not!() [](#method-i-not!)
Modify the source buffer in place by applying the binary NOT operation to the
source.

    source = IO::Buffer.for("1234567890").dup # Make a read/write copy.
    # =>
    # #<IO::Buffer 0x000056307a33a450+10 INTERNAL>
    # 0x00000000  31 32 33 34 35 36 37 38 39 30                   1234567890

    source.not!
    # =>
    # #<IO::Buffer 0x000056307a33a450+10 INTERNAL>
    # 0x00000000  ce cd cc cb ca c9 c8 c7 c6 cf                   ..........

**@overload** [] 

## null?() [](#method-i-null?)

**@return** [Boolean] 

## or!(mask) [](#method-i-or!)
Modify the source buffer in place by applying the binary OR operation to the
source, using the mask, repeating as necessary.

    source = IO::Buffer.for("1234567890").dup # Make a read/write copy.
    # =>
    # #<IO::Buffer 0x000056307a272350+10 INTERNAL>
    # 0x00000000  31 32 33 34 35 36 37 38 39 30                   1234567890

    source.or!(IO::Buffer.for("\xFF\x00\x00\xFF"))
    # =>
    # #<IO::Buffer 0x000056307a272350+10 INTERNAL>
    # 0x00000000  ff 32 33 ff ff 36 37 ff ff 30                   .23..67..0

**@overload** [] 

## pread(*args) [](#method-i-pread)
Read at least `length` bytes from the `io` starting at the specified `from`
position, into the buffer starting at `offset`. If an error occurs, return
`-errno`.

If `length` is not given or `nil`, it defaults to the size of the buffer minus
the offset, i.e. the entire buffer.

If `length` is zero, exactly one `pread` operation will occur.

If `offset` is not given, it defaults to zero, i.e. the beginning of the
buffer.

    IO::Buffer.for('test') do |buffer|
      p buffer
      # =>
      # <IO::Buffer 0x00007fca40087c38+4 SLICE>
      # 0x00000000  74 65 73 74         test

      # take 2 bytes from the beginning of urandom,
      # put them in buffer starting from position 2
      buffer.pread(File.open('/dev/urandom', 'rb'), 0, 2, 2)
      p buffer
      # =>
      # <IO::Buffer 0x00007f3bc65f2a58+4 EXTERNAL SLICE>
      # 0x00000000  05 35 73 74         te.5
    end

**@overload** [] 

## private?() [](#method-i-private?)

**@return** [Boolean] 

## pwrite(*args) [](#method-i-pwrite)
Write at least `length` bytes from the buffer starting at `offset`, into the
`io` starting at the specified `from` position. If an error occurs, return
`-errno`.

If `length` is not given or `nil`, it defaults to the size of the buffer minus
the offset, i.e. the entire buffer.

If `length` is zero, exactly one `pwrite` operation will occur.

If `offset` is not given, it defaults to zero, i.e. the beginning of the
buffer.

If the `from` position is beyond the end of the file, the gap will be filled
with null (0 value) bytes.

    out = File.open('output.txt', File::RDWR) # open for read/write, no truncation
    IO::Buffer.for('1234567').pwrite(out, 2, 3, 1)

This leads to `234` (3 bytes, starting from position 1) being written into
`output.txt`, starting from file position 2.

**@overload** [] 

## read(*args) [](#method-i-read)
Read at least `length` bytes from the `io`, into the buffer starting at
`offset`. If an error occurs, return `-errno`.

If `length` is not given or `nil`, it defaults to the size of the buffer minus
the offset, i.e. the entire buffer.

If `length` is zero, exactly one `read` operation will occur.

If `offset` is not given, it defaults to zero, i.e. the beginning of the
buffer.

    IO::Buffer.for('test') do |buffer|
      p buffer
      # =>
      # <IO::Buffer 0x00007fca40087c38+4 SLICE>
      # 0x00000000  74 65 73 74         test
      buffer.read(File.open('/dev/urandom', 'rb'), 2)
      p buffer
      # =>
      # <IO::Buffer 0x00007f3bc65f2a58+4 EXTERNAL SLICE>
      # 0x00000000  05 35 73 74         .5st
    end

**@overload** [] 

## readonly?() [](#method-i-readonly?)

**@return** [Boolean] 

## resize() [](#method-i-resize)

## set_string(*args) [](#method-i-set_string)
Efficiently copy from a source String into the buffer, at `offset` using
`memmove`.

    buf = IO::Buffer.new(8)
    # =>
    # #<IO::Buffer 0x0000557412714a20+8 INTERNAL>
    # 0x00000000  00 00 00 00 00 00 00 00                         ........

    # set buffer starting from offset 1, take 2 bytes starting from string's
    # second
    buf.set_string('test', 1, 2, 1)
    # => 2
    buf
    # =>
    # #<IO::Buffer 0x0000557412714a20+8 INTERNAL>
    # 0x00000000  00 65 73 00 00 00 00 00                         .es.....

See also #copy for examples of how buffer writing might be used for changing
associated strings and files.

**@overload** [] 

## set_value(type, _offset, value) [](#method-i-set_value)
Write to a buffer a `value` of `type` at `offset`. `type` should be one of
symbols described in #get_value.

    buffer = IO::Buffer.new(8)
    # =>
    # #<IO::Buffer 0x0000555f5c9a2d50+8 INTERNAL>
    # 0x00000000  00 00 00 00 00 00 00 00

    buffer.set_value(:U8, 1, 111)
    # => 1

    buffer
    # =>
    # #<IO::Buffer 0x0000555f5c9a2d50+8 INTERNAL>
    # 0x00000000  00 6f 00 00 00 00 00 00                         .o......

Note that if the `type` is integer and `value` is Float, the implicit
truncation is performed:

    buffer = IO::Buffer.new(8)
    buffer.set_value(:U32, 0, 2.5)

    buffer
    # =>
    # #<IO::Buffer 0x0000555f5c9a2d50+8 INTERNAL>
    # 0x00000000  00 00 00 02 00 00 00 00
    #                      ^^ the same as if we'd pass just integer 2

**@overload** [] 

## set_values(buffer_types, _offset, values) [](#method-i-set_values)
Write `values` of `buffer_types` at `offset` to the buffer. `buffer_types`
should be an array of symbols as described in #get_value. `values` should be
an array of values to write.

    buffer = IO::Buffer.new(8)
    buffer.set_values([:U8, :U16], 0, [1, 2])
    buffer
    # =>
    # #<IO::Buffer 0x696f717561746978+8 INTERNAL>
    # 0x00000000  01 00 02 00 00 00 00 00                         ........

**@overload** [] 

## shared?() [](#method-i-shared?)

**@return** [Boolean] 

## size() [](#method-i-size)

## slice() [](#method-i-slice)
Manipulation:

## to_s() [](#method-i-to_s)

## transfer() [](#method-i-transfer)

## valid?() [](#method-i-valid?)

**@return** [Boolean] 

## values(*args) [](#method-i-values)
Returns an array of values of `buffer_type` starting from `offset`.

If `count` is given, only `count` values will be returned.

    IO::Buffer.for("Hello World").values(:U8, 2, 2)
    # => [108, 108]

**@overload** [] 

## write(*args) [](#method-i-write)
Write at least `length` bytes from the buffer starting at `offset`, into the
`io`. If an error occurs, return `-errno`.

If `length` is not given or `nil`, it defaults to the size of the buffer minus
the offset, i.e. the entire buffer.

If `length` is zero, exactly one `write` operation will occur.

If `offset` is not given, it defaults to zero, i.e. the beginning of the
buffer.

    out = File.open('output.txt', 'wb')
    IO::Buffer.for('1234567').write(out, 3)

This leads to `123` being written into `output.txt`

**@overload** [] 

## xor!(mask) [](#method-i-xor!)
Modify the source buffer in place by applying the binary XOR operation to the
source, using the mask, repeating as necessary.

    source = IO::Buffer.for("1234567890").dup # Make a read/write copy.
    # =>
    # #<IO::Buffer 0x000056307a25b3e0+10 INTERNAL>
    # 0x00000000  31 32 33 34 35 36 37 38 39 30                   1234567890

    source.xor!(IO::Buffer.for("\xFF\x00\x00\xFF"))
    # =>
    # #<IO::Buffer 0x000056307a25b3e0+10 INTERNAL>
    # 0x00000000  ce 32 33 cb ca 36 37 c7 c6 30                   .23..67..0

**@overload** [] 

## |(mask) [](#method-i-|)
Generate a new buffer the same size as the source by applying the binary OR
operation to the source, using the mask, repeating as necessary.

    IO::Buffer.for("1234567890") | IO::Buffer.for("\xFF\x00\x00\xFF")
    # =>
    # #<IO::Buffer 0x0000561785ae3480+10 INTERNAL>
    # 0x00000000  ff 32 33 ff ff 36 37 ff ff 30                   .23..67..0

**@overload** [] 

## ~() [](#method-i-~)
Generate a new buffer the same size as the source by applying the binary NOT
operation to the source.

    ~IO::Buffer.for("1234567890")
    # =>
    # #<IO::Buffer 0x000055a5ac42f120+10 INTERNAL>
    # 0x00000000  ce cd cc cb ca c9 c8 c7 c6 cf                   ..........

**@overload** [] 

