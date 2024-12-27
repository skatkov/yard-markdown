# Class: Bundler::PubGrub::VersionRange
**Inherits:** Object
    



# Class Methods
## any() [](#method-c-any)
## empty() [](#method-c-empty)
# Attributes
## include_max[RW] [](#attribute-i-include_max)
Returns the value of attribute include_max.

## include_min[RW] [](#attribute-i-include_min)
Returns the value of attribute include_min.

## max[RW] [](#attribute-i-max)
Returns the value of attribute max.

## min[RW] [](#attribute-i-min)
Returns the value of attribute min.


#Instance Methods
## ==(other) [](#method-i-==)

## allows_all?(other) [](#method-i-allows_all?)

**@return** [Boolean] 

## any?() [](#method-i-any?)

**@return** [Boolean] 

## compare_version(version) [](#method-i-compare_version)

## contiguous_to?(other) [](#method-i-contiguous_to?)

**@return** [Boolean] 

## empty?() [](#method-i-empty?)

**@return** [Boolean] 

## eql?(other) [](#method-i-eql?)

**@return** [Boolean] 

## hash() [](#method-i-hash)

## include?(version) [](#method-i-include?)

**@return** [Boolean] 

## initialize(min:nil, max:nil, include_min:false, include_max:false, name:nil) [](#method-i-initialize)

**@return** [VersionRange] a new instance of VersionRange

## inspect() [](#method-i-inspect)

## intersect(other) [](#method-i-intersect)

## intersects?(other) [](#method-i-intersects?)

**@return** [Boolean] 

## invert() [](#method-i-invert)

## partition_versions(versions) [](#method-i-partition_versions)
Partitions passed versions into [lower, within, higher]

versions must be sorted

## ranges() [](#method-i-ranges)

## select_versions(versions) [](#method-i-select_versions)
Returns versions which are included by this range.

versions must be sorted

## span(other) [](#method-i-span)
The span covered by two ranges

If self and other are contiguous, this builds a union of the two ranges. (if
they aren't you are probably calling the wrong method)

## strictly_higher?(other) [](#method-i-strictly_higher?)

**@return** [Boolean] 

## strictly_lower?(other) [](#method-i-strictly_lower?)

**@return** [Boolean] 

## to_s() [](#method-i-to_s)

## union(other) [](#method-i-union)

## upper_invert() [](#method-i-upper_invert)

