# Class: Prism::ASCIISource
**Inherits:** Prism::Source
    

Specialized version of Prism::Source for source code that includes ASCII
characters only. This class is used to apply performance optimizations that
cannot be applied to sources that include multibyte characters.

In the extremely rare case that a source includes multi-byte characters but is
marked as binary because of a magic encoding comment and it cannot be eagerly
converted to UTF-8, this class will be used as well. This is because at that
point we will treat everything as single-byte characters.



#Instance Methods
## character_column(byte_offset) [](#method-i-character_column)
Return the column number in characters for the given byte offset.

## character_offset(byte_offset) [](#method-i-character_offset)
Return the character offset for the given byte offset.

## code_units_cache(encoding) [](#method-i-code_units_cache)
Returns a cache that is the identity function in order to maintain the same
interface. We can do this because code units are always equivalent to byte
offsets for ASCII-only sources.

## code_units_column(byte_offset, encoding) [](#method-i-code_units_column)
Specialized version of `code_units_column` that does not depend on
`code_units_offset`, which is a more expensive operation. This is essentially
the same as `Prism::Source#column`.

## code_units_offset(byte_offset, encoding) [](#method-i-code_units_offset)
Returns the offset from the start of the file for the given byte offset
counting in code units for the given encoding.

This method is tested with UTF-8, UTF-16, and UTF-32. If there is the concept
of code units that differs from the number of characters in other encodings,
it is not captured here.

