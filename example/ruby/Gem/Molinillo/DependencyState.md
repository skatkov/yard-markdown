# Class: Gem::Molinillo::DependencyState
**Inherits:** Gem::Molinillo::ResolutionState
    

A state that encapsulates a set of {#requirements} with an {Array} of
possibilities



#Instance Methods
## pop_possibility_state() [](#method-i-pop_possibility_state)
Removes a possibility from `self`

**@return** [PossibilityState] a state with a single possibility,
the possibility that was removed from `self`

