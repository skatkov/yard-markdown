# Class: Prism::Source
**Inherits:** Object
    

This represents a source of Ruby code that has been parsed. It is used in
conjunction with locations to allow them to resolve line numbers and source
ranges.


# Class Methods
## for(source , start_line 1, offsets []) [](#method-c-for)
Create a new source object with the given source code. This method should be
used instead of `new` and it will return either a `Source` or a specialized
and more performant `ASCIISource` if no multibyte characters are present in
the source code.
# Attributes
## offsets[RW] [](#attribute-i-offsets)
The list of newline byte offsets in the source code.

## source[RW] [](#attribute-i-source)
The source code that this source object represents.

## start_line[RW] [](#attribute-i-start_line)
The line number where this source starts.


#Instance Methods
## character_column(byte_offset) [](#method-i-character_column)
Return the column number in characters for the given byte offset.

## character_offset(byte_offset) [](#method-i-character_offset)
Return the character offset for the given byte offset.

## code_units_cache(encoding) [](#method-i-code_units_cache)
Generate a cache that targets a specific encoding for calculating code unit
offsets.

## code_units_column(byte_offset, encoding) [](#method-i-code_units_column)
Returns the column number in code units for the given encoding for the given
byte offset.

## code_units_offset(byte_offset, encoding) [](#method-i-code_units_offset)
Returns the offset from the start of the file for the given byte offset
counting in code units for the given encoding.

This method is tested with UTF-8, UTF-16, and UTF-32. If there is the concept
of code units that differs from the number of characters in other encodings,
it is not captured here.

We purposefully replace invalid and undefined characters with replacement
characters in this conversion. This happens for two reasons. First, it's
possible that the given byte offset will not occur on a character boundary.
Second, it's possible that the source code will contain a character that has
no equivalent in the given encoding.

## column(byte_offset) [](#method-i-column)
Return the column number for the given byte offset.

## encoding() [](#method-i-encoding)
Returns the encoding of the source code, which is set by parameters to the
parser or by the encoding magic comment.

## initialize(source, start_line1, offsets[]) [](#method-i-initialize)
Create a new source object with the given source code.

**@return** [Source] a new instance of Source

## line(byte_offset) [](#method-i-line)
Binary search through the offsets to find the line number for the given byte
offset.

## line_end(byte_offset) [](#method-i-line_end)
Returns the byte offset of the end of the line corresponding to the given byte
offset.

## line_start(byte_offset) [](#method-i-line_start)
Return the byte offset of the start of the line corresponding to the given
byte offset.

## lines() [](#method-i-lines)
Returns the lines of the source code as an array of strings.

## slice(byte_offset, length) [](#method-i-slice)
Perform a byteslice on the source code using the given byte offset and byte
length.

