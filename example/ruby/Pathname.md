# Class: Pathname
**Inherits:** Object
    

*   tmpdir *


# Class Methods
## getwd() [](#method-c-getwd)
Returns the current working directory as a Pathname.

Pathname.getwd
    #=> #<Pathname:/home/zzak/projects/ruby>

See Dir.getwd.
## glob(*args ) [](#method-c-glob)
Returns or yields Pathname objects.

    Pathname.glob("lib/i*.rb")

#=> [#<Pathname:lib/ipaddr.rb>, #<Pathname:lib/irb.rb>]

See Dir.glob.
## mktmpdir() [](#method-c-mktmpdir)
Creates a tmp directory and wraps the returned path in a Pathname object.

See Dir.mktmpdir
## pwd() [](#method-c-pwd)
Returns the current working directory as a Pathname.

Pathname.getwd
    #=> #<Pathname:/home/zzak/projects/ruby>

See Dir.getwd.

#Instance Methods
## +(other) [](#method-i-+)
Appends a pathname fragment to `self` to produce a new Pathname object. Since
`other` is considered as a path relative to `self`, if `other` is an absolute
path, the new Pathname object is created from just `other`.

    p1 = Pathname.new("/usr")      # Pathname:/usr
    p2 = p1 + "bin/ruby"           # Pathname:/usr/bin/ruby
    p3 = p1 + "/etc/passwd"        # Pathname:/etc/passwd

    # / is aliased to +.
    p4 = p1 / "bin/ruby"           # Pathname:/usr/bin/ruby
    p5 = p1 / "/etc/passwd"        # Pathname:/etc/passwd

This method doesn't access the file system; it is pure string manipulation.

## <=>(other) [](#method-i-<=>)
Provides a case-sensitive comparison operator for pathnames.

Pathname.new('/usr') <=> Pathname.new('/usr/bin')
    #=> -1

Pathname.new('/usr/bin') <=> Pathname.new('/usr/bin')
    #=> 0

Pathname.new('/usr/bin') <=> Pathname.new('/USR/BIN')
    #=> 1

It will return `-1`, `0` or `1` depending on the value of the left argument
relative to the right argument. Or it will return `nil` if the arguments are
not comparable.

## ==(other) [](#method-i-==)
Compare this pathname with `other`.  The comparison is string-based. Be aware
that two different paths (`foo.txt` and `./foo.txt`) can refer to the same
file.

## ===(other) [](#method-i-===)
Compare this pathname with `other`.  The comparison is string-based. Be aware
that two different paths (`foo.txt` and `./foo.txt`) can refer to the same
file.

## absolute?() [](#method-i-absolute?)
Predicate method for testing whether a path is absolute.

It returns `true` if the pathname begins with a slash.

    p = Pathname.new('/im/sure')
    p.absolute?
        #=> true

    p = Pathname.new('not/so/sure')
    p.absolute?
        #=> false

**@return** [Boolean] 

## ascend() [](#method-i-ascend)
Iterates over and yields a new Pathname object for each element in the given
path in ascending order.

    Pathname.new('/path/to/some/file.rb').ascend {|v| p v}
       #<Pathname:/path/to/some/file.rb>
       #<Pathname:/path/to/some>
       #<Pathname:/path/to>
       #<Pathname:/path>
       #<Pathname:/>

    Pathname.new('path/to/some/file.rb').ascend {|v| p v}
       #<Pathname:path/to/some/file.rb>
       #<Pathname:path/to/some>
       #<Pathname:path/to>
       #<Pathname:path>

Returns an Enumerator if no block was given.

    enum = Pathname.new("/usr/bin/ruby").ascend
      # ... do stuff ...
    enum.each { |e| ... }
      # yields Pathnames /usr/bin/ruby, /usr/bin, /usr, and /.

It doesn't access the filesystem.

**@yield** [_self] 

**@yieldparam** [Pathname] the object that the method was called on

## atime() [](#method-i-atime)
Returns the last access time for the file.

See File.atime.

**@overload** [] 

## basename(*args) [](#method-i-basename)
Returns the last component of the path.

See File.basename.

