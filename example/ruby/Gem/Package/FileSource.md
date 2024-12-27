# Class: Gem::Package::FileSource
**Inherits:** Gem::Package::Source
    

The primary source of gems is a file on disk, including all usages internal to
rubygems.

This is a private class, do not depend on it directly. Instead, pass a path
object to `Gem::Package.new`.


# Attributes
## path[RW] [](#attribute-i-path)
:nodoc: all


#Instance Methods
## initialize(path) [](#method-i-initialize)

**@return** [FileSource] a new instance of FileSource

## present?() [](#method-i-present?)

**@return** [Boolean] 

## start() [](#method-i-start)

## with_read_io(&block) [](#method-i-with_read_io)

## with_write_io(&block) [](#method-i-with_write_io)

