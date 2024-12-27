# Class: IO
**Inherits:** Object
    
**Includes:** Enumerable, File::Constants
  

An instance of class IO (commonly called a *stream*) represents an
input/output stream in the underlying operating system. Class IO is the basis
for input and output in Ruby.

Class File is the only class in the Ruby core that is a subclass of IO. Some
classes in the Ruby standard library are also subclasses of IO; these include
TCPSocket and UDPSocket.

The global constant ARGF (also accessible as `$<`) provides an IO-like stream
that allows access to all file paths found in ARGV (or found in STDIN if ARGV
is empty). ARGF is not itself a subclass of IO.

Class StringIO provides an IO-like stream that handles a String. StringIO is
not itself a subclass of IO.

Important objects based on IO include:

*   $stdin.
*   $stdout.
*   $stderr.
*   Instances of class File.

An instance of IO may be created using:

*   IO.new: returns a new IO object for the given integer file descriptor.
*   IO.open: passes a new IO object to the given block.
*   IO.popen: returns a new IO object that is connected to the $stdin and
    $stdout of a newly-launched subprocess.
*   Kernel#open: Returns a new IO object connected to a given source: stream,
    file, or subprocess.

Like a File stream, an IO stream has:

*   A read/write mode, which may be read-only, write-only, or read/write; see
    [Read/Write Mode](rdoc-ref:File@Read-2FWrite+Mode).
*   A data mode, which may be text-only or binary; see [Data
    Mode](rdoc-ref:File@Data+Mode).
*   Internal and external encodings; see [Encodings](rdoc-ref:File@Encodings).

And like other IO streams, it has:

*   A position, which determines where in the stream the next read or write is
    to occur; see [Position](rdoc-ref:IO@Position).
*   A line number, which is a special, line-oriented, "position" (different
    from the position mentioned above); see [Line
    Number](rdoc-ref:IO@Line+Number).

## Extension `io/console`

Extension `io/console` provides numerous methods for interacting with the
console; requiring it adds numerous methods to class IO.

## Example Files

Many examples here use these variables:

    :include: doc/examples/files.rdoc

## Open Options

A number of IO methods accept optional keyword arguments that determine how a
new stream is to be opened:

*   `:mode`: Stream mode.
*   `:flags`: Integer file open flags; If `mode` is also given, the two are
    bitwise-ORed.
*   `:external_encoding`: External encoding for the stream.
*   `:internal_encoding`: Internal encoding for the stream. `'-'` is a synonym
    for the default internal encoding. If the value is `nil` no conversion
    occurs.
*   `:encoding`: Specifies external and internal encodings as
    `'extern:intern'`.
*   `:textmode`: If a truthy value, specifies the mode as text-only, binary
    otherwise.
*   `:binmode`: If a truthy value, specifies the mode as binary, text-only
    otherwise.
*   `:autoclose`: If a truthy value, specifies that the `fd` will close when
    the stream closes; otherwise it remains open.
*   `:path:` If a string value is provided, it is used in #inspect and is
    available as #path method.

Also available are the options offered in String#encode, which may control
conversion between external and internal encoding.

## Basic IO

You can perform basic stream IO with these methods, which typically operate on
multi-byte strings:

*   IO#read: Reads and returns some or all of the remaining bytes from the
    stream.
*   IO#write: Writes zero or more strings to the stream; each given object
    that is not already a string is converted via `to_s`.

### Position

An IO stream has a nonnegative integer *position*, which is the byte offset at
which the next read or write is to occur. A new stream has position zero (and
line number zero); method `rewind` resets the position (and line number) to
zero.

These methods discard [buffers](rdoc-ref:IO@Buffering) and the
Encoding::Converter instances used for that IO.

The relevant methods:

*   IO#tell (aliased as `#pos`): Returns the current position (in bytes) in
    the stream.
*   IO#pos=: Sets the position of the stream to a given integer `new_position`
    (in bytes).
*   IO#seek: Sets the position of the stream to a given integer `offset` (in
    bytes), relative to a given position `whence` (indicating the beginning,
    end, or current position).
*   IO#rewind: Positions the stream at the beginning (also resetting the line
    number).

### Open and Closed Streams

A new IO stream may be open for reading, open for writing, or both.

A stream is automatically closed when claimed by the garbage collector.

Attempted reading or writing on a closed stream raises an exception.

The relevant methods:

*   IO#close: Closes the stream for both reading and writing.
*   IO#close_read: Closes the stream for reading.
*   IO#close_write: Closes the stream for writing.
*   IO#closed?: Returns whether the stream is closed.

### End-of-Stream

You can query whether a stream is positioned at its end:

*   IO#eof? (also aliased as `#eof`): Returns whether the stream is at
    end-of-stream.

You can reposition to end-of-stream by using method IO#seek:

    f = File.new('t.txt')
    f.eof? # => false
    f.seek(0, :END)
    f.eof? # => true
    f.close

