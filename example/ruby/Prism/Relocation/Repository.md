# Class: Prism::Relocation::Repository
**Inherits:** Object
    

A repository is a configured collection of fields and a set of entries that
knows how to reparse a source and reify the values.


# Attributes
## entries[RW] [](#attribute-i-entries)
The entries that have been saved on this repository.

## fields[RW] [](#attribute-i-fields)
The fields that have been configured on this repository.

## source[RW] [](#attribute-i-source)
The source associated with this repository. This will be either a
SourceFilepath (the most common use case) or a SourceString.


#Instance Methods
## character_columns() [](#method-i-character_columns)
Configure the character columns field for this repository and return self.

## character_offsets() [](#method-i-character_offsets)
Configure the character offsets field for this repository and return self.

## code_unit_columns(encoding) [](#method-i-code_unit_columns)
Configure the code unit columns field for this repository for a specific
encoding and return self.

## code_unit_offsets(encoding) [](#method-i-code_unit_offsets)
Configure the code unit offsets field for this repository for a specific
encoding and return self.

## code_units_cache(encoding) [](#method-i-code_units_cache)
Create a code units cache for the given encoding from the source.

## columns() [](#method-i-columns)
Configure the columns field for this repository and return self.

## comments() [](#method-i-comments)
Configure both the leading and trailing comment fields for this repository and
return self.

## enter(node_id, field_name) [](#method-i-enter)
This method is called from nodes and locations when they want to enter
themselves into the repository. It it internal-only and meant to be called
from the #save* APIs.

## filepath() [](#method-i-filepath)
Configure the filepath field for this repository and return self.

**@raise** [ConfigurationError] 

## initialize(source) [](#method-i-initialize)
Initialize a new repository with the given source.

**@return** [Repository] a new instance of Repository

## leading_comments() [](#method-i-leading_comments)
Configure the leading comments field for this repository and return self.

## lines() [](#method-i-lines)
Configure the lines field for this repository and return self.

## offsets() [](#method-i-offsets)
Configure the offsets field for this repository and return self.

## reify!() [](#method-i-reify!)
This method is called from the entries in the repository when they need to
reify their values. It is internal-only and meant to be called from the
various value APIs.

## trailing_comments() [](#method-i-trailing_comments)
Configure the trailing comments field for this repository and return self.

