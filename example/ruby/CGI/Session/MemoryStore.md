# Class: CGI::Session::MemoryStore
**Inherits:** Object
    

In-memory session storage class.

Implements session storage as a global in-memory hash.  Session data will only
persist for as long as the Ruby interpreter instance does.



#Instance Methods
## close() [](#method-i-close)
Close session storage.

A no-op.

## delete() [](#method-i-delete)
Delete the session state.

## initialize(session, optionnil) [](#method-i-initialize)
Create a new MemoryStore instance.

`session` is the session this instance is associated with. `option` is a list
of initialisation options.  None are currently recognized.

**@return** [MemoryStore] a new instance of MemoryStore

## restore() [](#method-i-restore)
Restore session state.

Returns session data as a hash.

## update() [](#method-i-update)
Update session state.

A no-op.

