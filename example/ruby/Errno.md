# Module: Errno
    

When an operating system encounters an error, it typically reports the error
as an integer error code:

    $ ls nosuch.txt
    ls: cannot access 'nosuch.txt': No such file or directory
    $ echo $? # Code for last error.
    2

When the Ruby interpreter interacts with the operating system and receives
such an error code (e.g., `2`), it maps the code to a particular Ruby
exception class (e.g., `Errno::ENOENT`):

    File.open('nosuch.txt')
    # => No such file or directory @ rb_sysopen - nosuch.txt (Errno::ENOENT)

Each such class is:

*   A nested class in this module, `Errno`.
*   A subclass of class SystemCallError.
*   Associated with an error code.

Thus:

    Errno::ENOENT.superclass # => SystemCallError
    Errno::ENOENT::Errno     # => 2

The names of nested classes are returned by method `Errno.constants`:

    Errno.constants.size         # => 158
    Errno.constants.sort.take(5) # => [:E2BIG, :EACCES, :EADDRINUSE, :EADDRNOTAVAIL, :EADV]

As seen above, the error code associated with each class is available as the
value of a constant; the value for a particular class may vary among operating
systems. If the class is not needed for the particular operating system, the
value is zero:

    Errno::ENOENT::Errno      # => 2
    Errno::ENOTCAPABLE::Errno # => 0



