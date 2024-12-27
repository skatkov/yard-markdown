# Class: Gem::Source::SpecificFile
**Inherits:** Gem::Source
    

A source representing a single .gem file.  This is used for installation of
local gems.


# Attributes
## path[RW] [](#attribute-i-path)
The path to the gem for this specific file.

## spec[RW] [](#attribute-i-spec)
The Gem::Specification extracted from this .gem.


#Instance Methods
## <=>(other) [](#method-i-<=>)
Orders this source against `other`.

If `other` is a SpecificFile from a different gem name `nil` is returned.

If `other` is a SpecificFile from the same gem name the versions are compared
using Gem::Version#<=>

Otherwise Gem::Source#<=> is used.

## download(spec, dirnil) [](#method-i-download)
:nodoc:

**@raise** [Gem::Exception] 

## fetch_spec(name) [](#method-i-fetch_spec)
:nodoc:

**@raise** [Gem::Exception] 

## initialize(file) [](#method-i-initialize)
Creates a new SpecificFile for the gem in `file`

**@return** [SpecificFile] a new instance of SpecificFile

## load_specs(*a) [](#method-i-load_specs)
:nodoc:

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

