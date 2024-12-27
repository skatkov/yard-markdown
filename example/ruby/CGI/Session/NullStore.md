# Class: CGI::Session::NullStore
**Inherits:** Object
    

Dummy session storage class.

Implements session storage place holder.  No actual storage will be done.



#Instance Methods
## close() [](#method-i-close)
Close session storage.

A no-op.

## delete() [](#method-i-delete)
Delete the session state.

A no-op.

## initialize(session, optionnil) [](#method-i-initialize)
Create a new NullStore instance.

`session` is the session this instance is associated with. `option` is a list
of initialisation options.  None are currently recognised.

**@return** [NullStore] a new instance of NullStore

## restore() [](#method-i-restore)
Restore (empty) session state.

## update() [](#method-i-update)
Update session state.

A no-op.

