# Class: Prism::Relocation::CodeUnitOffsetsField
**Inherits:** Object
    

A field representing the start and end code unit offsets.


# Attributes
## encoding[RW] [](#attribute-i-encoding)
The associated encoding for the code units.

## repository[RW] [](#attribute-i-repository)
A pointer to the repository object that is used for lazily creating a code
units cache.


#Instance Methods
## fields(value) [](#method-i-fields)
Fetches the start and end code units offset of a value for a particular
encoding.

## initialize(repository, encoding) [](#method-i-initialize)
Initialize a new field with the associated repository and encoding.

**@return** [CodeUnitOffsetsField] a new instance of CodeUnitOffsetsField

