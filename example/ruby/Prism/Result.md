# Class: Prism::Result
**Inherits:** Object
    

This represents the result of a call to ::parse or ::parse_file. It contains
the requested structure, any comments that were encounters, and any errors
that were encountered.


# Attributes
## comments[RW] [](#attribute-i-comments)
The list of comments that were encountered during parsing.

## data_loc[RW] [](#attribute-i-data_loc)
An optional location that represents the location of the __END__ marker and
the rest of the content of the file. This content is loaded into the DATA
constant when the file being parsed is the main file being executed.

## errors[RW] [](#attribute-i-errors)
The list of errors that were generated during parsing.

## magic_comments[RW] [](#attribute-i-magic_comments)
The list of magic comments that were encountered during parsing.

## source[RW] [](#attribute-i-source)
A Source instance that represents the source code that was parsed.

## warnings[RW] [](#attribute-i-warnings)
The list of warnings that were generated during parsing.


#Instance Methods
## code_units_cache(encoding) [](#method-i-code_units_cache)
Create a code units cache for the given encoding.

## deconstruct_keys(keys) [](#method-i-deconstruct_keys)
Implement the hash pattern matching interface for Result.

## encoding() [](#method-i-encoding)
Returns the encoding of the source code that was parsed.

## failure?() [](#method-i-failure?)
Returns true if there were errors during parsing and false if there were not.

**@return** [Boolean] 

## initialize(comments, magic_comments, data_loc, errors, warnings, source) [](#method-i-initialize)
Create a new result object with the given values.

**@return** [Result] a new instance of Result

## success?() [](#method-i-success?)
Returns true if there were no errors during parsing and false if there were.

**@return** [Boolean] 

