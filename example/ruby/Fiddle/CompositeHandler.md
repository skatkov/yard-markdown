# Class: Fiddle::CompositeHandler
**Inherits:** Object
    

Used internally by Fiddle::Importer



#Instance Methods
## [](symbol) [](#method-i-[])
See Fiddle::CompositeHandler.sym

## handlers() [](#method-i-handlers)
Array of the currently loaded libraries.

## initialize(handlers) [](#method-i-initialize)
Create a new handler with the open `handlers`

Used internally by Fiddle::Importer.dlload

**@return** [CompositeHandler] a new instance of CompositeHandler

## sym(symbol) [](#method-i-sym)
Returns the address as an Integer from any handlers with the function named
`symbol`.

Raises a DLError if the handle is closed.

