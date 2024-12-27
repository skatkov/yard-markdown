# Module: Gem::Molinillo::Delegates::ResolutionState
    

Delegates all {Gem::Molinillo::ResolutionState} methods to a `#state`
property.



#Instance Methods
## activated() [](#method-i-activated)
the graph of activated dependencies

## conflicts() [](#method-i-conflicts)
unresolved conflicts, indexed by dependency name

## depth() [](#method-i-depth)
the depth of the resolution

## name() [](#method-i-name)
the name of the current requirement

## possibilities() [](#method-i-possibilities)
the possibilities to satisfy the current requirement

## requirement() [](#method-i-requirement)
the current requirement

## requirements() [](#method-i-requirements)
currently unsatisfied requirements

## unused_unwind_options() [](#method-i-unused_unwind_options)
unwinds for previous conflicts that weren't explored

