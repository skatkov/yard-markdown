# Class: Gem::Resolver::BestSet
**Inherits:** Gem::Resolver::ComposedSet
    

The BestSet chooses the best available method to query a remote index.

It combines IndexSet and APISet



#Instance Methods
## find_all(req) [](#method-i-find_all)
:nodoc:

## initialize(sourcesGem.sources) [](#method-i-initialize)
Creates a BestSet for the given `sources` or Gem::sources if none are
specified.  `sources` must be a Gem::SourceList.

**@return** [BestSet] a new instance of BestSet

## pick_sets() [](#method-i-pick_sets)
Picks which sets to use for the configured sources.

## prefetch(reqs) [](#method-i-prefetch)
:nodoc:

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