## binread(*args) [](#method-i-binread)
Returns all the bytes from the file, or the first `N` if specified.

See File.binread.

**@overload** [] 

## binwrite(*args) [](#method-i-binwrite)
Writes `contents` to the file, opening it in binary mode.

See File.binwrite.

**@overload** [] 

**@overload** [] 

## birthtime() [](#method-i-birthtime)
Returns the birth time for the file. If the platform doesn't have birthtime,
raises NotImplementedError.

See File.birthtime.

**@overload** [] 

## blockdev?() [](#method-i-blockdev?)
See FileTest.blockdev?.

**@return** [Boolean] 

## chardev?() [](#method-i-chardev?)
See FileTest.chardev?.

**@return** [Boolean] 

## children(with_directorytrue) [](#method-i-children)
Returns the children of the directory (files and subdirectories, not
recursive) as an array of Pathname objects.

By default, the returned pathnames will have enough information to access the
files. If you set `with_directory` to `false`, then the returned pathnames
will contain the filename only.

For example:
    pn = Pathname("/usr/lib/ruby/1.8")
    pn.children
        # -> [ Pathname:/usr/lib/ruby/1.8/English.rb,
               Pathname:/usr/lib/ruby/1.8/Env.rb,
               Pathname:/usr/lib/ruby/1.8/abbrev.rb, ... ]
    pn.children(false)
        # -> [ Pathname:English.rb, Pathname:Env.rb, Pathname:abbrev.rb, ... ]

Note that the results never contain the entries `.` and `..` in the directory
because they are not children.

## chmod(mode) [](#method-i-chmod)
Changes file permissions.

See File.chmod.

**@overload** [] 

## chown(owner, group) [](#method-i-chown)
Change owner and group of the file.

See File.chown.

**@overload** [] 

## cleanpath(consider_symlinkfalse) [](#method-i-cleanpath)
Returns clean pathname of `self` with consecutive slashes and useless dots
removed.  The filesystem is not accessed.

If `consider_symlink` is `true`, then a more conservative algorithm is used to
avoid breaking symbolic linkages.  This may retain more `..` entries than
absolutely necessary, but without accessing the filesystem, this can't be
avoided.

See Pathname#realpath.

## ctime() [](#method-i-ctime)
Returns the last change time, using directory information, not the file
itself.

See File.ctime.

**@overload** [] 

## delete() [](#method-i-delete)
Removes a file or directory, using File.unlink if `self` is a file, or
Dir.unlink as necessary.

## descend() [](#method-i-descend)
Iterates over and yields a new Pathname object for each element in the given
path in descending order.

    Pathname.new('/path/to/some/file.rb').descend {|v| p v}
       #<Pathname:/>
       #<Pathname:/path>
       #<Pathname:/path/to>
       #<Pathname:/path/to/some>
       #<Pathname:/path/to/some/file.rb>

    Pathname.new('path/to/some/file.rb').descend {|v| p v}
       #<Pathname:path>
       #<Pathname:path/to>
       #<Pathname:path/to/some>
       #<Pathname:path/to/some/file.rb>

Returns an Enumerator if no block was given.

    enum = Pathname.new("/usr/bin/ruby").descend
      # ... do stuff ...
    enum.each { |e| ... }
      # yields Pathnames /, /usr, /usr/bin, and /usr/bin/ruby.

It doesn't access the filesystem.

## directory?() [](#method-i-directory?)
See FileTest.directory?.

**@return** [Boolean] 

## dirname() [](#method-i-dirname)
Returns all but the last component of the path.

See File.dirname.

## each_child(with_directorytrue, &b) [](#method-i-each_child)
Iterates over the children of the directory (files and subdirectories, not
recursive).

It yields Pathname object for each child.

By default, the yielded pathnames will have enough information to access the
files.

