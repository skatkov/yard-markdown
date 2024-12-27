# Class: Prism::Pack::Directive
**Inherits:** Object
    

A directive in the pack template language.


# Attributes
## endian[RW] [](#attribute-i-endian)
The type of endianness of the directive.

## length[RW] [](#attribute-i-length)
The length of this directive (used for integers).

## length_type[RW] [](#attribute-i-length_type)
The length type of this directive (used for integers).

## signed[RW] [](#attribute-i-signed)
The type of signedness of the directive.

## size[RW] [](#attribute-i-size)
The size of the directive.

## source[RW] [](#attribute-i-source)
A byteslice of the source string that this directive represents.

## type[RW] [](#attribute-i-type)
The type of the directive.

## variant[RW] [](#attribute-i-variant)
A symbol representing whether or not we are packing or unpacking.

## version[RW] [](#attribute-i-version)
A symbol representing the version of Ruby.


#Instance Methods
## describe() [](#method-i-describe)
Provide a human-readable description of the directive.

## initialize(version, variant, source, type, signed, endian, size, length_type, length) [](#method-i-initialize)
Initialize a new directive with the given values.

**@return** [Directive] a new instance of Directive

