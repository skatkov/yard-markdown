# Class: Psych::TreeBuilder
**Inherits:** Psych::Handler
    

This class works in conjunction with Psych::Parser to build an in-memory parse
tree that represents a YAML document.

## Example

    parser = Psych::Parser.new Psych::TreeBuilder.new
    parser.parse('--- foo')
    tree = parser.handler.root

See Psych::Handler for documentation on the event methods used in this class.


# Attributes
## root[RW] [](#attribute-i-root)
Returns the root node for the built tree


#Instance Methods
## alias(anchor) [](#method-i-alias)

## end_document(implicit_end!streaming?) [](#method-i-end_document)
Handles end_document events with `version`, `tag_directives`, and `implicit`
styling.

See Psych::Handler#start_document

## end_stream() [](#method-i-end_stream)

## event_location(start_line, start_column, end_line, end_column) [](#method-i-event_location)

## initialize() [](#method-i-initialize)
Create a new TreeBuilder instance

**@return** [TreeBuilder] a new instance of TreeBuilder

## scalar(value, anchor, tag, plain, quoted, style) [](#method-i-scalar)

## start_document(version, tag_directives, implicit) [](#method-i-start_document)
Handles start_document events with `version`, `tag_directives`, and `implicit`
styling.

See Psych::Handler#start_document

## start_stream(encoding) [](#method-i-start_stream)

