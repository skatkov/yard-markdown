# Class: Gem::Resolver::DependencyRequest
**Inherits:** Object
    

Used Internally. Wraps a Dependency object to also track which spec contained
the Dependency.


# Attributes
## dependency[RW] [](#attribute-i-dependency)
The wrapped Gem::Dependency

## requester[RW] [](#attribute-i-requester)
The request for this dependency.


#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## development?() [](#method-i-development?)
Is this dependency a development dependency?

**@return** [Boolean] 

## explicit?() [](#method-i-explicit?)
Indicate that the request is for a gem explicitly requested by the user

**@return** [Boolean] 

## implicit?() [](#method-i-implicit?)
Indicate that the request is for a gem requested as a dependency of another
gem

**@return** [Boolean] 

## initialize(dependency, requester) [](#method-i-initialize)
Creates a new DependencyRequest for `dependency` from `requester`. +requester
may be nil if the request came from a user.

**@return** [DependencyRequest] a new instance of DependencyRequest

## match?(spec, allow_prereleasefalse) [](#method-i-match?)
Does this dependency request match `spec`?

NOTE:  #match? only matches prerelease versions when #dependency is a
prerelease dependency.

**@return** [Boolean] 

## matches_spec?(spec) [](#method-i-matches_spec?)
Does this dependency request match `spec`?

NOTE:  #matches_spec? matches prerelease versions.  See also #match?

**@return** [Boolean] 

## name() [](#method-i-name)
The name of the gem this dependency request is requesting.

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## request_context() [](#method-i-request_context)
Return a String indicating who caused this request to be added (only valid for
implicit requests)

## requirement() [](#method-i-requirement)
The version requirement for this dependency request

## to_s() [](#method-i-to_s)
:nodoc:

## type() [](#method-i-type)