If you set `with_directory` to `false`, then the returned pathnames will
contain the filename only.

    Pathname("/usr/local").each_child {|f| p f }
    #=> #<Pathname:/usr/local/share>
    #   #<Pathname:/usr/local/bin>
    #   #<Pathname:/usr/local/games>
    #   #<Pathname:/usr/local/lib>
    #   #<Pathname:/usr/local/include>
    #   #<Pathname:/usr/local/sbin>
    #   #<Pathname:/usr/local/src>
    #   #<Pathname:/usr/local/man>

    Pathname("/usr/local").each_child(false) {|f| p f }
    #=> #<Pathname:share>
    #   #<Pathname:bin>
    #   #<Pathname:games>
    #   #<Pathname:lib>
    #   #<Pathname:include>
    #   #<Pathname:sbin>
    #   #<Pathname:src>
    #   #<Pathname:man>

Note that the results never contain the entries `.` and `..` in the directory
because they are not children.

See Pathname#children

## each_entry() [](#method-i-each_entry)
Iterates over the entries (files and subdirectories) in the directory,
yielding a Pathname object for each entry.

## each_filename() [](#method-i-each_filename)
Iterates over each component of the path.

    Pathname.new("/usr/bin/ruby").each_filename {|filename| ... }
      # yields "usr", "bin", and "ruby".

Returns an Enumerator if no block was given.

    enum = Pathname.new("/usr/bin/ruby").each_filename
      # ... do stuff ...
    enum.each { |e| ... }
      # yields "usr", "bin", and "ruby".

## each_line(*args) [](#method-i-each_line)
Iterates over each line in the file and yields a String object for each.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## empty?() [](#method-i-empty?)
Tests the file is empty.

See Dir#empty? and FileTest.empty?.

**@return** [Boolean] 

## entries() [](#method-i-entries)
Return the entries (files and subdirectories) in the directory, each as a
Pathname object.

The results contains just the names in the directory, without any trailing
slashes or recursive look-up.

    pp Pathname.new('/usr/local').entries
    #=> [#<Pathname:share>,
    #    #<Pathname:lib>,
    #    #<Pathname:..>,
    #    #<Pathname:include>,
    #    #<Pathname:etc>,
    #    #<Pathname:bin>,
    #    #<Pathname:man>,
    #    #<Pathname:games>,
    #    #<Pathname:.>,
    #    #<Pathname:sbin>,
    #    #<Pathname:src>]

The result may contain the current directory `#<Pathname:.>` and the parent
directory `#<Pathname:..>`.

If you don't want `.` and `..` and want directories, consider
Pathname#children.

## eql?(other) [](#method-i-eql?)
Compare this pathname with `other`.  The comparison is string-based. Be aware
that two different paths (`foo.txt` and `./foo.txt`) can refer to the same
file.

**@return** [Boolean] 

## executable?() [](#method-i-executable?)
See FileTest.executable?.

**@return** [Boolean] 

## executable_real?() [](#method-i-executable_real?)
See FileTest.executable_real?.

**@return** [Boolean] 

## exist?() [](#method-i-exist?)
See FileTest.exist?.

**@return** [Boolean] 

## expand_path(*args) [](#method-i-expand_path)
Returns the absolute path for the file.

See File.expand_path.

## extname() [](#method-i-extname)
Returns the file's extension.

See File.extname.

## file?() [](#method-i-file?)
See FileTest.file?.

**@return** [Boolean] 

## find(ignore_error:true) [](#method-i-find)
Iterates over the directory tree in a depth first manner, yielding a Pathname
for each file under "this" directory.

Returns an Enumerator if no block is given.

Since it is implemented by the standard library module Find, Find.prune can be
used to control the traversal.

If `self` is `.`, yielded pathnames begin with a filename in the current
directory, not `./`.

See Find.find

## fnmatch(*args) [](#method-i-fnmatch)
Return `true` if the receiver matches the given pattern.

See File.fnmatch.

**@overload** [] 

**@overload** [] 

## fnmatch?(*args) [](#method-i-fnmatch?)
Return `true` if the receiver matches the given pattern.

See File.fnmatch.

**@overload** [] 

**@overload** [] 

## freeze() [](#method-i-freeze)
Freezes this Pathname.

See Object.freeze.

**@overload** [] 

## ftype() [](#method-i-ftype)
Returns "type" of file ("file", "directory", etc).

See File.ftype.

**@overload** [] 

