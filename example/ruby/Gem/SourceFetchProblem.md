# Class: Gem::SourceFetchProblem
**Inherits:** Gem::ErrorReason
    

An error that indicates we weren't able to fetch some data from a source


# Attributes
## error[RW] [](#attribute-i-error)
The fetch error which is an Exception subclass.

## source[RW] [](#attribute-i-source)
The source that had the fetch problem.


#Instance Methods
## initialize(source, error) [](#method-i-initialize)
Creates a new SourceFetchProblem for the given `source` and `error`.

**@return** [SourceFetchProblem] a new instance of SourceFetchProblem

## wordy() [](#method-i-wordy)
An English description of the error.

