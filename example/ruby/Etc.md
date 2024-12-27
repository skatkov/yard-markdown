# Module: Etc
    



# Class Methods
## confstr(arg ) [](#method-c-confstr)
confstr(name)	->  String

Returns system configuration variable using confstr().

*name* should be a constant under `Etc` which begins with `CS_`.

The return value is a string or nil. nil means no configuration-defined value.
 (confstr() returns 0 but errno is not set.)

    Etc.confstr(Etc::CS_PATH) #=> "/bin:/usr/bin"

    # GNU/Linux
    Etc.confstr(Etc::CS_GNU_LIBC_VERSION) #=> "glibc 2.18"
    Etc.confstr(Etc::CS_GNU_LIBPTHREAD_VERSION) #=> "NPTL 2.18"
## endgrent() [](#method-c-endgrent)
endgrent

Ends the process of scanning through the `/etc/group` file begun by
::getgrent, and closes the file.
## endpwent() [](#method-c-endpwent)
endpwent

Ends the process of scanning through the `/etc/passwd` file begun with
::getpwent, and closes the file.
## getgrent() [](#method-c-getgrent)
getgrent	->  Etc::Group

Returns an entry from the `/etc/group` file.

The first time it is called it opens the file and returns the first entry;
each successive call returns the next entry, or `nil` if the end of the file
has been reached.

To close the file when processing is complete, call ::endgrent.

Each entry is returned as a Group struct
## getgrgid(*args ) [](#method-c-getgrgid)
getgrgid(group_id)  ->	Etc::Group

Returns information about the group with specified integer `group_id`, as
found in `/etc/group`.

The information is returned as a Group struct.

See the unix manpage for `getgrgid(3)` for more detail.

**Example:**

Etc.getgrgid(100) #=> #<struct Etc::Group name="users", passwd="x", gid=100,
mem=["meta", "root"]>
## getgrnam(nam ) [](#method-c-getgrnam)
getgrnam(name)	->  Etc::Group

Returns information about the group with specified `name`, as found in
`/etc/group`.

The information is returned as a Group struct.

See the unix manpage for `getgrnam(3)` for more detail.

**Example:**

Etc.getgrnam('users') #=> #<struct Etc::Group name="users", passwd="x",
gid=100, mem=["meta", "root"]>
## getlogin() [](#method-c-getlogin)
getlogin	->  String

Returns the short user name of the currently logged in user. Unfortunately, it
is often rather easy to fool ::getlogin.

Avoid ::getlogin for security-related purposes.

If ::getlogin fails, try ::getpwuid.

See the unix manpage for `getpwuid(3)` for more detail.

e.g.
    Etc.getlogin -> 'guest'
## getpwent() [](#method-c-getpwent)
getpwent	->  Etc::Passwd

Returns an entry from the `/etc/passwd` file.

The first time it is called it opens the file and returns the first entry;
each successive call returns the next entry, or `nil` if the end of the file
has been reached.

To close the file when processing is complete, call ::endpwent.

Each entry is returned as a Passwd struct.
## getpwnam(nam ) [](#method-c-getpwnam)
getpwnam(name)	->  Etc::Passwd

Returns the `/etc/passwd` information for the user with specified login
`name`.

The information is returned as a Passwd struct.

See the unix manpage for `getpwnam(3)` for more detail.

**Example:**

Etc.getpwnam('root') #=> #<struct Etc::Passwd name="root", passwd="x", uid=0,
gid=0, gecos="root",dir="/root", shell="/bin/bash">
## getpwuid(*args ) [](#method-c-getpwuid)
getpwuid(uid)	->  Etc::Passwd

Returns the `/etc/passwd` information for the user with the given integer
`uid`.

The information is returned as a Passwd struct.

If `uid` is omitted, the value from `Passwd[:uid]` is returned instead.

See the unix manpage for `getpwuid(3)` for more detail.

**Example:**

Etc.getpwuid(0) #=> #<struct Etc::Passwd name="root", passwd="x", uid=0,
gid=0, gecos="root",dir="/root", shell="/bin/bash">
## group() [](#method-c-group)
group { |struct| block } group				->  Etc::Group

Provides a convenient Ruby iterator which executes a block for each entry in
the `/etc/group` file.

The code block is passed an Group struct.

See ::getgrent above for details.

**Example:**

    require 'etc'

    Etc.group {|g|
      puts g.name + ": " + g.mem.join(', ')
    }
## nprocessors() [](#method-c-nprocessors)
nprocessors	->  Integer

Returns the number of online processors.

The result is intended as the number of processes to use all available
processors.

This method is implemented using:
*   sched_getaffinity(): Linux
*   sysconf(_SC_NPROCESSORS_ONLN): GNU/Linux, NetBSD, FreeBSD, OpenBSD,
    DragonFly BSD, OpenIndiana, Mac OS X, AIX

**Example:**

    require 'etc'
    p Etc.nprocessors #=> 4

The result might be smaller number than physical cpus especially when ruby
process is bound to specific cpus. This is intended for getting better
parallel processing.

**Example:** (Linux)

    linux$ taskset 0x3 ./ruby -retc -e "p Etc.nprocessors"  #=> 2
## passwd() [](#method-c-passwd)
passwd { |struct| block } passwd				->  Etc::Passwd

Provides a convenient Ruby iterator which executes a block for each entry in
the `/etc/passwd` file.

The code block is passed an Passwd struct.

See ::getpwent above for details.

**Example:**

    require 'etc'

    Etc.passwd {|u|
      puts u.name + " = " + u.gecos
    }
## setgrent() [](#method-c-setgrent)
setgrent

Resets the process of reading the `/etc/group` file, so that the next call to
::getgrent will return the first entry again.
## setpwent() [](#method-c-setpwent)
setpwent

Resets the process of reading the `/etc/passwd` file, so that the next call to
::getpwent will return the first entry again.
## sysconf(arg ) [](#method-c-sysconf)
sysconf(name)	->  Integer

Returns system configuration variable using sysconf().

*name* should be a constant under `Etc` which begins with `SC_`.

The return value is an integer or nil. nil means indefinite limit.  (sysconf()
returns -1 but errno is not set.)

    Etc.sysconf(Etc::SC_ARG_MAX) #=> 2097152
    Etc.sysconf(Etc::SC_LOGIN_NAME_MAX) #=> 256
## sysconfdir() [](#method-c-sysconfdir)
sysconfdir	->  String

Returns system configuration directory.

This is typically `"/etc"`, but is modified by the prefix used when Ruby was
compiled. For example, if Ruby is built and installed in `/usr/local`, returns
`"/usr/local/etc"` on other platforms than Windows.

On Windows, this always returns the directory provided by the system.
## systmpdir() [](#method-c-systmpdir)
systmpdir	->  String

Returns system temporary directory; typically "/tmp".
## uname() [](#method-c-uname)
uname	-> hash

Returns the system information obtained by uname system call.

The return value is a hash which has 5 keys at least:
    :sysname, :nodename, :release, :version, :machine

**Example:**

    require 'etc'
    require 'pp'

    pp Etc.uname
    #=> {:sysname=>"Linux",
    #    :nodename=>"boron",
    #    :release=>"2.6.18-6-xen-686",
    #    :version=>"#1 SMP Thu Nov 5 19:54:42 UTC 2009",
    #    :machine=>"i686"}

