# Class: PrettyPrint::Text
**Inherits:** Object
    

The Text class is the means by which to collect strings from objects.

This class is intended for internal use of the PrettyPrint buffers.


# Attributes
## width[RW] [](#attribute-i-width)
The total width of the objects included in this Text object.


#Instance Methods
## add(obj, width) [](#method-i-add)
Include `obj` in the objects to be pretty printed, and increment this Text
object's total width by `width`

## initialize() [](#method-i-initialize)
Creates a new text object.

This constructor takes no arguments.

The workflow is to append a PrettyPrint::Text object to the buffer, and being
able to call the buffer.last() to reference it.

As there are objects, use PrettyPrint::Text#add to include the objects and the
width to utilized by the String version of this object.

**@return** [Text] a new instance of Text

## output(out, output_width) [](#method-i-output)
Render the String text of the objects that have been added to this Text
object.

Output the text to `out`, and increment the width to `output_width`

