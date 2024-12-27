# Class: CGI::Session::FileStore
**Inherits:** Object
    

File-based session storage class.

Implements session storage as a flat file of 'key=value' values. This storage
type only works directly with String values; the user is responsible for
converting other types to Strings when storing and from Strings when
retrieving.



#Instance Methods
## close() [](#method-i-close)
Update and close the session's FileStore file.

## delete() [](#method-i-delete)
Close and delete the session's FileStore file.

## initialize(session, option{}) [](#method-i-initialize)
Create a new FileStore instance.

This constructor is used internally by CGI::Session.  The user does not
generally need to call it directly.

`session` is the session for which this instance is being created.  The
session id must only contain alphanumeric characters; automatically generated
session ids observe this requirement.

`option` is a hash of options for the initializer.  The following options are
recognised:

tmpdir
:   the directory to use for storing the FileStore file.  Defaults to
    Dir::tmpdir (generally "/tmp" on Unix systems).

prefix
:   the prefix to add to the session id when generating the filename for this
    session's FileStore file. Defaults to "cgi_sid_".

suffix
:   the prefix to add to the session id when generating the filename for this
    session's FileStore file. Defaults to the empty string.


This session's FileStore file will be created if it does not exist, or opened
if it does.

**@return** [FileStore] a new instance of FileStore

## restore() [](#method-i-restore)
Restore session state from the session's FileStore file.

Returns the session state as a hash.

## update() [](#method-i-update)
Save session state to the session's FileStore file.

