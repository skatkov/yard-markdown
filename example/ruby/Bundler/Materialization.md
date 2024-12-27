# Class: Bundler::Materialization
**Inherits:** Object
    

This class materializes a set of resolved specifications (`LazySpecification`)
for a given gem into the most appropriate real specifications
(`StubSepecification`, `EndpointSpecification`, etc), given a dependency and a
target platform.



#Instance Methods
## complete?() [](#method-i-complete?)

**@return** [Boolean] 

## completely_missing_specs() [](#method-i-completely_missing_specs)

## dependencies() [](#method-i-dependencies)

## incomplete_specs() [](#method-i-incomplete_specs)

## initialize(dep, platform, candidates:) [](#method-i-initialize)

**@return** [Materialization] a new instance of Materialization

## materialized_spec() [](#method-i-materialized_spec)

## partially_missing_specs() [](#method-i-partially_missing_specs)

## specs() [](#method-i-specs)

