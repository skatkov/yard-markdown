# Class: Gem::Source::Lock
**Inherits:** Gem::Source
    

A Lock source wraps an installed gem's source and sorts before other sources
during dependency resolution.  This allows RubyGems to prefer gems from
dependency lock files.


# Attributes
## wrapped[RW] [](#attribute-i-wrapped)
The wrapped Gem::Source


#Instance Methods
## <=>(other) [](#method-i-<=>)
:nodoc:

## ==(other) [](#method-i-==)
:nodoc:

## fetch_spec(name_tuple) [](#method-i-fetch_spec)
Delegates to the wrapped source's fetch_spec method.

## hash() [](#method-i-hash)
:nodoc:

## initialize(source) [](#method-i-initialize)
Creates a new Lock source that wraps `source` and moves it earlier in the sort
list.

**@return** [Lock] a new instance of Lock

## uri() [](#method-i-uri)
:nodoc:

