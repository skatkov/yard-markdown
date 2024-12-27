# Class: CGI::Session::PStore
**Inherits:** Object
    

PStore-based session storage class.

This builds upon the top-level PStore class provided by the library file
pstore.rb.  Session data is marshalled and stored in a file.  File locking and
transaction services are provided.



#Instance Methods
## close() [](#method-i-close)
Update and close the session's PStore file.

## delete() [](#method-i-delete)
Close and delete the session's PStore file.

## initialize(session, option{}) [](#method-i-initialize)
Create a new CGI::Session::PStore instance

This constructor is used internally by CGI::Session.  The user does not
generally need to call it directly.

`session` is the session for which this instance is being created.  The
session id must only contain alphanumeric characters; automatically generated
session ids observe this requirement.

`option` is a hash of options for the initializer.  The following options are
recognised:

tmpdir
:   the directory to use for storing the PStore file.  Defaults to Dir::tmpdir
    (generally "/tmp" on Unix systems).

prefix
:   the prefix to add to the session id when generating the filename for this
    session's PStore file. Defaults to the empty string.


This session's PStore file will be created if it does not exist, or opened if
it does.

**@return** [PStore] a new instance of PStore

## restore() [](#method-i-restore)
Restore session state from the session's PStore file.

Returns the session state as a hash.

## update() [](#method-i-update)
Save session state to the session's PStore file.