## glob(*args) [](#method-i-glob)
Returns or yields Pathname objects.

    Pathname("ruby-2.4.2").glob("R*.md")
    #=> [#<Pathname:ruby-2.4.2/README.md>, #<Pathname:ruby-2.4.2/README.ja.md>]

See Dir.glob. This method uses the `base` keyword argument of Dir.glob.

## grpowned?() [](#method-i-grpowned?)
See FileTest.grpowned?.

**@return** [Boolean] 

## hash() [](#method-i-hash)
:nodoc:

## initialize(arg) [](#method-i-initialize)
Create a Pathname object from the given String (or String-like object). If
`path` contains a NULL character (`\0`), an ArgumentError is raised.

## inspect() [](#method-i-inspect)
:nodoc:

## join(*args) [](#method-i-join)
Joins the given pathnames onto `self` to create a new Pathname object. This is
effectively the same as using Pathname#+ to append `self` and all arguments
sequentially.

    path0 = Pathname.new("/usr")                # Pathname:/usr
    path0 = path0.join("bin/ruby")              # Pathname:/usr/bin/ruby
        # is the same as
    path1 = Pathname.new("/usr") + "bin/ruby"   # Pathname:/usr/bin/ruby
    path0 == path1
        #=> true

## lchmod(mode) [](#method-i-lchmod)
Same as Pathname.chmod, but does not follow symbolic links.

See File.lchmod.

**@overload** [] 

## lchown(owner, group) [](#method-i-lchown)
Same as Pathname.chown, but does not follow symbolic links.

See File.lchown.

**@overload** [] 

## lstat() [](#method-i-lstat)
See File.lstat.

## lutime(atime, mtime) [](#method-i-lutime)
Update the access and modification times of the file.

Same as Pathname#utime, but does not follow symbolic links.

See File.lutime.

## make_link(old) [](#method-i-make_link)
Creates a hard link at *pathname*.

See File.link.

**@overload** [] 

## make_symlink(old) [](#method-i-make_symlink)
Creates a symbolic link.

See File.symlink.

**@overload** [] 

## mkdir(*args) [](#method-i-mkdir)
Create the referenced directory.

See Dir.mkdir.

## mkpath(mode:nil) [](#method-i-mkpath)
Creates a full path, including any intermediate directories that don't yet
exist.

See FileUtils.mkpath and FileUtils.mkdir_p

## mountpoint?() [](#method-i-mountpoint?)
Returns `true` if `self` points to a mountpoint.

**@return** [Boolean] 

## mtime() [](#method-i-mtime)
Returns the last modified time of the file.

See File.mtime.

**@overload** [] 

## open(*args) [](#method-i-open)
Opens the file for reading or writing.

See File.open.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## opendir() [](#method-i-opendir)
Opens the referenced directory.

See Dir.open.

## owned?() [](#method-i-owned?)
See FileTest.owned?.

**@return** [Boolean] 

## parent() [](#method-i-parent)
Returns the parent directory.

This is same as `self + '..'`.

## pipe?() [](#method-i-pipe?)
See FileTest.pipe?.

**@return** [Boolean] 

## read(*args) [](#method-i-read)
Returns all data from the file, or the first `N` bytes if specified.

See File.read.

**@overload** [] 

**@overload** [] 

## readable?() [](#method-i-readable?)
See FileTest.readable?.

**@return** [Boolean] 

## readable_real?() [](#method-i-readable_real?)
See FileTest.readable_real?.

**@return** [Boolean] 

## readlines(*args) [](#method-i-readlines)
Returns all the lines from the file.

See File.readlines.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## readlink() [](#method-i-readlink)
Read symbolic link.

See File.readlink.

## realdirpath(*args) [](#method-i-realdirpath)
Returns the real (absolute) pathname of `self` in the actual filesystem.

Does not contain symlinks or useless dots, `..` and `.`.

The last component of the real pathname can be nonexistent.

## realpath(*args) [](#method-i-realpath)
Returns the real (absolute) pathname for `self` in the actual filesystem.

Does not contain symlinks or useless dots, `..` and `.`.

All components of the pathname must exist when this method is called.

## relative?() [](#method-i-relative?)
The opposite of Pathname#absolute?

