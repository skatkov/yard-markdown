# Class: Psych::Nodes::Stream
**Inherits:** Psych::Nodes::Node
    

Represents a YAML stream.  This is the root node for any YAML parse tree. 
This node must have one or more child nodes.  The only valid child node for a
Psych::Nodes::Stream node is Psych::Nodes::Document.


# Attributes
## encoding[RW] [](#attribute-i-encoding)
The encoding used for this stream


#Instance Methods
## initialize(encodingUTF8) [](#method-i-initialize)
Create a new Psych::Nodes::Stream node with an `encoding` that defaults to
Psych::Nodes::Stream::UTF8.

See also Psych::Handler#start_stream

**@return** [Stream] a new instance of Stream

## stream?() [](#method-i-stream?)

**@return** [Boolean] 

