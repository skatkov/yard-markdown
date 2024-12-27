# Class: Bundler::PubGrub::PartialSolution
**Inherits:** Object
    



# Attributes
## assignments[RW] [](#attribute-i-assignments)
Returns the value of attribute assignments.

## attempted_solutions[RW] [](#attribute-i-attempted_solutions)
Returns the value of attribute attempted_solutions.

## decisions[RW] [](#attribute-i-decisions)
Returns the value of attribute decisions.


#Instance Methods
## backtrack(previous_level) [](#method-i-backtrack)

## decide(package, version) [](#method-i-decide)

## decision_level() [](#method-i-decision_level)

## derive(term, cause) [](#method-i-derive)

## initialize() [](#method-i-initialize)

**@return** [PartialSolution] a new instance of PartialSolution

## relation(term) [](#method-i-relation)

## satisfier(term) [](#method-i-satisfier)

## satisfies?(term) [](#method-i-satisfies?)

**@return** [Boolean] 

## unsatisfied() [](#method-i-unsatisfied)
A list of unsatisfied terms

