# Class: Gem::Package::IOSource
**Inherits:** Gem::Package::Source
    

Supports reading and writing gems from/to a generic IO object.  This is useful
for other applications built on top of rubygems, such as rubygems.org.

This is a private class, do not depend on it directly. Instead, pass an IO
object to `Gem::Package.new`.


# Attributes
## io[RW] [](#attribute-i-io)
:nodoc: all


#Instance Methods
## initialize(io) [](#method-i-initialize)

**@return** [IOSource] a new instance of IOSource

## path() [](#method-i-path)

## present?() [](#method-i-present?)

**@return** [Boolean] 

## start() [](#method-i-start)

## with_read_io() [](#method-i-with_read_io)

## with_write_io() [](#method-i-with_write_io)

