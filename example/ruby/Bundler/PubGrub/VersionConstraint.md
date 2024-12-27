# Class: Bundler::PubGrub::VersionConstraint
**Inherits:** Object
    



# Class Methods
## any(package ) [](#method-c-any)
## empty(package ) [](#method-c-empty)
## exact(package , version ) [](#method-c-exact)
# Attributes
## package[RW] [](#attribute-i-package)
Returns the value of attribute package.

## range[RW] [](#attribute-i-range)
Returns the value of attribute range.


#Instance Methods
## ==(other) [](#method-i-==)

## allows_all?(other) [](#method-i-allows_all?)

**@return** [Boolean] 

## allows_any?(other) [](#method-i-allows_any?)

**@return** [Boolean] 

## any?() [](#method-i-any?)
Does this match every version of the package

**@return** [Boolean] 

## constraint_string() [](#method-i-constraint_string)

## difference(other) [](#method-i-difference)

## disjoint?(other) [](#method-i-disjoint?)

**@return** [Boolean] 

## empty?() [](#method-i-empty?)

**@return** [Boolean] 

## eql?(other) [](#method-i-eql?)

**@return** [Boolean] 

## hash() [](#method-i-hash)

## initialize(package, range:nil) [](#method-i-initialize)

**@param** [Bundler::PubGrub::Package] 

**@param** [Bundler::PubGrub::VersionRange] 

**@return** [VersionConstraint] a new instance of VersionConstraint

## inspect() [](#method-i-inspect)

## intersect(other) [](#method-i-intersect)

## invert() [](#method-i-invert)

## overlap?(other) [](#method-i-overlap?)

**@return** [Boolean] 

## relation(other) [](#method-i-relation)

## subset?(other) [](#method-i-subset?)

**@return** [Boolean] 

## to_s(allow_every:false) [](#method-i-to_s)

## union(other) [](#method-i-union)

