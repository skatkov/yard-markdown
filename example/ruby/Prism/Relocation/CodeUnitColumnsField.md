# Class: Prism::Relocation::CodeUnitColumnsField
**Inherits:** Object
    

A field representing the start and end code unit columns for a specific
encoding.


# Attributes
## encoding[RW] [](#attribute-i-encoding)
The associated encoding for the code units.

## repository[RW] [](#attribute-i-repository)
The repository object that is used for lazily creating a code units cache.


#Instance Methods
## fields(value) [](#method-i-fields)
Fetches the start and end code units column of a value for a particular
encoding.

## initialize(repository, encoding) [](#method-i-initialize)
Initialize a new field with the associated repository and encoding.

**@return** [CodeUnitColumnsField] a new instance of CodeUnitColumnsField

