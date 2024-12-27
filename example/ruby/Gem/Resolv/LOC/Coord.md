# Class: Gem::Resolv::LOC::Coord
**Inherits:** Object
    

A Gem::Resolv::LOC::Coord


# Class Methods
## create(arg ) [](#method-c-create)
Creates a new LOC::Coord from `arg` which may be:

LOC::Coord
:   returns `arg`.

String
:   `arg` must match the LOC::Coord::Regex constant

# Attributes
## coordinates[RW] [](#attribute-i-coordinates)
The raw coordinates

## orientation[RW] [](#attribute-i-orientation)
The orientation of the hemisphere as 'lat' or 'lon'


#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## eql?(other) [](#method-i-eql?)
:nodoc:

**@return** [Boolean] 

## hash() [](#method-i-hash)
:nodoc:

## initialize(coordinates, orientation) [](#method-i-initialize)

**@return** [Coord] a new instance of Coord

## inspect() [](#method-i-inspect)
:nodoc:

## to_s() [](#method-i-to_s)
:nodoc:

