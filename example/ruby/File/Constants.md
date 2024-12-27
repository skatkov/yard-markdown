# Module: File::Constants
    

Module `File::Constants` defines file-related constants.

There are two families of constants here:

*   Those having to do with [file
    access](rdoc-ref:File::Constants@File+Access).
*   Those having to do with [filename
    globbing](rdoc-ref:File::Constants@Filename+Globbing+Constants+-28File-3A-
    3AFNM_-2A-29).

File constants defined for the local process may be retrieved with method
File::Constants.constants:

    File::Constants.constants.take(5)
    # => [:RDONLY, :WRONLY, :RDWR, :APPEND, :CREAT]

## File Access

File-access constants may be used with optional argument `mode` in calls to
the following methods:

*   File.new.
*   File.open.
*   IO.for_fd.
*   IO.new.
*   IO.open.
*   IO.popen.
*   IO.reopen.
*   IO.sysopen.
*   StringIO.new.
*   StringIO.open.
*   StringIO#reopen.

### Read/Write Access

Read-write access for a stream may be specified by a file-access constant.

The constant may be specified as part of a bitwise OR of other such constants.

Any combination of the constants in this section may be specified.

#### File::RDONLY

Flag File::RDONLY specifies the stream should be opened for reading only:

    filepath = '/tmp/t.tmp'
    f = File.new(filepath, File::RDONLY)
    f.write('Foo') # Raises IOError (not opened for writing).

#### File::WRONLY

Flag File::WRONLY specifies that the stream should be opened for writing only:

    f = File.new(filepath, File::WRONLY)
    f.read # Raises IOError (not opened for reading).

#### File::RDWR

Flag File::RDWR specifies that the stream should be opened for both reading
and writing:

    f = File.new(filepath, File::RDWR)
    f.write('Foo') # => 3
    f.rewind       # => 0
    f.read         # => "Foo"

### File Positioning

#### File::APPEND

Flag File::APPEND specifies that the stream should be opened in append mode.

Before each write operation, the position is set to end-of-stream. The
modification of the position and the following write operation are performed
as a single atomic step.

#### File::TRUNC

Flag File::TRUNC specifies that the stream should be truncated at its
beginning. If the file exists and is successfully opened for writing, it is to
be truncated to position zero; its ctime and mtime are updated.

There is no effect on a FIFO special file or a terminal device. The effect on
other file types is implementation-defined. The result of using File::TRUNC
with File::RDONLY is undefined.

### Creating and Preserving

#### File::CREAT

Flag File::CREAT specifies that the stream should be created if it does not
already exist.

If the file exists:

    - Raise an exception if File::EXCL is also specified.
    - Otherwise, do nothing.

If the file does not exist, then it is created. Upon successful completion,
the atime, ctime, and mtime of the file are updated, and the ctime and mtime
of the parent directory are updated.

#### File::EXCL

Flag File::EXCL specifies that the stream should not already exist; If flags
File::CREAT and File::EXCL are both specified and the stream already exists,
an exception is raised.

The check for the existence and creation of the file is performed as an atomic
operation.

If both File::EXCL and File::CREAT are specified and the path names a symbolic
link, an exception is raised regardless of the contents of the symbolic link.

If File::EXCL is specified and File::CREAT is not specified, the result is
undefined.

### POSIX File Constants

Some file-access constants are defined only on POSIX-compliant systems; those
are:

*   File::SYNC.
*   File::DSYNC.
*   File::RSYNC.
*   File::DIRECT.
*   File::NOATIME.
*   File::NOCTTY.
*   File::NOFOLLOW.
*   File::TMPFILE.

#### File::SYNC, File::RSYNC, and File::DSYNC

Flag File::SYNC, File::RSYNC, or File::DSYNC specifies synchronization of I/O
operations with the underlying file system.

These flags are valid only for POSIX-compliant systems.

*   File::SYNC specifies that all write operations (both data and metadata)
    are immediately to be flushed to the underlying storage device. This means
    that the data is written to the storage device, and the file's metadata
    (e.g., file size, timestamps, permissions) are also synchronized. This
    guarantees that data is safely stored on the storage medium before
    returning control to the calling program. This flag can have a significant
    impact on performance since it requires synchronous writes, which can be
    slower compared to asynchronous writes.

*   File::RSYNC specifies that any read operations on the file will not return
    until all outstanding write operations (those that have been issued but
    not completed) are also synchronized. This is useful when you want to read
    the most up-to-date data, which may still be in the process of being
    written.

