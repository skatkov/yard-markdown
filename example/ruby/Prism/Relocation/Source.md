# Class: Prism::Relocation::Source
**Inherits:** Object
    

Represents the source of a repository that will be reparsed.


# Attributes
## value[RW] [](#attribute-i-value)
The value that will need to be reparsed.


#Instance Methods
## code_units_cache(encoding) [](#method-i-code_units_cache)
Create a code units cache for the given encoding.

## initialize(value) [](#method-i-initialize)
Initialize the source with the given value.

**@return** [Source] a new instance of Source

## result() [](#method-i-result)
Reparse the value and return the parse result.

**@raise** [NotImplementedError] 

