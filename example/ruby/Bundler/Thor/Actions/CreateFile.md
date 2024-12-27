# Class: Bundler::Thor::Actions::CreateFile
**Inherits:** Bundler::Thor::Actions::EmptyDirectory
    

CreateFile is a subset of Template, which instead of rendering a file with
ERB, it gets the content from the user.


# Attributes
## data[RW] [](#attribute-i-data)
:nodoc:


#Instance Methods
## identical?() [](#method-i-identical?)
Checks if the content of the file at the destination is identical to the
rendered result.

#### Returns
Boolean
:   true if it is identical, false otherwise.


**@return** [Boolean] 

## initialize(base, destination, data, config{}) [](#method-i-initialize)

**@return** [CreateFile] a new instance of CreateFile

## invoke!() [](#method-i-invoke!)

## render() [](#method-i-render)
Holds the content to be added to the file.