Or by reading all stream content (which is slower than using IO#seek):

    f.rewind
    f.eof? # => false
    f.read # => "First line\nSecond line\n\nFourth line\nFifth line\n"
    f.eof? # => true

## Line IO

Class IO supports line-oriented [input](rdoc-ref:IO@Line+Input) and
[output](rdoc-ref:IO@Line+Output)

### Line Input

Class IO supports line-oriented input for [files](rdoc-ref:IO@File+Line+Input)
and [IO streams](rdoc-ref:IO@Stream+Line+Input)

#### File Line Input

You can read lines from a file using these methods:

*   IO.foreach: Reads each line and passes it to the given block.
*   IO.readlines: Reads and returns all lines in an array.

For each of these methods:

*   You can specify [open options](rdoc-ref:IO@Open+Options).
*   Line parsing depends on the effective *line separator*; see [Line
    Separator](rdoc-ref:IO@Line+Separator).
*   The length of each returned line depends on the effective *line limit*;
    see [Line Limit](rdoc-ref:IO@Line+Limit).

#### Stream Line Input

You can read lines from an IO stream using these methods:

*   IO#each_line: Reads each remaining line, passing it to the given block.
*   IO#gets: Returns the next line.
*   IO#readline: Like #gets, but raises an exception at end-of-stream.
*   IO#readlines: Returns all remaining lines in an array.

For each of these methods:

*   Reading may begin mid-line, depending on the stream's *position*; see
    [Position](rdoc-ref:IO@Position).
*   Line parsing depends on the effective *line separator*; see [Line
    Separator](rdoc-ref:IO@Line+Separator).
*   The length of each returned line depends on the effective *line limit*;
    see [Line Limit](rdoc-ref:IO@Line+Limit).

##### Line Separator

Each of the [line input methods](rdoc-ref:IO@Line+Input) uses a *line
separator*: the string that determines what is considered a line; it is
sometimes called the *input record separator*.

The default line separator is taken from global variable `$/`, whose initial
value is `"\n"`.

Generally, the line to be read next is all data from the current
[position](rdoc-ref:IO@Position) to the next line separator (but see [Special
Line Separator Values](rdoc-ref:IO@Special+Line+Separator+Values)):

    f = File.new('t.txt')
    # Method gets with no sep argument returns the next line, according to $/.
    f.gets # => "First line\n"
    f.gets # => "Second line\n"
    f.gets # => "\n"
    f.gets # => "Fourth line\n"
    f.gets # => "Fifth line\n"
    f.close

You can use a different line separator by passing argument `sep`:

    f = File.new('t.txt')
    f.gets('l')   # => "First l"
    f.gets('li')  # => "ine\nSecond li"
    f.gets('lin') # => "ne\n\nFourth lin"
    f.gets        # => "e\n"
    f.close

Or by setting global variable `$/`:

    f = File.new('t.txt')
    $/ = 'l'
    f.gets # => "First l"
    f.gets # => "ine\nSecond l"
    f.gets # => "ine\n\nFourth l"
    f.close

##### Special Line Separator Values

Each of the [line input methods](rdoc-ref:IO@Line+Input) accepts two special
values for parameter `sep`:

*   `nil`: The entire stream is to be read ("slurped") into a single string:

        f = File.new('t.txt')
        f.gets(nil) # => "First line\nSecond line\n\nFourth line\nFifth line\n"
        f.close

*   `''` (the empty string): The next "paragraph" is to be read (paragraphs
    being separated by two consecutive line separators):

        f = File.new('t.txt')
        f.gets('') # => "First line\nSecond line\n\n"
        f.gets('') # => "Fourth line\nFifth line\n"
        f.close

##### Line Limit

Each of the [line input methods](rdoc-ref:IO@Line+Input) uses an integer *line
limit*, which restricts the number of bytes that may be returned. (A
multi-byte character will not be split, and so a returned line may be slightly
longer than the limit).

The default limit value is `-1`; any negative limit value means that there is
no limit.

If there is no limit, the line is determined only by `sep`.

    # Text with 1-byte characters.
    File.open('t.txt') {|f| f.gets(1) }  # => "F"
    File.open('t.txt') {|f| f.gets(2) }  # => "Fi"
    File.open('t.txt') {|f| f.gets(3) }  # => "Fir"
    File.open('t.txt') {|f| f.gets(4) }  # => "Firs"
    # No more than one line.
    File.open('t.txt') {|f| f.gets(10) } # => "First line"
    File.open('t.txt') {|f| f.gets(11) } # => "First line\n"
    File.open('t.txt') {|f| f.gets(12) } # => "First line\n"

    # Text with 2-byte characters, which will not be split.
    File.open('t.rus') {|f| f.gets(1).size } # => 1
    File.open('t.rus') {|f| f.gets(2).size } # => 1
    File.open('t.rus') {|f| f.gets(3).size } # => 2
    File.open('t.rus') {|f| f.gets(4).size } # => 2

##### Line Separator and Line Limit

With arguments `sep` and `limit` given, combines the two behaviors:

*   Returns the next line as determined by line separator `sep`.
*   But returns no more bytes than are allowed by the limit `limit`.

Example:

    File.open('t.txt') {|f| f.gets('li', 20) } # => "First li"
    File.open('t.txt') {|f| f.gets('li', 2) }  # => "Fi"

##### Line Number

A readable IO stream has a non-negative integer *line number*:

*   IO#lineno: Returns the line number.
*   IO#lineno=: Resets and returns the line number.

Unless modified by a call to method IO#lineno=, the line number is the number
of lines read by certain line-oriented methods, according to the effective
[line separator](rdoc-ref:IO@Line+Separator):

*   IO.foreach: Increments the line number on each call to the block.
*   IO#each_line: Increments the line number on each call to the block.
*   IO#gets: Increments the line number.
*   IO#readline: Increments the line number.
*   IO#readlines: Increments the line number for each line read.

A new stream is initially has line number zero (and position zero); method
`rewind` resets the line number (and position) to zero:

    f = File.new('t.txt')
    f.lineno # => 0
    f.gets   # => "First line\n"
    f.lineno # => 1
    f.rewind
    f.lineno # => 0
    f.close

Reading lines from a stream usually changes its line number:

    f = File.new('t.txt', 'r')
    f.lineno   # => 0
    f.readline # => "This is line one.\n"
    f.lineno   # => 1
    f.readline # => "This is the second line.\n"
    f.lineno   # => 2
    f.readline # => "Here's the third line.\n"
    f.lineno   # => 3
    f.eof?     # => true
    f.close

Iterating over lines in a stream usually changes its line number:

    File.open('t.txt') do |f|
      f.each_line do |line|
        p "position=#{f.pos} eof?=#{f.eof?} lineno=#{f.lineno}"
      end
    end

Output:

    "position=11 eof?=false lineno=1"
    "position=23 eof?=false lineno=2"
    "position=24 eof?=false lineno=3"
    "position=36 eof?=false lineno=4"
    "position=47 eof?=true lineno=5"

Unlike the stream's [position](rdoc-ref:IO@Position), the line number does not
affect where the next read or write will occur:

    f = File.new('t.txt')
    f.lineno = 1000
    f.lineno # => 1000
    f.gets   # => "First line\n"
    f.lineno # => 1001
    f.close

Associated with the line number is the global variable `$.`:

*   When a stream is opened, `$.` is not set; its value is left over from
    previous activity in the process:

        $. = 41
        f = File.new('t.txt')
        $. = 41
        # => 41
        f.close

*   When a stream is read, `$.` is set to the line number for that stream:

        f0 = File.new('t.txt')
        f1 = File.new('t.dat')
        f0.readlines # => ["First line\n", "Second line\n", "\n", "Fourth line\n", "Fifth line\n"]
        $.           # => 5
        f1.readlines # => ["\xFE\xFF\x99\x90\x99\x91\x99\x92\x99\x93\x99\x94"]
        $.           # => 1
        f0.close
        f1.close

*   Methods IO#rewind and IO#seek do not affect `$.`:

        f = File.new('t.txt')
        f.readlines # => ["First line\n", "Second line\n", "\n", "Fourth line\n", "Fifth line\n"]
        $.          # => 5
        f.rewind
        f.seek(0, :SET)
        $.          # => 5
        f.close

### Line Output

You can write to an IO stream line-by-line using this method:

*   IO#puts: Writes objects to the stream.

## Character IO

You can process an IO stream character-by-character using these methods:

*   IO#getc: Reads and returns the next character from the stream.
*   IO#readchar: Like #getc, but raises an exception at end-of-stream.
*   IO#ungetc: Pushes back ("unshifts") a character or integer onto the
    stream.
*   IO#putc: Writes a character to the stream.
*   IO#each_char: Reads each remaining character in the stream, passing the
    character to the given block.

## Byte IO

You can process an IO stream byte-by-byte using these methods:

*   IO#getbyte: Returns the next 8-bit byte as an integer in range 0..255.
*   IO#readbyte: Like #getbyte, but raises an exception if at end-of-stream.
*   IO#ungetbyte: Pushes back ("unshifts") a byte back onto the stream.
*   IO#each_byte: Reads each remaining byte in the stream, passing the byte to
    the given block.

## Codepoint IO

You can process an IO stream codepoint-by-codepoint:

*   IO#each_codepoint: Reads each remaining codepoint, passing it to the given
    block.

## What's Here

First, what's elsewhere. Class IO:

*   Inherits from [class Object](rdoc-ref:Object@What-27s+Here).
*   Includes [module Enumerable](rdoc-ref:Enumerable@What-27s+Here), which
    provides dozens of additional methods.

Here, class IO provides methods that are useful for:

*   [Creating](rdoc-ref:IO@Creating)
*   [Reading](rdoc-ref:IO@Reading)
*   [Writing](rdoc-ref:IO@Writing)
*   [Positioning](rdoc-ref:IO@Positioning)
*   [Iterating](rdoc-ref:IO@Iterating)
*   [Settings](rdoc-ref:IO@Settings)
*   [Querying](rdoc-ref:IO@Querying)
*   [Buffering](rdoc-ref:IO@Buffering)
*   [Low-Level Access](rdoc-ref:IO@Low-Level+Access)
*   [Other](rdoc-ref:IO@Other)

### Creating

*   ::new (aliased as ::for_fd): Creates and returns a new IO object for the
    given integer file descriptor.
*   ::open: Creates a new IO object.
*   ::pipe: Creates a connected pair of reader and writer IO objects.
*   ::popen: Creates an IO object to interact with a subprocess.
*   ::select: Selects which given IO instances are ready for reading, writing,
    or have pending exceptions.

### Reading

*   ::binread: Returns a binary string with all or a subset of bytes from the
    given file.
*   ::read: Returns a string with all or a subset of bytes from the given
    file.
*   ::readlines: Returns an array of strings, which are the lines from the
    given file.
*   #getbyte: Returns the next 8-bit byte read from `self` as an integer.
*   #getc: Returns the next character read from `self` as a string.
*   #gets: Returns the line read from `self`.
*   #pread: Returns all or the next *n* bytes read from `self`, not updating
    the receiver's offset.
*   #read: Returns all remaining or the next *n* bytes read from `self` for a
    given *n*.
*   #read_nonblock: the next *n* bytes read from `self` for a given *n*, in
    non-block mode.
*   #readbyte: Returns the next byte read from `self`; same as #getbyte, but
    raises an exception on end-of-stream.
*   #readchar: Returns the next character read from `self`; same as #getc, but
    raises an exception on end-of-stream.
*   #readline: Returns the next line read from `self`; same as #getline, but
    raises an exception of end-of-stream.
*   #readlines: Returns an array of all lines read read from `self`.
*   #readpartial: Returns up to the given number of bytes from `self`.

### Writing

*   ::binwrite: Writes the given string to the file at the given filepath, in
    binary mode.
*   ::write: Writes the given string to `self`.
*   #<<: Appends the given string to `self`.
*   #print: Prints last read line or given objects to `self`.
*   #printf: Writes to `self` based on the given format string and objects.
*   #putc: Writes a character to `self`.
*   #puts: Writes lines to `self`, making sure line ends with a newline.
*   #pwrite: Writes the given string at the given offset, not updating the
    receiver's offset.
*   #write: Writes one or more given strings to `self`.
*   #write_nonblock: Writes one or more given strings to `self` in
    non-blocking mode.

### Positioning

*   #lineno: Returns the current line number in `self`.
*   #lineno=: Sets the line number is `self`.
*   #pos (aliased as #tell): Returns the current byte offset in `self`.
*   #pos=: Sets the byte offset in `self`.
*   #reopen: Reassociates `self` with a new or existing IO stream.
*   #rewind: Positions `self` to the beginning of input.
*   #seek: Sets the offset for `self` relative to given position.

### Iterating

*   ::foreach: Yields each line of given file to the block.
*   #each (aliased as #each_line): Calls the given block with each successive
    line in `self`.
*   #each_byte: Calls the given block with each successive byte in `self` as
    an integer.
*   #each_char: Calls the given block with each successive character in `self`
    as a string.
*   #each_codepoint: Calls the given block with each successive codepoint in
    `self` as an integer.

### Settings

*   #autoclose=: Sets whether `self` auto-closes.
*   #binmode: Sets `self` to binary mode.
*   #close: Closes `self`.
*   #close_on_exec=: Sets the close-on-exec flag.
*   #close_read: Closes `self` for reading.
*   #close_write: Closes `self` for writing.
*   #set_encoding: Sets the encoding for `self`.
*   #set_encoding_by_bom: Sets the encoding for `self`, based on its Unicode
    byte-order-mark.
*   #sync=: Sets the sync-mode to the given value.

### Querying

*   #autoclose?: Returns whether `self` auto-closes.
*   #binmode?: Returns whether `self` is in binary mode.
*   #close_on_exec?: Returns the close-on-exec flag for `self`.
*   #closed?: Returns whether `self` is closed.
*   #eof? (aliased as #eof): Returns whether `self` is at end-of-stream.
*   #external_encoding: Returns the external encoding object for `self`.
*   #fileno (aliased as #to_i): Returns the integer file descriptor for `self`
*   #internal_encoding: Returns the internal encoding object for `self`.
*   #pid: Returns the process ID of a child process associated with `self`, if
    `self` was created by ::popen.
*   #stat: Returns the File::Stat object containing status information for
    `self`.
*   #sync: Returns whether `self` is in sync-mode.
*   #tty? (aliased as #isatty): Returns whether `self` is a terminal.

### Buffering

*   #fdatasync: Immediately writes all buffered data in `self` to disk.
*   #flush: Flushes any buffered data within `self` to the underlying
    operating system.
*   #fsync: Immediately writes all buffered data and attributes in `self` to
    disk.
*   #ungetbyte: Prepends buffer for `self` with given integer byte or string.
*   #ungetc: Prepends buffer for `self` with given string.

### Low-Level Access

*   ::sysopen: Opens the file given by its path, returning the integer file
    descriptor.
*   #advise: Announces the intention to access data from `self` in a specific
    way.
*   #fcntl: Passes a low-level command to the file specified by the given file
    descriptor.
*   #ioctl: Passes a low-level command to the device specified by the given
    file descriptor.
*   #sysread: Returns up to the next *n* bytes read from self using a
    low-level read.
*   #sysseek: Sets the offset for `self`.
*   #syswrite: Writes the given string to `self` using a low-level write.

### Other

*   ::copy_stream: Copies data from a source to a destination, each of which
    is a filepath or an IO-like object.
*   ::try_convert: Returns a new IO object resulting from converting the given
    object.
*   #inspect: Returns the string representation of `self`.


# Class Methods
## binread(*args ) [](#method-c-binread)
Behaves like IO.read, except that the stream is opened in binary mode with
ASCII-8BIT encoding.

When called from class IO (but not subclasses of IO), this method has
potential security vulnerabilities if called with untrusted input; see
[Command Injection](rdoc-ref:command_injection.rdoc).
**@overload** [] 

## binwrite(*args ) [](#method-c-binwrite)
Behaves like IO.write, except that the stream is opened in binary mode with
ASCII-8BIT encoding.

When called from class IO (but not subclasses of IO), this method has
potential security vulnerabilities if called with untrusted input; see
[Command Injection](rdoc-ref:command_injection.rdoc).
**@overload** [] 

## console(*args ) [](#method-c-console)
Returns an File instance opened console.

If `sym` is given, it will be sent to the opened console with `args` and the
result will be returned instead of the console IO itself.

You must require 'io/console' to use this method.
**@overload** [] 

**@overload** [] 

## copy_stream(*args ) [](#method-c-copy_stream)
Copies from the given `src` to the given `dst`, returning the number of bytes
copied.

*   The given `src` must be one of the following:

    *   The path to a readable file, from which source data is to be read.
    *   An IO-like object, opened for reading and capable of responding to
        method `:readpartial` or method `:read`.

*   The given `dst` must be one of the following:

    *   The path to a writable file, to which data is to be written.
    *   An IO-like object, opened for writing and capable of responding to
        method `:write`.

The examples here use file `t.txt` as source:

    File.read('t.txt')
    # => "First line\nSecond line\n\nThird line\nFourth line\n"
    File.read('t.txt').size # => 47

If only arguments `src` and `dst` are given, the entire source stream is
copied:

    # Paths.
    IO.copy_stream('t.txt', 't.tmp')  # => 47

    # IOs (recall that a File is also an IO).
    src_io = File.open('t.txt', 'r') # => #<File:t.txt>
    dst_io = File.open('t.tmp', 'w') # => #<File:t.tmp>
    IO.copy_stream(src_io, dst_io)   # => 47
    src_io.close
    dst_io.close

With argument `src_length` a non-negative integer, no more than that many
bytes are copied:

    IO.copy_stream('t.txt', 't.tmp', 10) # => 10
    File.read('t.tmp')                   # => "First line"

With argument `src_offset` also given, the source stream is read beginning at
that offset:

    IO.copy_stream('t.txt', 't.tmp', 11, 11) # => 11
    IO.read('t.tmp')                         # => "Second line"
**@overload** [] 

## default_console_size() [](#method-c-default_console_size)
fallback to console window size
## for_fd(*args ) [](#method-c-for_fd)
Synonym for IO.new.
**@overload** [] 

## foreach(*args ) [](#method-c-foreach)
Calls the block with each successive line read from the stream.

When called from class IO (but not subclasses of IO), this method has
potential security vulnerabilities if called with untrusted input; see
[Command Injection](rdoc-ref:command_injection.rdoc).

The first argument must be a string that is the path to a file.

With only argument `path` given, parses lines from the file at the given
`path`, as determined by the default line separator, and calls the block with
each successive line:

    File.foreach('t.txt') {|line| p line }

Output: the same as above.

For both forms, command and path, the remaining arguments are the same.

With argument `sep` given, parses lines as determined by that line separator
(see [Line Separator](rdoc-ref:IO@Line+Separator)):

    File.foreach('t.txt', 'li') {|line| p line }

Output:

    "First li"
    "ne\nSecond li"
    "ne\n\nThird li"
    "ne\nFourth li"
    "ne\n"

Each paragraph:

    File.foreach('t.txt', '') {|paragraph| p paragraph }

Output:

    "First line\nSecond line\n\n"
    "Third line\nFourth line\n"

With argument `limit` given, parses lines as determined by the default line
separator and the given line-length limit (see [Line
Separator](rdoc-ref:IO@Line+Separator) and [Line
Limit](rdoc-ref:IO@Line+Limit)):

    File.foreach('t.txt', 7) {|line| p line }

Output:

    "First l"
    "ine\n"
    "Second "
    "line\n"
    "\n"
    "Third l"
    "ine\n"
    "Fourth l"
    "line\n"

With arguments `sep` and `limit` given, combines the two behaviors (see [Line
Separator and Line Limit](rdoc-ref:IO@Line+Separator+and+Line+Limit)).

Optional keyword arguments `opts` specify:

*   [Open Options](rdoc-ref:IO@Open+Options).
*   [Encoding options](rdoc-ref:encodings.rdoc@Encoding+Options).
*   [Line Options](rdoc-ref:IO@Line+IO).

Returns an Enumerator if no block is given.
**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## io_maybe_wait(error , io , events , timeout ) [](#method-c-io_maybe_wait)
## io_maybe_wait_readable(error , io , timeout ) [](#method-c-io_maybe_wait_readable)
## io_maybe_wait_writable(error , io , timeout ) [](#method-c-io_maybe_wait_writable)
## io_wait(io , events , timeout ) [](#method-c-io_wait)
## new(*args ) [](#method-c-new)
:nodoc:
## open(*args ) [](#method-c-open)
call-seq:
    IO.open(fd, mode = 'r', **opts)             -> io
    IO.open(fd, mode = 'r', **opts) {|io| ... } -> object

Creates a new IO object, via IO.new with the given arguments.

With no block given, returns the IO object.

With a block given, calls the block with the IO object and returns the block's
value.
## pipe(*args ) [](#method-c-pipe)
Creates a pair of pipe endpoints, `read_io` and `write_io`, connected to each
other.

If argument `enc_string` is given, it must be a string containing one of:

*   The name of the encoding to be used as the external encoding.
*   The colon-separated names of two encodings to be used as the external and
    internal encodings.

If argument `int_enc` is given, it must be an Encoding object or encoding name
string that specifies the internal encoding to be used; if argument `ext_enc`
is also given, it must be an Encoding object or encoding name string that
specifies the external encoding to be used.

The string read from `read_io` is tagged with the external encoding; if an
internal encoding is also specified, the string is converted to, and tagged
with, that encoding.

If any encoding is specified, optional hash arguments specify the conversion
option.

Optional keyword arguments `opts` specify:

*   [Open Options](rdoc-ref:IO@Open+Options).
*   [Encoding Options](rdoc-ref:encodings.rdoc@Encoding+Options).

With no block given, returns the two endpoints in an array:

    IO.pipe # => [#<IO:fd 4>, #<IO:fd 5>]

With a block given, calls the block with the two endpoints; closes both
endpoints and returns the value of the block:

    IO.pipe {|read_io, write_io| p read_io; p write_io }

Output:

    #<IO:fd 6>
    #<IO:fd 7>

Not available on all platforms.

In the example below, the two processes close the ends of the pipe that they
are not using. This is not just a cosmetic nicety. The read end of a pipe will
not generate an end of file condition if there are any writers with the pipe
still open. In the case of the parent process, the `rd.read` will never return
if it does not first issue a `wr.close`:

    rd, wr = IO.pipe

    if fork
      wr.close
      puts "Parent got: <#{rd.read}>"
      rd.close
      Process.wait
    else
      rd.close
      puts 'Sending message to parent'
      wr.write "Hi Dad"
      wr.close
    end

*produces:*

    Sending message to parent
    Parent got: <Hi Dad>
**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## popen(*args ) [](#method-c-popen)
Executes the given command `cmd` as a subprocess whose $stdin and $stdout are
connected to a new stream `io`.

This method has potential security vulnerabilities if called with untrusted
input; see [Command Injection](rdoc-ref:command_injection.rdoc).

If no block is given, returns the new stream, which depending on given `mode`
may be open for reading, writing, or both. The stream should be explicitly
closed (eventually) to avoid resource leaks.

If a block is given, the stream is passed to the block (again, open for
reading, writing, or both); when the block exits, the stream is closed, and
the block's value is assigned to global variable `$?` and returned.

Optional argument `mode` may be any valid IO mode. See [Access
Modes](rdoc-ref:File@Access+Modes).

Required argument `cmd` determines which of the following occurs:

*   The process forks.
*   A specified program runs in a shell.
*   A specified program runs with specified arguments.
*   A specified program runs with specified arguments and a specified `argv0`.

Each of these is detailed below.

The optional hash argument `env` specifies name/value pairs that are to be
added to the environment variables for the subprocess:

    IO.popen({'FOO' => 'bar'}, 'ruby', 'r+') do |pipe|
      pipe.puts 'puts ENV["FOO"]'
      pipe.close_write
      pipe.gets
    end => "bar\n"

Optional keyword arguments `opts` specify:

*   [Open options](rdoc-ref:IO@Open+Options).
*   [Encoding options](rdoc-ref:encodings.rdoc@Encoding+Options).
*   Options for Kernel#spawn.

**Forked \Process**

When argument `cmd` is the 1-character string `'-'`, causes the process to
fork:
    IO.popen('-') do |pipe|
      if pipe
        $stderr.puts "In parent, child pid is #{pipe.pid}\n"
      else
        $stderr.puts "In child, pid is #{$$}\n"
      end
    end

Output:

    In parent, child pid is 26253
    In child, pid is 26253

Note that this is not supported on all platforms.

**Shell Subprocess**

When argument `cmd` is a single string (but not `'-'`), the program named
`cmd` is run as a shell command:

    IO.popen('uname') do |pipe|
      pipe.readlines
    end

Output:

    ["Linux\n"]

Another example:

    IO.popen('/bin/sh', 'r+') do |pipe|
      pipe.puts('ls')
      pipe.close_write
      $stderr.puts pipe.readlines.size
    end

Output:

    213

**Program Subprocess**

When argument `cmd` is an array of strings, the program named `cmd[0]` is run
with all elements of `cmd` as its arguments:

    IO.popen(['du', '..', '.']) do |pipe|
      $stderr.puts pipe.readlines.size
    end

Output:

    1111

**Program Subprocess with `argv0`**

When argument `cmd` is an array whose first element is a 2-element string
array and whose remaining elements (if any) are strings:

*   `cmd[0][0]` (the first string in the nested array) is the name of a
    program that is run.
*   `cmd[0][1]` (the second string in the nested array) is set as the
    program's `argv[0]`.
*   `cmd[1..-1]` (the strings in the outer array) are the program's arguments.

Example (sets `$0` to 'foo'):

    IO.popen([['/bin/sh', 'foo'], '-c', 'echo $0']).read # => "foo\n"

**Some Special Examples**

    # Set IO encoding.
    IO.popen("nkf -e filename", :external_encoding=>"EUC-JP") {|nkf_io|
      euc_jp_string = nkf_io.read
    }

    # Merge standard output and standard error using Kernel#spawn option. See Kernel#spawn.
    IO.popen(["ls", "/", :err=>[:child, :out]]) do |io|
      ls_result_with_error = io.read
    end

    # Use mixture of spawn options and IO options.
    IO.popen(["ls", "/"], :err=>[:child, :out]) do |io|
      ls_result_with_error = io.read
    end

     f = IO.popen("uname")
     p f.readlines
     f.close
     puts "Parent is #{Process.pid}"
     IO.popen("date") {|f| puts f.gets }
     IO.popen("-") {|f| $stderr.puts "#{Process.pid} is here, f is #{f.inspect}"}
     p $?
     IO.popen(%w"sed -e s|^|<foo>| -e s&$&;zot;&", "r+") {|f|
       f.puts "bar"; f.close_write; puts f.gets
     }

Output (from last section):

    ["Linux\n"]
    Parent is 21346
    Thu Jan 15 22:41:19 JST 2009
    21346 is here, f is #<IO:fd 3>
    21352 is here, f is nil
    #<Process::Status: pid 21352 exit 0>
    <foo>bar;zot;

Raises exceptions that IO.pipe and Kernel.spawn raise.
**@overload** [] 

**@overload** [] 

## pread(*args ) [](#method-c-pread)
## read(*args ) [](#method-c-read)
Opens the stream, reads and returns some or all of its content, and closes the
stream; returns `nil` if no bytes were read.

When called from class IO (but not subclasses of IO), this method has
potential security vulnerabilities if called with untrusted input; see
[Command Injection](rdoc-ref:command_injection.rdoc).

The first argument must be a string that is the path to a file.

With only argument `path` given, reads in text mode and returns the entire
content of the file at the given path:

    IO.read('t.txt')
    # => "First line\nSecond line\n\nThird line\nFourth line\n"

On Windows, text mode can terminate reading and leave bytes in the file unread
when encountering certain special bytes. Consider using IO.binread if all
bytes in the file should be read.

With argument `length`, returns `length` bytes if available:

    IO.read('t.txt', 7) # => "First l"
    IO.read('t.txt', 700)
    # => "First line\r\nSecond line\r\n\r\nFourth line\r\nFifth line\r\n"

With arguments `length` and `offset`, returns `length` bytes if available,
beginning at the given `offset`:

    IO.read('t.txt', 10, 2)   # => "rst line\nS"
    IO.read('t.txt', 10, 200) # => nil

Optional keyword arguments `opts` specify:

*   [Open Options](rdoc-ref:IO@Open+Options).
*   [Encoding options](rdoc-ref:encodings.rdoc@Encoding+Options).
**@overload** [] 

## readlines(*args ) [](#method-c-readlines)
Returns an array of all lines read from the stream.

When called from class IO (but not subclasses of IO), this method has
potential security vulnerabilities if called with untrusted input; see
[Command Injection](rdoc-ref:command_injection.rdoc).

The first argument must be a string that is the path to a file.

With only argument `path` given, parses lines from the file at the given
`path`, as determined by the default line separator, and returns those lines
in an array:

    IO.readlines('t.txt')
    # => ["First line\n", "Second line\n", "\n", "Third line\n", "Fourth line\n"]

With argument `sep` given, parses lines as determined by that line separator
(see [Line Separator](rdoc-ref:IO@Line+Separator)):

    # Ordinary separator.
    IO.readlines('t.txt', 'li')
    # =>["First li", "ne\nSecond li", "ne\n\nThird li", "ne\nFourth li", "ne\n"]
    # Get-paragraphs separator.
    IO.readlines('t.txt', '')
    # => ["First line\nSecond line\n\n", "Third line\nFourth line\n"]
    # Get-all separator.
    IO.readlines('t.txt', nil)
    # => ["First line\nSecond line\n\nThird line\nFourth line\n"]

With argument `limit` given, parses lines as determined by the default line
separator and the given line-length limit (see [Line
Separator](rdoc-ref:IO@Line+Separator) and [Line
Limit](rdoc-ref:IO@Line+Limit):

    IO.readlines('t.txt', 7)
    # => ["First l", "ine\n", "Second ", "line\n", "\n", "Third l", "ine\n", "Fourth ", "line\n"]

With arguments `sep` and `limit` given, combines the two behaviors (see [Line
Separator and Line Limit](rdoc-ref:IO@Line+Separator+and+Line+Limit)).

Optional keyword arguments `opts` specify:

*   [Open Options](rdoc-ref:IO@Open+Options).
*   [Encoding options](rdoc-ref:encodings.rdoc@Encoding+Options).
*   [Line Options](rdoc-ref:IO@Line+IO).
**@overload** [] 

**@overload** [] 

**@overload** [] 

## select(*args ) [](#method-c-select)
Invokes system call [select(2)](https://linux.die.net/man/2/select), which
monitors multiple file descriptors, waiting until one or more of the file
descriptors becomes ready for some class of I/O operation.

Not implemented on all platforms.

Each of the arguments `read_ios`, `write_ios`, and `error_ios` is an array of
IO objects.

Argument `timeout` is a numeric value (such as integer or float) timeout
interval in seconds.

The method monitors the IO objects given in all three arrays, waiting for some
to be ready; returns a 3-element array whose elements are:

*   An array of the objects in `read_ios` that are ready for reading.
*   An array of the objects in `write_ios` that are ready for writing.
*   An array of the objects in `error_ios` have pending exceptions.

If no object becomes ready within the given `timeout`, `nil` is returned.

IO.select peeks the buffer of IO objects for testing readability. If the IO
buffer is not empty, IO.select immediately notifies readability.  This "peek"
only happens for IO objects.  It does not happen for IO-like objects such as
OpenSSL::SSL::SSLSocket.

The best way to use IO.select is invoking it after non-blocking methods such
as #read_nonblock, #write_nonblock, etc.  The methods raise an exception which
is extended by IO::WaitReadable or IO::WaitWritable.  The modules notify how
the caller should wait with IO.select.  If IO::WaitReadable is raised, the
caller should wait for reading.  If IO::WaitWritable is raised, the caller
should wait for writing.

So, blocking read (#readpartial) can be emulated using #read_nonblock and
IO.select as follows:

    begin
      result = io_like.read_nonblock(maxlen)
    rescue IO::WaitReadable
      IO.select([io_like])
      retry
    rescue IO::WaitWritable
      IO.select(nil, [io_like])
      retry
    end

Especially, the combination of non-blocking methods and IO.select is preferred
for IO like objects such as OpenSSL::SSL::SSLSocket.  It has #to_io method to
return underlying IO object.  IO.select calls #to_io to obtain the file
descriptor to wait.

This means that readability notified by IO.select doesn't mean readability
from OpenSSL::SSL::SSLSocket object.

The most likely situation is that OpenSSL::SSL::SSLSocket buffers some data. 
IO.select doesn't see the buffer.  So IO.select can block when
OpenSSL::SSL::SSLSocket#readpartial doesn't block.

However, several more complicated situations exist.

SSL is a protocol which is sequence of records. The record consists of
multiple bytes. So, the remote side of SSL sends a partial record, IO.select
notifies readability but OpenSSL::SSL::SSLSocket cannot decrypt a byte and
OpenSSL::SSL::SSLSocket#readpartial will block.

Also, the remote side can request SSL renegotiation which forces the local SSL
engine to write some data. This means OpenSSL::SSL::SSLSocket#readpartial may
invoke #write system call and it can block. In such a situation,
OpenSSL::SSL::SSLSocket#read_nonblock raises IO::WaitWritable instead of
blocking. So, the caller should wait for ready for writability as above
example.

The combination of non-blocking methods and IO.select is also useful for
streams such as tty, pipe socket socket when multiple processes read from a
stream.

Finally, Linux kernel developers don't guarantee that readability of select(2)
means readability of following read(2) even for a single process; see
[select(2)](https://linux.die.net/man/2/select)

Invoking IO.select before IO#readpartial works well as usual. However it is
not the best way to use IO.select.

The writability notified by select(2) doesn't show how many bytes are
writable. IO#write method blocks until given whole string is written. So,
`IO#write(two or more bytes)` can block after writability is notified by
IO.select.  IO#write_nonblock is required to avoid the blocking.

Blocking write (#write) can be emulated using #write_nonblock and IO.select as
follows: IO::WaitReadable should also be rescued for SSL renegotiation in
OpenSSL::SSL::SSLSocket.

    while 0 < string.bytesize
      begin
        written = io_like.write_nonblock(string)
      rescue IO::WaitReadable
        IO.select([io_like])
        retry
      rescue IO::WaitWritable
        IO.select(nil, [io_like])
        retry
      end
      string = string.byteslice(written..-1)
    end

Example:

    rp, wp = IO.pipe
    mesg = "ping "
    100.times {
      # IO.select follows IO#read.  Not the best way to use IO.select.
      rs, ws, = IO.select([rp], [wp])
      if r = rs[0]
        ret = r.read(5)
        print ret
        case ret
        when /ping/
          mesg = "pong\n"
        when /pong/
          mesg = "ping "
        end
      end
      if w = ws[0]
        w.write(mesg)
      end
    }

Output:

    ping pong
    ping pong
    ping pong
    (snipped)
    ping
**@overload** [] 

## sysopen(*args ) [](#method-c-sysopen)
Opens the file at the given path with the given mode and permissions; returns
the integer file descriptor.

If the file is to be readable, it must exist; if the file is to be writable
and does not exist, it is created with the given permissions:

    File.write('t.tmp', '')  # => 0
    IO.sysopen('t.tmp')      # => 8
    IO.sysopen('t.tmp', 'w') # => 9
**@overload** [] 

## thread_fd_close(fd ) [](#method-c-thread_fd_close)
## thread_fd_wait(fd ) [](#method-c-thread_fd_wait)
## thread_fd_writable(fd ) [](#method-c-thread_fd_writable)
## try_convert(io ) [](#method-c-try_convert)
Attempts to convert `object` into an IO object via method `to_io`; returns the
new IO object if successful, or `nil` otherwise:

    IO.try_convert(STDOUT)   # => #<IO:<STDOUT>>
    IO.try_convert(ARGF)     # => #<IO:<STDIN>>
    IO.try_convert('STDOUT') # => nil
**@overload** [] 

## write(*args ) [](#method-c-write)
Opens the stream, writes the given `data` to it, and closes the stream;
returns the number of bytes written.

When called from class IO (but not subclasses of IO), this method has
potential security vulnerabilities if called with untrusted input; see
[Command Injection](rdoc-ref:command_injection.rdoc).

The first argument must be a string that is the path to a file.

With only argument `path` given, writes the given `data` to the file at that
path:

    IO.write('t.tmp', 'abc')    # => 3
    File.read('t.tmp')          # => "abc"

If `offset` is zero (the default), the file is overwritten:

    IO.write('t.tmp', 'A')      # => 1
    File.read('t.tmp')          # => "A"

If `offset` in within the file content, the file is partly overwritten:

    IO.write('t.tmp', 'abcdef') # => 3
    File.read('t.tmp')          # => "abcdef"
    # Offset within content.
    IO.write('t.tmp', '012', 2) # => 3
    File.read('t.tmp')          # => "ab012f"

If `offset` is outside the file content, the file is padded with null
characters `"\u0000"`:

    IO.write('t.tmp', 'xyz', 10) # => 3
    File.read('t.tmp')           # => "ab012f\u0000\u0000\u0000\u0000xyz"

Optional keyword arguments `opts` specify:

*   [Open Options](rdoc-ref:IO@Open+Options).
*   [Encoding options](rdoc-ref:encodings.rdoc@Encoding+Options).
**@overload** [] 


#Instance Methods
## <<(str) [](#method-i-<<)
Writes the given `object` to `self`, which must be opened for writing (see
[Access Modes](rdoc-ref:File@Access+Modes)); returns `self`; if `object` is
not a string, it is converted via method `to_s`:

    $stdout << 'Hello' << ', ' << 'World!' << "\n"
    $stdout << 'foo' << :bar << 2 << "\n"

Output:

    Hello, World!
    foobar2

**@overload** [] 

## advise(*args) [](#method-i-advise)
Invokes Posix system call
[posix_fadvise(2)](https://linux.die.net/man/2/posix_fadvise), which announces
an intention to access data from the current file in a particular manner.

The arguments and results are platform-dependent.

The relevant data is specified by:

*   `offset`: The offset of the first byte of data.
*   `len`: The number of bytes to be accessed; if `len` is zero, or is larger
    than the number of bytes remaining, all remaining bytes will be accessed.

Argument `advice` is one of the following symbols:

*   `:normal`: The application has no advice to give about its access pattern
    for the specified data. If no advice is given for an open file, this is
    the default assumption.
*   `:sequential`: The application expects to access the specified data
    sequentially (with lower offsets read before higher ones).
*   `:random`: The specified data will be accessed in random order.
*   `:noreuse`: The specified data will be accessed only once.
*   `:willneed`: The specified data will be accessed in the near future.
*   `:dontneed`: The specified data will not be accessed in the near future.

Not implemented on all platforms.

**@overload** [] 

## all?(*args) [](#method-i-all?)
Returns whether every element meets a given criterion.

If `self` has no element, returns `true` and argument or block are not used.

With no argument and no block, returns whether every element is truthy:

    (1..4).all?           # => true
    %w[a b c d].all?      # => true
    [1, 2, nil].all?      # => false
    ['a','b', false].all? # => false
    [].all?               # => true

With argument `pattern` and no block, returns whether for each element
`element`, `pattern === element`:

    (1..4).all?(Integer)                 # => true
    (1..4).all?(Numeric)                 # => true
    (1..4).all?(Float)                   # => false
    %w[bar baz bat bam].all?(/ba/)       # => true
    %w[bar baz bat bam].all?(/bar/)      # => false
    %w[bar baz bat bam].all?('ba')       # => false
    {foo: 0, bar: 1, baz: 2}.all?(Array) # => true
    {foo: 0, bar: 1, baz: 2}.all?(Hash)  # => false
    [].all?(Integer)                     # => true

With a block given, returns whether the block returns a truthy value for every
element:

    (1..4).all? {|element| element < 5 }                    # => true
    (1..4).all? {|element| element < 4 }                    # => false
    {foo: 0, bar: 1, baz: 2}.all? {|key, value| value < 3 } # => true
    {foo: 0, bar: 1, baz: 2}.all? {|key, value| value < 2 } # => false

Related: #any?, #none? #one?.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## any?(*args) [](#method-i-any?)
Returns whether any element meets a given criterion.

If `self` has no element, returns `false` and argument or block are not used.

With no argument and no block, returns whether any element is truthy:

    (1..4).any?          # => true
    %w[a b c d].any?     # => true
    [1, false, nil].any? # => true
    [].any?              # => false

With argument `pattern` and no block, returns whether for any element
`element`, `pattern === element`:

    [nil, false, 0].any?(Integer)        # => true
    [nil, false, 0].any?(Numeric)        # => true
    [nil, false, 0].any?(Float)          # => false
    %w[bar baz bat bam].any?(/m/)        # => true
    %w[bar baz bat bam].any?(/foo/)      # => false
    %w[bar baz bat bam].any?('ba')       # => false
    {foo: 0, bar: 1, baz: 2}.any?(Array) # => true
    {foo: 0, bar: 1, baz: 2}.any?(Hash)  # => false
    [].any?(Integer)                     # => false

With a block given, returns whether the block returns a truthy value for any
element:

    (1..4).any? {|element| element < 2 }                    # => true
    (1..4).any? {|element| element < 1 }                    # => false
    {foo: 0, bar: 1, baz: 2}.any? {|key, value| value < 1 } # => true
    {foo: 0, bar: 1, baz: 2}.any? {|key, value| value < 0 } # => false

Related: #all?, #none?, #one?.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## autoclose=(autoclose) [](#method-i-autoclose=)
Sets auto-close flag.

    f = File.open(File::NULL)
    IO.for_fd(f.fileno).close
    f.gets # raises Errno::EBADF

    f = File.open(File::NULL)
    g = IO.for_fd(f.fileno)
    g.autoclose = false
    g.close
    f.gets # won't cause Errno::EBADF

**@overload** [] 

## autoclose?() [](#method-i-autoclose?)
Returns `true` if the underlying file descriptor of *ios* will be closed at
its finalization or at calling #close, otherwise `false`.

**@overload** [] 

## beep() [](#method-i-beep)
Beeps on the output console.

You must require 'io/console' to use this method.

**@overload** [] 

## binmode() [](#method-i-binmode)
Sets the stream's data mode as binary (see [Data
Mode](rdoc-ref:File@Data+Mode)).

A stream's data mode may not be changed from binary to text.

**@overload** [] 

## binmode?() [](#method-i-binmode?)
Returns `true` if the stream is on binary mode, `false` otherwise. See [Data
Mode](rdoc-ref:File@Data+Mode).

**@overload** [] 

## chain(*args) [](#method-i-chain)
Returns an enumerator object generated from this enumerator and given
enumerables.

    e = (1..3).chain([4, 5])
    e.to_a #=> [1, 2, 3, 4, 5]

**@overload** [] 

## check_winsize_changed() [](#method-i-check_winsize_changed)
Yields while console input events are queued.

This method is Windows only.

You must require 'io/console' to use this method.

**@overload** [] 

## chunk() [](#method-i-chunk)
Each element in the returned enumerator is a 2-element array consisting of:

*   A value returned by the block.
*   An array ("chunk") containing the element for which that value was
    returned, and all following elements for which the block returned the same
    value:

So that:

*   Each block return value that is different from its predecessor begins a
    new chunk.
*   Each block return value that is the same as its predecessor continues the
    same chunk.

Example:

    e = (0..10).chunk {|i| (i / 3).floor } # => #<Enumerator: ...>
    # The enumerator elements.
    e.next # => [0, [0, 1, 2]]
    e.next # => [1, [3, 4, 5]]
    e.next # => [2, [6, 7, 8]]
    e.next # => [3, [9, 10]]

Method `chunk` is especially useful for an enumerable that is already sorted.
This example counts words for each initial letter in a large array of words:

    # Get sorted words from a web page.
    url = 'https://raw.githubusercontent.com/eneko/data-repository/master/data/words.txt'
    words = URI::open(url).readlines
    # Make chunks, one for each letter.
    e = words.chunk {|word| word.upcase[0] } # => #<Enumerator: ...>
    # Display 'A' through 'F'.
    e.each {|c, words| p [c, words.length]; break if c == 'F' }

Output:

    ["A", 17096]
    ["B", 11070]
    ["C", 19901]
    ["D", 10896]
    ["E", 8736]
    ["F", 6860]

You can use the special symbol `:_alone` to force an element into its own
separate chuck:

    a = [0, 0, 1, 1]
    e = a.chunk{|i| i.even? ? :_alone : true }
    e.to_a # => [[:_alone, [0]], [:_alone, [0]], [true, [1, 1]]]

For example, you can put each line that contains a URL into its own chunk:

    pattern = /http/
    open(filename) { |f|
      f.chunk { |line| line =~ pattern ? :_alone : true }.each { |key, lines|
        pp lines
      }
    }

You can use the special symbol `:_separator` or `nil` to force an element to
be ignored (not included in any chunk):

    a = [0, 0, -1, 1, 1]
    e = a.chunk{|i| i < 0 ? :_separator : true }
    e.to_a # => [[true, [0, 0]], [true, [1, 1]]]

Note that the separator does end the chunk:

    a = [0, 0, -1, 1, -1, 1]
    e = a.chunk{|i| i < 0 ? :_separator : true }
    e.to_a # => [[true, [0, 0]], [true, [1]], [true, [1]]]

For example, the sequence of hyphens in svn log can be eliminated as follows:

    sep = "-"*72 + "\n"
    IO.popen("svn log README") { |f|
      f.chunk { |line|
        line != sep || nil
      }.each { |_, lines|
        pp lines
      }
    }
    #=> ["r20018 | knu | 2008-10-29 13:20:42 +0900 (Wed, 29 Oct 2008) | 2 lines\n",
    #    "\n",
    #    "* README, README.ja: Update the portability section.\n",
    #    "\n"]
    #   ["r16725 | knu | 2008-05-31 23:34:23 +0900 (Sat, 31 May 2008) | 2 lines\n",
    #    "\n",
    #    "* README, README.ja: Add a note about default C flags.\n",
    #    "\n"]
    #   ...

Paragraphs separated by empty lines can be parsed as follows:

    File.foreach("README").chunk { |line|
      /\A\s*\z/ !~ line || nil
    }.each { |_, lines|
      pp lines
    }

**@overload** [] 

## chunk_while() [](#method-i-chunk_while)
Creates an enumerator for each chunked elements. The beginnings of chunks are
defined by the block.

This method splits each chunk using adjacent elements, *elt_before* and
*elt_after*, in the receiver enumerator. This method split chunks between
*elt_before* and *elt_after* where the block returns `false`.

The block is called the length of the receiver enumerator minus one.

The result enumerator yields the chunked elements as an array. So `each`
method can be called as follows:

    enum.chunk_while { |elt_before, elt_after| bool }.each { |ary| ... }

Other methods of the Enumerator class and Enumerable module, such as `to_a`,
`map`, etc., are also usable.

For example, one-by-one increasing subsequence can be chunked as follows:

    a = [1,2,4,9,10,11,12,15,16,19,20,21]
    b = a.chunk_while {|i, j| i+1 == j }
    p b.to_a #=> [[1, 2], [4], [9, 10, 11, 12], [15, 16], [19, 20, 21]]
    c = b.map {|a| a.length < 3 ? a : "#{a.first}-#{a.last}" }
    p c #=> [[1, 2], [4], "9-12", [15, 16], "19-21"]
    d = c.join(",")
    p d #=> "1,2,4,9-12,15,16,19-21"

Increasing (non-decreasing) subsequence can be chunked as follows:

    a = [0, 9, 2, 2, 3, 2, 7, 5, 9, 5]
    p a.chunk_while {|i, j| i <= j }.to_a
    #=> [[0, 9], [2, 2, 3], [2, 7], [5, 9], [5]]

Adjacent evens and odds can be chunked as follows: (Enumerable#chunk is
another way to do it.)

    a = [7, 5, 9, 2, 0, 7, 9, 4, 2, 0]
    p a.chunk_while {|i, j| i.even? == j.even? }.to_a
    #=> [[7, 5, 9], [2, 0], [7, 9], [4, 2, 0]]

Enumerable#slice_when does the same, except splitting when the block returns
`true` instead of `false`.

**@overload** [] 

## clear_screen() [](#method-i-clear_screen)
Clears the entire screen and moves the cursor top-left corner.

You must require 'io/console' to use this method.

**@overload** [] 

## close() [](#method-i-close)
Closes the stream for both reading and writing if open for either or both;
returns `nil`. See [Open and Closed
Streams](rdoc-ref:IO@Open+and+Closed+Streams).

If the stream is open for writing, flushes any buffered writes to the
operating system before closing.

If the stream was opened by IO.popen, sets global variable `$?` (child exit
status).

It is not an error to close an IO object that has already been closed. It just
returns nil.

Example:

    IO.popen('ruby', 'r+') do |pipe|
      puts pipe.closed?
      pipe.close
      puts $?
      puts pipe.closed?
    end

Output:

    false
    pid 13760 exit 0
    true

Related: IO#close_read, IO#close_write, IO#closed?.

**@overload** [] 

## close_on_exec=(arg) [](#method-i-close_on_exec=)
Sets a close-on-exec flag.

    f = File.open(File::NULL)
    f.close_on_exec = true
    system("cat", "/proc/self/fd/#{f.fileno}") # cat: /proc/self/fd/3: No such file or directory
    f.closed?                #=> false

Ruby sets close-on-exec flags of all file descriptors by default since Ruby
2.0.0. So you don't need to set by yourself. Also, unsetting a close-on-exec
flag can cause file descriptor leak if another thread use fork() and exec()
(via system() method for example). If you really needs file descriptor
inheritance to child process, use spawn()'s argument such as fd=>fd.

**@overload** [] 

## close_on_exec?() [](#method-i-close_on_exec?)
Returns `true` if the stream will be closed on exec, `false` otherwise:

    f = File.open('t.txt')
    f.close_on_exec? # => true
    f.close_on_exec = false
    f.close_on_exec? # => false
    f.close

**@overload** [] 

## close_read() [](#method-i-close_read)
Closes the stream for reading if open for reading; returns `nil`. See [Open
and Closed Streams](rdoc-ref:IO@Open+and+Closed+Streams).

If the stream was opened by IO.popen and is also closed for writing, sets
global variable `$?` (child exit status).

Example:

    IO.popen('ruby', 'r+') do |pipe|
      puts pipe.closed?
      pipe.close_write
      puts pipe.closed?
      pipe.close_read
      puts $?
      puts pipe.closed?
    end

Output:

    false
    false
    pid 14748 exit 0
    true

Related: IO#close, IO#close_write, IO#closed?.

**@overload** [] 

## close_write() [](#method-i-close_write)
Closes the stream for writing if open for writing; returns `nil`. See [Open
and Closed Streams](rdoc-ref:IO@Open+and+Closed+Streams).

Flushes any buffered writes to the operating system before closing.

If the stream was opened by IO.popen and is also closed for reading, sets
global variable `$?` (child exit status).

    IO.popen('ruby', 'r+') do |pipe|
      puts pipe.closed?
      pipe.close_read
      puts pipe.closed?
      pipe.close_write
      puts $?
      puts pipe.closed?
    end

Output:

    false
    false
    pid 15044 exit 0
    true

Related: IO#close, IO#close_read, IO#closed?.

**@overload** [] 

## closed?() [](#method-i-closed?)
Returns `true` if the stream is closed for both reading and writing, `false`
otherwise. See [Open and Closed Streams](rdoc-ref:IO@Open+and+Closed+Streams).

    IO.popen('ruby', 'r+') do |pipe|
      puts pipe.closed?
      pipe.close_read
      puts pipe.closed?
      pipe.close_write
      puts pipe.closed?
    end

Output:

    false
    false
    true

Related: IO#close_read, IO#close_write, IO#close.

**@overload** [] 

## collect() [](#method-i-collect)
Returns an array of objects returned by the block.

With a block given, calls the block with successive elements; returns an array
of the objects returned by the block:

    (0..4).map {|i| i*i }                               # => [0, 1, 4, 9, 16]
    {foo: 0, bar: 1, baz: 2}.map {|key, value| value*2} # => [0, 2, 4]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## collect_concat() [](#method-i-collect_concat)
Returns an array of flattened objects returned by the block.

With a block given, calls the block with successive elements; returns a
flattened array of objects returned by the block:

    [0, 1, 2, 3].flat_map {|element| -element }                    # => [0, -1, -2, -3]
    [0, 1, 2, 3].flat_map {|element| [element, -element] }         # => [0, 0, 1, -1, 2, -2, 3, -3]
    [[0, 1], [2, 3]].flat_map {|e| e + [100] }                     # => [0, 1, 100, 2, 3, 100]
    {foo: 0, bar: 1, baz: 2}.flat_map {|key, value| [key, value] } # => [:foo, 0, :bar, 1, :baz, 2]

With no block given, returns an Enumerator.

Alias: #collect_concat.

**@overload** [] 

**@overload** [] 

## compact() [](#method-i-compact)
Returns an array of all non-`nil` elements:

    a = [nil, 0, nil, 'a', false, nil, false, nil, 'a', nil, 0, nil]
    a.compact # => [0, "a", false, false, "a", 0]

**@overload** [] 

## console_mode() [](#method-i-console_mode)
Returns a data represents the current console mode.

You must require 'io/console' to use this method.

**@overload** [] 

## console_mode=(mode) [](#method-i-console_mode=)
Sets the console mode to `mode`.

You must require 'io/console' to use this method.

**@overload** [] 

## cooked() [](#method-i-cooked)
Yields `self` within cooked mode.

    STDIN.cooked(&:gets)

will read and return a line with echo back and line editing.

You must require 'io/console' to use this method.

**@overload** [] 

## cooked!() [](#method-i-cooked!)
Enables cooked mode.

If the terminal mode needs to be back, use io.cooked { ... }.

You must require 'io/console' to use this method.

**@overload** [] 

## count(*args) [](#method-i-count)
Returns the count of elements, based on an argument or block criterion, if
given.

With no argument and no block given, returns the number of elements:

    [0, 1, 2].count                # => 3
    {foo: 0, bar: 1, baz: 2}.count # => 3

With argument `object` given, returns the number of elements that are `==` to
`object`:

    [0, 1, 2, 1].count(1)           # => 2

With a block given, calls the block with each element and returns the number
of elements for which the block returns a truthy value:

    [0, 1, 2, 3].count {|element| element < 2}              # => 2
    {foo: 0, bar: 1, baz: 2}.count {|key, value| value < 2} # => 2

**@overload** [] 

**@overload** [] 

**@overload** [] 

## cursor() [](#method-i-cursor)
Returns the current cursor position as a two-element array of integers (row,
column)

    io.cursor # => [3, 5]

You must require 'io/console' to use this method.

**@overload** [] 

## cursor=(cpos) [](#method-i-cursor=)
Same as `io.goto(line, column)`

See IO#goto.

You must require 'io/console' to use this method.

## cursor_down(val) [](#method-i-cursor_down)
Moves the cursor down `n` lines.

You must require 'io/console' to use this method.

**@overload** [] 

## cursor_left(val) [](#method-i-cursor_left)
Moves the cursor left `n` columns.

You must require 'io/console' to use this method.

**@overload** [] 

## cursor_right(val) [](#method-i-cursor_right)
Moves the cursor right `n` columns.

You must require 'io/console' to use this method.

**@overload** [] 

## cursor_up(val) [](#method-i-cursor_up)
Moves the cursor up `n` lines.

You must require 'io/console' to use this method.

**@overload** [] 

## cycle(*args) [](#method-i-cycle)
When called with positive integer argument `n` and a block, calls the block
with each element, then does so again, until it has done so `n` times; returns
`nil`:

    a = []
    (1..4).cycle(3) {|element| a.push(element) } # => nil
    a # => [1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4]
    a = []
    ('a'..'d').cycle(2) {|element| a.push(element) }
    a # => ["a", "b", "c", "d", "a", "b", "c", "d"]
    a = []
    {foo: 0, bar: 1, baz: 2}.cycle(2) {|element| a.push(element) }
    a # => [[:foo, 0], [:bar, 1], [:baz, 2], [:foo, 0], [:bar, 1], [:baz, 2]]

If count is zero or negative, does not call the block.

When called with a block and `n` is `nil`, cycles forever.

When no block is given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## detect(*args) [](#method-i-detect)
Returns the first element for which the block returns a truthy value.

With a block given, calls the block with successive elements of the
collection; returns the first element for which the block returns a truthy
value:

    (0..9).find {|element| element > 2}                # => 3

If no such element is found, calls `if_none_proc` and returns its return
value.

    (0..9).find(proc {false}) {|element| element > 12} # => false
    {foo: 0, bar: 1, baz: 2}.find {|key, value| key.start_with?('b') }            # => [:bar, 1]
    {foo: 0, bar: 1, baz: 2}.find(proc {[]}) {|key, value| key.start_with?('c') } # => []

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## drop(n) [](#method-i-drop)
For positive integer `n`, returns an array containing all but the first `n`
elements:

    r = (1..4)
    r.drop(3)  # => [4]
    r.drop(2)  # => [3, 4]
    r.drop(1)  # => [2, 3, 4]
    r.drop(0)  # => [1, 2, 3, 4]
    r.drop(50) # => []

    h = {foo: 0, bar: 1, baz: 2, bat: 3}
    h.drop(2) # => [[:baz, 2], [:bat, 3]]

**@overload** [] 

## drop_while() [](#method-i-drop_while)
Calls the block with successive elements as long as the block returns a truthy
value; returns an array of all elements after that point:

    (1..4).drop_while{|i| i < 3 } # => [3, 4]
    h = {foo: 0, bar: 1, baz: 2}
    a = h.drop_while{|element| key, value = *element; value < 2 }
    a # => [[:baz, 2]]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## each(*args) [](#method-i-each)
Calls the block with each remaining line read from the stream; returns `self`.
Does nothing if already at end-of-stream; See [Line IO](rdoc-ref:IO@Line+IO).

With no arguments given, reads lines as determined by line separator `$/`:

    f = File.new('t.txt')
    f.each_line {|line| p line }
    f.each_line {|line| fail 'Cannot happen' }
    f.close

Output:

    "First line\n"
    "Second line\n"
    "\n"
    "Fourth line\n"
    "Fifth line\n"

With only string argument `sep` given, reads lines as determined by line
separator `sep`; see [Line Separator](rdoc-ref:IO@Line+Separator):

    f = File.new('t.txt')
    f.each_line('li') {|line| p line }
    f.close

Output:

    "First li"
    "ne\nSecond li"
    "ne\n\nFourth li"
    "ne\nFifth li"
    "ne\n"

The two special values for `sep` are honored:

    f = File.new('t.txt')
    # Get all into one string.
    f.each_line(nil) {|line| p line }
    f.close

Output:

    "First line\nSecond line\n\nFourth line\nFifth line\n"

    f.rewind
    # Get paragraphs (up to two line separators).
    f.each_line('') {|line| p line }

Output:

    "First line\nSecond line\n\n"
    "Fourth line\nFifth line\n"

With only integer argument `limit` given, limits the number of bytes in each
line; see [Line Limit](rdoc-ref:IO@Line+Limit):

    f = File.new('t.txt')
    f.each_line(8) {|line| p line }
    f.close

Output:

    "First li"
    "ne\n"
    "Second l"
    "ine\n"
    "\n"
    "Fourth l"
    "ine\n"
    "Fifth li"
    "ne\n"

With arguments `sep` and `limit` given, combines the two behaviors (see [Line
Separator and Line Limit](rdoc-ref:IO@Line+Separator+and+Line+Limit)).

Optional keyword argument `chomp` specifies whether line separators are to be
omitted:

    f = File.new('t.txt')
    f.each_line(chomp: true) {|line| p line }
    f.close

Output:

    "First line"
    "Second line"
    ""
    "Fourth line"
    "Fifth line"

Returns an Enumerator if no block is given.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## each_byte() [](#method-i-each_byte)
Calls the given block with each byte (0..255) in the stream; returns `self`.
See [Byte IO](rdoc-ref:IO@Byte+IO).

    f = File.new('t.rus')
    a = []
    f.each_byte {|b| a << b }
    a # => [209, 130, 208, 181, 209, 129, 209, 130]
    f.close

Returns an Enumerator if no block is given.

Related: IO#each_char, IO#each_codepoint.

**@overload** [] 

**@overload** [] 

## each_char() [](#method-i-each_char)
Calls the given block with each character in the stream; returns `self`. See
[Character IO](rdoc-ref:IO@Character+IO).

    f = File.new('t.rus')
    a = []
    f.each_char {|c| a << c.ord }
    a # => [1090, 1077, 1089, 1090]
    f.close

Returns an Enumerator if no block is given.

Related: IO#each_byte, IO#each_codepoint.

**@overload** [] 

**@overload** [] 

## each_codepoint() [](#method-i-each_codepoint)
Calls the given block with each codepoint in the stream; returns `self`:

    f = File.new('t.rus')
    a = []
    f.each_codepoint {|c| a << c }
    a # => [1090, 1077, 1089, 1090]
    f.close

Returns an Enumerator if no block is given.

Related: IO#each_byte, IO#each_char.

**@overload** [] 

**@overload** [] 

## each_cons(n) [](#method-i-each_cons)
Calls the block with each successive overlapped `n`-tuple of elements; returns
`self`:

    a = []
    (1..5).each_cons(3) {|element| a.push(element) }
    a # => [[1, 2, 3], [2, 3, 4], [3, 4, 5]]

    a = []
    h = {foo: 0,  bar: 1, baz: 2, bam: 3}
    h.each_cons(2) {|element| a.push(element) }
    a # => [[[:foo, 0], [:bar, 1]], [[:bar, 1], [:baz, 2]], [[:baz, 2], [:bam, 3]]]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## each_entry(*args) [](#method-i-each_entry)
Calls the given block with each element, converting multiple values from yield
to an array; returns `self`:

    a = []
    (1..4).each_entry {|element| a.push(element) } # => 1..4
    a # => [1, 2, 3, 4]

    a = []
    h = {foo: 0, bar: 1, baz:2}
    h.each_entry {|element| a.push(element) }
    # => {:foo=>0, :bar=>1, :baz=>2}
    a # => [[:foo, 0], [:bar, 1], [:baz, 2]]

    class Foo
      include Enumerable
      def each
        yield 1
        yield 1, 2
        yield
      end
    end
    Foo.new.each_entry {|yielded| p yielded }

Output:

    1
    [1, 2]
    nil

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## each_line(*args) [](#method-i-each_line)
Calls the block with each remaining line read from the stream; returns `self`.
Does nothing if already at end-of-stream; See [Line IO](rdoc-ref:IO@Line+IO).

With no arguments given, reads lines as determined by line separator `$/`:

    f = File.new('t.txt')
    f.each_line {|line| p line }
    f.each_line {|line| fail 'Cannot happen' }
    f.close

Output:

    "First line\n"
    "Second line\n"
    "\n"
    "Fourth line\n"
    "Fifth line\n"

With only string argument `sep` given, reads lines as determined by line
separator `sep`; see [Line Separator](rdoc-ref:IO@Line+Separator):

    f = File.new('t.txt')
    f.each_line('li') {|line| p line }
    f.close

Output:

    "First li"
    "ne\nSecond li"
    "ne\n\nFourth li"
    "ne\nFifth li"
    "ne\n"

The two special values for `sep` are honored:

    f = File.new('t.txt')
    # Get all into one string.
    f.each_line(nil) {|line| p line }
    f.close

Output:

    "First line\nSecond line\n\nFourth line\nFifth line\n"

    f.rewind
    # Get paragraphs (up to two line separators).
    f.each_line('') {|line| p line }

Output:

    "First line\nSecond line\n\n"
    "Fourth line\nFifth line\n"

With only integer argument `limit` given, limits the number of bytes in each
line; see [Line Limit](rdoc-ref:IO@Line+Limit):

    f = File.new('t.txt')
    f.each_line(8) {|line| p line }
    f.close

Output:

    "First li"
    "ne\n"
    "Second l"
    "ine\n"
    "\n"
    "Fourth l"
    "ine\n"
    "Fifth li"
    "ne\n"

With arguments `sep` and `limit` given, combines the two behaviors (see [Line
Separator and Line Limit](rdoc-ref:IO@Line+Separator+and+Line+Limit)).

Optional keyword argument `chomp` specifies whether line separators are to be
omitted:

    f = File.new('t.txt')
    f.each_line(chomp: true) {|line| p line }
    f.close

Output:

    "First line"
    "Second line"
    ""
    "Fourth line"
    "Fifth line"

Returns an Enumerator if no block is given.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## each_slice(n) [](#method-i-each_slice)
Calls the block with each successive disjoint `n`-tuple of elements; returns
`self`:

    a = []
    (1..10).each_slice(3) {|tuple| a.push(tuple) }
    a # => [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]

    a = []
    h = {foo: 0, bar: 1, baz: 2, bat: 3, bam: 4}
    h.each_slice(2) {|tuple| a.push(tuple) }
    a # => [[[:foo, 0], [:bar, 1]], [[:baz, 2], [:bat, 3]], [[:bam, 4]]]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## each_with_index(*args) [](#method-i-each_with_index)
Invoke `self.each` with `*args`. With a block given, the block receives each
element and its index; returns `self`:

    h = {}
    (1..4).each_with_index {|element, i| h[element] = i } # => 1..4
    h # => {1=>0, 2=>1, 3=>2, 4=>3}

    h = {}
    %w[a b c d].each_with_index {|element, i| h[element] = i }
    # => ["a", "b", "c", "d"]
    h # => {"a"=>0, "b"=>1, "c"=>2, "d"=>3}

    a = []
    h = {foo: 0, bar: 1, baz: 2}
    h.each_with_index {|element, i| a.push([i, element]) }
    # => {:foo=>0, :bar=>1, :baz=>2}
    a # => [[0, [:foo, 0]], [1, [:bar, 1]], [2, [:baz, 2]]]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## each_with_object(memo) [](#method-i-each_with_object)
Calls the block once for each element, passing both the element and the given
object:

    (1..4).each_with_object([]) {|i, a| a.push(i**2) }
    # => [1, 4, 9, 16]

    {foo: 0, bar: 1, baz: 2}.each_with_object({}) {|(k, v), h| h[v] = k }
    # => {0=>:foo, 1=>:bar, 2=>:baz}

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## echo=(f) [](#method-i-echo=)
Enables/disables echo back. On some platforms, all combinations of this flags
and raw/cooked mode may not be valid.

You must require 'io/console' to use this method.

**@overload** [] 

## echo?() [](#method-i-echo?)
Returns `true` if echo back is enabled.

You must require 'io/console' to use this method.

**@overload** [] 

## entries(*args) [](#method-i-entries)
Returns an array containing the items in `self`:

    (0..4).to_a # => [0, 1, 2, 3, 4]

**@overload** [] 

## eof() [](#method-i-eof)
Returns `true` if the stream is positioned at its end, `false` otherwise; see
[Position](rdoc-ref:IO@Position):

    f = File.open('t.txt')
    f.eof           # => false
    f.seek(0, :END) # => 0
    f.eof           # => true
    f.close

Raises an exception unless the stream is opened for reading; see
[Mode](rdoc-ref:File@Access+Modes).

If `self` is a stream such as pipe or socket, this method blocks until the
other end sends some data or closes it:

    r, w = IO.pipe
    Thread.new { sleep 1; w.close }
    r.eof? # => true # After 1-second wait.

    r, w = IO.pipe
    Thread.new { sleep 1; w.puts "a" }
    r.eof?  # => false # After 1-second wait.

    r, w = IO.pipe
    r.eof?  # blocks forever

Note that this method reads data to the input byte buffer.  So IO#sysread may
not behave as you intend with IO#eof?, unless you call IO#rewind first (which
is not available for some streams).

**@overload** [] 

## eof?() [](#method-i-eof?)
Returns `true` if the stream is positioned at its end, `false` otherwise; see
[Position](rdoc-ref:IO@Position):

    f = File.open('t.txt')
    f.eof           # => false
    f.seek(0, :END) # => 0
    f.eof           # => true
    f.close

Raises an exception unless the stream is opened for reading; see
[Mode](rdoc-ref:File@Access+Modes).

If `self` is a stream such as pipe or socket, this method blocks until the
other end sends some data or closes it:

    r, w = IO.pipe
    Thread.new { sleep 1; w.close }
    r.eof? # => true # After 1-second wait.

    r, w = IO.pipe
    Thread.new { sleep 1; w.puts "a" }
    r.eof?  # => false # After 1-second wait.

    r, w = IO.pipe
    r.eof?  # blocks forever

Note that this method reads data to the input byte buffer.  So IO#sysread may
not behave as you intend with IO#eof?, unless you call IO#rewind first (which
is not available for some streams).

**@overload** [] 

## erase_line(val) [](#method-i-erase_line)
Erases the line at the cursor corresponding to `mode`. `mode` may be either:
0: after cursor 1: before and cursor 2: entire line

You must require 'io/console' to use this method.

**@overload** [] 

## erase_screen(val) [](#method-i-erase_screen)
Erases the screen at the cursor corresponding to `mode`. `mode` may be either:
0: after cursor 1: before and cursor 2: entire screen

You must require 'io/console' to use this method.

**@overload** [] 

## expect(pat, timeout9999999) [](#method-i-expect)
call-seq:
    IO#expect(pattern,timeout=9999999)                  ->  Array
    IO#expect(pattern,timeout=9999999) { |result| ... } ->  nil

The `expect` library adds instance method IO#expect, which is similar to the
[TCL expect extension](https://www.tcl.tk/man/expect5.31/expect.1.html).

To use this method, you must require `expect`:

    require 'expect'

Reads from the IO until the given `pattern` matches or the `timeout` is over.

It returns an array with the read buffer, followed by the matches. If a block
is given, the result is yielded to the block and returns nil.

When called without a block, it waits until the input that matches the given
`pattern` is obtained from the IO or the time specified as the timeout passes.
An array is returned when the pattern is obtained from the IO. The first
element of the array is the entire string obtained from the IO until the
pattern matches, followed by elements indicating which the pattern which
matched to the anchor in the regular expression.

The optional timeout parameter defines, in seconds, the total time to wait for
the pattern.  If the timeout expires or eof is found, nil is returned or
yielded.  However, the buffer in a timeout session is kept for the next expect
call.  The default timeout is 9999999 seconds.

## external_encoding() [](#method-i-external_encoding)
Returns the Encoding object that represents the encoding of the stream, or
`nil` if the stream is in write mode and no encoding is specified.

See [Encodings](rdoc-ref:File@Encodings).

**@overload** [] 

## fcntl(*args) [](#method-i-fcntl)
Invokes Posix system call [fcntl(2)](https://linux.die.net/man/2/fcntl), which
provides a mechanism for issuing low-level commands to control or query a
file-oriented I/O stream. Arguments and results are platform dependent.

If `argument` is a number, its value is passed directly; if it is a string, it
is interpreted as a binary sequence of bytes. (Array#pack might be a useful
way to build this string.)

Not implemented on all platforms.

**@overload** [] 

## fdatasync() [](#method-i-fdatasync)
Immediately writes to disk all data buffered in the stream, via the operating
system's: `fdatasync(2)`, if supported, otherwise via `fsync(2)`, if
supported; otherwise raises an exception.

**@overload** [] 

## fileno() [](#method-i-fileno)
Returns the integer file descriptor for the stream:

    $stdin.fileno             # => 0
    $stdout.fileno            # => 1
    $stderr.fileno            # => 2
    File.open('t.txt').fileno # => 10
    f.close

**@overload** [] 

## filter() [](#method-i-filter)
Returns an array containing elements selected by the block.

With a block given, calls the block with successive elements; returns an array
of those elements for which the block returns a truthy value:

    (0..9).select {|element| element % 3 == 0 } # => [0, 3, 6, 9]
    a = {foo: 0, bar: 1, baz: 2}.select {|key, value| key.start_with?('b') }
    a # => {:bar=>1, :baz=>2}

With no block given, returns an Enumerator.

Related: #reject.

**@overload** [] 

**@overload** [] 

## filter_map() [](#method-i-filter_map)
Returns an array containing truthy elements returned by the block.

With a block given, calls the block with successive elements; returns an array
containing each truthy value returned by the block:

    (0..9).filter_map {|i| i * 2 if i.even? }                              # => [0, 4, 8, 12, 16]
    {foo: 0, bar: 1, baz: 2}.filter_map {|key, value| key if value.even? } # => [:foo, :baz]

When no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## find(*args) [](#method-i-find)
Returns the first element for which the block returns a truthy value.

With a block given, calls the block with successive elements of the
collection; returns the first element for which the block returns a truthy
value:

    (0..9).find {|element| element > 2}                # => 3

If no such element is found, calls `if_none_proc` and returns its return
value.

    (0..9).find(proc {false}) {|element| element > 12} # => false
    {foo: 0, bar: 1, baz: 2}.find {|key, value| key.start_with?('b') }            # => [:bar, 1]
    {foo: 0, bar: 1, baz: 2}.find(proc {[]}) {|key, value| key.start_with?('c') } # => []

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## find_all() [](#method-i-find_all)
Returns an array containing elements selected by the block.

With a block given, calls the block with successive elements; returns an array
of those elements for which the block returns a truthy value:

    (0..9).select {|element| element % 3 == 0 } # => [0, 3, 6, 9]
    a = {foo: 0, bar: 1, baz: 2}.select {|key, value| key.start_with?('b') }
    a # => {:bar=>1, :baz=>2}

With no block given, returns an Enumerator.

Related: #reject.

**@overload** [] 

**@overload** [] 

## find_index(*args) [](#method-i-find_index)
Returns the index of the first element that meets a specified criterion, or
`nil` if no such element is found.

With argument `object` given, returns the index of the first element that is
`==` `object`:

    ['a', 'b', 'c', 'b'].find_index('b') # => 1

With a block given, calls the block with successive elements; returns the
first element for which the block returns a truthy value:

    ['a', 'b', 'c', 'b'].find_index {|element| element.start_with?('b') } # => 1
    {foo: 0, bar: 1, baz: 2}.find_index {|key, value| value > 1 }         # => 2

With no argument and no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## first(*args) [](#method-i-first)
Returns the first element or elements.

With no argument, returns the first element, or `nil` if there is none:

    (1..4).first                   # => 1
    %w[a b c].first                # => "a"
    {foo: 1, bar: 1, baz: 2}.first # => [:foo, 1]
    [].first                       # => nil

With integer argument `n`, returns an array containing the first `n` elements
that exist:

    (1..4).first(2)                   # => [1, 2]
    %w[a b c d].first(3)              # => ["a", "b", "c"]
    %w[a b c d].first(50)             # => ["a", "b", "c", "d"]
    {foo: 1, bar: 1, baz: 2}.first(2) # => [[:foo, 1], [:bar, 1]]
    [].first(2)                       # => []

**@overload** [] 

**@overload** [] 

## flat_map() [](#method-i-flat_map)
Returns an array of flattened objects returned by the block.

With a block given, calls the block with successive elements; returns a
flattened array of objects returned by the block:

    [0, 1, 2, 3].flat_map {|element| -element }                    # => [0, -1, -2, -3]
    [0, 1, 2, 3].flat_map {|element| [element, -element] }         # => [0, 0, 1, -1, 2, -2, 3, -3]
    [[0, 1], [2, 3]].flat_map {|e| e + [100] }                     # => [0, 1, 100, 2, 3, 100]
    {foo: 0, bar: 1, baz: 2}.flat_map {|key, value| [key, value] } # => [:foo, 0, :bar, 1, :baz, 2]

With no block given, returns an Enumerator.

Alias: #collect_concat.

**@overload** [] 

**@overload** [] 

## flush() [](#method-i-flush)
Flushes data buffered in `self` to the operating system (but does not
necessarily flush data buffered in the operating system):

    $stdout.print 'no newline' # Not necessarily flushed.
    $stdout.flush              # Flushed.

**@overload** [] 

## fsync() [](#method-i-fsync)
Immediately writes to disk all data buffered in the stream, via the operating
system's `fsync(2)`.

Note this difference:

*   IO#sync=: Ensures that data is flushed from the stream's internal buffers,
    but does not guarantee that the operating system actually writes the data
    to disk.
*   IO#fsync: Ensures both that data is flushed from internal buffers, and
    that data is written to disk.

Raises an exception if the operating system does not support `fsync(2)`.

**@overload** [] 

## getbyte() [](#method-i-getbyte)
Reads and returns the next byte (in range 0..255) from the stream; returns
`nil` if already at end-of-stream. See [Byte IO](rdoc-ref:IO@Byte+IO).

    f = File.open('t.txt')
    f.getbyte # => 70
    f.close
    f = File.open('t.rus')
    f.getbyte # => 209
    f.close

Related: IO#readbyte (may raise EOFError).

**@overload** [] 

## getc() [](#method-i-getc)
Reads and returns the next 1-character string from the stream; returns `nil`
if already at end-of-stream. See [Character IO](rdoc-ref:IO@Character+IO).

    f = File.open('t.txt')
    f.getc     # => "F"
    f.close
    f = File.open('t.rus')
    f.getc.ord # => 1090
    f.close

Related:  IO#readchar (may raise EOFError).

**@overload** [] 

## getch(*args) [](#method-i-getch)
Reads and returns a character in raw mode.

See IO#raw for details on the parameters.

You must require 'io/console' to use this method.

**@overload** [] 

## getpass(*args) [](#method-i-getpass)
Reads and returns a line without echo back. Prints `prompt` unless it is
`nil`.

The newline character that terminates the read line is removed from the
returned string, see String#chomp!.

You must require 'io/console' to use this method.

    require 'io/console'
    IO::console.getpass("Enter password:")
    Enter password:
    # => "mypassword"

**@overload** [] 

## gets(*args) [](#method-i-gets)
Reads and returns a line from the stream; assigns the return value to `$_`.
See [Line IO](rdoc-ref:IO@Line+IO).

With no arguments given, returns the next line as determined by line separator
`$/`, or `nil` if none:

    f = File.open('t.txt')
    f.gets # => "First line\n"
    $_     # => "First line\n"
    f.gets # => "\n"
    f.gets # => "Fourth line\n"
    f.gets # => "Fifth line\n"
    f.gets # => nil
    f.close

With only string argument `sep` given, returns the next line as determined by
line separator `sep`, or `nil` if none; see [Line
Separator](rdoc-ref:IO@Line+Separator):

    f = File.new('t.txt')
    f.gets('l')   # => "First l"
    f.gets('li')  # => "ine\nSecond li"
    f.gets('lin') # => "ne\n\nFourth lin"
    f.gets        # => "e\n"
    f.close

The two special values for `sep` are honored:

    f = File.new('t.txt')
    # Get all.
    f.gets(nil) # => "First line\nSecond line\n\nFourth line\nFifth line\n"
    f.rewind
    # Get paragraph (up to two line separators).
    f.gets('')  # => "First line\nSecond line\n\n"
    f.close

With only integer argument `limit` given, limits the number of bytes in the
line; see [Line Limit](rdoc-ref:IO@Line+Limit):

    # No more than one line.
    File.open('t.txt') {|f| f.gets(10) } # => "First line"
    File.open('t.txt') {|f| f.gets(11) } # => "First line\n"
    File.open('t.txt') {|f| f.gets(12) } # => "First line\n"

With arguments `sep` and `limit` given, combines the two behaviors (see [Line
Separator and Line Limit](rdoc-ref:IO@Line+Separator+and+Line+Limit)).

Optional keyword argument `chomp` specifies whether line separators are to be
omitted:

    f = File.open('t.txt')
    # Chomp the lines.
    f.gets(chomp: true) # => "First line"
    f.gets(chomp: true) # => "Second line"
    f.gets(chomp: true) # => ""
    f.gets(chomp: true) # => "Fourth line"
    f.gets(chomp: true) # => "Fifth line"
    f.gets(chomp: true) # => nil
    f.close

**@overload** [] 

**@overload** [] 

**@overload** [] 

## goto(y, x) [](#method-i-goto)
Set the cursor position at `line` and `column`.

You must require 'io/console' to use this method.

**@overload** [] 

## goto_column(val) [](#method-i-goto_column)
Set the cursor position at `column` in the same line of the current position.

You must require 'io/console' to use this method.

**@overload** [] 

## grep(pat) [](#method-i-grep)
Returns an array of objects based elements of `self` that match the given
pattern.

With no block given, returns an array containing each element for which
`pattern === element` is `true`:

    a = ['foo', 'bar', 'car', 'moo']
    a.grep(/ar/)                   # => ["bar", "car"]
    (1..10).grep(3..8)             # => [3, 4, 5, 6, 7, 8]
    ['a', 'b', 0, 1].grep(Integer) # => [0, 1]

With a block given, calls the block with each matching element and returns an
array containing each object returned by the block:

    a = ['foo', 'bar', 'car', 'moo']
    a.grep(/ar/) {|element| element.upcase } # => ["BAR", "CAR"]

Related: #grep_v.

**@overload** [] 

**@overload** [] 

## grep_v(pat) [](#method-i-grep_v)
Returns an array of objects based on elements of `self` that *don't* match the
given pattern.

With no block given, returns an array containing each element for which
`pattern === element` is `false`:

    a = ['foo', 'bar', 'car', 'moo']
    a.grep_v(/ar/)                   # => ["foo", "moo"]
    (1..10).grep_v(3..8)             # => [1, 2, 9, 10]
    ['a', 'b', 0, 1].grep_v(Integer) # => ["a", "b"]

With a block given, calls the block with each non-matching element and returns
an array containing each object returned by the block:

    a = ['foo', 'bar', 'car', 'moo']
    a.grep_v(/ar/) {|element| element.upcase } # => ["FOO", "MOO"]

Related: #grep.

**@overload** [] 

**@overload** [] 

## group_by() [](#method-i-group_by)
With a block given returns a hash:

*   Each key is a return value from the block.
*   Each value is an array of those elements for which the block returned that
    key.

Examples:

    g = (1..6).group_by {|i| i%3 }
    g # => {1=>[1, 4], 2=>[2, 5], 0=>[3, 6]}
    h = {foo: 0, bar: 1, baz: 0, bat: 1}
    g = h.group_by {|key, value| value }
    g # => {0=>[[:foo, 0], [:baz, 0]], 1=>[[:bar, 1], [:bat, 1]]}

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## iflush() [](#method-i-iflush)
Flushes input buffer in kernel.

You must require 'io/console' to use this method.

**@overload** [] 

## include?(val) [](#method-i-include?)
Returns whether for any element `object == element`:

    (1..4).include?(2)                       # => true
    (1..4).include?(5)                       # => false
    (1..4).include?('2')                     # => false
    %w[a b c d].include?('b')                # => true
    %w[a b c d].include?('2')                # => false
    {foo: 0, bar: 1, baz: 2}.include?(:foo)  # => true
    {foo: 0, bar: 1, baz: 2}.include?('foo') # => false
    {foo: 0, bar: 1, baz: 2}.include?(0)     # => false

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Creates and returns a new IO object (file stream) from a file descriptor.

IO.new may be useful for interaction with low-level libraries. For
higher-level interactions, it may be simpler to create the file stream using
File.open.

Argument `fd` must be a valid file descriptor (integer):

    path = 't.tmp'
    fd = IO.sysopen(path) # => 3
    IO.new(fd)            # => #<IO:fd 3>

The new IO object does not inherit encoding (because the integer file
descriptor does not have an encoding):

    fd = IO.sysopen('t.rus', 'rb')
    io = IO.new(fd)
    io.external_encoding # => #<Encoding:UTF-8> # Not ASCII-8BIT.

Optional argument `mode` (defaults to 'r') must specify a valid mode; see
[Access Modes](rdoc-ref:File@Access+Modes):

    IO.new(fd, 'w')         # => #<IO:fd 3>
    IO.new(fd, File::WRONLY) # => #<IO:fd 3>

Optional keyword arguments `opts` specify:

*   [Open Options](rdoc-ref:IO@Open+Options).
*   [Encoding options](rdoc-ref:encodings.rdoc@Encoding+Options).

Examples:

    IO.new(fd, internal_encoding: nil) # => #<IO:fd 3>
    IO.new(fd, autoclose: true)        # => #<IO:fd 3>

**@overload** [] 

## initialize_copy(io) [](#method-i-initialize_copy)
:nodoc:

## inject(*args) [](#method-i-inject)
Returns the result of applying a reducer to an initial value and the first
element of the Enumerable. It then takes the result and applies the function
to it and the second element of the collection, and so on. The return value is
the result returned by the final call to the function.

You can think of

    [ a, b, c, d ].inject(i) { |r, v| fn(r, v) }

as being

    fn(fn(fn(fn(i, a), b), c), d)

In a way the `inject` function *injects* the function between the elements of
the enumerable.

`inject` is aliased as `reduce`. You use it when you want to *reduce* a
collection to a single value.

**The Calling Sequences**

Let's start with the most verbose:

    enum.inject(initial_value) do |result, next_value|
      # do something with +result+ and +next_value+
      # the value returned by the block becomes the
      # value passed in to the next iteration
      # as +result+
    end

For example:

    product = [ 2, 3, 4 ].inject(1) do |result, next_value|
      result * next_value
    end
    product #=> 24

When this runs, the block is first called with `1` (the initial value) and `2`
(the first element of the array). The block returns `1*2`, so on the next
iteration the block is called with `2` (the previous result) and `3`. The
block returns `6`, and is called one last time with `6` and `4`. The result of
the block, `24` becomes the value returned by `inject`. This code returns the
product of the elements in the enumerable.

**First Shortcut: Default Initial value**

In the case of the previous example, the initial value, `1`, wasn't really
necessary: the calculation of the product of a list of numbers is
self-contained.

In these circumstances, you can omit the `initial_value` parameter. `inject`
will then initially call the block with the first element of the collection as
the `result` parameter and the second element as the `next_value`.

    [ 2, 3, 4 ].inject do |result, next_value|
      result * next_value
    end

This shortcut is convenient, but can only be used when the block produces a
result which can be passed back to it as a first parameter.

Here's an example where that's not the case: it returns a hash where the keys
are words and the values are the number of occurrences of that word in the
enumerable.

    freqs = File.read("README.md")
      .scan(/\w{2,}/)
      .reduce(Hash.new(0)) do |counts, word|
        counts[word] += 1
        counts
      end
    freqs #=> {"Actions"=>4,
               "Status"=>5,
               "MinGW"=>3,
               "https"=>27,
               "github"=>10,
               "com"=>15, ...

Note that the last line of the block is just the word `counts`. This ensures
the return value of the block is the result that's being calculated.

**Second Shortcut: a Reducer function**

A *reducer function* is a function that takes a partial result and the next
value, returning the next partial result. The block that is given to `inject`
is a reducer.

You can also write a reducer as a function and pass the name of that function
(as a symbol) to `inject`. However, for this to work, the function

1.  Must be defined on the type of the result value
2.  Must accept a single parameter, the next value in the collection, and
3.  Must return an updated result which will also implement the function.

Here's an example that adds elements to a string. The two calls invoke the
functions String#concat and String#+ on the result so far, passing it the next
value.

    s = [ "cat", " ", "dog" ].inject("", :concat)
    s #=> "cat dog"
    s = [ "cat", " ", "dog" ].inject("The result is:", :+)
    s #=> "The result is: cat dog"

Here's a more complex example when the result object maintains state of a
different type to the enumerable elements.

    class Turtle

      def initialize
        @x = @y = 0
      end

      def move(dir)
        case dir
        when "n" then @y += 1
        when "s" then @y -= 1
        when "e" then @x += 1
        when "w" then @x -= 1
        end
        self
      end
    end

    position = "nnneesw".chars.reduce(Turtle.new, :move)
    position  #=>> #<Turtle:0x00000001052f4698 @y=2, @x=1>

**Third Shortcut: Reducer With no Initial Value**

If your reducer returns a value that it can accept as a parameter, then you
don't have to pass in an initial value. Here `:*` is the name of the *times*
function:

    product = [ 2, 3, 4 ].inject(:*)
    product # => 24

String concatenation again:

    s = [ "cat", " ", "dog" ].inject(:+)
    s #=> "cat dog"

And an example that converts a hash to an array of two-element subarrays.

    nested = {foo: 0, bar: 1}.inject([], :push)
    nested # => [[:foo, 0], [:bar, 1]]

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## inspect() [](#method-i-inspect)
Returns a string representation of `self`:

    f = File.open('t.txt')
    f.inspect # => "#<File:t.txt>"
    f.close

**@overload** [] 

## internal_encoding() [](#method-i-internal_encoding)
Returns the Encoding object that represents the encoding of the internal
string, if conversion is specified, or `nil` otherwise.

See [Encodings](rdoc-ref:File@Encodings).

**@overload** [] 

## ioctl(*args) [](#method-i-ioctl)
Invokes Posix system call [ioctl(2)](https://linux.die.net/man/2/ioctl), which
issues a low-level command to an I/O device.

Issues a low-level command to an I/O device. The arguments and returned value
are platform-dependent. The effect of the call is platform-dependent.

If argument `argument` is an integer, it is passed directly; if it is a
string, it is interpreted as a binary sequence of bytes.

Not implemented on all platforms.

**@overload** [] 

## ioflush() [](#method-i-ioflush)
Flushes input and output buffers in kernel.

You must require 'io/console' to use this method.

**@overload** [] 

## isatty() [](#method-i-isatty)
Returns `true` if the stream is associated with a terminal device (tty),
`false` otherwise:

    f = File.new('t.txt').isatty    #=> false
    f.close
    f = File.new('/dev/tty').isatty #=> true
    f.close

**@overload** [] 

## lazy() [](#method-i-lazy)
Returns an Enumerator::Lazy, which redefines most Enumerable methods to
postpone enumeration and enumerate values only on an as-needed basis.

### Example

The following program finds pythagorean triples:

    def pythagorean_triples
      (1..Float::INFINITY).lazy.flat_map {|z|
        (1..z).flat_map {|x|
          (x..z).select {|y|
            x**2 + y**2 == z**2
          }.map {|y|
            [x, y, z]
          }
        }
      }
    end
    # show first ten pythagorean triples
    p pythagorean_triples.take(10).force # take is lazy, so force is needed
    p pythagorean_triples.first(10)      # first is eager
    # show pythagorean triples less than 100
    p pythagorean_triples.take_while { |*, z| z < 100 }.force

**@overload** [] 

## lineno() [](#method-i-lineno)
Returns the current line number for the stream; see [Line
Number](rdoc-ref:IO@Line+Number).

**@overload** [] 

## lineno=(lineno) [](#method-i-lineno=)
Sets and returns the line number for the stream; see [Line
Number](rdoc-ref:IO@Line+Number).

**@overload** [] 

## map() [](#method-i-map)
Returns an array of objects returned by the block.

With a block given, calls the block with successive elements; returns an array
of the objects returned by the block:

    (0..4).map {|i| i*i }                               # => [0, 1, 4, 9, 16]
    {foo: 0, bar: 1, baz: 2}.map {|key, value| value*2} # => [0, 2, 4]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## max(*args) [](#method-i-max)
Returns the element with the maximum element according to a given criterion.
The ordering of equal elements is indeterminate and may be unstable.

With no argument and no block, returns the maximum element, using the
elements' own method `#<=>` for comparison:

    (1..4).max                   # => 4
    (-4..-1).max                 # => -1
    %w[d c b a].max              # => "d"
    {foo: 0, bar: 1, baz: 2}.max # => [:foo, 0]
    [].max                       # => nil

With positive integer argument `n` given, and no block, returns an array
containing the first `n` maximum elements that exist:

    (1..4).max(2)                   # => [4, 3]
    (-4..-1).max(2)                # => [-1, -2]
    %w[d c b a].max(2)              # => ["d", "c"]
    {foo: 0, bar: 1, baz: 2}.max(2) # => [[:foo, 0], [:baz, 2]]
    [].max(2)                       # => []

With a block given, the block determines the maximum elements. The block is
called with two elements `a` and `b`, and must return:

*   A negative integer if `a < b`.
*   Zero if `a == b`.
*   A positive integer if `a > b`.

With a block given and no argument, returns the maximum element as determined
by the block:

    %w[xxx x xxxx xx].max {|a, b| a.size <=> b.size } # => "xxxx"
    h = {foo: 0, bar: 1, baz: 2}
    h.max {|pair1, pair2| pair1[1] <=> pair2[1] }     # => [:baz, 2]
    [].max {|a, b| a <=> b }                          # => nil

With a block given and positive integer argument `n` given, returns an array
containing the first `n` maximum elements that exist, as determined by the
block.

    %w[xxx x xxxx xx].max(2) {|a, b| a.size <=> b.size } # => ["xxxx", "xxx"]
    h = {foo: 0, bar: 1, baz: 2}
    h.max(2) {|pair1, pair2| pair1[1] <=> pair2[1] }
    # => [[:baz, 2], [:bar, 1]]
    [].max(2) {|a, b| a <=> b }                          # => []

Related: #min, #minmax, #max_by.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## max_by(*args) [](#method-i-max_by)
Returns the elements for which the block returns the maximum values.

With a block given and no argument, returns the element for which the block
returns the maximum value:

    (1..4).max_by {|element| -element }                    # => 1
    %w[a b c d].max_by {|element| -element.ord }           # => "a"
    {foo: 0, bar: 1, baz: 2}.max_by {|key, value| -value } # => [:foo, 0]
    [].max_by {|element| -element }                        # => nil

With a block given and positive integer argument `n` given, returns an array
containing the `n` elements for which the block returns maximum values:

    (1..4).max_by(2) {|element| -element }
    # => [1, 2]
    %w[a b c d].max_by(2) {|element| -element.ord }
    # => ["a", "b"]
    {foo: 0, bar: 1, baz: 2}.max_by(2) {|key, value| -value }
    # => [[:foo, 0], [:bar, 1]]
    [].max_by(2) {|element| -element }
    # => []

Returns an Enumerator if no block is given.

Related: #max, #minmax, #min_by.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## member?(val) [](#method-i-member?)
Returns whether for any element `object == element`:

    (1..4).include?(2)                       # => true
    (1..4).include?(5)                       # => false
    (1..4).include?('2')                     # => false
    %w[a b c d].include?('b')                # => true
    %w[a b c d].include?('2')                # => false
    {foo: 0, bar: 1, baz: 2}.include?(:foo)  # => true
    {foo: 0, bar: 1, baz: 2}.include?('foo') # => false
    {foo: 0, bar: 1, baz: 2}.include?(0)     # => false

**@overload** [] 

## min(*args) [](#method-i-min)
Returns the element with the minimum element according to a given criterion.
The ordering of equal elements is indeterminate and may be unstable.

With no argument and no block, returns the minimum element, using the
elements' own method `#<=>` for comparison:

    (1..4).min                   # => 1
    (-4..-1).min                 # => -4
    %w[d c b a].min              # => "a"
    {foo: 0, bar: 1, baz: 2}.min # => [:bar, 1]
    [].min                       # => nil

With positive integer argument `n` given, and no block, returns an array
containing the first `n` minimum elements that exist:

    (1..4).min(2)                   # => [1, 2]
    (-4..-1).min(2)                 # => [-4, -3]
    %w[d c b a].min(2)              # => ["a", "b"]
    {foo: 0, bar: 1, baz: 2}.min(2) # => [[:bar, 1], [:baz, 2]]
    [].min(2)                       # => []

With a block given, the block determines the minimum elements. The block is
called with two elements `a` and `b`, and must return:

*   A negative integer if `a < b`.
*   Zero if `a == b`.
*   A positive integer if `a > b`.

With a block given and no argument, returns the minimum element as determined
by the block:

    %w[xxx x xxxx xx].min {|a, b| a.size <=> b.size } # => "x"
    h = {foo: 0, bar: 1, baz: 2}
    h.min {|pair1, pair2| pair1[1] <=> pair2[1] } # => [:foo, 0]
    [].min {|a, b| a <=> b }                          # => nil

With a block given and positive integer argument `n` given, returns an array
containing the first `n` minimum elements that exist, as determined by the
block.

    %w[xxx x xxxx xx].min(2) {|a, b| a.size <=> b.size } # => ["x", "xx"]
    h = {foo: 0, bar: 1, baz: 2}
    h.min(2) {|pair1, pair2| pair1[1] <=> pair2[1] }
    # => [[:foo, 0], [:bar, 1]]
    [].min(2) {|a, b| a <=> b }                          # => []

Related: #min_by, #minmax, #max.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## min_by(*args) [](#method-i-min_by)
Returns the elements for which the block returns the minimum values.

With a block given and no argument, returns the element for which the block
returns the minimum value:

    (1..4).min_by {|element| -element }                    # => 4
    %w[a b c d].min_by {|element| -element.ord }           # => "d"
    {foo: 0, bar: 1, baz: 2}.min_by {|key, value| -value } # => [:baz, 2]
    [].min_by {|element| -element }                        # => nil

With a block given and positive integer argument `n` given, returns an array
containing the `n` elements for which the block returns minimum values:

    (1..4).min_by(2) {|element| -element }
    # => [4, 3]
    %w[a b c d].min_by(2) {|element| -element.ord }
    # => ["d", "c"]
    {foo: 0, bar: 1, baz: 2}.min_by(2) {|key, value| -value }
    # => [[:baz, 2], [:bar, 1]]
    [].min_by(2) {|element| -element }
    # => []

Returns an Enumerator if no block is given.

Related: #min, #minmax, #max_by.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## minmax() [](#method-i-minmax)
Returns a 2-element array containing the minimum and maximum elements
according to a given criterion. The ordering of equal elements is
indeterminate and may be unstable.

With no argument and no block, returns the minimum and maximum elements, using
the elements' own method `#<=>` for comparison:

    (1..4).minmax                   # => [1, 4]
    (-4..-1).minmax                 # => [-4, -1]
    %w[d c b a].minmax              # => ["a", "d"]
    {foo: 0, bar: 1, baz: 2}.minmax # => [[:bar, 1], [:foo, 0]]
    [].minmax                       # => [nil, nil]

With a block given, returns the minimum and maximum elements as determined by
the block:

    %w[xxx x xxxx xx].minmax {|a, b| a.size <=> b.size } # => ["x", "xxxx"]
    h = {foo: 0, bar: 1, baz: 2}
    h.minmax {|pair1, pair2| pair1[1] <=> pair2[1] }
    # => [[:foo, 0], [:baz, 2]]
    [].minmax {|a, b| a <=> b }                          # => [nil, nil]

Related: #min, #max, #minmax_by.

**@overload** [] 

**@overload** [] 

## minmax_by() [](#method-i-minmax_by)
Returns a 2-element array containing the elements for which the block returns
minimum and maximum values:

    (1..4).minmax_by {|element| -element }
    # => [4, 1]
    %w[a b c d].minmax_by {|element| -element.ord }
    # => ["d", "a"]
    {foo: 0, bar: 1, baz: 2}.minmax_by {|key, value| -value }
    # => [[:baz, 2], [:foo, 0]]
    [].minmax_by {|element| -element }
    # => [nil, nil]

Returns an Enumerator if no block is given.

Related: #max_by, #minmax, #min_by.

**@overload** [] 

**@overload** [] 

## noecho() [](#method-i-noecho)
Yields `self` with disabling echo back.

    STDIN.noecho(&:gets)

will read and return a line without echo back.

You must require 'io/console' to use this method.

**@overload** [] 

## nonblock(*args) [](#method-i-nonblock)
Yields `self` in non-blocking mode.

When `false` is given as an argument, `self` is yielded in blocking mode. The
original mode is restored after the block is executed.

**@overload** [] 

**@overload** [] 

## nonblock=(value) [](#method-i-nonblock=)
Enables non-blocking mode on a stream when set to `true`, and blocking mode
when set to `false`.

This method set or clear O_NONBLOCK flag for the file descriptor in *ios*.

The behavior of most IO methods is not affected by this flag because they
retry system calls to complete their task after EAGAIN and partial read/write.
(An exception is IO#syswrite which doesn't retry.)

This method can be used to clear non-blocking mode of standard I/O. Since
nonblocking methods (read_nonblock, etc.) set non-blocking mode but they
doesn't clear it, this method is usable as follows.

    END { STDOUT.nonblock = false }
    STDOUT.write_nonblock("foo")

Since the flag is shared across processes and many non-Ruby commands doesn't
expect standard I/O with non-blocking mode, it would be safe to clear the flag
before Ruby program exits.

For example following Ruby program leaves STDIN/STDOUT/STDER non-blocking
mode. (STDIN, STDOUT and STDERR are connected to a terminal. So making one of
them nonblocking-mode effects other two.) Thus cat command try to read from
standard input and it causes "Resource temporarily unavailable" error
(EAGAIN).

    % ruby -e '
    STDOUT.write_nonblock("foo\n")'; cat
    foo
    cat: -: Resource temporarily unavailable

Clearing the flag makes the behavior of cat command normal. (cat command waits
input from standard input.)

    % ruby -rio/nonblock -e '
    END { STDOUT.nonblock = false }
    STDOUT.write_nonblock("foo")
    '; cat
    foo

**@overload** [] 

## nonblock?() [](#method-i-nonblock?)
Returns `true` if an IO object is in non-blocking mode.

**@overload** [] 

## none?(*args) [](#method-i-none?)
Returns whether no element meets a given criterion.

With no argument and no block, returns whether no element is truthy:

    (1..4).none?           # => false
    [nil, false].none?     # => true
    {foo: 0}.none?         # => false
    {foo: 0, bar: 1}.none? # => false
    [].none?               # => true

With argument `pattern` and no block, returns whether for no element
`element`, `pattern === element`:

    [nil, false, 1.1].none?(Integer)      # => true
    %w[bar baz bat bam].none?(/m/)        # => false
    %w[bar baz bat bam].none?(/foo/)      # => true
    %w[bar baz bat bam].none?('ba')       # => true
    {foo: 0, bar: 1, baz: 2}.none?(Hash)  # => true
    {foo: 0}.none?(Array)                 # => false
    [].none?(Integer)                     # => true

With a block given, returns whether the block returns a truthy value for no
element:

    (1..4).none? {|element| element < 1 }                     # => true
    (1..4).none? {|element| element < 2 }                     # => false
    {foo: 0, bar: 1, baz: 2}.none? {|key, value| value < 0 }  # => true
    {foo: 0, bar: 1, baz: 2}.none? {|key, value| value < 1 } # => false

Related: #one?, #all?, #any?.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## nread() [](#method-i-nread)
Returns number of bytes that can be read without blocking. Returns zero if no
information available.

You must require 'io/wait' to use this method.

**@overload** [] 

## oflush() [](#method-i-oflush)
Flushes output buffer in kernel.

You must require 'io/console' to use this method.

**@overload** [] 

## one?(*args) [](#method-i-one?)
Returns whether exactly one element meets a given criterion.

With no argument and no block, returns whether exactly one element is truthy:

    (1..1).one?           # => true
    [1, nil, false].one?  # => true
    (1..4).one?           # => false
    {foo: 0}.one?         # => true
    {foo: 0, bar: 1}.one? # => false
    [].one?               # => false

With argument `pattern` and no block, returns whether for exactly one element
`element`, `pattern === element`:

    [nil, false, 0].one?(Integer)        # => true
    [nil, false, 0].one?(Numeric)        # => true
    [nil, false, 0].one?(Float)          # => false
    %w[bar baz bat bam].one?(/m/)        # => true
    %w[bar baz bat bam].one?(/foo/)      # => false
    %w[bar baz bat bam].one?('ba')       # => false
    {foo: 0, bar: 1, baz: 2}.one?(Array) # => false
    {foo: 0}.one?(Array)                 # => true
    [].one?(Integer)                     # => false

With a block given, returns whether the block returns a truthy value for
exactly one element:

    (1..4).one? {|element| element < 2 }                     # => true
    (1..4).one? {|element| element < 1 }                     # => false
    {foo: 0, bar: 1, baz: 2}.one? {|key, value| value < 1 }  # => true
    {foo: 0, bar: 1, baz: 2}.one? {|key, value| value < 2 } # => false

Related: #none?, #all?, #any?.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## partition() [](#method-i-partition)
With a block given, returns an array of two arrays:

*   The first having those elements for which the block returns a truthy
    value.
*   The other having all other elements.

Examples:

    p = (1..4).partition {|i| i.even? }
    p # => [[2, 4], [1, 3]]
    p = ('a'..'d').partition {|c| c < 'c' }
    p # => [["a", "b"], ["c", "d"]]
    h = {foo: 0, bar: 1, baz: 2, bat: 3}
    p = h.partition {|key, value| key.start_with?('b') }
    p # => [[[:bar, 1], [:baz, 2], [:bat, 3]], [[:foo, 0]]]
    p = h.partition {|key, value| value < 2 }
    p # => [[[:foo, 0], [:bar, 1]], [[:baz, 2], [:bat, 3]]]

With no block given, returns an Enumerator.

Related: Enumerable#group_by.

**@overload** [] 

**@overload** [] 

## path() [](#method-i-path)
Returns the path associated with the IO, or `nil` if there is no path
associated with the IO. It is not guaranteed that the path exists on the
filesystem.

    $stdin.path # => "<STDIN>"

    File.open("testfile") {|f| f.path} # => "testfile"

**@overload** [] 

## pathconf(arg) [](#method-i-pathconf)
pathconf(name)	->  Integer

Returns pathname configuration variable using fpathconf().

*name* should be a constant under `Etc` which begins with `PC_`.

The return value is an integer or nil. nil means indefinite limit. 
(fpathconf() returns -1 but errno is not set.)

    require 'etc'
    IO.pipe {|r, w|
      p w.pathconf(Etc::PC_PIPE_BUF) #=> 4096
    }

## pid() [](#method-i-pid)
Returns the process ID of a child process associated with the stream, which
will have been set by IO#popen, or `nil` if the stream was not created by
IO#popen:

    pipe = IO.popen("-")
    if pipe
      $stderr.puts "In parent, child pid is #{pipe.pid}"
    else
      $stderr.puts "In child, pid is #{$$}"
    end

Output:

    In child, pid is 26209
    In parent, child pid is 26209

**@overload** [] 

## pos() [](#method-i-pos)
Returns the current position (in bytes) in `self` (see
[Position](rdoc-ref:IO@Position)):

    f = File.open('t.txt')
    f.tell # => 0
    f.gets # => "First line\n"
    f.tell # => 12
    f.close

Related: IO#pos=, IO#seek.

**@overload** [] 

## pos=(offset) [](#method-i-pos=)
Seeks to the given `new_position` (in bytes); see
[Position](rdoc-ref:IO@Position):

    f = File.open('t.txt')
    f.tell     # => 0
    f.pos = 20 # => 20
    f.tell     # => 20
    f.close

Related: IO#seek, IO#tell.

**@overload** [] 

## pread(*args) [](#method-i-pread)
Behaves like IO#readpartial, except that it:

*   Reads at the given `offset` (in bytes).
*   Disregards, and does not modify, the stream's position (see
    [Position](rdoc-ref:IO@Position)).
*   Bypasses any user space buffering in the stream.

Because this method does not disturb the stream's state (its position, in
particular), `pread` allows multiple threads and processes to use the same IO
object for reading at various offsets.

    f = File.open('t.txt')
    f.read # => "First line\nSecond line\n\nFourth line\nFifth line\n"
    f.pos  # => 52
    # Read 12 bytes at offset 0.
    f.pread(12, 0) # => "First line\n"
    # Read 9 bytes at offset 8.
    f.pread(9, 8)  # => "ne\nSecon"
    f.close

Not available on some platforms.

**@overload** [] 

**@overload** [] 

## pressed?(k) [](#method-i-pressed?)
Returns `true` if `key` is pressed.  `key` may be a virtual key code or its
name (String or Symbol) with out "VK_" prefix.

This method is Windows only.

You must require 'io/console' to use this method.

**@overload** [] 

## print(*args) [](#method-i-print)
Writes the given objects to the stream; returns `nil`. Appends the output
record separator `$OUTPUT_RECORD_SEPARATOR` (`$\`), if it is not `nil`. See
[Line IO](rdoc-ref:IO@Line+IO).

With argument `objects` given, for each object:

*   Converts via its method `to_s` if not a string.
*   Writes to the stream.
*   If not the last object, writes the output field separator
    `$OUTPUT_FIELD_SEPARATOR` (`$,`) if it is not `nil`.

With default separators:

    f = File.open('t.tmp', 'w+')
    objects = [0, 0.0, Rational(0, 1), Complex(0, 0), :zero, 'zero']
    p $OUTPUT_RECORD_SEPARATOR
    p $OUTPUT_FIELD_SEPARATOR
    f.print(*objects)
    f.rewind
    p f.read
    f.close

Output:

    nil
    nil
    "00.00/10+0izerozero"

With specified separators:

    $\ = "\n"
    $, = ','
    f.rewind
    f.print(*objects)
    f.rewind
    p f.read

Output:

    "0,0.0,0/1,0+0i,zero,zero\n"

With no argument given, writes the content of `$_` (which is usually the most
recent user input):

    f = File.open('t.tmp', 'w+')
    gets # Sets $_ to the most recent user input.
    f.print
    f.close

**@overload** [] 

## printf(*args) [](#method-i-printf)
Formats and writes `objects` to the stream.

For details on `format_string`, see [Format
Specifications](rdoc-ref:format_specifications.rdoc).

**@overload** [] 

## putc(ch) [](#method-i-putc)
Writes a character to the stream. See [Character
IO](rdoc-ref:IO@Character+IO).

If `object` is numeric, converts to integer if necessary, then writes the
character whose code is the least significant byte; if `object` is a string,
writes the first character:

    $stdout.putc "A"
    $stdout.putc 65

Output:

    AA

**@overload** [] 

## puts(*args) [](#method-i-puts)
Writes the given `objects` to the stream, which must be open for writing;
returns `nil`.\ Writes a newline after each that does not already end with a
newline sequence. If called without arguments, writes a newline. See [Line
IO](rdoc-ref:IO@Line+IO).

Note that each added newline is the character `"\n"<//tt>, not the output
record separator (<tt>$\`).

Treatment for each object:

*   String: writes the string.
*   Neither string nor array: writes `object.to_s`.
*   Array: writes each element of the array; arrays may be nested.

To keep these examples brief, we define this helper method:

    def show(*objects)
      # Puts objects to file.
      f = File.new('t.tmp', 'w+')
      f.puts(objects)
      # Return file content.
      f.rewind
      p f.read
      f.close
    end

    # Strings without newlines.
    show('foo', 'bar', 'baz')     # => "foo\nbar\nbaz\n"
    # Strings, some with newlines.
    show("foo\n", 'bar', "baz\n") # => "foo\nbar\nbaz\n"

    # Neither strings nor arrays:
    show(0, 0.0, Rational(0, 1), Complex(9, 0), :zero)
    # => "0\n0.0\n0/1\n9+0i\nzero\n"

    # Array of strings.
    show(['foo', "bar\n", 'baz']) # => "foo\nbar\nbaz\n"
    # Nested arrays.
    show([[[0, 1], 2, 3], 4, 5])  # => "0\n1\n2\n3\n4\n5\n"

**@overload** [] 

## pwrite(str, offset) [](#method-i-pwrite)
Behaves like IO#write, except that it:

*   Writes at the given `offset` (in bytes).
*   Disregards, and does not modify, the stream's position (see
    [Position](rdoc-ref:IO@Position)).
*   Bypasses any user space buffering in the stream.

Because this method does not disturb the stream's state (its position, in
particular), `pwrite` allows multiple threads and processes to use the same IO
object for writing at various offsets.

    f = File.open('t.tmp', 'w+')
    # Write 6 bytes at offset 3.
    f.pwrite('ABCDEF', 3) # => 6
    f.rewind
    f.read # => "\u0000\u0000\u0000ABCDEF"
    f.close

Not available on some platforms.

**@overload** [] 

## raw(*args) [](#method-i-raw)
Yields `self` within raw mode, and returns the result of the block.

    STDIN.raw(&:gets)

will read and return a line without echo back and line editing.

The parameter `min` specifies the minimum number of bytes that should be
received when a read operation is performed. (default: 1)

The parameter `time` specifies the timeout in *seconds* with a precision of
1/10 of a second. (default: 0)

If the parameter `intr` is `true`, enables break, interrupt, quit, and suspend
special characters.

Refer to the manual page of termios for further details.

You must require 'io/console' to use this method.

**@overload** [] 

## raw!(*args) [](#method-i-raw!)
Enables raw mode, and returns `io`.

If the terminal mode needs to be back, use `io.raw { ... }`.

See IO#raw for details on the parameters.

You must require 'io/console' to use this method.

**@overload** [] 

## read(*args) [](#method-i-read)
Reads bytes from the stream; the stream must be opened for reading (see
[Access Modes](rdoc-ref:File@Access+Modes)):

*   If `maxlen` is `nil`, reads all bytes using the stream's data mode.
*   Otherwise reads up to `maxlen` bytes in binary mode.

Returns a string (either a new string or the given `out_string`) containing
the bytes read. The encoding of the string depends on both `maxLen` and
`out_string`:

*   `maxlen` is `nil`: uses internal encoding of `self` (regardless of whether
    `out_string` was given).
*   `maxlen` not `nil`:

    *   `out_string` given: encoding of `out_string` not modified.
    *   `out_string` not given: ASCII-8BIT is used.

**Without Argument `out_string`**

When argument `out_string` is omitted, the returned value is a new string:

    f = File.new('t.txt')
    f.read
    # => "First line\nSecond line\n\nFourth line\nFifth line\n"
    f.rewind
    f.read(30) # => "First line\r\nSecond line\r\n\r\nFou"
    f.read(30) # => "rth line\r\nFifth line\r\n"
    f.read(30) # => nil
    f.close

If `maxlen` is zero, returns an empty string.

** With Argument `out_string`**

When argument `out_string` is given, the returned value is `out_string`, whose
content is replaced:

    f = File.new('t.txt')
    s = 'foo'      # => "foo"
    f.read(nil, s) # => "First line\nSecond line\n\nFourth line\nFifth line\n"
    s              # => "First line\nSecond line\n\nFourth line\nFifth line\n"
    f.rewind
    s = 'bar'
    f.read(30, s)  # => "First line\r\nSecond line\r\n\r\nFou"
    s              # => "First line\r\nSecond line\r\n\r\nFou"
    s = 'baz'
    f.read(30, s)  # => "rth line\r\nFifth line\r\n"
    s              # => "rth line\r\nFifth line\r\n"
    s = 'bat'
    f.read(30, s)  # => nil
    s              # => ""
    f.close

Note that this method behaves like the fread() function in C. This means it
retries to invoke read(2) system calls to read data with the specified maxlen
(or until EOF).

This behavior is preserved even if the stream is in non-blocking mode. (This
method is non-blocking-flag insensitive as other methods.)

If you need the behavior like a single read(2) system call, consider
#readpartial, #read_nonblock, and #sysread.

Related: IO#write.

**@overload** [] 

## read_nonblock(len, bufnil, exception:true) [](#method-i-read_nonblock)
call-seq:
    ios.read_nonblock(maxlen [, options])              -> string
    ios.read_nonblock(maxlen, outbuf [, options])      -> outbuf

Reads at most *maxlen* bytes from *ios* using the read(2) system call after
O_NONBLOCK is set for the underlying file descriptor.

If the optional *outbuf* argument is present, it must reference a String,
which will receive the data. The *outbuf* will contain only the received data
after the method call even if it is not empty at the beginning.

read_nonblock just calls the read(2) system call. It causes all errors the
read(2) system call causes: Errno::EWOULDBLOCK, Errno::EINTR, etc. The caller
should care such errors.

If the exception is Errno::EWOULDBLOCK or Errno::EAGAIN, it is extended by
IO::WaitReadable. So IO::WaitReadable can be used to rescue the exceptions for
retrying read_nonblock.

read_nonblock causes EOFError on EOF.

On some platforms, such as Windows, non-blocking mode is not supported on IO
objects other than sockets. In such cases, Errno::EBADF will be raised.

If the read byte buffer is not empty, read_nonblock reads from the buffer like
readpartial. In this case, the read(2) system call is not called.

When read_nonblock raises an exception kind of IO::WaitReadable, read_nonblock
should not be called until io is readable for avoiding busy loop. This can be
done as follows.

    # emulates blocking read (readpartial).
    begin
      result = io.read_nonblock(maxlen)
    rescue IO::WaitReadable
      IO.select([io])
      retry
    end

Although IO#read_nonblock doesn't raise IO::WaitWritable.
OpenSSL::Buffering#read_nonblock can raise IO::WaitWritable. If IO and SSL
should be used polymorphically, IO::WaitWritable should be rescued too. See
the document of OpenSSL::Buffering#read_nonblock for sample code.

Note that this method is identical to readpartial except the non-blocking flag
is set.

By specifying a keyword argument *exception* to `false`, you can indicate that
read_nonblock should not raise an IO::WaitReadable exception, but return the
symbol `:wait_readable` instead. At EOF, it will return nil instead of raising
EOFError.

## readbyte() [](#method-i-readbyte)
Reads and returns the next byte (in range 0..255) from the stream; raises
EOFError if already at end-of-stream. See [Byte IO](rdoc-ref:IO@Byte+IO).

    f = File.open('t.txt')
    f.readbyte # => 70
    f.close
    f = File.open('t.rus')
    f.readbyte # => 209
    f.close

Related: IO#getbyte (will not raise EOFError).

**@overload** [] 

## readchar() [](#method-i-readchar)
Reads and returns the next 1-character string from the stream; raises EOFError
if already at end-of-stream. See [Character IO](rdoc-ref:IO@Character+IO).

    f = File.open('t.txt')
    f.readchar     # => "F"
    f.close
    f = File.open('t.rus')
    f.readchar.ord # => 1090
    f.close

Related:  IO#getc (will not raise EOFError).

**@overload** [] 

## readline(sep$/, limitnil, chomp:false) [](#method-i-readline)
call-seq:
    readline(sep = $/, chomp: false)   -> string
    readline(limit, chomp: false)      -> string
    readline(sep, limit, chomp: false) -> string

Reads a line as with IO#gets, but raises EOFError if already at end-of-stream.

Optional keyword argument `chomp` specifies whether line separators are to be
omitted.

## readlines(*args) [](#method-i-readlines)
Reads and returns all remaining line from the stream; does not modify `$_`.
See [Line IO](rdoc-ref:IO@Line+IO).

With no arguments given, returns lines as determined by line separator `$/`,
or `nil` if none:

    f = File.new('t.txt')
    f.readlines
    # => ["First line\n", "Second line\n", "\n", "Fourth line\n", "Fifth line\n"]
    f.readlines # => []
    f.close

With only string argument `sep` given, returns lines as determined by line
separator `sep`, or `nil` if none; see [Line
Separator](rdoc-ref:IO@Line+Separator):

    f = File.new('t.txt')
    f.readlines('li')
    # => ["First li", "ne\nSecond li", "ne\n\nFourth li", "ne\nFifth li", "ne\n"]
    f.close

The two special values for `sep` are honored:

    f = File.new('t.txt')
    # Get all into one string.
    f.readlines(nil)
    # => ["First line\nSecond line\n\nFourth line\nFifth line\n"]
    # Get paragraphs (up to two line separators).
    f.rewind
    f.readlines('')
    # => ["First line\nSecond line\n\n", "Fourth line\nFifth line\n"]
    f.close

With only integer argument `limit` given, limits the number of bytes in each
line; see [Line Limit](rdoc-ref:IO@Line+Limit):

    f = File.new('t.txt')
    f.readlines(8)
    # => ["First li", "ne\n", "Second l", "ine\n", "\n", "Fourth l", "ine\n", "Fifth li", "ne\n"]
    f.close

With arguments `sep` and `limit` given, combines the two behaviors (see [Line
Separator and Line Limit](rdoc-ref:IO@Line+Separator+and+Line+Limit)).

Optional keyword argument `chomp` specifies whether line separators are to be
omitted:

    f = File.new('t.txt')
    f.readlines(chomp: true)
    # => ["First line", "Second line", "", "Fourth line", "Fifth line"]
    f.close

**@overload** [] 

**@overload** [] 

**@overload** [] 

## readpartial(*args) [](#method-i-readpartial)
Reads up to `maxlen` bytes from the stream; returns a string (either a new
string or the given `out_string`). Its encoding is:

*   The unchanged encoding of `out_string`, if `out_string` is given.
*   ASCII-8BIT, otherwise.

*   Contains `maxlen` bytes from the stream, if available.
*   Otherwise contains all available bytes, if any available.
*   Otherwise is an empty string.

With the single non-negative integer argument `maxlen` given, returns a new
string:

    f = File.new('t.txt')
    f.readpartial(20) # => "First line\nSecond l"
    f.readpartial(20) # => "ine\n\nFourth line\n"
    f.readpartial(20) # => "Fifth line\n"
    f.readpartial(20) # Raises EOFError.
    f.close

With both argument `maxlen` and string argument `out_string` given, returns
modified `out_string`:

    f = File.new('t.txt')
    s = 'foo'
    f.readpartial(20, s) # => "First line\nSecond l"
    s = 'bar'
    f.readpartial(0, s)  # => ""
    f.close

This method is useful for a stream such as a pipe, a socket, or a tty. It
blocks only when no data is immediately available. This means that it blocks
only when *all* of the following are true:

*   The byte buffer in the stream is empty.
*   The content of the stream is empty.
*   The stream is not at EOF.

When blocked, the method waits for either more data or EOF on the stream:

*   If more data is read, the method returns the data.
*   If EOF is reached, the method raises EOFError.

When not blocked, the method responds immediately:

*   Returns data from the buffer if there is any.
*   Otherwise returns data from the stream if there is any.
*   Otherwise raises EOFError if the stream has reached EOF.

Note that this method is similar to sysread. The differences are:

*   If the byte buffer is not empty, read from the byte buffer instead of
    "sysread for buffered IO (IOError)".
*   It doesn't cause Errno::EWOULDBLOCK and Errno::EINTR.  When readpartial
    meets EWOULDBLOCK and EINTR by read system call, readpartial retries the
    system call.

The latter means that readpartial is non-blocking-flag insensitive. It blocks
on the situation IO#sysread causes Errno::EWOULDBLOCK as if the fd is blocking
mode.

Examples:

    #                        # Returned      Buffer Content    Pipe Content
    r, w = IO.pipe           #
    w << 'abc'               #               ""                "abc".
    r.readpartial(4096)      # => "abc"      ""                ""
    r.readpartial(4096)      # (Blocks because buffer and pipe are empty.)

    #                        # Returned      Buffer Content    Pipe Content
    r, w = IO.pipe           #
    w << 'abc'               #               ""                "abc"
    w.close                  #               ""                "abc" EOF
    r.readpartial(4096)      # => "abc"      ""                 EOF
    r.readpartial(4096)      # raises EOFError

    #                        # Returned      Buffer Content    Pipe Content
    r, w = IO.pipe           #
    w << "abc\ndef\n"        #               ""                "abc\ndef\n"
    r.gets                   # => "abc\n"    "def\n"           ""
    w << "ghi\n"             #               "def\n"           "ghi\n"
    r.readpartial(4096)      # => "def\n"    ""                "ghi\n"
    r.readpartial(4096)      # => "ghi\n"    ""                ""

**@overload** [] 

**@overload** [] 

## ready?() [](#method-i-ready?)
Returns a truthy value if input available without blocking, or a falsy value.

You must require 'io/wait' to use this method.

**@overload** [] 

**@return** [Boolean] 

## reduce(*args) [](#method-i-reduce)
Returns the result of applying a reducer to an initial value and the first
element of the Enumerable. It then takes the result and applies the function
to it and the second element of the collection, and so on. The return value is
the result returned by the final call to the function.

You can think of

    [ a, b, c, d ].inject(i) { |r, v| fn(r, v) }

as being

    fn(fn(fn(fn(i, a), b), c), d)

In a way the `inject` function *injects* the function between the elements of
the enumerable.

`inject` is aliased as `reduce`. You use it when you want to *reduce* a
collection to a single value.

**The Calling Sequences**

Let's start with the most verbose:

    enum.inject(initial_value) do |result, next_value|
      # do something with +result+ and +next_value+
      # the value returned by the block becomes the
      # value passed in to the next iteration
      # as +result+
    end

For example:

    product = [ 2, 3, 4 ].inject(1) do |result, next_value|
      result * next_value
    end
    product #=> 24

When this runs, the block is first called with `1` (the initial value) and `2`
(the first element of the array). The block returns `1*2`, so on the next
iteration the block is called with `2` (the previous result) and `3`. The
block returns `6`, and is called one last time with `6` and `4`. The result of
the block, `24` becomes the value returned by `inject`. This code returns the
product of the elements in the enumerable.

**First Shortcut: Default Initial value**

In the case of the previous example, the initial value, `1`, wasn't really
necessary: the calculation of the product of a list of numbers is
self-contained.

In these circumstances, you can omit the `initial_value` parameter. `inject`
will then initially call the block with the first element of the collection as
the `result` parameter and the second element as the `next_value`.

    [ 2, 3, 4 ].inject do |result, next_value|
      result * next_value
    end

This shortcut is convenient, but can only be used when the block produces a
result which can be passed back to it as a first parameter.

Here's an example where that's not the case: it returns a hash where the keys
are words and the values are the number of occurrences of that word in the
enumerable.

    freqs = File.read("README.md")
      .scan(/\w{2,}/)
      .reduce(Hash.new(0)) do |counts, word|
        counts[word] += 1
        counts
      end
    freqs #=> {"Actions"=>4,
               "Status"=>5,
               "MinGW"=>3,
               "https"=>27,
               "github"=>10,
               "com"=>15, ...

Note that the last line of the block is just the word `counts`. This ensures
the return value of the block is the result that's being calculated.

**Second Shortcut: a Reducer function**

A *reducer function* is a function that takes a partial result and the next
value, returning the next partial result. The block that is given to `inject`
is a reducer.

You can also write a reducer as a function and pass the name of that function
(as a symbol) to `inject`. However, for this to work, the function

1.  Must be defined on the type of the result value
2.  Must accept a single parameter, the next value in the collection, and
3.  Must return an updated result which will also implement the function.

Here's an example that adds elements to a string. The two calls invoke the
functions String#concat and String#+ on the result so far, passing it the next
value.

    s = [ "cat", " ", "dog" ].inject("", :concat)
    s #=> "cat dog"
    s = [ "cat", " ", "dog" ].inject("The result is:", :+)
    s #=> "The result is: cat dog"

Here's a more complex example when the result object maintains state of a
different type to the enumerable elements.

    class Turtle

      def initialize
        @x = @y = 0
      end

      def move(dir)
        case dir
        when "n" then @y += 1
        when "s" then @y -= 1
        when "e" then @x += 1
        when "w" then @x -= 1
        end
        self
      end
    end

    position = "nnneesw".chars.reduce(Turtle.new, :move)
    position  #=>> #<Turtle:0x00000001052f4698 @y=2, @x=1>

**Third Shortcut: Reducer With no Initial Value**

If your reducer returns a value that it can accept as a parameter, then you
don't have to pass in an initial value. Here `:*` is the name of the *times*
function:

    product = [ 2, 3, 4 ].inject(:*)
    product # => 24

String concatenation again:

    s = [ "cat", " ", "dog" ].inject(:+)
    s #=> "cat dog"

And an example that converts a hash to an array of two-element subarrays.

    nested = {foo: 0, bar: 1}.inject([], :push)
    nested # => [[:foo, 0], [:bar, 1]]

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## reject() [](#method-i-reject)
Returns an array of objects rejected by the block.

With a block given, calls the block with successive elements; returns an array
of those elements for which the block returns `nil` or `false`:

    (0..9).reject {|i| i * 2 if i.even? }                             # => [1, 3, 5, 7, 9]
    {foo: 0, bar: 1, baz: 2}.reject {|key, value| key if value.odd? } # => {:foo=>0, :baz=>2}

When no block given, returns an Enumerator.

Related: #select.

**@overload** [] 

**@overload** [] 

## reopen(*args) [](#method-i-reopen)
Reassociates the stream with another stream, which may be of a different
class. This method may be used to redirect an existing stream to a new
destination.

With argument `other_io` given, reassociates with that stream:

    # Redirect $stdin from a file.
    f = File.open('t.txt')
    $stdin.reopen(f)
    f.close

    # Redirect $stdout to a file.
    f = File.open('t.tmp', 'w')
    $stdout.reopen(f)
    f.close

With argument `path` given, reassociates with a new stream to that file path:

    $stdin.reopen('t.txt')
    $stdout.reopen('t.tmp', 'w')

Optional keyword arguments `opts` specify:

*   [Open Options](rdoc-ref:IO@Open+Options).
*   [Encoding options](rdoc-ref:encodings.rdoc@Encoding+Options).

**@overload** [] 

**@overload** [] 

## reverse_each(*args) [](#method-i-reverse_each)
With a block given, calls the block with each element, but in reverse order;
returns `self`:

    a = []
    (1..4).reverse_each {|element| a.push(-element) } # => 1..4
    a # => [-4, -3, -2, -1]

    a = []
    %w[a b c d].reverse_each {|element| a.push(element) }
    # => ["a", "b", "c", "d"]
    a # => ["d", "c", "b", "a"]

    a = []
    h.reverse_each {|element| a.push(element) }
    # => {:foo=>0, :bar=>1, :baz=>2}
    a # => [[:baz, 2], [:bar, 1], [:foo, 0]]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## rewind() [](#method-i-rewind)
Repositions the stream to its beginning, setting both the position and the
line number to zero; see [Position](rdoc-ref:IO@Position) and [Line
Number](rdoc-ref:IO@Line+Number):

    f = File.open('t.txt')
    f.tell     # => 0
    f.lineno   # => 0
    f.gets     # => "First line\n"
    f.tell     # => 12
    f.lineno   # => 1
    f.rewind   # => 0
    f.tell     # => 0
    f.lineno   # => 0
    f.close

Note that this method cannot be used with streams such as pipes, ttys, and
sockets.

**@overload** [] 

## scroll_backward(val) [](#method-i-scroll_backward)
Scrolls the entire scrolls backward `n` lines.

You must require 'io/console' to use this method.

**@overload** [] 

## scroll_forward(val) [](#method-i-scroll_forward)
Scrolls the entire scrolls forward `n` lines.

You must require 'io/console' to use this method.

**@overload** [] 

## seek(*args) [](#method-i-seek)
Seeks to the position given by integer `offset` (see
[Position](rdoc-ref:IO@Position)) and constant `whence`, which is one of:

*   `:CUR` or `IO::SEEK_CUR`: Repositions the stream to its current position
    plus the given `offset`:

        f = File.open('t.txt')
        f.tell            # => 0
        f.seek(20, :CUR)  # => 0
        f.tell            # => 20
        f.seek(-10, :CUR) # => 0
        f.tell            # => 10
        f.close

*   `:END` or `IO::SEEK_END`: Repositions the stream to its end plus the given
    `offset`:

        f = File.open('t.txt')
        f.tell            # => 0
        f.seek(0, :END)   # => 0  # Repositions to stream end.
        f.tell            # => 52
        f.seek(-20, :END) # => 0
        f.tell            # => 32
        f.seek(-40, :END) # => 0
        f.tell            # => 12
        f.close

*   `:SET` or `IO:SEEK_SET`: Repositions the stream to the given `offset`:

        f = File.open('t.txt')
        f.tell            # => 0
        f.seek(20, :SET) # => 0
        f.tell           # => 20
        f.seek(40, :SET) # => 0
        f.tell           # => 40
        f.close

Related: IO#pos=, IO#tell.

**@overload** [] 

## select() [](#method-i-select)
Returns an array containing elements selected by the block.

With a block given, calls the block with successive elements; returns an array
of those elements for which the block returns a truthy value:

    (0..9).select {|element| element % 3 == 0 } # => [0, 3, 6, 9]
    a = {foo: 0, bar: 1, baz: 2}.select {|key, value| key.start_with?('b') }
    a # => {:bar=>1, :baz=>2}

With no block given, returns an Enumerator.

Related: #reject.

**@overload** [] 

**@overload** [] 

## set_encoding(*args) [](#method-i-set_encoding)
See [Encodings](rdoc-ref:File@Encodings).

Argument `ext_enc`, if given, must be an Encoding object or a String with the
encoding name; it is assigned as the encoding for the stream.

Argument `int_enc`, if given, must be an Encoding object or a String with the
encoding name; it is assigned as the encoding for the internal string.

Argument `'ext_enc:int_enc'`, if given, is a string containing two
colon-separated encoding names; corresponding Encoding objects are assigned as
the external and internal encodings for the stream.

If the external encoding of a string is binary/ASCII-8BIT, the internal
encoding of the string is set to nil, since no transcoding is needed.

Optional keyword arguments `enc_opts` specify [Encoding
options](rdoc-ref:encodings.rdoc@Encoding+Options).

**@overload** [] 

**@overload** [] 

**@overload** [] 

## set_encoding_by_bom() [](#method-i-set_encoding_by_bom)
If the stream begins with a BOM ([byte order
marker](https://en.wikipedia.org/wiki/Byte_order_mark)), consumes the BOM and
sets the external encoding accordingly; returns the result encoding if found,
or `nil` otherwise:

    File.write('t.tmp', "\u{FEFF}abc")
    io = File.open('t.tmp', 'rb')
    io.set_encoding_by_bom # => #<Encoding:UTF-8>
    io.close

    File.write('t.tmp', 'abc')
    io = File.open('t.tmp', 'rb')
    io.set_encoding_by_bom # => nil
    io.close

Raises an exception if the stream is not binmode or its encoding has already
been set.

**@overload** [] 

## slice_after(*args) [](#method-i-slice_after)
Creates an enumerator for each chunked elements. The ends of chunks are
defined by *pattern* and the block.

If *`pattern* === *elt`* returns `true` or the block returns `true` for the
element, the element is end of a chunk.

The `===` and *block* is called from the first element to the last element of
*enum*.

The result enumerator yields the chunked elements as an array. So `each`
method can be called as follows:

    enum.slice_after(pattern).each { |ary| ... }
    enum.slice_after { |elt| bool }.each { |ary| ... }

Other methods of the Enumerator class and Enumerable module, such as `map`,
etc., are also usable.

For example, continuation lines (lines end with backslash) can be concatenated
as follows:

    lines = ["foo\n", "bar\\\n", "baz\n", "\n", "qux\n"]
    e = lines.slice_after(/(?<!\\)\n\z/)
    p e.to_a
    #=> [["foo\n"], ["bar\\\n", "baz\n"], ["\n"], ["qux\n"]]
    p e.map {|ll| ll[0...-1].map {|l| l.sub(/\\\n\z/, "") }.join + ll.last }
    #=>["foo\n", "barbaz\n", "\n", "qux\n"]

**@overload** [] 

**@overload** [] 

## slice_before(*args) [](#method-i-slice_before)
With argument `pattern`, returns an enumerator that uses the pattern to
partition elements into arrays ("slices"). An element begins a new slice if
`element === pattern` (or if it is the first element).

    a = %w[foo bar fop for baz fob fog bam foy]
    e = a.slice_before(/ba/) # => #<Enumerator: ...>
    e.each {|array| p array }

Output:

    ["foo"]
    ["bar", "fop", "for"]
    ["baz", "fob", "fog"]
    ["bam", "foy"]

With a block, returns an enumerator that uses the block to partition elements
into arrays. An element begins a new slice if its block return is a truthy
value (or if it is the first element):

    e = (1..20).slice_before {|i| i % 4 == 2 } # => #<Enumerator: ...>
    e.each {|array| p array }

Output:

    [1]
    [2, 3, 4, 5]
    [6, 7, 8, 9]
    [10, 11, 12, 13]
    [14, 15, 16, 17]
    [18, 19, 20]

Other methods of the Enumerator class and Enumerable module, such as `to_a`,
`map`, etc., are also usable.

For example, iteration over ChangeLog entries can be implemented as follows:

    # iterate over ChangeLog entries.
    open("ChangeLog") { |f|
      f.slice_before(/\A\S/).each { |e| pp e }
    }

    # same as above.  block is used instead of pattern argument.
    open("ChangeLog") { |f|
      f.slice_before { |line| /\A\S/ === line }.each { |e| pp e }
    }

"svn proplist -R" produces multiline output for each file. They can be chunked
as follows:

    IO.popen([{"LC_ALL"=>"C"}, "svn", "proplist", "-R"]) { |f|
      f.lines.slice_before(/\AProp/).each { |lines| p lines }
    }
    #=> ["Properties on '.':\n", "  svn:ignore\n", "  svk:merge\n"]
    #   ["Properties on 'goruby.c':\n", "  svn:eol-style\n"]
    #   ["Properties on 'complex.c':\n", "  svn:mime-type\n", "  svn:eol-style\n"]
    #   ["Properties on 'regparse.c':\n", "  svn:eol-style\n"]
    #   ...

If the block needs to maintain state over multiple elements, local variables
can be used. For example, three or more consecutive increasing numbers can be
squashed as follows (see `chunk_while` for a better way):

    a = [0, 2, 3, 4, 6, 7, 9]
    prev = a[0]
    p a.slice_before { |e|
      prev, prev2 = e, prev
      prev2 + 1 != e
    }.map { |es|
      es.length <= 2 ? es.join(",") : "#{es.first}-#{es.last}"
    }.join(",")
    #=> "0,2-4,6,7,9"

However local variables should be used carefully if the result enumerator is
enumerated twice or more. The local variables should be initialized for each
enumeration. Enumerator.new can be used to do it.

    # Word wrapping.  This assumes all characters have same width.
    def wordwrap(words, maxwidth)
      Enumerator.new {|y|
        # cols is initialized in Enumerator.new.
        cols = 0
        words.slice_before { |w|
          cols += 1 if cols != 0
          cols += w.length
          if maxwidth < cols
            cols = w.length
            true
          else
            false
          end
        }.each {|ws| y.yield ws }
      }
    end
    text = (1..20).to_a.join(" ")
    enum = wordwrap(text.split(/\s+/), 10)
    puts "-"*10
    enum.each { |ws| puts ws.join(" ") } # first enumeration.
    puts "-"*10
    enum.each { |ws| puts ws.join(" ") } # second enumeration generates same result as the first.
    puts "-"*10
    #=> ----------
    #   1 2 3 4 5
    #   6 7 8 9 10
    #   11 12 13
    #   14 15 16
    #   17 18 19
    #   20
    #   ----------
    #   1 2 3 4 5
    #   6 7 8 9 10
    #   11 12 13
    #   14 15 16
    #   17 18 19
    #   20
    #   ----------

mbox contains series of mails which start with Unix From line. So each mail
can be extracted by slice before Unix From line.

    # parse mbox
    open("mbox") { |f|
      f.slice_before { |line|
        line.start_with? "From "
      }.each { |mail|
        unix_from = mail.shift
        i = mail.index("\n")
        header = mail[0...i]
        body = mail[(i+1)..-1]
        body.pop if body.last == "\n"
        fields = header.slice_before { |line| !" \t".include?(line[0]) }.to_a
        p unix_from
        pp fields
        pp body
      }
    }

    # split mails in mbox (slice before Unix From line after an empty line)
    open("mbox") { |f|
      emp = true
      f.slice_before { |line|
        prevemp = emp
        emp = line == "\n"
        prevemp && line.start_with?("From ")
      }.each { |mail|
        mail.pop if mail.last == "\n"
        pp mail
      }
    }

**@overload** [] 

**@overload** [] 

## slice_when() [](#method-i-slice_when)
Creates an enumerator for each chunked elements. The beginnings of chunks are
defined by the block.

This method splits each chunk using adjacent elements, *elt_before* and
*elt_after*, in the receiver enumerator. This method split chunks between
*elt_before* and *elt_after* where the block returns `true`.

The block is called the length of the receiver enumerator minus one.

The result enumerator yields the chunked elements as an array. So `each`
method can be called as follows:

    enum.slice_when { |elt_before, elt_after| bool }.each { |ary| ... }

Other methods of the Enumerator class and Enumerable module, such as `to_a`,
`map`, etc., are also usable.

For example, one-by-one increasing subsequence can be chunked as follows:

    a = [1,2,4,9,10,11,12,15,16,19,20,21]
    b = a.slice_when {|i, j| i+1 != j }
    p b.to_a #=> [[1, 2], [4], [9, 10, 11, 12], [15, 16], [19, 20, 21]]
    c = b.map {|a| a.length < 3 ? a : "#{a.first}-#{a.last}" }
    p c #=> [[1, 2], [4], "9-12", [15, 16], "19-21"]
    d = c.join(",")
    p d #=> "1,2,4,9-12,15,16,19-21"

Near elements (threshold: 6) in sorted array can be chunked as follows:

    a = [3, 11, 14, 25, 28, 29, 29, 41, 55, 57]
    p a.slice_when {|i, j| 6 < j - i }.to_a
    #=> [[3], [11, 14], [25, 28, 29, 29], [41], [55, 57]]

Increasing (non-decreasing) subsequence can be chunked as follows:

    a = [0, 9, 2, 2, 3, 2, 7, 5, 9, 5]
    p a.slice_when {|i, j| i > j }.to_a
    #=> [[0, 9], [2, 2, 3], [2, 7], [5, 9], [5]]

Adjacent evens and odds can be chunked as follows: (Enumerable#chunk is
another way to do it.)

    a = [7, 5, 9, 2, 0, 7, 9, 4, 2, 0]
    p a.slice_when {|i, j| i.even? != j.even? }.to_a
    #=> [[7, 5, 9], [2, 0], [7, 9], [4, 2, 0]]

Paragraphs (non-empty lines with trailing empty lines) can be chunked as
follows: (See Enumerable#chunk to ignore empty lines.)

    lines = ["foo\n", "bar\n", "\n", "baz\n", "qux\n"]
    p lines.slice_when {|l1, l2| /\A\s*\z/ =~ l1 && /\S/ =~ l2 }.to_a
    #=> [["foo\n", "bar\n", "\n"], ["baz\n", "qux\n"]]

Enumerable#chunk_while does the same, except splitting when the block returns
`false` instead of `true`.

**@overload** [] 

## sort() [](#method-i-sort)
Returns an array containing the sorted elements of `self`. The ordering of
equal elements is indeterminate and may be unstable.

With no block given, the sort compares using the elements' own method `#<=>`:

    %w[b c a d].sort              # => ["a", "b", "c", "d"]
    {foo: 0, bar: 1, baz: 2}.sort # => [[:bar, 1], [:baz, 2], [:foo, 0]]

With a block given, comparisons in the block determine the ordering. The block
is called with two elements `a` and `b`, and must return:

*   A negative integer if `a < b`.
*   Zero if `a == b`.
*   A positive integer if `a > b`.

Examples:

    a = %w[b c a d]
    a.sort {|a, b| b <=> a } # => ["d", "c", "b", "a"]
    h = {foo: 0, bar: 1, baz: 2}
    h.sort {|a, b| b <=> a } # => [[:foo, 0], [:baz, 2], [:bar, 1]]

See also #sort_by. It implements a Schwartzian transform which is useful when
key computation or comparison is expensive.

**@overload** [] 

**@overload** [] 

## sort_by() [](#method-i-sort_by)
With a block given, returns an array of elements of `self`, sorted according
to the value returned by the block for each element. The ordering of equal
elements is indeterminate and may be unstable.

Examples:

    a = %w[xx xxx x xxxx]
    a.sort_by {|s| s.size }        # => ["x", "xx", "xxx", "xxxx"]
    a.sort_by {|s| -s.size }       # => ["xxxx", "xxx", "xx", "x"]
    h = {foo: 2, bar: 1, baz: 0}
    h.sort_by{|key, value| value } # => [[:baz, 0], [:bar, 1], [:foo, 2]]
    h.sort_by{|key, value| key }   # => [[:bar, 1], [:baz, 0], [:foo, 2]]

With no block given, returns an Enumerator.

The current implementation of #sort_by generates an array of tuples containing
the original collection element and the mapped value. This makes #sort_by
fairly expensive when the keysets are simple.

    require 'benchmark'

    a = (1..100000).map { rand(100000) }

    Benchmark.bm(10) do |b|
      b.report("Sort")    { a.sort }
      b.report("Sort by") { a.sort_by { |a| a } }
    end

*produces:*

    user     system      total        real
    Sort        0.180000   0.000000   0.180000 (  0.175469)
    Sort by     1.980000   0.040000   2.020000 (  2.013586)

However, consider the case where comparing the keys is a non-trivial
operation. The following code sorts some files on modification time using the
basic #sort method.

    files = Dir["*"]
    sorted = files.sort { |a, b| File.new(a).mtime <=> File.new(b).mtime }
    sorted   #=> ["mon", "tues", "wed", "thurs"]

This sort is inefficient: it generates two new File objects during every
comparison. A slightly better technique is to use the Kernel#test method to
generate the modification times directly.

    files = Dir["*"]
    sorted = files.sort { |a, b|
      test(?M, a) <=> test(?M, b)
    }
    sorted   #=> ["mon", "tues", "wed", "thurs"]

This still generates many unnecessary Time objects. A more efficient technique
is to cache the sort keys (modification times in this case) before the sort.
Perl users often call this approach a Schwartzian transform, after Randal
Schwartz. We construct a temporary array, where each element is an array
containing our sort key along with the filename. We sort this array, and then
extract the filename from the result.

    sorted = Dir["*"].collect { |f|
       [test(?M, f), f]
    }.sort.collect { |f| f[1] }
    sorted   #=> ["mon", "tues", "wed", "thurs"]

This is exactly what #sort_by does internally.

    sorted = Dir["*"].sort_by { |f| test(?M, f) }
    sorted   #=> ["mon", "tues", "wed", "thurs"]

To produce the reverse of a specific order, the following can be used:

    ary.sort_by { ... }.reverse!

**@overload** [] 

**@overload** [] 

## stat() [](#method-i-stat)
Returns status information for *ios* as an object of type File::Stat.

    f = File.new("testfile")
    s = f.stat
    "%o" % s.mode   #=> "100644"
    s.blksize       #=> 4096
    s.atime         #=> Wed Apr 09 08:53:54 CDT 2003

**@overload** [] 

## sum(*args) [](#method-i-sum)
With no block given, returns the sum of `initial_value` and the elements:

    (1..100).sum          # => 5050
    (1..100).sum(1)       # => 5051
    ('a'..'d').sum('foo') # => "fooabcd"

Generally, the sum is computed using methods `+` and `each`; for performance
optimizations, those methods may not be used, and so any redefinition of those
methods may not have effect here.

One such optimization: When possible, computes using Gauss's summation formula
*n(n+1)/2*:

    100 * (100 + 1) / 2 # => 5050

With a block given, calls the block with each element; returns the sum of
`initial_value` and the block return values:

    (1..4).sum {|i| i*i }                        # => 30
    (1..4).sum(100) {|i| i*i }                   # => 130
    h = {a: 0, b: 1, c: 2, d: 3, e: 4, f: 5}
    h.sum {|key, value| value.odd? ? value : 0 } # => 9
    ('a'..'f').sum('x') {|c| c < 'd' ? c : '' }  # => "xabc"

**@overload** [] 

**@overload** [] 

## sync() [](#method-i-sync)
Returns the current sync mode of the stream. When sync mode is true, all
output is immediately flushed to the underlying operating system and is not
buffered by Ruby internally. See also #fsync.

    f = File.open('t.tmp', 'w')
    f.sync # => false
    f.sync = true
    f.sync # => true
    f.close

**@overload** [] 

## sync=(sync) [](#method-i-sync=)

## sysread(*args) [](#method-i-sysread)
Behaves like IO#readpartial, except that it uses low-level system functions.

This method should not be used with other stream-reader methods.

**@overload** [] 

**@overload** [] 

## sysseek(*args) [](#method-i-sysseek)
Behaves like IO#seek, except that it:

*   Uses low-level system functions.
*   Returns the new position.

**@overload** [] 

## syswrite(str) [](#method-i-syswrite)
Writes the given `object` to self, which must be opened for writing (see
Modes); returns the number bytes written. If `object` is not a string is
converted via method to_s:

    f = File.new('t.tmp', 'w')
    f.syswrite('foo') # => 3
    f.syswrite(30)    # => 2
    f.syswrite(:foo)  # => 3
    f.close

This methods should not be used with other stream-writer methods.

**@overload** [] 

## take(n) [](#method-i-take)
For non-negative integer `n`, returns the first `n` elements:

    r = (1..4)
    r.take(2) # => [1, 2]
    r.take(0) # => []

    h = {foo: 0, bar: 1, baz: 2, bat: 3}
    h.take(2) # => [[:foo, 0], [:bar, 1]]

**@overload** [] 

## take_while() [](#method-i-take_while)
Calls the block with successive elements as long as the block returns a truthy
value; returns an array of all elements up to that point:

    (1..4).take_while{|i| i < 3 } # => [1, 2]
    h = {foo: 0, bar: 1, baz: 2}
    h.take_while{|element| key, value = *element; value < 2 }
    # => [[:foo, 0], [:bar, 1]]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## tally(*args) [](#method-i-tally)
When argument `hash` is not given, returns a new hash whose keys are the
distinct elements in `self`; each integer value is the count of occurrences of
each element:

    %w[a b c b c a c b].tally # => {"a"=>2, "b"=>3, "c"=>3}

When argument `hash` is given, returns `hash`, possibly augmented; for each
element `ele` in `self`:

*   Adds it as a key with a zero value if that key does not already exist:

        hash[ele] = 0 unless hash.include?(ele)

*   Increments the value of key `ele`:

        hash[ele] += 1

This is useful for accumulating tallies across multiple enumerables:

    h = {}                   # => {}
    %w[a c d b c a].tally(h) # => {"a"=>2, "c"=>2, "d"=>1, "b"=>1}
    %w[b a z].tally(h)       # => {"a"=>3, "c"=>2, "d"=>1, "b"=>2, "z"=>1}
    %w[b a m].tally(h)       # => {"a"=>4, "c"=>2, "d"=>1, "b"=>3, "z"=>1, "m"=>1}

The key to be added or found for an element depends on the class of `self`;
see [Enumerable in Ruby
Classes](rdoc-ref:Enumerable@Enumerable+in+Ruby+Classes).

Examples:

*   Array (and certain array-like classes): the key is the element (as above).
*   Hash (and certain hash-like classes): the key is the 2-element array
    formed from the key-value pair:

        h = {}                        # => {}
        {foo: 'a', bar: 'b'}.tally(h) # => {[:foo, "a"]=>1, [:bar, "b"]=>1}
        {foo: 'c', bar: 'd'}.tally(h) # => {[:foo, "a"]=>1, [:bar, "b"]=>1, [:foo, "c"]=>1, [:bar, "d"]=>1}
        {foo: 'a', bar: 'b'}.tally(h) # => {[:foo, "a"]=>2, [:bar, "b"]=>2, [:foo, "c"]=>1, [:bar, "d"]=>1}
        {foo: 'c', bar: 'd'}.tally(h) # => {[:foo, "a"]=>2, [:bar, "b"]=>2, [:foo, "c"]=>2, [:bar, "d"]=>2}

**@overload** [] 

## tell() [](#method-i-tell)
Returns the current position (in bytes) in `self` (see
[Position](rdoc-ref:IO@Position)):

    f = File.open('t.txt')
    f.tell # => 0
    f.gets # => "First line\n"
    f.tell # => 12
    f.close

Related: IO#pos=, IO#seek.

**@overload** [] 

## timeout() [](#method-i-timeout)
Get the internal timeout duration or nil if it was not set.

**@overload** [] 

## timeout=(timeout) [](#method-i-timeout=)
Sets the internal timeout to the specified duration or nil. The timeout
applies to all blocking operations where possible.

When the operation performs longer than the timeout set, IO::TimeoutError is
raised.

This affects the following methods (but is not limited to): #gets, #puts,
#read, #write, #wait_readable and #wait_writable. This also affects blocking
socket operations like Socket#accept and Socket#connect.

Some operations like File#open and IO#close are not affected by the timeout. A
timeout during a write operation may leave the IO in an inconsistent state,
e.g. data was partially written. Generally speaking, a timeout is a last ditch
effort to prevent an application from hanging on slow I/O operations, such as
those that occur during a slowloris attack.

**@overload** [] 

**@overload** [] 

## to_a(*args) [](#method-i-to_a)
Returns an array containing the items in `self`:

    (0..4).to_a # => [0, 1, 2, 3, 4]

**@overload** [] 

## to_h(*args) [](#method-i-to_h)
When `self` consists of 2-element arrays, returns a hash each of whose entries
is the key-value pair formed from one of those arrays:

    [[:foo, 0], [:bar, 1], [:baz, 2]].to_h # => {:foo=>0, :bar=>1, :baz=>2}

When a block is given, the block is called with each element of `self`; the
block should return a 2-element array which becomes a key-value pair in the
returned hash:

    (0..3).to_h {|i| [i, i ** 2]} # => {0=>0, 1=>1, 2=>4, 3=>9}

Raises an exception if an element of `self` is not a 2-element array, and a
block is not passed.

**@overload** [] 

**@overload** [] 

## to_io() [](#method-i-to_io)
Returns `self`.

**@overload** [] 

## to_path() [](#method-i-to_path)
Returns the path associated with the IO, or `nil` if there is no path
associated with the IO. It is not guaranteed that the path exists on the
filesystem.

    $stdin.path # => "<STDIN>"

    File.open("testfile") {|f| f.path} # => "testfile"

**@overload** [] 

## to_set(klassSet, *args, &block) [](#method-i-to_set)
Makes a set from the enumerable object with given arguments.

## tty?() [](#method-i-tty?)
Returns `true` if the stream is associated with a terminal device (tty),
`false` otherwise:

    f = File.new('t.txt').isatty    #=> false
    f.close
    f = File.new('/dev/tty').isatty #=> true
    f.close

**@overload** [] 

## ttyname() [](#method-i-ttyname)
Returns name of associated terminal (tty) if `io` is not a tty. Returns `nil`
otherwise.

**@overload** [] 

## ungetbyte(b) [](#method-i-ungetbyte)
Pushes back ("unshifts") the given data onto the stream's buffer, placing the
data so that it is next to be read; returns `nil`. See [Byte
IO](rdoc-ref:IO@Byte+IO).

Note that:

*   Calling the method has no effect with unbuffered reads (such as
    IO#sysread).
*   Calling #rewind on the stream discards the pushed-back data.

When argument `integer` is given, uses only its low-order byte:

    File.write('t.tmp', '012')
    f = File.open('t.tmp')
    f.ungetbyte(0x41)   # => nil
    f.read              # => "A012"
    f.rewind
    f.ungetbyte(0x4243) # => nil
    f.read              # => "C012"
    f.close

When argument `string` is given, uses all bytes:

    File.write('t.tmp', '012')
    f = File.open('t.tmp')
    f.ungetbyte('A')    # => nil
    f.read              # => "A012"
    f.rewind
    f.ungetbyte('BCDE') # => nil
    f.read              # => "BCDE012"
    f.close

**@overload** [] 

**@overload** [] 

## ungetc(c) [](#method-i-ungetc)
Pushes back ("unshifts") the given data onto the stream's buffer, placing the
data so that it is next to be read; returns `nil`. See [Character
IO](rdoc-ref:IO@Character+IO).

Note that:

*   Calling the method has no effect with unbuffered reads (such as
    IO#sysread).
*   Calling #rewind on the stream discards the pushed-back data.

When argument `integer` is given, interprets the integer as a character:

    File.write('t.tmp', '012')
    f = File.open('t.tmp')
    f.ungetc(0x41)     # => nil
    f.read             # => "A012"
    f.rewind
    f.ungetc(0x0442)   # => nil
    f.getc.ord         # => 1090
    f.close

When argument `string` is given, uses all characters:

    File.write('t.tmp', '012')
    f = File.open('t.tmp')
    f.ungetc('A')      # => nil
    f.read      # => "A012"
    f.rewind
    f.ungetc("\u0442\u0435\u0441\u0442") # => nil
    f.getc.ord      # => 1090
    f.getc.ord      # => 1077
    f.getc.ord      # => 1089
    f.getc.ord      # => 1090
    f.close

**@overload** [] 

**@overload** [] 

## uniq() [](#method-i-uniq)
With no block, returns a new array containing only unique elements; the array
has no two elements `e0` and `e1` such that `e0.eql?(e1)`:

    %w[a b c c b a a b c].uniq       # => ["a", "b", "c"]
    [0, 1, 2, 2, 1, 0, 0, 1, 2].uniq # => [0, 1, 2]

With a block, returns a new array containing elements only for which the block
returns a unique value:

    a = [0, 1, 2, 3, 4, 5, 5, 4, 3, 2, 1]
    a.uniq {|i| i.even? ? i : 0 } # => [0, 2, 4]
    a = %w[a b c d e e d c b a a b c d e]
    a.uniq {|c| c < 'c' }         # => ["a", "c"]

**@overload** [] 

**@overload** [] 

## wait(*args) [](#method-i-wait)
Waits until the IO becomes ready for the specified events and returns the
subset of events that become ready, or a falsy value when times out.

The events can be a bit mask of `IO::READABLE`, `IO::WRITABLE` or
`IO::PRIORITY`.

Returns a truthy value immediately when buffered data is available.

Optional parameter `mode` is one of `:read`, `:write`, or `:read_write`.

You must require 'io/wait' to use this method.

**@overload** [] 

**@overload** [] 

## wait_priority(*args) [](#method-i-wait_priority)
Waits until IO is priority and returns a truthy value or a falsy value when
times out. Priority data is sent and received using the Socket::MSG_OOB flag
and is typically limited to streams.

You must require 'io/wait' to use this method.

**@overload** [] 

**@overload** [] 

## wait_readable(*args) [](#method-i-wait_readable)
Waits until IO is readable and returns a truthy value, or a falsy value when
times out.  Returns a truthy value immediately when buffered data is
available.

You must require 'io/wait' to use this method.

**@overload** [] 

**@overload** [] 

## wait_writable(*args) [](#method-i-wait_writable)
Waits until IO is writable and returns a truthy value or a falsy value when
times out.

You must require 'io/wait' to use this method.

**@overload** [] 

**@overload** [] 

## winsize() [](#method-i-winsize)
Returns console size.

You must require 'io/console' to use this method.

**@overload** [] 

## winsize=(size) [](#method-i-winsize=)
Tries to set console size.  The effect depends on the platform and the running
environment.

You must require 'io/console' to use this method.

## write(*args) [](#method-i-write)
Writes each of the given `objects` to `self`, which must be opened for writing
(see [Access Modes](rdoc-ref:File@Access+Modes)); returns the total number
bytes written; each of `objects` that is not a string is converted via method
`to_s`:

    $stdout.write('Hello', ', ', 'World!', "\n") # => 14
    $stdout.write('foo', :bar, 2, "\n")          # => 8

Output:

    Hello, World!
    foobar2

Related: IO#read.

**@overload** [] 

## write_nonblock(buf, exception:true) [](#method-i-write_nonblock)
call-seq:
    ios.write_nonblock(string)   -> integer
    ios.write_nonblock(string [, options])   -> integer

Writes the given string to *ios* using the write(2) system call after
O_NONBLOCK is set for the underlying file descriptor.

It returns the number of bytes written.

write_nonblock just calls the write(2) system call. It causes all errors the
write(2) system call causes: Errno::EWOULDBLOCK, Errno::EINTR, etc. The result
may also be smaller than string.length (partial write). The caller should care
such errors and partial write.

If the exception is Errno::EWOULDBLOCK or Errno::EAGAIN, it is extended by
IO::WaitWritable. So IO::WaitWritable can be used to rescue the exceptions for
retrying write_nonblock.

    # Creates a pipe.
    r, w = IO.pipe

    # write_nonblock writes only 65536 bytes and return 65536.
    # (The pipe size is 65536 bytes on this environment.)
    s = "a" * 100000
    p w.write_nonblock(s)     #=> 65536

    # write_nonblock cannot write a byte and raise EWOULDBLOCK (EAGAIN).
    p w.write_nonblock("b")   # Resource temporarily unavailable (Errno::EAGAIN)

If the write buffer is not empty, it is flushed at first.

When write_nonblock raises an exception kind of IO::WaitWritable,
write_nonblock should not be called until io is writable for avoiding busy
loop. This can be done as follows.

    begin
      result = io.write_nonblock(string)
    rescue IO::WaitWritable, Errno::EINTR
      IO.select(nil, [io])
      retry
    end

Note that this doesn't guarantee to write all data in string. The length
written is reported as result and it should be checked later.

On some platforms such as Windows, write_nonblock is not supported according
to the kind of the IO object. In such cases, write_nonblock raises
`Errno::EBADF`.

By specifying a keyword argument *exception* to `false`, you can indicate that
write_nonblock should not raise an IO::WaitWritable exception, but return the
symbol `:wait_writable` instead.

## zip(*args) [](#method-i-zip)
With no block given, returns a new array `new_array` of size self.size whose
elements are arrays. Each nested array `new_array[n]` is of size
`other_enums.size+1`, and contains:

*   The `n`-th element of self.
*   The `n`-th element of each of the `other_enums`.

If all `other_enums` and self are the same size, all elements are included in
the result, and there is no `nil`-filling:

    a = [:a0, :a1, :a2, :a3]
    b = [:b0, :b1, :b2, :b3]
    c = [:c0, :c1, :c2, :c3]
    d = a.zip(b, c)
    d # => [[:a0, :b0, :c0], [:a1, :b1, :c1], [:a2, :b2, :c2], [:a3, :b3, :c3]]

    f = {foo: 0, bar: 1, baz: 2}
    g = {goo: 3, gar: 4, gaz: 5}
    h = {hoo: 6, har: 7, haz: 8}
    d = f.zip(g, h)
    d # => [
      #      [[:foo, 0], [:goo, 3], [:hoo, 6]],
      #      [[:bar, 1], [:gar, 4], [:har, 7]],
      #      [[:baz, 2], [:gaz, 5], [:haz, 8]]
      #    ]

If any enumerable in other_enums is smaller than self, fills to `self.size`
with `nil`:

    a = [:a0, :a1, :a2, :a3]
    b = [:b0, :b1, :b2]
    c = [:c0, :c1]
    d = a.zip(b, c)
    d # => [[:a0, :b0, :c0], [:a1, :b1, :c1], [:a2, :b2, nil], [:a3, nil, nil]]

If any enumerable in other_enums is larger than self, its trailing elements
are ignored:

    a = [:a0, :a1, :a2, :a3]
    b = [:b0, :b1, :b2, :b3, :b4]
    c = [:c0, :c1, :c2, :c3, :c4, :c5]
    d = a.zip(b, c)
    d # => [[:a0, :b0, :c0], [:a1, :b1, :c1], [:a2, :b2, :c2], [:a3, :b3, :c3]]

When a block is given, calls the block with each of the sub-arrays (formed as
above); returns nil:

    a = [:a0, :a1, :a2, :a3]
    b = [:b0, :b1, :b2, :b3]
    c = [:c0, :c1, :c2, :c3]
    a.zip(b, c) {|sub_array| p sub_array} # => nil

Output:

    [:a0, :b0, :c0]
    [:a1, :b1, :c1]
    [:a2, :b2, :c2]
    [:a3, :b3, :c3]

**@overload** [] 

**@overload** [] 

