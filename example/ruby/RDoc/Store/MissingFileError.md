# Exception: RDoc::Store::MissingFileError
**Inherits:** RDoc::Store::Error
    

Raised when a stored file for a class, module, page or method is missing.


# Attributes
## file[RW] [](#attribute-i-file)
The file the #name should be saved as

## name[RW] [](#attribute-i-name)
The name of the object the #file would be loaded from

## store[RW] [](#attribute-i-store)
The store the file should exist in


#Instance Methods
## initialize(store, file, name) [](#method-i-initialize)
Creates a new MissingFileError for the missing `file` for the given `name`
that should have been in the `store`.

**@return** [MissingFileError] a new instance of MissingFileError

## message() [](#method-i-message)
:nodoc:

