# Class: Bundler::PubGrub::VersionUnion
**Inherits:** Object
    



# Class Methods
## normalize_ranges(ranges ) [](#method-c-normalize_ranges)
## union(ranges , normalize: true) [](#method-c-union)
# Attributes
## ranges[RW] [](#attribute-i-ranges)
Returns the value of attribute ranges.


#Instance Methods
## ==(other) [](#method-i-==)

## allows_all?(other) [](#method-i-allows_all?)

**@return** [Boolean] 

## any?() [](#method-i-any?)

**@return** [Boolean] 

## empty?() [](#method-i-empty?)

**@return** [Boolean] 

## eql?(other) [](#method-i-eql?)

**@return** [Boolean] 

## hash() [](#method-i-hash)

## include?(version) [](#method-i-include?)

**@return** [Boolean] 

## initialize(ranges) [](#method-i-initialize)

**@raise** [ArgumentError] 

**@return** [VersionUnion] a new instance of VersionUnion

## inspect() [](#method-i-inspect)

## intersect(other) [](#method-i-intersect)

## intersects?(other) [](#method-i-intersects?)

**@return** [Boolean] 

## invert() [](#method-i-invert)

## select_versions(all_versions) [](#method-i-select_versions)

## to_s() [](#method-i-to_s)

## union(other) [](#method-i-union)

## upper_invert() [](#method-i-upper_invert)

