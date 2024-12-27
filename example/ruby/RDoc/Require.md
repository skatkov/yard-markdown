# Class: RDoc::Require
**Inherits:** RDoc::CodeObject
    

A file loaded by #require


# Attributes
## name[RW] [](#attribute-i-name)
Name of the required file


#Instance Methods
## initialize(name, comment) [](#method-i-initialize)
Creates a new Require that loads `name` with `comment`

**@return** [Require] a new instance of Require

## inspect() [](#method-i-inspect)
:nodoc:

## to_s() [](#method-i-to_s)
:nodoc:

## top_level() [](#method-i-top_level)
The RDoc::TopLevel corresponding to this require, or `nil` if not found.

