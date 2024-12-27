# Class: Bundler::PubGrub::Term
**Inherits:** Object
    



# Attributes
## constraint[RW] [](#attribute-i-constraint)
Returns the value of attribute constraint.

## package[RW] [](#attribute-i-package)
Returns the value of attribute package.

## positive[RW] [](#attribute-i-positive)
Returns the value of attribute positive.


#Instance Methods
## difference(other) [](#method-i-difference)

## empty?() [](#method-i-empty?)

**@return** [Boolean] 

## eql?(other) [](#method-i-eql?)

**@return** [Boolean] 

## hash() [](#method-i-hash)

## initialize(constraint, positive) [](#method-i-initialize)

**@return** [Term] a new instance of Term

## inspect() [](#method-i-inspect)

## intersect(other) [](#method-i-intersect)

**@raise** [ArgumentError] 

## invert() [](#method-i-invert)

## negative?() [](#method-i-negative?)

**@return** [Boolean] 

## normalized_constraint() [](#method-i-normalized_constraint)

## positive?() [](#method-i-positive?)

**@return** [Boolean] 

## relation(other) [](#method-i-relation)

## satisfies?(other) [](#method-i-satisfies?)

**@raise** [ArgumentError] 

**@return** [Boolean] 

## to_s(allow_every:false) [](#method-i-to_s)

