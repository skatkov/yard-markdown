# Class: OutputToFDMatcher
**Inherits:** Object
    

Lower-level output speccing mechanism for a single output stream. Unlike
OutputMatcher which provides methods to capture the output, we actually
replace the FD itself so that there is no reliance on a certain method being
used.



#Instance Methods
## failure_message() [](#method-i-failure_message)

## initialize(expected, to) [](#method-i-initialize)

**@return** [OutputToFDMatcher] a new instance of OutputToFDMatcher

## matches?(block) [](#method-i-matches?)

**@return** [Boolean] 

## negative_failure_message() [](#method-i-negative_failure_message)

## with_tmp() [](#method-i-with_tmp)

