# Class: Psych::Emitter
**Inherits:** Psych::Handler
    




#Instance Methods
## alias(anchor) [](#method-i-alias)
Emit an alias with `anchor`.

See Psych::Handler#alias

**@overload** [] 

## canonical() [](#method-i-canonical)
Get the output style, canonical or not.

**@overload** [] 

## canonical=(style) [](#method-i-canonical=)
Set the output style to canonical, or not.

**@overload** [] 

## end_document(imp) [](#method-i-end_document)
End a document emission with an `implicit` ending.

See Psych::Handler#end_document

**@overload** [] 

## end_mapping() [](#method-i-end_mapping)
Emit the end of a mapping.

See Psych::Handler#end_mapping

**@overload** [] 

## end_sequence() [](#method-i-end_sequence)
End sequence emission.

See Psych::Handler#end_sequence

**@overload** [] 

## end_stream() [](#method-i-end_stream)
End a stream emission

See Psych::Handler#end_stream

**@overload** [] 

## indentation() [](#method-i-indentation)
Get the indentation level.

**@overload** [] 

## indentation=(level) [](#method-i-indentation=)
Set the indentation level to `level`.  The level must be less than 10 and
greater than 1.

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Create a new Psych::Emitter that writes to `io`.

**@overload** [] 

## line_width() [](#method-i-line_width)
Get the preferred line width.

**@overload** [] 

## line_width=(width) [](#method-i-line_width=)
Set the preferred line with to `width`.

**@overload** [] 

## scalar(value, anchor, tag, plain, quoted, style) [](#method-i-scalar)
Emit a scalar with `value`, `anchor`, `tag`, and a `plain` or `quoted` string
type with `style`.

See Psych::Handler#scalar

**@overload** [] 

## start_document(version, tags, imp) [](#method-i-start_document)
Start a document emission with YAML `version`, `tags`, and an `implicit`
start.

See Psych::Handler#start_document

**@overload** [] 

## start_mapping(anchor, tag, implicit, style) [](#method-i-start_mapping)
Start emitting a YAML map with `anchor`, `tag`, an `implicit` start and end,
and `style`.

See Psych::Handler#start_mapping

**@overload** [] 

## start_sequence(anchor, tag, implicit, style) [](#method-i-start_sequence)
Start emitting a sequence with `anchor`, a `tag`, `implicit` sequence start
and end, along with `style`.

See Psych::Handler#start_sequence

**@overload** [] 

## start_stream(encoding) [](#method-i-start_stream)
Start a stream emission with `encoding`

See Psych::Handler#start_stream

**@overload** [] 

