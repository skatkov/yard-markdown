# Class: Prism::Location
**Inherits:** Object
    

This represents a location in the source.


# Attributes
## length[RW] [](#attribute-i-length)
The length of this location in bytes.

## start_offset[RW] [](#attribute-i-start_offset)
The byte offset from the beginning of the source where this location starts.


#Instance Methods
## ==(other) [](#method-i-==)
Returns true if the given other location is equal to this location.

## adjoin(string) [](#method-i-adjoin)
Join this location with the first occurrence of the string in the source that
occurs after this location on the same line, and return the new location. This
will raise an error if the string does not exist.

## cached_end_code_units_column(cache) [](#method-i-cached_end_code_units_column)
The end column in code units using the given cache to fetch or calculate the
value.

## cached_end_code_units_offset(cache) [](#method-i-cached_end_code_units_offset)
The end offset from the start of the file in code units using the given cache
to fetch or calculate the value.

## cached_start_code_units_column(cache) [](#method-i-cached_start_code_units_column)
The start column in code units using the given cache to fetch or calculate the
value.

## cached_start_code_units_offset(cache) [](#method-i-cached_start_code_units_offset)
The start offset from the start of the file in code units using the given
cache to fetch or calculate the value.

## chop() [](#method-i-chop)
Returns a new location that is the result of chopping off the last byte.

## comments() [](#method-i-comments)
Returns all comments that are associated with this location (both leading and
trailing comments).

## copy(source:self.source, start_offset:self.start_offset, length:self.length) [](#method-i-copy)
Create a new location object with the given options.

## deconstruct_keys(keys) [](#method-i-deconstruct_keys)
Implement the hash pattern matching interface for Location.

## end_character_column() [](#method-i-end_character_column)
The column number in characters where this location ends from the start of the
line.

## end_character_offset() [](#method-i-end_character_offset)
The character offset from the beginning of the source where this location
ends.

## end_code_units_column(encodingEncoding::UTF_16LE) [](#method-i-end_code_units_column)
The column number in code units of the given encoding where this location ends
from the start of the line.

## end_code_units_offset(encodingEncoding::UTF_16LE) [](#method-i-end_code_units_offset)
The offset from the start of the file in code units of the given encoding.

## end_column() [](#method-i-end_column)
The column number in bytes where this location ends from the start of the
line.

## end_line() [](#method-i-end_line)
The line number where this location ends.

## end_offset() [](#method-i-end_offset)
The byte offset from the beginning of the source where this location ends.

## initialize(source, start_offset, length) [](#method-i-initialize)
Create a new location object with the given source, start byte offset, and
byte length.

**@return** [Location] a new instance of Location

## inspect() [](#method-i-inspect)
Returns a string representation of this location.

## join(other) [](#method-i-join)
Returns a new location that stretches from this location to the given other
location. Raises an error if this location is not before the other location or
if they don't share the same source.

## leading_comment(comment) [](#method-i-leading_comment)
Attach a comment to the leading comments of this location.

## leading_comments() [](#method-i-leading_comments)
These are the comments that are associated with this location that exist
before the start of this location.

## pretty_print(q) [](#method-i-pretty_print)
Implement the pretty print interface for Location.

## slice() [](#method-i-slice)
The source code that this location represents.

## slice_lines() [](#method-i-slice_lines)
The source code that this location represents starting from the beginning of
the line that this location starts on to the end of the line that this
location ends on.

## source_lines() [](#method-i-source_lines)
Returns all of the lines of the source code associated with this location.

## start_character_column() [](#method-i-start_character_column)
The column number in characters where this location ends from the start of the
line.

## start_character_offset() [](#method-i-start_character_offset)
The character offset from the beginning of the source where this location
starts.

## start_code_units_column(encodingEncoding::UTF_16LE) [](#method-i-start_code_units_column)
The column number in code units of the given encoding where this location
starts from the start of the line.

## start_code_units_offset(encodingEncoding::UTF_16LE) [](#method-i-start_code_units_offset)
The offset from the start of the file in code units of the given encoding.

## start_column() [](#method-i-start_column)
The column number in bytes where this location starts from the start of the
line.

## start_line() [](#method-i-start_line)
The line number where this location starts.

## start_line_slice() [](#method-i-start_line_slice)
The content of the line where this location starts before this location.

## trailing_comment(comment) [](#method-i-trailing_comment)
Attach a comment to the trailing comments of this location.

## trailing_comments() [](#method-i-trailing_comments)
These are the comments that are associated with this location that exist after
the end of this location.

