# Class: Gem::Resolver::Conflict
**Inherits:** Object
    

Used internally to indicate that a dependency conflicted with a spec that
would be activated.


# Attributes
## activated[RW] [](#attribute-i-activated)
The specification that was activated prior to the conflict

## dependency[RW] [](#attribute-i-dependency)
The dependency that is in conflict with the activated gem.

## failed_dep[RW] [](#attribute-i-failed_dep)
:nodoc:


#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## conflicting_dependencies() [](#method-i-conflicting_dependencies)
Return the 2 dependency objects that conflicted

## explain() [](#method-i-explain)
A string explanation of the conflict.

## explanation() [](#method-i-explanation)
Explanation of the conflict used by exceptions to print useful messages

## for_spec?(spec) [](#method-i-for_spec?)
Returns true if the conflicting dependency's name matches `spec`.

**@return** [Boolean] 

## initialize(dependency, activated, failed_depdependency) [](#method-i-initialize)
Creates a new resolver conflict when `dependency` is in conflict with an
already `activated` specification.

**@return** [Conflict] a new instance of Conflict

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## request_path(current) [](#method-i-request_path)
Path of activations from the `current` list.

## requester() [](#method-i-requester)
Return the Specification that listed the dependency

