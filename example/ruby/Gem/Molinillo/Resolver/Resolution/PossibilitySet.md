# Class: Gem::Molinillo::Resolver::Resolution::PossibilitySet
**Inherits:** Struct
    

A collection of possibility states that share the same dependencies

**@attr** [Array] the dependencies for this set of possibilities

**@attr** [Array] the possibilities


# Attributes
## dependencies[RW] [](#attribute-i-dependencies)
the dependencies for this set of possibilities

**@return** [Array] the current value of dependencies

## possibilities[RW] [](#attribute-i-possibilities)
the possibilities

**@return** [Array] the current value of possibilities


#Instance Methods
## latest_version() [](#method-i-latest_version)

**@return** [Object] most up-to-date dependency in the possibility set

## to_s() [](#method-i-to_s)
String representation of the possibility set, for debugging

