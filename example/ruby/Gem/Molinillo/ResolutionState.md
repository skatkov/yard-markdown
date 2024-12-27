# Class: Gem::Molinillo::ResolutionState
**Inherits:** Struct
    

A state that a {Resolution} can be in

**@attr** [String] the name of the current requirement

**@attr** [Array<Object>] currently unsatisfied requirements

**@attr** [DependencyGraph] the graph of activated dependencies

**@attr** [Object] the current requirement

**@attr** [Object] the possibilities to satisfy the current requirement

**@attr** [Integer] the depth of the resolution

**@attr** [Hash] unresolved conflicts, indexed by dependency name

**@attr** [Array<UnwindDetails>] unwinds for previous conflicts that weren't explored


# Class Methods
## empty() [](#method-c-empty)
Returns an empty resolution state
**@return** [ResolutionState] an empty state

# Attributes
## activated[RW] [](#attribute-i-activated)
the graph of activated dependencies

**@return** [DependencyGraph] the current value of activated

## conflicts[RW] [](#attribute-i-conflicts)
unresolved conflicts, indexed by dependency name

**@return** [Hash] the current value of conflicts

## depth[RW] [](#attribute-i-depth)
the depth of the resolution

**@return** [Integer] the current value of depth

## name[RW] [](#attribute-i-name)
the name of the current requirement

**@return** [String] the current value of name

## possibilities[RW] [](#attribute-i-possibilities)
the possibilities to satisfy the current requirement

**@return** [Object] the current value of possibilities

## requirement[RW] [](#attribute-i-requirement)
the current requirement

**@return** [Object] the current value of requirement

## requirements[RW] [](#attribute-i-requirements)
currently unsatisfied requirements

**@return** [Array<Object>] the current value of requirements

## unused_unwind_options[RW] [](#attribute-i-unused_unwind_options)
unwinds for previous conflicts that weren't explored

**@return** [Array<UnwindDetails>] the current value of unused_unwind_options


