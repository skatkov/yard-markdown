# Class: RDoc::Markup::Include
**Inherits:** Object
    

A file included at generation time.  Objects of this class are created by
RDoc::RD for an extension-less include.

This implementation in incomplete.


# Attributes
## file[RW] [](#attribute-i-file)
The filename to be included, without extension

## include_path[RW] [](#attribute-i-include_path)
Directories to search for #file


#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## initialize(file, include_path) [](#method-i-initialize)
Creates a new include that will import `file` from `include_path`

**@return** [Include] a new instance of Include

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

