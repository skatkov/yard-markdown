# Exception: Gem::ConflictError
**Inherits:** Gem::LoadError
    

Raised when there are conflicting gem specs loaded


# Attributes
## conflicts[RW] [](#attribute-i-conflicts)
A Hash mapping conflicting specifications to the dependencies that caused the
conflict

## target[RW] [](#attribute-i-target)
The specification that had the conflict


#Instance Methods
## initialize(target, conflicts) [](#method-i-initialize)

**@return** [ConflictError] a new instance of ConflictError

