# Class: Gem::Resolver::SourceSet
**Inherits:** Gem::Resolver::Set
    

The SourceSet chooses the best available method to query a remote index.

Kind off like BestSet but filters the sources for gems



#Instance Methods
## add_source_gem(name, source) [](#method-i-add_source_gem)

## find_all(req) [](#method-i-find_all)
:nodoc:

## initialize() [](#method-i-initialize)
Creates a SourceSet for the given `sources` or Gem::sources if none are
specified.  `sources` must be a Gem::SourceList.

**@return** [SourceSet] a new instance of SourceSet

## prefetch(reqs) [](#method-i-prefetch)
potentially no-op

