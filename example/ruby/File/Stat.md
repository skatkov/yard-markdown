# Class: File::Stat
**Inherits:** Object
    
**Includes:** Comparable
  

:nodoc:



#Instance Methods
## <(y) [](#method-i-<)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than 0.

**@overload** [] 

## <=(y) [](#method-i-<=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than or equal to 0.

**@overload** [] 

## <=>(other) [](#method-i-<=>)
Compares File::Stat objects by comparing their respective modification times.

`nil` is returned if `other_stat` is not a File::Stat object

    f1 = File.new("f1", "w")
    sleep 1
    f2 = File.new("f2", "w")
    f1.stat <=> f2.stat   #=> -1

**@overload** [] 

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

## atime() [](#method-i-atime)
Returns the last access time for this file as an object of class Time.

    File.stat("testfile").atime   #=> Wed Dec 31 18:00:00 CST 1969

**@overload** [] 

## between?(min, max) [](#method-i-between?)
Returns `false` if *obj* `<=>` *min* is less than zero or if *obj* `<=>` *max*
is greater than zero, `true` otherwise.

    3.between?(1, 5)               #=> true
    6.between?(1, 5)               #=> false
    'cat'.between?('ant', 'dog')   #=> true
    'gnu'.between?('ant', 'dog')   #=> false

**@overload** [] 

## birthtime() [](#method-i-birthtime)
Returns the birth time for *stat*.

If the platform doesn't have birthtime, raises NotImplementedError.

    File.write("testfile", "foo")
    sleep 10
    File.write("testfile", "bar")
    sleep 10
    File.chmod(0644, "testfile")
    sleep 10
    File.read("testfile")
    File.stat("testfile").birthtime   #=> 2014-02-24 11:19:17 +0900
    File.stat("testfile").mtime       #=> 2014-02-24 11:19:27 +0900
    File.stat("testfile").ctime       #=> 2014-02-24 11:19:37 +0900
    File.stat("testfile").atime       #=> 2014-02-24 11:19:47 +0900

**@overload** [] 

## blksize() [](#method-i-blksize)
Returns the native file system's block size. Will return `nil` on platforms
that don't support this information.

    File.stat("testfile").blksize   #=> 4096

**@overload** [] 

## blockdev?() [](#method-i-blockdev?)
Returns `true` if the file is a block device, `false` if it isn't or if the
operating system doesn't support this feature.

    File.stat("testfile").blockdev?    #=> false
    File.stat("/dev/hda1").blockdev?   #=> true

**@overload** [] 

## blocks() [](#method-i-blocks)
Returns the number of native file system blocks allocated for this file, or
`nil` if the operating system doesn't support this feature.

    File.stat("testfile").blocks   #=> 2

**@overload** [] 

## chardev?() [](#method-i-chardev?)
Returns `true` if the file is a character device, `false` if it isn't or if
the operating system doesn't support this feature.

    File.stat("/dev/tty").chardev?   #=> true

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

## ctime() [](#method-i-ctime)
Returns the change time for *stat* (that is, the time directory information
about the file was changed, not the file itself).

Note that on Windows (NTFS), returns creation time (birth time).

    File.stat("testfile").ctime   #=> Wed Apr 09 08:53:14 CDT 2003

**@overload** [] 

## dev() [](#method-i-dev)
Returns an integer representing the device on which *stat* resides.

    File.stat("testfile").dev   #=> 774

**@overload** [] 

## dev_major() [](#method-i-dev_major)
Returns the major part of `File_Stat#dev` or `nil`.

    File.stat("/dev/fd1").dev_major   #=> 2
    File.stat("/dev/tty").dev_major   #=> 5

**@overload** [] 

## dev_minor() [](#method-i-dev_minor)
Returns the minor part of `File_Stat#dev` or `nil`.

    File.stat("/dev/fd1").dev_minor   #=> 1
    File.stat("/dev/tty").dev_minor   #=> 0

**@overload** [] 

## directory?() [](#method-i-directory?)
Returns `true` if *stat* is a directory, `false` otherwise.

    File.stat("testfile").directory?   #=> false
    File.stat(".").directory?          #=> true

**@overload** [] 

## executable?() [](#method-i-executable?)
Returns `true` if *stat* is executable or if the operating system doesn't
distinguish executable files from nonexecutable files. The tests are made
using the effective owner of the process.

    File.stat("testfile").executable?   #=> false

**@overload** [] 

## executable_real?() [](#method-i-executable_real?)
Same as `executable?`, but tests using the real owner of the process.

**@overload** [] 

## file?() [](#method-i-file?)
Returns `true` if *stat* is a regular file (not a device file, pipe, socket,
etc.).

    File.stat("testfile").file?   #=> true

**@overload** [] 

## ftype() [](#method-i-ftype)
Identifies the type of *stat*. The return string is one of: ```file`'',
```directory`'', ```characterSpecial`'', ```blockSpecial`'', ```fifo`'',
```link`'', ```socket`'', or ```unknown`''.

    File.stat("/dev/tty").ftype   #=> "characterSpecial"

**@overload** [] 

## gid() [](#method-i-gid)
Returns the numeric group id of the owner of *stat*.

    File.stat("testfile").gid   #=> 500

**@overload** [] 

## grpowned?() [](#method-i-grpowned?)
Returns true if the effective group id of the process is the same as the group
id of *stat*. On Windows, returns `false`.

    File.stat("testfile").grpowned?      #=> true
    File.stat("/etc/passwd").grpowned?   #=> false

**@overload** [] 

