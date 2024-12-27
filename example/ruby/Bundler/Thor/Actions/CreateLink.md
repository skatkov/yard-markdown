# Class: Bundler::Thor::Actions::CreateLink
**Inherits:** Bundler::Thor::Actions::CreateFile
    

CreateLink is a subset of CreateFile, which instead of taking a block of data,
just takes a source string from the user.


# Attributes
## data[RW] [](#attribute-i-data)
:nodoc:


#Instance Methods
## exists?() [](#method-i-exists?)

**@return** [Boolean] 

## identical?() [](#method-i-identical?)
Checks if the content of the file at the destination is identical to the
rendered result.

#### Returns
Boolean
:   true if it is identical, false otherwise.


**@return** [Boolean] 

## invoke!() [](#method-i-invoke!)

