# Class: Bundler::Checksum::Source
**Inherits:** Object
    



# Attributes
## location[RW] [](#attribute-i-location)
Returns the value of attribute location.

## type[RW] [](#attribute-i-type)
Returns the value of attribute type.


#Instance Methods
## ==(other) [](#method-i-==)

## initialize(type, location) [](#method-i-initialize)

**@return** [Source] a new instance of Source

## removable?() [](#method-i-removable?)

**@return** [Boolean] 

## removal() [](#method-i-removal)
A full sentence describing how to remove the checksum

## to_s() [](#method-i-to_s)
phrased so that the usual string format is grammatically correct
    rake (10.3.2) sha256=abc123 from #{to_s}

