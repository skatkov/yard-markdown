# Class: Gem::Source::Installed
**Inherits:** Gem::Source
    

Represents an installed gem.  This is used for dependency resolution.



#Instance Methods
## <=>(other) [](#method-i-<=>)
Installed sources sort before all other sources

## download(spec, path) [](#method-i-download)
We don't need to download an installed gem

## initialize() [](#method-i-initialize)
:nodoc:

**@return** [Installed] a new instance of Installed

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

