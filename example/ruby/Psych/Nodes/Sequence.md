# Class: Psych::Nodes::Sequence
**Inherits:** Psych::Nodes::Node
    

This class represents a [YAML
sequence](http://yaml.org/spec/1.1/#sequence/syntax).

A YAML sequence is basically a list, and looks like this:

    %YAML 1.1
    ---
    - I am
    - a Sequence

A YAML sequence may have an anchor like this:

    %YAML 1.1
    ---
    &A [
      "This sequence",
      "has an anchor"
    ]

A YAML sequence may also have a tag like this:

    %YAML 1.1
    ---
    !!seq [
      "This sequence",
      "has a tag"
    ]

This class represents a sequence in a YAML document.  A Psych::Nodes::Sequence
node may have 0 or more children.  Valid children for this node are:

*   Psych::Nodes::Sequence
*   Psych::Nodes::Mapping
*   Psych::Nodes::Scalar
*   Psych::Nodes::Alias


# Attributes
## anchor[RW] [](#attribute-i-anchor)
The anchor for this sequence (if any)

## implicit[RW] [](#attribute-i-implicit)
Is this sequence started implicitly?

## style[RW] [](#attribute-i-style)
The sequence style used

## tag[RW] [](#attribute-i-tag)
The tag name for this sequence (if any)


#Instance Methods
## initialize(anchornil, tagnil, implicittrue, styleBLOCK) [](#method-i-initialize)
Create a new object representing a YAML sequence.

`anchor` is the anchor associated with the sequence or nil. `tag` is the tag
associated with the sequence or nil. `implicit` a boolean indicating whether
or not the sequence was implicitly started. `style` is an integer indicating
the list style.

See Psych::Handler#start_sequence

**@return** [Sequence] a new instance of Sequence

## sequence?() [](#method-i-sequence?)

**@return** [Boolean] 

