# Class: File
**Inherits:** IO
    

Used by Makefile and configure for building Ruby. See common.mk and
Makefile.in for details.


# Class Methods
## absolute_path(* , _ ) [](#method-c-absolute_path)
Converts a pathname to an absolute pathname. Relative paths are referenced
from the current working directory of the process unless *dir_string* is
given, in which case it will be used as the starting point. If the given
pathname starts with a ```~`'' it is NOT expanded, it is treated as a normal
directory name.

    File.absolute_path("~oracle/bin")       #=> "<relative_path>/~oracle/bin"
**@overload** [] 

## absolute_path?(fname ) [](#method-c-absolute_path?)
Returns `true` if `file_name` is an absolute path, and `false` otherwise.

    File.absolute_path?("c:/foo")     #=> false (on Linux), true (on Windows)
**@overload** [] 

## atime(fname ) [](#method-c-atime)
Returns the last access time for the named file as a Time object.

*file_name* can be an IO object.

    File.atime("testfile")   #=> Wed Apr 09 08:51:48 CDT 2003
**@overload** [] 

## basename(*args ) [](#method-c-basename)
Returns the last component of the filename given in *file_name* (after first
stripping trailing separators), which can be formed using both File::SEPARATOR
and File::ALT_SEPARATOR as the separator when File::ALT_SEPARATOR is not
`nil`. If *suffix* is given and present at the end of *file_name*, it is
removed. If *suffix* is ".*", any extension will be removed.

    File.basename("/home/gumby/work/ruby.rb")          #=> "ruby.rb"
    File.basename("/home/gumby/work/ruby.rb", ".rb")   #=> "ruby"
    File.basename("/home/gumby/work/ruby.rb", ".*")    #=> "ruby"
**@overload** [] 

## birthtime(fname ) [](#method-c-birthtime)
Returns the birth time for the named file.

*file_name* can be an IO object.

    File.birthtime("testfile")   #=> Wed Apr 09 08:53:13 CDT 2003

If the platform doesn't have birthtime, raises NotImplementedError.
**@overload** [] 

## blockdev?(fname ) [](#method-c-blockdev?)
Returns `true` if `filepath` points to a block device, `false` otherwise:

    File.blockdev?('/dev/sda1')       # => true
    File.blockdev?(File.new('t.tmp')) # => false
**@overload** [] 

## chardev?(fname ) [](#method-c-chardev?)
Returns `true` if `filepath` points to a character device, `false` otherwise.

    File.chardev?($stdin)     # => true
    File.chardev?('t.txt')     # => false
**@overload** [] 

## chmod(*args ) [](#method-c-chmod)
Changes permission bits on the named file(s) to the bit pattern represented by
*mode_int*. Actual effects are operating system dependent (see the beginning
of this section). On Unix systems, see `chmod(2)` for details. Returns the
number of files processed.

    File.chmod(0644, "testfile", "out")   #=> 2
**@overload** [] 

## chown(*args ) [](#method-c-chown)
Changes the owner and group of the named file(s) to the given numeric owner
and group id's. Only a process with superuser privileges may change the owner
of a file. The current owner of a file may change the file's group to any
group to which the owner belongs. A `nil` or -1 owner or group id is ignored.
Returns the number of files processed.

    File.chown(nil, 100, "testfile")
**@overload** [] 

## ctime(fname ) [](#method-c-ctime)
Returns the change time for the named file (the time at which directory
information about the file was changed, not the file itself).

*file_name* can be an IO object.

Note that on Windows (NTFS), returns creation time (birth time).

    File.ctime("testfile")   #=> Wed Apr 09 08:53:13 CDT 2003
**@overload** [] 

