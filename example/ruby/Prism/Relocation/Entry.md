# Class: Prism::Relocation::Entry
**Inherits:** Object
    

An entry in a repository that will lazily reify its values when they are first
accessed.



#Instance Methods
## comments() [](#method-i-comments)
Fetch the leading and trailing comments of the value.

## end_character_column() [](#method-i-end_character_column)
Fetch the end character column of the value.

## end_character_offset() [](#method-i-end_character_offset)
Fetch the end character offset of the value.

## end_code_units_column() [](#method-i-end_code_units_column)
Fetch the end code units column of the value, for the encoding that was
configured on the repository.

## end_code_units_offset() [](#method-i-end_code_units_offset)
Fetch the end code units offset of the value, for the encoding that was
configured on the repository.

## end_column() [](#method-i-end_column)
Fetch the end byte column of the value.

## end_line() [](#method-i-end_line)
Fetch the end line of the value.

## end_offset() [](#method-i-end_offset)
Fetch the end byte offset of the value.

## filepath() [](#method-i-filepath)
Fetch the filepath of the value.

## initialize(repository) [](#method-i-initialize)
Initialize a new entry with the given repository.

**@return** [Entry] a new instance of Entry

## leading_comments() [](#method-i-leading_comments)
Fetch the leading comments of the value.

## reify!(values) [](#method-i-reify!)
Reify the values on this entry with the given values. This is an internal-only
API that is called from the repository when it is time to reify the values.

## start_character_column() [](#method-i-start_character_column)
Fetch the start character column of the value.

## start_character_offset() [](#method-i-start_character_offset)
Fetch the start character offset of the value.

## start_code_units_column() [](#method-i-start_code_units_column)
Fetch the start code units column of the value, for the encoding that was
configured on the repository.

## start_code_units_offset() [](#method-i-start_code_units_offset)
Fetch the start code units offset of the value, for the encoding that was
configured on the repository.

## start_column() [](#method-i-start_column)
Fetch the start byte column of the value.

## start_line() [](#method-i-start_line)
Fetch the start line of the value.

## start_offset() [](#method-i-start_offset)
Fetch the start byte offset of the value.

## trailing_comments() [](#method-i-trailing_comments)
Fetch the trailing comments of the value.

