# Class: Psych::Nodes::Document
**Inherits:** Psych::Nodes::Node
    

This represents a YAML Document.  This node must be a child of
Psych::Nodes::Stream.  A Psych::Nodes::Document must have one child, and that
child may be one of the following:

*   Psych::Nodes::Sequence
*   Psych::Nodes::Mapping
*   Psych::Nodes::Scalar


# Attributes
## implicit[RW] [](#attribute-i-implicit)
Was this document implicitly created?

## implicit_end[RW] [](#attribute-i-implicit_end)
Is the end of the document implicit?

## tag_directives[RW] [](#attribute-i-tag_directives)
A list of tag directives for this document

## version[RW] [](#attribute-i-version)
The version of the YAML document


#Instance Methods
## document?() [](#method-i-document?)

**@return** [Boolean] 

## initialize(version[], tag_directives[], implicitfalse) [](#method-i-initialize)
Create a new Psych::Nodes::Document object.

`version` is a list indicating the YAML version. `tags_directives` is a list
of tag directive declarations `implicit` is a flag indicating whether the
document will be implicitly started.

## Example:
This creates a YAML document object that represents a YAML 1.1 document with
one tag directive, and has an implicit start:

    Psych::Nodes::Document.new(
      [1,1],
      [["!", "tag:tenderlovemaking.com,2009:"]],
      true
    )

## See Also
See also Psych::Handler#start_document

**@return** [Document] a new instance of Document

## root() [](#method-i-root)
Returns the root node.  A Document may only have one root node:
http://yaml.org/spec/1.1/#id898031

