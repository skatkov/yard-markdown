# Class: PrettyPrint::SingleLine
**Inherits:** Object
    

PrettyPrint::SingleLine is used by PrettyPrint.singleline_format

It is passed to be similar to a PrettyPrint object itself, by responding to:
*   #text
*   #breakable
*   #nest
*   #group
*   #flush
*   #first?

but instead, the output has no line breaks



#Instance Methods
## breakable(sep' ', widthnil) [](#method-i-breakable)
Appends `sep` to the text to be output. By default `sep` is ' '

`width` argument is here for compatibility. It is a noop argument.

## first?() [](#method-i-first?)
This is used as a predicate, and ought to be called first.

**@return** [Boolean] 

## flush() [](#method-i-flush)
Method present for compatibility, but is a noop

## group(indentnil, open_obj'', close_obj'', open_widthnil, close_widthnil) [](#method-i-group)
Opens a block for grouping objects to be pretty printed.

Arguments:
*   `indent` - noop argument. Present for compatibility.
*   `open_obj` - text appended before the &blok. Default is ''
*   `close_obj` - text appended after the &blok. Default is ''
*   `open_width` - noop argument. Present for compatibility.
*   `close_width` - noop argument. Present for compatibility.

## initialize(output, maxwidthnil, newlinenil) [](#method-i-initialize)
Create a PrettyPrint::SingleLine object

Arguments:
*   `output` - String (or similar) to store rendered text. Needs to respond to
    '<<'
*   `maxwidth` - Argument position expected to be here for compatibility.
        This argument is a noop.

*   `newline` - Argument position expected to be here for compatibility.
        This argument is a noop.

**@return** [SingleLine] a new instance of SingleLine

## nest(indent) [](#method-i-nest)
Takes `indent` arg, but does nothing with it.

Yields to a block.

## text(obj, widthnil) [](#method-i-text)
Add `obj` to the text to be output.

`width` argument is here for compatibility. It is a noop argument.

