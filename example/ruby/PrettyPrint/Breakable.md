# Class: PrettyPrint::Breakable
**Inherits:** Object
    

The Breakable class is used for breaking up object information

This class is intended for internal use of the PrettyPrint buffers.


# Attributes
## indent[RW] [](#attribute-i-indent)
The number of spaces to indent.

This is inferred from `q` within PrettyPrint, passed in ::new

## obj[RW] [](#attribute-i-obj)
Holds the separator String

The `sep` argument from ::new

## width[RW] [](#attribute-i-width)
The width of `obj` / `sep`


#Instance Methods
## initialize(sep, width, q) [](#method-i-initialize)
Create a new Breakable object.

Arguments:
*   `sep` String of the separator
*   `width` Integer width of the `sep`
*   `q` parent PrettyPrint object, to base from

**@return** [Breakable] a new instance of Breakable

## output(out, output_width) [](#method-i-output)
Render the String text of the objects that have been added to this Breakable
object.

Output the text to `out`, and increment the width to `output_width`