## delete(*args ) [](#method-c-delete)
Deletes the named files, returning the number of names passed as arguments.
Raises an exception on any error. Since the underlying implementation relies
on the `unlink(2)` system call, the type of exception raised depends on its
error type (see https://linux.die.net/man/2/unlink) and has the form of e.g.
Errno::ENOENT.

See also Dir::rmdir.
**@overload** [] 

**@overload** [] 

## directory?(fname ) [](#method-c-directory?)
With string `object` given, returns `true` if `path` is a string path leading
to a directory, or to a symbolic link to a directory; `false` otherwise:

    File.directory?('.')              # => true
    File.directory?('foo')            # => false
    File.symlink('.', 'dirlink')      # => 0
    File.directory?('dirlink')        # => true
    File.symlink('t,txt', 'filelink') # => 0
    File.directory?('filelink')       # => false

Argument `path` can be an IO object.
**@overload** [] 

## dirname(*args ) [](#method-c-dirname)
Returns all components of the filename given in *file_name* except the last
one (after first stripping trailing separators). The filename can be formed
using both File::SEPARATOR and File::ALT_SEPARATOR as the separator when
File::ALT_SEPARATOR is not `nil`.

    File.dirname("/home/gumby/work/ruby.rb")   #=> "/home/gumby/work"

If `level` is given, removes the last `level` components, not only one.

    File.dirname("/home/gumby/work/ruby.rb", 2) #=> "/home/gumby"
    File.dirname("/home/gumby/work/ruby.rb", 4) #=> "/"
**@overload** [] 

## empty?(fname ) [](#method-c-empty?)
Returns `true` if the named file exists and has a zero size.

*file_name* can be an IO object.
**@overload** [] 

## executable?(fname ) [](#method-c-executable?)
Returns `true` if the named file is executable by the effective user and group
id of this process. See eaccess(3).

Windows does not support execute permissions separately from read permissions.
On Windows, a file is only considered executable if it ends in .bat, .cmd,
.com, or .exe.

Note that some OS-level security features may cause this to return true even
though the file is not executable by the effective user/group.
**@overload** [] 

## executable_real?(fname ) [](#method-c-executable_real?)
Returns `true` if the named file is executable by the real user and group id
of this process. See access(3).

Windows does not support execute permissions separately from read permissions.
On Windows, a file is only considered executable if it ends in .bat, .cmd,
.com, or .exe.

Note that some OS-level security features may cause this to return true even
though the file is not executable by the real user/group.
**@overload** [] 

## exist?(fname ) [](#method-c-exist?)
Return `true` if the named file exists.

*file_name* can be an IO object.

"file exists" means that stat() or fstat() system call is successful.
**@overload** [] 

## expand_path(* , _ ) [](#method-c-expand_path)
Converts a pathname to an absolute pathname. Relative paths are referenced
from the current working directory of the process unless `dir_string` is
given, in which case it will be used as the starting point. The given pathname
may start with a ```~`'', which expands to the process owner's home directory
(the environment variable `HOME` must be set correctly). ```~`*user*'' expands
to the named user's home directory.

    File.expand_path("~oracle/bin")           #=> "/home/oracle/bin"

A simple example of using `dir_string` is as follows.
    File.expand_path("ruby", "/usr/bin")      #=> "/usr/bin/ruby"

A more complex example which also resolves parent directory is as follows.
Suppose we are in bin/mygem and want the absolute path of lib/mygem.rb.

    File.expand_path("../../lib/mygem.rb", __FILE__)
    #=> ".../path/to/project/lib/mygem.rb"

So first it resolves the parent of __FILE__, that is bin/, then go to the
parent, the root of the project and appends `lib/mygem.rb`.
**@overload** [] 

## extname(fname ) [](#method-c-extname)
Returns the extension (the portion of file name in `path` starting from the
last period).

If `path` is a dotfile, or starts with a period, then the starting dot is not
dealt with the start of the extension.

An empty string will also be returned when the period is the last character in
`path`.

On Windows, trailing dots are truncated.

    File.extname("test.rb")         #=> ".rb"
    File.extname("a/b/d/test.rb")   #=> ".rb"
    File.extname(".a/b/d/test.rb")  #=> ".rb"
    File.extname("foo.")            #=> "" on Windows
    File.extname("foo.")            #=> "." on non-Windows
    File.extname("test")            #=> ""
    File.extname(".profile")        #=> ""
    File.extname(".profile.sh")     #=> ".sh"
**@overload** [] 

## file?(fname ) [](#method-c-file?)
Returns `true` if the named `file` exists and is a regular file.

`file` can be an IO object.

If the `file` argument is a symbolic link, it will resolve the symbolic link
and use the file referenced by the link.
**@overload** [] 

## fnmatch(pattern , path , flags 0) [](#method-c-fnmatch)
call-seq:
    File.fnmatch( pattern, path, [flags] ) -> (true or false)
    File.fnmatch?( pattern, path, [flags] ) -> (true or false)

Returns true if `path` matches against `pattern`.  The pattern is not a
regular expression; instead it follows rules similar to shell filename
globbing.  It may contain the following metacharacters:

`*`
:   Matches any file. Can be restricted by other values in the glob.
    Equivalent to `/.*/x` in regexp.

    `*`
:       Matches all regular files

    `c*`
:       Matches all files beginning with `c`

    `*c`
:       Matches all files ending with `c`

    `*c*`
:       Matches all files that have `c` in them (including at the beginning or
        end).


    To match hidden files (that start with a `.`) set the File::FNM_DOTMATCH
    flag.


`**`
:   Matches directories recursively or files expansively.


`?`
:   Matches any one character. Equivalent to `/.{1}/` in regexp.


`[set]`
:   Matches any one character in `set`.  Behaves exactly like character sets
    in Regexp, including set negation (`[^a-z]`).


`\`
:   Escapes the next metacharacter.


`{a,b}`
:   Matches pattern a and pattern b if File::FNM_EXTGLOB flag is enabled.
    Behaves like a Regexp union (`(?:a|b)`).


`flags` is a bitwise OR of the `FNM_XXX` constants. The same glob pattern and
flags are used by Dir::glob.

Examples:

    File.fnmatch('cat',       'cat')        #=> true  # match entire string
    File.fnmatch('cat',       'category')   #=> false # only match partial string

    File.fnmatch('c{at,ub}s', 'cats')                    #=> false # { } isn't supported by default
    File.fnmatch('c{at,ub}s', 'cats', File::FNM_EXTGLOB) #=> true  # { } is supported on FNM_EXTGLOB

    File.fnmatch('c?t',     'cat')          #=> true  # '?' match only 1 character
    File.fnmatch('c??t',    'cat')          #=> false # ditto
    File.fnmatch('c*',      'cats')         #=> true  # '*' match 0 or more characters
    File.fnmatch('c*t',     'c/a/b/t')      #=> true  # ditto
    File.fnmatch('ca[a-z]', 'cat')          #=> true  # inclusive bracket expression
    File.fnmatch('ca[^t]',  'cat')          #=> false # exclusive bracket expression ('^' or '!')

    File.fnmatch('cat', 'CAT')                     #=> false # case sensitive
    File.fnmatch('cat', 'CAT', File::FNM_CASEFOLD) #=> true  # case insensitive
    File.fnmatch('cat', 'CAT', File::FNM_SYSCASE)  #=> true or false # depends on the system default

    File.fnmatch('?',   '/', File::FNM_PATHNAME)  #=> false # wildcard doesn't match '/' on FNM_PATHNAME
    File.fnmatch('*',   '/', File::FNM_PATHNAME)  #=> false # ditto
    File.fnmatch('[/]', '/', File::FNM_PATHNAME)  #=> false # ditto

    File.fnmatch('\?',   '?')                       #=> true  # escaped wildcard becomes ordinary
    File.fnmatch('\a',   'a')                       #=> true  # escaped ordinary remains ordinary
    File.fnmatch('\a',   '\a', File::FNM_NOESCAPE)  #=> true  # FNM_NOESCAPE makes '\' ordinary
    File.fnmatch('[\?]', '?')                       #=> true  # can escape inside bracket expression

    File.fnmatch('*',   '.profile')                      #=> false # wildcard doesn't match leading
    File.fnmatch('*',   '.profile', File::FNM_DOTMATCH)  #=> true  # period by default.
    File.fnmatch('.*',  '.profile')                      #=> true

    File.fnmatch('**/*.rb', 'main.rb')                  #=> false
    File.fnmatch('**/*.rb', './main.rb')                #=> false
    File.fnmatch('**/*.rb', 'lib/song.rb')              #=> true
    File.fnmatch('**.rb', 'main.rb')                    #=> true
    File.fnmatch('**.rb', './main.rb')                  #=> false
    File.fnmatch('**.rb', 'lib/song.rb')                #=> true
    File.fnmatch('*',     'dave/.profile')              #=> true

    File.fnmatch('**/foo', 'a/b/c/foo', File::FNM_PATHNAME)     #=> true
    File.fnmatch('**/foo', '/a/b/c/foo', File::FNM_PATHNAME)    #=> true
    File.fnmatch('**/foo', 'c:/a/b/c/foo', File::FNM_PATHNAME)  #=> true
    File.fnmatch('**/foo', 'a/.b/c/foo', File::FNM_PATHNAME)    #=> false
    File.fnmatch('**/foo', 'a/.b/c/foo', File::FNM_PATHNAME | File::FNM_DOTMATCH) #=> true
## ftype(fname ) [](#method-c-ftype)
Identifies the type of the named file; the return string is one of ```file`'',
```directory`'', ```characterSpecial`'', ```blockSpecial`'', ```fifo`'',
```link`'', ```socket`'', or ```unknown`''.

    File.ftype("testfile")            #=> "file"
    File.ftype("/dev/tty")            #=> "characterSpecial"
    File.ftype("/tmp/.X11-unix/X0")   #=> "socket"
**@overload** [] 

## grpowned?(fname ) [](#method-c-grpowned?)
Returns `true` if the named file exists and the effective group id of the
calling process is the owner of the file. Returns `false` on Windows.

*file_name* can be an IO object.
**@overload** [] 

## identical?(fname1 , fname2 ) [](#method-c-identical?)
Returns `true` if the named files are identical.

*file_1* and *file_2* can be an IO object.

    open("a", "w") {}
    p File.identical?("a", "a")      #=> true
    p File.identical?("a", "./a")    #=> true
    File.link("a", "b")
    p File.identical?("a", "b")      #=> true
    File.symlink("a", "c")
    p File.identical?("a", "c")      #=> true
    open("d", "w") {}
    p File.identical?("a", "d")      #=> false
**@overload** [] 

## join(args ) [](#method-c-join)
Returns a new string formed by joining the strings using `"/"`.

    File.join("usr", "mail", "gumby")   #=> "usr/mail/gumby"
**@overload** [] 

## lchmod(*args ) [](#method-c-lchmod)
Equivalent to File::chmod, but does not follow symbolic links (so it will
change the permissions associated with the link, not the file referenced by
the link). Often not available.
**@overload** [] 

## lchown(*args ) [](#method-c-lchown)
Equivalent to File::chown, but does not follow symbolic links (so it will
change the owner associated with the link, not the file referenced by the
link). Often not available. Returns number of files in the argument list.
**@overload** [] 

## link(from , to ) [](#method-c-link)
Creates a new name for an existing file using a hard link. Will not overwrite
*new_name* if it already exists (raising a subclass of SystemCallError). Not
available on all platforms.

    File.link("testfile", ".testfile")   #=> 0
    IO.readlines(".testfile")[0]         #=> "This is line one\n"
**@overload** [] 

## lstat(fname ) [](#method-c-lstat)
Like File::stat, but does not follow the last symbolic link; instead, returns
a File::Stat object for the link itself.

    File.symlink('t.txt', 'symlink')
    File.stat('symlink').size  # => 47
    File.lstat('symlink').size # => 5
**@overload** [] 

## lutime(*args ) [](#method-c-lutime)
Sets the access and modification times of each named file to the first two
arguments. If a file is a symlink, this method acts upon the link itself as
opposed to its referent; for the inverse behavior, see File.utime. Returns the
number of file names in the argument list.
**@overload** [] 

## mkfifo(*args ) [](#method-c-mkfifo)
Creates a FIFO special file with name *file_name*.  *mode* specifies the
FIFO's permissions. It is modified by the process's umask in the usual way:
the permissions of the created file are (mode & ~umask).
**@overload** [] 

## mtime(fname ) [](#method-c-mtime)
Returns the modification time for the named file as a Time object.

*file_name* can be an IO object.

    File.mtime("testfile")   #=> Tue Apr 08 12:58:04 CDT 2003
**@overload** [] 

## open(*args ) [](#method-c-open)
call-seq:
    IO.open(fd, mode = 'r', **opts)             -> io
    IO.open(fd, mode = 'r', **opts) {|io| ... } -> object

Creates a new IO object, via IO.new with the given arguments.

With no block given, returns the IO object.

With a block given, calls the block with the IO object and returns the block's
value.
## owned?(fname ) [](#method-c-owned?)
Returns `true` if the named file exists and the effective used id of the
calling process is the owner of the file.

*file_name* can be an IO object.
**@overload** [] 

## path(fname ) [](#method-c-path)
Returns the string representation of the path

    File.path(File::NULL)           #=> "/dev/null"
    File.path(Pathname.new("/tmp")) #=> "/tmp"
**@overload** [] 

## pipe?(fname ) [](#method-c-pipe?)
Returns `true` if `filepath` points to a pipe, `false` otherwise:

    File.mkfifo('tmp/fifo')
    File.pipe?('tmp/fifo') # => true
    File.pipe?('t.txt')    # => false
**@overload** [] 

## readable?(fname ) [](#method-c-readable?)
Returns `true` if the named file is readable by the effective user and group
id of this process. See eaccess(3).

Note that some OS-level security features may cause this to return true even
though the file is not readable by the effective user/group.
**@overload** [] 

## readable_real?(fname ) [](#method-c-readable_real?)
Returns `true` if the named file is readable by the real user and group id of
this process. See access(3).

Note that some OS-level security features may cause this to return true even
though the file is not readable by the real user/group.
**@overload** [] 

## readlink(path ) [](#method-c-readlink)
Returns the name of the file referenced by the given link. Not available on
all platforms.

    File.symlink("testfile", "link2test")   #=> 0
    File.readlink("link2test")              #=> "testfile"
**@overload** [] 

## realdirpath(*args ) [](#method-c-realdirpath)
Returns the real (absolute) pathname of *pathname* in the actual filesystem.
    The real pathname doesn't contain symlinks or useless dots.

    If _dir_string_ is given, it is used as a base directory
    for interpreting relative pathname instead of the current directory.

    The last component of the real pathname can be nonexistent.
**@overload** [] 

## realpath(*args ) [](#method-c-realpath)
Returns the real (absolute) pathname of *pathname* in the actual
    filesystem not containing symlinks or useless dots.

    If _dir_string_ is given, it is used as a base directory
    for interpreting relative pathname instead of the current directory.

    All components of the pathname must exist when this method is
    called.
**@overload** [] 

## rename(from , to ) [](#method-c-rename)
Renames the given file to the new name. Raises a SystemCallError if the file
cannot be renamed.

    File.rename("afile", "afile.bak")   #=> 0
**@overload** [] 

## setgid?(fname ) [](#method-c-setgid?)
Returns `true` if the named file has the setgid bit set.

*file_name* can be an IO object.
**@overload** [] 

## setuid?(fname ) [](#method-c-setuid?)
Returns `true` if the named file has the setuid bit set.

*file_name* can be an IO object.
**@overload** [] 

## size(fname ) [](#method-c-size)
Returns the size of `file_name`.

*file_name* can be an IO object.
**@overload** [] 

## size?(fname ) [](#method-c-size?)
Returns `nil` if `file_name` doesn't exist or has zero size, the size of the
file otherwise.

*file_name* can be an IO object.
**@overload** [] 

## socket?(fname ) [](#method-c-socket?)
Returns `true` if `filepath` points to a socket, `false` otherwise:

    require 'socket'
    File.socket?(Socket.new(:INET, :STREAM)) # => true
    File.socket?(File.new('t.txt'))          # => false
**@overload** [] 

## split(path ) [](#method-c-split)
Splits the given string into a directory and a file component and returns them
in a two-element array. See also File::dirname and File::basename.

    File.split("/home/gumby/.profile")   #=> ["/home/gumby", ".profile"]
**@overload** [] 

## stat(fname ) [](#method-c-stat)
Returns a File::Stat object for the file at `filepath` (see File::Stat):

    File.stat('t.txt').class # => File::Stat
**@overload** [] 

## sticky?(fname ) [](#method-c-sticky?)
Returns `true` if the named file has the sticky bit set.

*file_name* can be an IO object.
**@overload** [] 

## symlink(from , to ) [](#method-c-symlink)
Creates a symbolic link called *new_name* for the existing file *old_name*.
Raises a NotImplemented exception on platforms that do not support symbolic
links.

    File.symlink("testfile", "link2test")   #=> 0
**@overload** [] 

## symlink?(fname ) [](#method-c-symlink?)
Returns `true` if `filepath` points to a symbolic link, `false` otherwise:

    symlink = File.symlink('t.txt', 'symlink')
    File.symlink?('symlink') # => true
    File.symlink?('t.txt')   # => false
**@overload** [] 

## truncate(path , len ) [](#method-c-truncate)
Truncates the file *file_name* to be at most *integer* bytes long. Not
available on all platforms.

    f = File.new("out", "w")
    f.write("1234567890")     #=> 10
    f.close                   #=> nil
    File.truncate("out", 5)   #=> 0
    File.size("out")          #=> 5
**@overload** [] 

## umask(*args ) [](#method-c-umask)
Returns the current umask value for this process. If the optional argument is
given, set the umask to that value and return the previous value. Umask values
are *subtracted* from the default permissions, so a umask of `0222` would make
a file read-only for everyone.

    File.umask(0006)   #=> 18
    File.umask         #=> 6
**@overload** [] 

**@overload** [] 

## unlink(*args ) [](#method-c-unlink)
Deletes the named files, returning the number of names passed as arguments.
Raises an exception on any error. Since the underlying implementation relies
on the `unlink(2)` system call, the type of exception raised depends on its
error type (see https://linux.die.net/man/2/unlink) and has the form of e.g.
Errno::ENOENT.

See also Dir::rmdir.
**@overload** [] 

**@overload** [] 

## utime(*args ) [](#method-c-utime)
Sets the access and modification times of each named file to the first two
arguments. If a file is a symlink, this method acts upon its referent rather
than the link itself; for the inverse behavior see File.lutime. Returns the
number of file names in the argument list.
**@overload** [] 

## world_readable?(fname ) [](#method-c-world_readable?)
If *file_name* is readable by others, returns an integer representing the file
permission bits of *file_name*. Returns `nil` otherwise. The meaning of the
bits is platform dependent; on Unix systems, see `stat(2)`.

*file_name* can be an IO object.

    File.world_readable?("/etc/passwd")	    #=> 420
    m = File.world_readable?("/etc/passwd")
    sprintf("%o", m)				    #=> "644"
**@overload** [] 

## world_writable?(fname ) [](#method-c-world_writable?)
If *file_name* is writable by others, returns an integer representing the file
permission bits of *file_name*. Returns `nil` otherwise. The meaning of the
bits is platform dependent; on Unix systems, see `stat(2)`.

*file_name* can be an IO object.

    File.world_writable?("/tmp")		    #=> 511
    m = File.world_writable?("/tmp")
    sprintf("%o", m)				    #=> "777"
**@overload** [] 

## writable?(fname ) [](#method-c-writable?)
Returns `true` if the named file is writable by the effective user and group
id of this process. See eaccess(3).

Note that some OS-level security features may cause this to return true even
though the file is not writable by the effective user/group.
**@overload** [] 

## writable_real?(fname ) [](#method-c-writable_real?)
Returns `true` if the named file is writable by the real user and group id of
this process. See access(3).

Note that some OS-level security features may cause this to return true even
though the file is not writable by the real user/group.
**@overload** [] 

## zero?(fname ) [](#method-c-zero?)
Returns `true` if the named file exists and has a zero size.

*file_name* can be an IO object.
**@overload** [] 


#Instance Methods
## atime() [](#method-i-atime)
Returns the last access time (a Time object) for *file*, or epoch if *file*
has not been accessed.

    File.new("testfile").atime   #=> Wed Dec 31 18:00:00 CST 1969

**@overload** [] 

## birthtime() [](#method-i-birthtime)
Returns the birth time for *file*.

    File.new("testfile").birthtime   #=> Wed Apr 09 08:53:14 CDT 2003

If the platform doesn't have birthtime, raises NotImplementedError.

**@overload** [] 

## chmod(vmode) [](#method-i-chmod)
Changes permission bits on *file* to the bit pattern represented by
*mode_int*. Actual effects are platform dependent; on Unix systems, see
`chmod(2)` for details. Follows symbolic links. Also see File#lchmod.

    f = File.new("out", "w");
    f.chmod(0644)   #=> 0

**@overload** [] 

## chown(owner, group) [](#method-i-chown)
Changes the owner and group of *file* to the given numeric owner and group
id's. Only a process with superuser privileges may change the owner of a file.
The current owner of a file may change the file's group to any group to which
the owner belongs. A `nil` or -1 owner or group id is ignored. Follows
symbolic links. See also File#lchown.

    File.new("testfile").chown(502, 1000)

**@overload** [] 

## ctime() [](#method-i-ctime)
Returns the change time for *file* (that is, the time directory information
about the file was changed, not the file itself).

Note that on Windows (NTFS), returns creation time (birth time).

    File.new("testfile").ctime   #=> Wed Apr 09 08:53:14 CDT 2003

**@overload** [] 

## flock(operation) [](#method-i-flock)
:markup: markdown

call-seq:
    flock(locking_constant) -> 0 or false

Locks or unlocks file `self` according to the given `locking_constant`, a
bitwise OR of the values in the table below.

Not available on all platforms.

Returns `false` if `File::LOCK_NB` is specified and the operation would have
blocked; otherwise returns `0`.

| Constant        | Lock         | Effect
|-----------------|--------------|--------------------------------------------
---------------------------------------------------------------------| |
`File::LOCK_EX` | Exclusive    | Only one process may hold an exclusive lock
for `self` at a time.                                               | |
`File::LOCK_NB` | Non-blocking | No blocking; may be combined with
`File::LOCK_SH` or `File::LOCK_EX` using the bitwise OR operator `\|`. | |
`File::LOCK_SH` | Shared       | Multiple processes may each hold a shared
lock for `self` at the same time.                                     | |
`File::LOCK_UN` | Unlock       | Remove an existing lock held by this process.
                                                                  |

Example:

```ruby # Update a counter using an exclusive lock. # Don't use File::WRONLY
because it truncates the file. File.open('counter', File::RDWR | File::CREAT,
0644) do |f|
    f.flock(File::LOCK_EX)
    value = f.read.to_i + 1
    f.rewind
    f.write("#{value}\n")
    f.flush
    f.truncate(f.pos)

end

# Read the counter using a shared lock. File.open('counter', 'r') do |f|
    f.flock(File::LOCK_SH)
    f.read

end ```

## initialize(*args) [](#method-i-initialize)
Opens the file at the given `path` according to the given `mode`; creates and
returns a new File object for that file.

The new File object is buffered mode (or non-sync mode), unless `filename` is
a tty. See IO#flush, IO#fsync, IO#fdatasync, and IO#sync=.

Argument `path` must be a valid file path:

    f = File.new('/etc/fstab')
    f.close
    f = File.new('t.txt')
    f.close

Optional argument `mode` (defaults to 'r') must specify a valid mode; see
[Access Modes](rdoc-ref:File@Access+Modes):

    f = File.new('t.tmp', 'w')
    f.close
    f = File.new('t.tmp', File::RDONLY)
    f.close

Optional argument `perm` (defaults to 0666) must specify valid permissions see
[File Permissions](rdoc-ref:File@File+Permissions):

    f = File.new('t.tmp', File::CREAT, 0644)
    f.close
    f = File.new('t.tmp', File::CREAT, 0444)
    f.close

Optional keyword arguments `opts` specify:

*   [Open Options](rdoc-ref:IO@Open+Options).
*   [Encoding options](rdoc-ref:encodings.rdoc@Encoding+Options).

**@overload** [] 

## lstat() [](#method-i-lstat)
Like File#stat, but does not follow the last symbolic link; instead, returns a
File::Stat object for the link itself:

    File.symlink('t.txt', 'symlink')
    f = File.new('symlink')
    f.stat.size  # => 47
    f.lstat.size # => 11

**@overload** [] 

## mtime() [](#method-i-mtime)
Returns the modification time for *file*.

    File.new("testfile").mtime   #=> Wed Apr 09 08:53:14 CDT 2003

**@overload** [] 

## size() [](#method-i-size)
Returns the size of *file* in bytes.

    File.new("testfile").size   #=> 66

**@overload** [] 

## truncate(len) [](#method-i-truncate)
Truncates *file* to at most *integer* bytes. The file must be opened for
writing. Not available on all platforms.

    f = File.new("out", "w")
    f.syswrite("1234567890")   #=> 10
    f.truncate(5)              #=> 0
    f.close()                  #=> nil
    File.size("out")           #=> 5

**@overload** [] 