## initialize(fname) [](#method-i-initialize)
Create a File::Stat object for the given file name (raising an exception if
the file doesn't exist).

**@overload** [] 

## initialize_copy(orig) [](#method-i-initialize_copy)
:nodoc:

## ino() [](#method-i-ino)
Returns the inode number for *stat*.

    File.stat("testfile").ino   #=> 1083669

**@overload** [] 

## inspect() [](#method-i-inspect)
Produce a nicely formatted description of *stat*.

    File.stat("/etc/passwd").inspect
       #=> "#<File::Stat dev=0xe000005, ino=1078078, mode=0100644,
       #    nlink=1, uid=0, gid=0, rdev=0x0, size=1374, blksize=4096,
       #    blocks=8, atime=Wed Dec 10 10:16:12 CST 2003,
       #    mtime=Fri Sep 12 15:41:41 CDT 2003,
       #    ctime=Mon Oct 27 11:20:27 CST 2003,
       #    birthtime=Mon Aug 04 08:13:49 CDT 2003>"

**@overload** [] 

## mode() [](#method-i-mode)
Returns an integer representing the permission bits of *stat*. The meaning of
the bits is platform dependent; on Unix systems, see `stat(2)`.

    File.chmod(0644, "testfile")   #=> 1
    s = File.stat("testfile")
    sprintf("%o", s.mode)          #=> "100644"

**@overload** [] 

## mtime() [](#method-i-mtime)
Returns the modification time of *stat*.

    File.stat("testfile").mtime   #=> Wed Apr 09 08:53:14 CDT 2003

**@overload** [] 

## nlink() [](#method-i-nlink)
Returns the number of hard links to *stat*.

    File.stat("testfile").nlink             #=> 1
    File.link("testfile", "testfile.bak")   #=> 0
    File.stat("testfile").nlink             #=> 2

**@overload** [] 

## owned?() [](#method-i-owned?)
Returns `true` if the effective user id of the process is the same as the
owner of *stat*.

    File.stat("testfile").owned?      #=> true
    File.stat("/etc/passwd").owned?   #=> false

**@overload** [] 

## pipe?() [](#method-i-pipe?)
Returns `true` if the operating system supports pipes and *stat* is a pipe;
`false` otherwise.

**@overload** [] 

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## rdev() [](#method-i-rdev)
Returns an integer representing the device type on which *stat* resides.
Returns `nil` if the operating system doesn't support this feature.

    File.stat("/dev/fd1").rdev   #=> 513
    File.stat("/dev/tty").rdev   #=> 1280

**@overload** [] 

## rdev_major() [](#method-i-rdev_major)
Returns the major part of `File_Stat#rdev` or `nil`.

    File.stat("/dev/fd1").rdev_major   #=> 2
    File.stat("/dev/tty").rdev_major   #=> 5

**@overload** [] 

## rdev_minor() [](#method-i-rdev_minor)
Returns the minor part of `File_Stat#rdev` or `nil`.

    File.stat("/dev/fd1").rdev_minor   #=> 1
    File.stat("/dev/tty").rdev_minor   #=> 0

**@overload** [] 

## readable?() [](#method-i-readable?)
Returns `true` if *stat* is readable by the effective user id of this process.

    File.stat("testfile").readable?   #=> true

**@overload** [] 

## readable_real?() [](#method-i-readable_real?)
Returns `true` if *stat* is readable by the real user id of this process.

    File.stat("testfile").readable_real?   #=> true

**@overload** [] 

## setgid?() [](#method-i-setgid?)
Returns `true` if *stat* has the set-group-id permission bit set, `false` if
it doesn't or if the operating system doesn't support this feature.

    File.stat("/usr/sbin/lpc").setgid?   #=> true

**@overload** [] 

## setuid?() [](#method-i-setuid?)
Returns `true` if *stat* has the set-user-id permission bit set, `false` if it
doesn't or if the operating system doesn't support this feature.

    File.stat("/bin/su").setuid?   #=> true

**@overload** [] 

## size() [](#method-i-size)
Returns the size of *stat* in bytes.

    File.stat("testfile").size   #=> 66

**@overload** [] 

## size?() [](#method-i-size?)
Returns `nil` if *stat* is a zero-length file, the size of the file otherwise.

    File.stat("testfile").size?   #=> 66
    File.stat(File::NULL).size?   #=> nil

**@overload** [] 

## socket?() [](#method-i-socket?)
Returns `true` if *stat* is a socket, `false` if it isn't or if the operating
system doesn't support this feature.

    File.stat("testfile").socket?   #=> false

**@overload** [] 

## sticky?() [](#method-i-sticky?)
Returns `true` if *stat* has its sticky bit set, `false` if it doesn't or if
the operating system doesn't support this feature.

    File.stat("testfile").sticky?   #=> false

**@overload** [] 

## symlink?() [](#method-i-symlink?)
Returns `true` if *stat* is a symbolic link, `false` if it isn't or if the
operating system doesn't support this feature. As File::stat automatically
follows symbolic links, #symlink? will always be `false` for an object
returned by File::stat.

    File.symlink("testfile", "alink")   #=> 0
    File.stat("alink").symlink?         #=> false
    File.lstat("alink").symlink?        #=> true

**@overload** [] 

## uid() [](#method-i-uid)
Returns the numeric user id of the owner of *stat*.

    File.stat("testfile").uid   #=> 501

**@overload** [] 

## world_readable?() [](#method-i-world_readable?)
If *stat* is readable by others, returns an integer representing the file
permission bits of *stat*. Returns `nil` otherwise. The meaning of the bits is
platform dependent; on Unix systems, see `stat(2)`.

    m = File.stat("/etc/passwd").world_readable?  #=> 420
    sprintf("%o", m)				    #=> "644"

**@overload** [] 

## world_writable?() [](#method-i-world_writable?)
If *stat* is writable by others, returns an integer representing the file
permission bits of *stat*. Returns `nil` otherwise. The meaning of the bits is
platform dependent; on Unix systems, see `stat(2)`.

    m = File.stat("/tmp").world_writable?	    #=> 511
    sprintf("%o", m)				    #=> "777"

**@overload** [] 

## writable?() [](#method-i-writable?)
Returns `true` if *stat* is writable by the effective user id of this process.

    File.stat("testfile").writable?   #=> true

**@overload** [] 

## writable_real?() [](#method-i-writable_real?)
Returns `true` if *stat* is writable by the real user id of this process.

    File.stat("testfile").writable_real?   #=> true

**@overload** [] 

## zero?() [](#method-i-zero?)
Returns `true` if *stat* is a zero-length file; `false` otherwise.

    File.stat("testfile").zero?   #=> false

**@overload** [] 