*   File::DSYNC specifies that all *data* write operations are immediately to
    be flushed to the underlying storage device; this differs from File::SYNC,
    which requires that *metadata* also be synchronized.

Note that the behavior of these flags may vary slightly depending on the
operating system and filesystem being used. Additionally, using these flags
can have an impact on performance due to the synchronous nature of the I/O
operations, so they should be used judiciously, especially in
performance-critical applications.

#### File::NOCTTY

Flag File::NOCTTY specifies that if the stream is a terminal device, that
device does not become the controlling terminal for the process.

Defined only for POSIX-compliant systems.

#### File::DIRECT

Flag File::DIRECT requests that cache effects of the I/O to and from the
stream be minimized.

Defined only for POSIX-compliant systems.

#### File::NOATIME

Flag File::NOATIME specifies that act of opening the stream should not modify
its access time (atime).

Defined only for POSIX-compliant systems.

#### File::NOFOLLOW

Flag File::NOFOLLOW specifies that if path is a symbolic link, it should not
be followed.

Defined only for POSIX-compliant systems.

#### File::TMPFILE

Flag File::TMPFILE specifies that the opened stream should be a new temporary
file.

Defined only for POSIX-compliant systems.

### Other File-Access Constants

#### File::NONBLOCK

When possible, the file is opened in nonblocking mode. Neither the open
operation nor any subsequent I/O operations on the file will cause the calling
process to wait.

#### File::BINARY

Flag File::BINARY specifies that the stream is to be accessed in binary mode.

#### File::SHARE_DELETE

Flag File::SHARE_DELETE enables other processes to open the stream with delete
access.

Windows only.

If the stream is opened for (local) delete access without File::SHARE_DELETE,
and another process attempts to open it with delete access, the attempt fails
and the stream is not opened for that process.

## Locking

Four file constants relate to stream locking; see File#flock:

#### File::LOCK_EX

Flag File::LOCK_EX specifies an exclusive lock; only one process a a time may
lock the stream.

#### File::LOCK_NB

Flag File::LOCK_NB specifies non-blocking locking for the stream; may be
combined with File::LOCK_EX or File::LOCK_SH.

#### File::LOCK_SH

Flag File::LOCK_SH specifies that multiple processes may lock the stream at
the same time.

#### File::LOCK_UN

Flag File::LOCK_UN specifies that the stream is not to be locked.

## Filename Globbing Constants (File::FNM_*)

Filename-globbing constants may be used with optional argument `flags` in
calls to the following methods:

*   Dir.glob.
*   File.fnmatch.
*   Pathname#fnmatch.
*   Pathname.glob.
*   Pathname#glob.

The constants are:

#### File::FNM_CASEFOLD

Flag File::FNM_CASEFOLD makes patterns case insensitive for File.fnmatch (but
not Dir.glob).

#### File::FNM_DOTMATCH

Flag File::FNM_DOTMATCH makes the `'*'` pattern match a filename starting with
`'.'`.

#### File::FNM_EXTGLOB

Flag File::FNM_EXTGLOB enables pattern `'{*a*,*b*}'`, which matches pattern
'*a*' and pattern '*b*'; behaves like a [regexp union](rdoc-ref:Regexp.union)
(e.g., `'(?:*a*|*b*)'`):

    pattern = '{LEGAL,BSDL}'
    Dir.glob(pattern)      # => ["LEGAL", "BSDL"]
    Pathname.glob(pattern) # => [#<Pathname:LEGAL>, #<Pathname:BSDL>]
    pathname.glob(pattern) # => [#<Pathname:LEGAL>, #<Pathname:BSDL>]

#### File::FNM_NOESCAPE

Flag File::FNM_NOESCAPE disables `'\'` escaping.

#### File::FNM_PATHNAME

Flag File::FNM_PATHNAME specifies that patterns `'*'` and `'?'` do not match
the directory separator (the value of constant File::SEPARATOR).

#### File::FNM_SHORTNAME

Flag File::FNM_SHORTNAME allows patterns to match short names if they exist.

Windows only.

#### File::FNM_SYSCASE

Flag File::FNM_SYSCASE specifies that case sensitivity is the same as in the
underlying operating system; effective for File.fnmatch, but not Dir.glob.

## Other Constants

#### File::NULL

Flag File::NULL contains the string value of the null device:

*   On a Unix-like OS, `'/dev/null'`.
*   On Windows, `'NUL'`.