It returns `false` if the pathname begins with a slash.

    p = Pathname.new('/im/sure')
    p.relative?
        #=> false

    p = Pathname.new('not/so/sure')
    p.relative?
        #=> true

**@return** [Boolean] 

## relative_path_from(base_directory) [](#method-i-relative_path_from)
Returns a relative path from the given `base_directory` to the receiver.

If `self` is absolute, then `base_directory` must be absolute too.

If `self` is relative, then `base_directory` must be relative too.

This method doesn't access the filesystem.  It assumes no symlinks.

ArgumentError is raised when it cannot find a relative path.

Note that this method does not handle situations where the case sensitivity of
the filesystem in use differs from the operating system default.

## rename(to) [](#method-i-rename)
Rename the file.

See File.rename.

## rmdir() [](#method-i-rmdir)
Remove the referenced directory.

See Dir.rmdir.

## rmtree(noop:nil, verbose:nil, secure:nil) [](#method-i-rmtree)
Recursively deletes a directory, including all directories beneath it.

See FileUtils.rm_rf

## root?() [](#method-i-root?)
Predicate method for root directories.  Returns `true` if the pathname
consists of consecutive slashes.

It doesn't access the filesystem.  So it may return `false` for some pathnames
which points to roots such as `/usr/..`.

**@return** [Boolean] 

## setgid?() [](#method-i-setgid?)
See FileTest.setgid?.

**@return** [Boolean] 

## setuid?() [](#method-i-setuid?)
See FileTest.setuid?.

**@return** [Boolean] 

## size() [](#method-i-size)
See FileTest.size.

## size?() [](#method-i-size?)
See FileTest.size?.

**@return** [Boolean] 

## socket?() [](#method-i-socket?)
See FileTest.socket?.

**@return** [Boolean] 

## split() [](#method-i-split)
Returns the #dirname and the #basename in an Array.

See File.split.

## stat() [](#method-i-stat)
Returns a File::Stat object.

See File.stat.

## sticky?() [](#method-i-sticky?)
See FileTest.sticky?.

**@return** [Boolean] 

## sub(*args) [](#method-i-sub)
Return a pathname which is substituted by String#sub.

path1 = Pathname.new('/usr/bin/perl') path1.sub('perl', 'ruby')
    #=> #<Pathname:/usr/bin/ruby>

## sub_ext(repl) [](#method-i-sub_ext)
Return a pathname with `repl` added as a suffix to the basename.

If self has no extension part, `repl` is appended.

Pathname.new('/usr/bin/shutdown').sub_ext('.rb')
    #=> #<Pathname:/usr/bin/shutdown.rb>

## symlink?() [](#method-i-symlink?)
See FileTest.symlink?.

**@return** [Boolean] 

## sysopen(*args) [](#method-i-sysopen)
See IO.sysopen.

**@overload** [] 

## to_path() [](#method-i-to_path)
Return the path as a String.

to_path is implemented so Pathname objects are usable with File.open, etc.

**@overload** [] 

**@overload** [] 

## to_s() [](#method-i-to_s)
Return the path as a String.

to_path is implemented so Pathname objects are usable with File.open, etc.

**@overload** [] 

**@overload** [] 

## truncate(length) [](#method-i-truncate)
Truncates the file to `length` bytes.

See File.truncate.

## unlink() [](#method-i-unlink)
Removes a file or directory, using File.unlink if `self` is a file, or
Dir.unlink as necessary.

## utime(atime, mtime) [](#method-i-utime)
Update the access and modification times of the file.

See File.utime.

## world_readable?() [](#method-i-world_readable?)
See FileTest.world_readable?.

**@return** [Boolean] 

## world_writable?() [](#method-i-world_writable?)
See FileTest.world_writable?.

**@return** [Boolean] 

## writable?() [](#method-i-writable?)
See FileTest.writable?.

**@return** [Boolean] 

## writable_real?() [](#method-i-writable_real?)
See FileTest.writable_real?.

**@return** [Boolean] 

## write(*args) [](#method-i-write)
Writes `contents` to the file.

See File.write.

**@overload** [] 

**@overload** [] 

## zero?() [](#method-i-zero?)
See FileTest.zero?.

**@return** [Boolean] 

