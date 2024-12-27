# Exception: Gem::ImpossibleDependenciesError
**Inherits:** Gem::Exception
    

Raised by Gem::Resolver when dependencies conflict and create the inability to
find a valid possible spec for a request.


# Attributes
## conflicts[RW] [](#attribute-i-conflicts)
Returns the value of attribute conflicts.

## request[RW] [](#attribute-i-request)
Returns the value of attribute request.


#Instance Methods
## build_message() [](#method-i-build_message)
:nodoc:

## dependency() [](#method-i-dependency)

## initialize(request, conflicts) [](#method-i-initialize)

**@return** [ImpossibleDependenciesError] a new instance of ImpossibleDependenciesError

