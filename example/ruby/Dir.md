# Class: Dir
**Inherits:** Object
    
**Includes:** Enumerable
  

An object of class Dir represents a directory in the underlying file system.

It consists mainly of:

*   A string *path*, given when the object is created, that specifies a
    directory in the underlying file system; method #path returns the path.
*   A collection of string *entry names*, each of which is the name of a
    directory or file in the underlying file system; the entry names may be
    retrieved in an [array-like fashion](rdoc-ref:Dir@Dir+As+Array-Like) or in
    a [stream-like fashion](rdoc-ref:Dir@Dir+As+Stream-Like).

## About the Examples

Some examples on this page use this simple file tree:

    example/
    ├── config.h
    ├── lib/
    │   ├── song/
    │   │   └── karaoke.rb
    │   └── song.rb
    └── main.rb

Others use the file tree for the [Ruby project
itself](https://github.com/ruby/ruby).

## Dir As Array-Like

A Dir object is in some ways array-like:

*   It has instance methods #children, #each, and #each_child.
*   It includes [module Enumerable](rdoc-ref:Enumerable@What-27s+Here).

## Dir As Stream-Like

A Dir object is in some ways stream-like.

The stream is initially open for reading, but may be closed manually (using
method #close), and will be closed on block exit if created by Dir.open called
with a block. The closed stream may not be further manipulated, and may not be
reopened.

The stream has a *position*, which is the index of an entry in the directory:

*   The initial position is zero (before the first entry).
*   Method #tell (aliased as #pos) returns the position.
*   Method #pos= sets the position (but ignores a value outside the stream),
    and returns the position.
*   Method #seek is like #pos=, but returns `self` (convenient for chaining).
*   Method #read, if not at end-of-stream, reads the next entry and increments
    the position; if at end-of-stream, does not increment the position.
*   Method #rewind sets the position to zero.

Examples (using the [simple file tree](rdoc-ref:Dir@About+the+Examples)):

    dir = Dir.new('example') # => #<Dir:example>
    dir.pos                  # => 0

    dir.read # => "."
    dir.read # => ".."
    dir.read # => "config.h"
    dir.read # => "lib"
    dir.read # => "main.rb"
    dir.pos  # => 5
    dir.read # => nil
    dir.pos  # => 5

    dir.rewind # => #<Dir:example>
    dir.pos    # => 0

    dir.pos = 3 # => 3
    dir.pos     # => 3

    dir.seek(4) # => #<Dir:example>
    dir.pos     # => 4

    dir.close # => nil
    dir.read  # Raises IOError.

## What's Here

First, what's elsewhere. Class Dir:

*   Inherits from [class Object](rdoc-ref:Object@What-27s+Here).
*   Includes [module Enumerable](rdoc-ref:Enumerable@What-27s+Here), which
    provides dozens of additional methods.

Here, class Dir provides methods that are useful for:

*   [Reading](rdoc-ref:Dir@Reading)
*   [Setting](rdoc-ref:Dir@Setting)
*   [Querying](rdoc-ref:Dir@Querying)
*   [Iterating](rdoc-ref:Dir@Iterating)
*   [Other](rdoc-ref:Dir@Other)

### Reading

*   #close: Closes the directory stream for `self`.
*   #pos=: Sets the position in the directory stream for `self`.
*   #read: Reads and returns the next entry in the directory stream for
    `self`.
*   #rewind: Sets the position in the directory stream for `self` to the first
    entry.
*   #seek: Sets the position in the directory stream for `self` the entry at
    the given offset.

### Setting

*   ::chdir: Changes the working directory of the current process to the given
    directory.
*   ::chroot: Changes the file-system root for the current process to the
    given directory.

### Querying

*   ::[]: Same as ::glob without the ability to pass flags.
*   ::children: Returns an array of names of the children (both files and
    directories) of the given directory, but not including `.` or `..`.
*   ::empty?: Returns whether the given path is an empty directory.
*   ::entries: Returns an array of names of the children (both files and
    directories) of the given directory, including `.` and `..`.
*   ::exist?: Returns whether the given path is a directory.
*   ::getwd (aliased as #pwd): Returns the path to the current working
    directory.
*   ::glob: Returns an array of file paths matching the given pattern and
    flags.
*   ::home: Returns the home directory path for a given user or the current
    user.
*   #children: Returns an array of names of the children (both files and
    directories) of `self`, but not including `.` or `..`.
*   #fileno: Returns the integer file descriptor for `self`.
*   #path (aliased as #to_path): Returns the path used to create `self`.
*   #tell (aliased as #pos): Returns the integer position in the directory
    stream for `self`.

### Iterating

*   ::each_child: Calls the given block with each entry in the given
    directory, but not including `.` or `..`.
*   ::foreach: Calls the given block with each entry in the given directory,
    including `.` and `..`.
*   #each: Calls the given block with each entry in `self`, including `.` and
    `..`.
*   #each_child: Calls the given block with each entry in `self`, but not
    including `.` or `..`.

### Other

*   ::mkdir: Creates a directory at the given path, with optional permissions.
*   ::new: Returns a new Dir for the given path, with optional encoding.
*   ::open: Same as ::new, but if a block is given, yields the Dir to the
    block, closing it upon block exit.
*   ::unlink (aliased as ::delete and ::rmdir): Removes the given directory.
*   #inspect: Returns a string description of `self`.


# Class Methods
## [](*args , base: nil, sort: true) [](#method-c-[])
call-seq:
    Dir[*patterns, base: nil, sort: true] -> array

Calls Dir.glob with argument `patterns` and the values of keyword arguments
`base` and `sort`; returns the array of selected entry names.
## chdir(*args ) [](#method-c-chdir)
Changes the current working directory.

With argument `new_dirpath` and no block, changes to the given `dirpath`:

    Dir.pwd         # => "/example"
    Dir.chdir('..') # => 0
    Dir.pwd         # => "/"

With no argument and no block:

*   Changes to the value of environment variable `HOME` if defined.
*   Otherwise changes to the value of environment variable `LOGDIR` if
    defined.
*   Otherwise makes no change.

With argument `new_dirpath` and a block, temporarily changes the working
directory:

*   Calls the block with the argument.
*   Changes to the given directory.
*   Executes the block (yielding the new path).
*   Restores the previous working directory.
*   Returns the block's return value.

Example:

    Dir.chdir('/var/spool/mail')
    Dir.pwd   # => "/var/spool/mail"
    Dir.chdir('/tmp') do
      Dir.pwd # => "/tmp"
    end
    Dir.pwd   # => "/var/spool/mail"

With no argument and a block, calls the block with the current working
directory (string) and returns the block's return value.

Calls to Dir.chdir with blocks may be nested:

    Dir.chdir('/var/spool/mail')
    Dir.pwd     # => "/var/spool/mail"
    Dir.chdir('/tmp') do
      Dir.pwd   # => "/tmp"
      Dir.chdir('/usr') do
        Dir.pwd # => "/usr"
      end
      Dir.pwd   # => "/tmp"
    end
    Dir.pwd     # => "/var/spool/mail"

In a multi-threaded program an error is raised if a thread attempts to open a
`chdir` block while another thread has one open, or a call to `chdir` without
a block occurs inside a block passed to `chdir` (even in the same thread).

Raises an exception if the target directory does not exist.
**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## children(*args ) [](#method-c-children)
Returns an array of the entry names in the directory at `dirpath` except for
`'.'` and `'..'`; sets the given encoding onto each returned entry name:

    Dir.children('/example') # => ["config.h", "lib", "main.rb"]
    Dir.children('/example').first.encoding
    # => #<Encoding:UTF-8>
    Dir.children('/example', encoding: 'US-ASCII').first.encoding
    # => #<Encoding:US-ASCII>

See [String Encoding](rdoc-ref:encodings.rdoc@String+Encoding).

Raises an exception if the directory does not exist.
**@overload** [] 

**@overload** [] 

## chroot(path ) [](#method-c-chroot)
Changes the root directory of the calling process to that specified in
`dirpath`. The new root directory is used for pathnames beginning with `'/'`.
The root directory is inherited by all children of the calling process.

Only a privileged process may call `chroot`.

See [Linux chroot](https://man7.org/linux/man-pages/man2/chroot.2.html).
**@overload** [] 

## delete(dir ) [](#method-c-delete)
Removes the directory at `dirpath` from the underlying file system:

    Dir.rmdir('foo') # => 0

Raises an exception if the directory is not empty.
**@overload** [] 

## each_child(*args ) [](#method-c-each_child)
Like Dir.foreach, except that entries `'.'` and `'..'` are not included.
**@overload** [] 

**@overload** [] 

## empty?(dirname ) [](#method-c-empty?)
Returns whether `dirpath` specifies an empty directory:

    dirpath = '/tmp/foo'
    Dir.mkdir(dirpath)
    Dir.empty?(dirpath)            # => true
    Dir.empty?('/example')         # => false
    Dir.empty?('/example/main.rb') # => false

Raises an exception if `dirpath` does not specify a directory or file in the
underlying file system.
**@overload** [] 

## entries(*args ) [](#method-c-entries)
Returns an array of the entry names in the directory at `dirpath`; sets the
given encoding onto each returned entry name:

    Dir.entries('/example') # => ["config.h", "lib", "main.rb", "..", "."]
    Dir.entries('/example').first.encoding
    # => #<Encoding:UTF-8>
    Dir.entries('/example', encoding: 'US-ASCII').first.encoding
    # => #<Encoding:US-ASCII>

See [String Encoding](rdoc-ref:encodings.rdoc@String+Encoding).

Raises an exception if the directory does not exist.
**@overload** [] 

## exist?() [](#method-c-exist?)
Returns whether `dirpath` is a directory in the underlying file system:

    Dir.exist?('/example')         # => true
    Dir.exist?('/nosuch')          # => false
    Dir.exist?('/example/main.rb') # => false

Same as File.directory?.
**@overload** [] 

## fchdir(fd_value ) [](#method-c-fchdir)
Changes the current working directory to the directory specified by the
integer file descriptor `fd`.

When passing a file descriptor over a UNIX socket or to a child process, using
`fchdir` instead of `chdir` avoids the [time-of-check to time-of-use
vulnerability](https://en.wikipedia.org/wiki/Time-of-check_to_time-of-use)

With no block, changes to the directory given by `fd`:

    Dir.chdir('/var/spool/mail')
    Dir.pwd # => "/var/spool/mail"
    dir  = Dir.new('/usr')
    fd = dir.fileno
    Dir.fchdir(fd)
    Dir.pwd # => "/usr"

With a block, temporarily changes the working directory:

*   Calls the block with the argument.
*   Changes to the given directory.
*   Executes the block (yields no args).
*   Restores the previous working directory.
*   Returns the block's return value.

Example:

    Dir.chdir('/var/spool/mail')
    Dir.pwd # => "/var/spool/mail"
    dir  = Dir.new('/tmp')
    fd = dir.fileno
    Dir.fchdir(fd) do
      Dir.pwd # => "/tmp"
    end
    Dir.pwd # => "/var/spool/mail"

This method uses the
[fchdir()](https://www.man7.org/linux/man-pages/man3/fchdir.3p.html) function
defined by POSIX 2008; the method is not implemented on non-POSIX platforms
(raises NotImplementedError).

Raises an exception if the file descriptor is not valid.

In a multi-threaded program an error is raised if a thread attempts to open a
`chdir` block while another thread has one open, or a call to `chdir` without
a block occurs inside a block passed to `chdir` (even in the same thread).
**@overload** [] 

**@overload** [] 

## for_fd(fd ) [](#method-c-for_fd)
Returns a new Dir object representing the directory specified by the given
integer directory file descriptor `fd`:

    d0 = Dir.new('..')
    d1 = Dir.for_fd(d0.fileno)

Note that the returned `d1` does not have an associated path:

    d0.path # => '..'
    d1.path # => nil

This method uses the
[fdopendir()](https://www.man7.org/linux/man-pages/man3/fdopendir.3p.html)
function defined by POSIX 2008; the method is not implemented on non-POSIX
platforms (raises NotImplementedError).
**@overload** [] 

## foreach(*args ) [](#method-c-foreach)
Calls the block with each entry name in the directory at `dirpath`; sets the
given encoding onto each passed `entry_name`:

    Dir.foreach('/example') {|entry_name| p entry_name }

Output:

    "config.h"
    "lib"
    "main.rb"
    ".."
    "."

Encoding:

    Dir.foreach('/example') {|entry_name| p entry_name.encoding; break }
    Dir.foreach('/example', encoding: 'US-ASCII') {|entry_name| p entry_name.encoding; break }

Output:

    #<Encoding:UTF-8>
    #<Encoding:US-ASCII>

See [String Encoding](rdoc-ref:encodings.rdoc@String+Encoding).

Returns an enumerator if no block is given.
**@overload** [] 

## getwd() [](#method-c-getwd)
Returns the path to the current working directory:

    Dir.chdir("/tmp") # => 0
    Dir.pwd           # => "/tmp"
**@overload** [] 

## glob(pattern , _flags 0, flags: _flags, base: nil, sort: true) [](#method-c-glob)
call-seq:
    Dir.glob(*patterns, flags: 0, base: nil, sort: true) -> array
    Dir.glob(*patterns, flags: 0, base: nil, sort: true) {|entry_name| ... } -> nil

Forms an array *entry_names* of the entry names selected by the arguments.

Argument `patterns` is a string pattern or an array of string patterns; note
that these are not regexps; see below.

Notes for the following examples:

*   `'*'` is the pattern that matches any entry name except those that begin
    with `'.'`.
*   We use method Array#take to shorten returned arrays that otherwise would
    be very large.

With no block, returns array *entry_names*; example (using the [simple file
tree](rdoc-ref:Dir@About+the+Examples)):

    Dir.glob('*') # => ["config.h", "lib", "main.rb"]

With a block, calls the block with each of the *entry_names* and returns
`nil`:

    Dir.glob('*') {|entry_name| puts entry_name } # => nil

Output:

    config.h
    lib
    main.rb

If optional keyword argument `flags` is given, the value modifies the
matching; see below.

If optional keyword argument `base` is given, its value specifies the base
directory. Each pattern string specifies entries relative to the base
directory; the default is `'.'`. The base directory is not prepended to the
entry names in the result:

    Dir.glob(pattern, base: 'lib').take(5)
    # => ["abbrev.gemspec", "abbrev.rb", "base64.gemspec", "base64.rb", "benchmark.gemspec"]
    Dir.glob(pattern, base: 'lib/irb').take(5)
    # => ["cmd", "color.rb", "color_printer.rb", "completion.rb", "context.rb"]

If optional keyword `sort` is given, its value specifies whether the array is
to be sorted; the default is `true`. Passing value `false` with that keyword
disables sorting (though the underlying file system may already have sorted
the array).

**Patterns**

Each pattern string is expanded according to certain metacharacters; examples
below use the [Ruby file tree](rdoc-ref:Dir@About+the+Examples):

*   `'*'`: Matches any substring in an entry name, similar in meaning to
    regexp `/.*/mx`; may be restricted by other values in the pattern strings:

    *   `'*'` matches all entry names:

            Dir.glob('*').take(3)  # => ["BSDL", "CONTRIBUTING.md", "COPYING"]

    *   `'c*'` matches entry names beginning with `'c'`:

            Dir.glob('c*').take(3) # => ["CONTRIBUTING.md", "COPYING", "COPYING.ja"]

    *   `'*c'` matches entry names ending with `'c'`:

            Dir.glob('*c').take(3) # => ["addr2line.c", "array.c", "ast.c"]

    *   `'*c*'` matches entry names that contain `'c'`, even at the beginning
        or end:

            Dir.glob('*c*').take(3) # => ["CONTRIBUTING.md", "COPYING", "COPYING.ja"]

    Does not match Unix-like hidden entry names ("dot files"). To include
    those in the matched entry names, use flag IO::FNM_DOTMATCH or something
    like `'{*,.*}'`.

*   `'**'`: Matches entry names recursively if followed by  the slash
    character `'/'`:

        Dir.glob('**/').take(3) # => ["basictest/", "benchmark/", "benchmark/gc/"]

    If the string pattern contains other characters or is not followed by a
    slash character, it is equivalent to `'*'`.

*   `'?'` Matches any single character; similar in meaning to regexp `/./`:

        Dir.glob('io.?') # => ["io.c"]

*   `'[*set*]'`: Matches any one character in the string *set*; behaves like a
    [Regexp character class](rdoc-ref:Regexp@Character+Classes), including set
    negation (`'[^a-z]'`):

        Dir.glob('*.[a-z][a-z]').take(3)
        # => ["CONTRIBUTING.md", "COPYING.ja", "KNOWNBUGS.rb"]

*   `'{*abc*,*xyz*}'`: Matches either string *abc* or string *xyz*; behaves
    like [Regexp alternation](rdoc-ref:Regexp@Alternation):

        Dir.glob('{LEGAL,BSDL}') # => ["LEGAL", "BSDL"]

    More than two alternatives may be given.

*   `\`: Escapes the following metacharacter.

    Note that on Windows, the backslash character may not be used in a string
    pattern: `Dir['c:\\foo*']` will not work, use `Dir['c:/foo*']` instead.

More examples (using the [simple file tree](rdoc-ref:Dir@About+the+Examples)):

    # We're in the example directory.
    File.basename(Dir.pwd) # => "example"
    Dir.glob('config.?')              # => ["config.h"]
    Dir.glob('*.[a-z][a-z]')          # => ["main.rb"]
    Dir.glob('*.[^r]*')               # => ["config.h"]
    Dir.glob('*.{rb,h}')              # => ["main.rb", "config.h"]
    Dir.glob('*')                     # => ["config.h", "lib", "main.rb"]
    Dir.glob('*', File::FNM_DOTMATCH) # => [".", "config.h", "lib", "main.rb"]
    Dir.glob(["*.rb", "*.h"])         # => ["main.rb", "config.h"]

    Dir.glob('**/*.rb')
    => ["lib/song/karaoke.rb", "lib/song.rb", "main.rb"]

    Dir.glob('**/*.rb', base: 'lib')  #   => ["song/karaoke.rb", "song.rb"]

    Dir.glob('**/lib')                # => ["lib"]

    Dir.glob('**/lib/**/*.rb')        # => ["lib/song/karaoke.rb", "lib/song.rb"]

    Dir.glob('**/lib/*.rb')           # => ["lib/song.rb"]

**Flags**

If optional keyword argument `flags` is given (the default is zero -- no
flags), its value should be the bitwise OR of one or more of the constants
defined in module File::Constants.

Example:

    flags = File::FNM_EXTGLOB | File::FNM_DOTMATCH

Specifying flags can extend, restrict, or otherwise modify the matching.

The flags for this method (other constants in File::Constants do not apply):

*   File::FNM_DOTMATCH: specifies that entry names beginning with `'.'` should
    be considered for matching:

        Dir.glob('*').take(5)
        # => ["BSDL", "CONTRIBUTING.md", "COPYING", "COPYING.ja", "GPL"]
        Dir.glob('*', flags: File::FNM_DOTMATCH).take(5)
        # => [".", ".appveyor.yml", ".cirrus.yml", ".dir-locals.el", ".document"]

*   File::FNM_EXTGLOB: enables the pattern extension `'{*a*,*b*}'`, which
    matches pattern *a* and pattern *b*; behaves like a [regexp
    union](rdoc-ref:Regexp.union) (e.g., `'(?:*a*|*b*)'`):

        pattern = '{LEGAL,BSDL}'
        Dir.glob(pattern)      # => ["LEGAL", "BSDL"]

*   File::FNM_NOESCAPE: specifies that escaping with the backslash character
    `'\'` is disabled; the character is not an escape character.

*   File::FNM_PATHNAME: specifies that metacharacters `'*'` and `'?'` do not
    match directory separators.

*   File::FNM_SHORTNAME: specifies that patterns may match short names if they
    exist; Windows only.
## home(*args ) [](#method-c-home)
Returns the home directory path of the user specified with `user_name` if it
is not `nil`, or the current login user:

    Dir.home         # => "/home/me"
    Dir.home('root') # => "/root"

Raises ArgumentError if `user_name` is not a user name.
**@overload** [] 

## mkdir(*args ) [](#method-c-mkdir)
Creates a directory in the underlying file system at `dirpath` with the given
`permissions`; returns zero:

    Dir.mkdir('foo')
    File.stat(Dir.new('foo')).mode.to_s(8)[1..4] # => "0755"
    Dir.mkdir('bar', 0644)
    File.stat(Dir.new('bar')).mode.to_s(8)[1..4] # => "0644"

See [File Permissions](rdoc-ref:File@File+Permissions). Note that argument
`permissions` is ignored on Windows.
**@overload** [] 

## mktmpdir(prefix_suffix nil, tmpdir nil) [](#method-c-mktmpdir)
copied from lib/tmpdir.rb
## open(name , encoding: nil, &block ) [](#method-c-open)
call-seq:
    Dir.open(dirpath) -> dir
    Dir.open(dirpath, encoding: nil) -> dir
    Dir.open(dirpath) {|dir| ... } -> object
    Dir.open(dirpath, encoding: nil) {|dir| ... } -> object

Creates a new Dir object *dir* for the directory at `dirpath`.

With no block, the method equivalent to Dir.new(dirpath, encoding):

    Dir.open('.') # => #<Dir:.>

With a block given, the block is called with the created *dir*; on block exit
*dir* is closed and the block's value is returned:

    Dir.open('.') {|dir| dir.inspect } # => "#<Dir:.>"

The value given with optional keyword argument `encoding` specifies the
encoding for the directory entry names; if `nil` (the default), the file
system's encoding is used:

    Dir.open('.').read.encoding                       # => #<Encoding:UTF-8>
    Dir.open('.', encoding: 'US-ASCII').read.encoding # => #<Encoding:US-ASCII>
## pwd() [](#method-c-pwd)
Returns the path to the current working directory:

    Dir.chdir("/tmp") # => 0
    Dir.pwd           # => "/tmp"
**@overload** [] 

## rmdir(dir ) [](#method-c-rmdir)
Removes the directory at `dirpath` from the underlying file system:

    Dir.rmdir('foo') # => 0

Raises an exception if the directory is not empty.
**@overload** [] 

## tmpdir() [](#method-c-tmpdir)
Returns the operating system's temporary file path.

    require 'tmpdir'
    Dir.tmpdir # => "/tmp"
## unlink(dir ) [](#method-c-unlink)
Removes the directory at `dirpath` from the underlying file system:

    Dir.rmdir('foo') # => 0

Raises an exception if the directory is not empty.
**@overload** [] 


#Instance Methods
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

## chain(*args) [](#method-i-chain)
Returns an enumerator object generated from this enumerator and given
enumerables.

    e = (1..3).chain([4, 5])
    e.to_a #=> [1, 2, 3, 4, 5]

**@overload** [] 

## chdir() [](#method-i-chdir)
Changes the current working directory to `self`:

    Dir.pwd # => "/"
    dir = Dir.new('example')
    dir.chdir
    Dir.pwd # => "/example"

With a block, temporarily changes the working directory:

*   Calls the block.
*   Changes to the given directory.
*   Executes the block (yields no args).
*   Restores the previous working directory.
*   Returns the block's return value.

Uses Dir.fchdir if available, and Dir.chdir if not, see those methods for
caveats.

**@overload** [] 

**@overload** [] 

## children() [](#method-i-children)
Returns an array of the entry names in `self` except for `'.'` and `'..'`:

    dir = Dir.new('/example')
    dir.children # => ["config.h", "lib", "main.rb"]

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

## close() [](#method-i-close)
Closes the stream in `self`, if it is open, and returns `nil`; ignored if
`self` is already closed:

    dir = Dir.new('example')
    dir.read     # => "."
    dir.close     # => nil
    dir.close     # => nil
    dir.read # Raises IOError.

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

## each() [](#method-i-each)
Calls the block with each entry name in `self`:

    Dir.new('example').each {|entry_name| p entry_name }

Output:

    "."
    ".."
    "config.h"
    "lib"
    "main.rb"

With no block given, returns an Enumerator.

**@overload** [] 

## each_child() [](#method-i-each_child)
Calls the block with each entry name in `self` except `'.'` and `'..'`:

    dir = Dir.new('/example')
    dir.each_child {|entry_name| p entry_name }

Output:

    "config.h"
    "lib"
    "main.rb"

If no block is given, returns an enumerator.

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

## entries(*args) [](#method-i-entries)
Returns an array containing the items in `self`:

    (0..4).to_a # => [0, 1, 2, 3, 4]

**@overload** [] 

## fileno() [](#method-i-fileno)
Returns the file descriptor used in *dir*.

    d = Dir.new('..')
    d.fileno # => 8

This method uses the
[dirfd()](https://www.man7.org/linux/man-pages/man3/dirfd.3.html) function
defined by POSIX 2008; the method is not implemented on non-POSIX platforms
(raises NotImplementedError).

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

## initialize(name, encoding:nil) [](#method-i-initialize)
call-seq:
    Dir.new(dirpath) -> dir
    Dir.new(dirpath, encoding: nil) -> dir

Returns a new Dir object for the directory at `dirpath`:

    Dir.new('.') # => #<Dir:.>

The value given with optional keyword argument `encoding` specifies the
encoding for the directory entry names; if `nil` (the default), the file
system's encoding is used:

    Dir.new('.').read.encoding                       # => #<Encoding:UTF-8>
    Dir.new('.', encoding: 'US-ASCII').read.encoding # => #<Encoding:US-ASCII>

**@return** [Dir] a new instance of Dir

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
Returns a string description of `self`:

    Dir.new('example').inspect # => "#<Dir:example>"

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
Returns the `dirpath` string that was used to create `self` (or `nil` if
created by method Dir.for_fd):

    Dir.new('example').path # => "example"

**@overload** [] 

## pos() [](#method-i-pos)
Returns the current position of `self`; see [Dir As
Stream-Like](rdoc-ref:Dir@Dir+As+Stream-Like):

    dir = Dir.new('example')
    dir.tell  # => 0
    dir.read  # => "."
    dir.tell  # => 1

**@overload** [] 

## pos=(pos) [](#method-i-pos=)
Sets the position in `self` and returns `position`. The value of `position`
should have been returned from an earlier call to #tell; if not, the return
values from subsequent calls to #read are unspecified.

See [Dir As Stream-Like](rdoc-ref:Dir@Dir+As+Stream-Like).

Examples:

    dir = Dir.new('example')
    dir.pos      # => 0
    dir.pos = 3  # => 3
    dir.pos      # => 3
    dir.pos = 30 # => 30
    dir.pos      # => 5

**@overload** [] 

## read() [](#method-i-read)
Reads and returns the next entry name from `self`; returns `nil` if at
end-of-stream; see [Dir As Stream-Like](rdoc-ref:Dir@Dir+As+Stream-Like):

    dir = Dir.new('example')
    dir.read # => "."
    dir.read # => ".."
    dir.read # => "config.h"

**@overload** [] 

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
Sets the position in `self` to zero; see [Dir As
Stream-Like](rdoc-ref:Dir@Dir+As+Stream-Like):

    dir = Dir.new('example')
    dir.read    # => "."
    dir.read    # => ".."
    dir.pos     # => 2
    dir.rewind  # => #<Dir:example>
    dir.pos     # => 0

**@overload** [] 

## seek(pos) [](#method-i-seek)
Sets the position in `self` and returns `self`. The value of `position` should
have been returned from an earlier call to #tell; if not, the return values
from subsequent calls to #read are unspecified.

See [Dir As Stream-Like](rdoc-ref:Dir@Dir+As+Stream-Like).

Examples:

    dir = Dir.new('example')
    dir.pos      # => 0
    dir.seek(3)  # => #<Dir:example>
    dir.pos      # => 3
    dir.seek(30) # => #<Dir:example>
    dir.pos      # => 5

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
Returns the current position of `self`; see [Dir As
Stream-Like](rdoc-ref:Dir@Dir+As+Stream-Like):

    dir = Dir.new('example')
    dir.tell  # => 0
    dir.read  # => "."
    dir.tell  # => 1

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

## to_path() [](#method-i-to_path)
Returns the `dirpath` string that was used to create `self` (or `nil` if
created by method Dir.for_fd):

    Dir.new('example').path # => "example"

**@overload** [] 

## to_set(klassSet, *args, &block) [](#method-i-to_set)
Makes a set from the enumerable object with given arguments.

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

