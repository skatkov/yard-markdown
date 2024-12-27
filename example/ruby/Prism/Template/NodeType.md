# Class: Prism::Template::NodeType
**Inherits:** Object
    

This class represents a node in the tree, configured by the config.yml file in
YAML format. It contains information about the name of the node and the
various child nodes it contains.


# Attributes
## comment[RW] [](#attribute-i-comment)
Returns the value of attribute comment.

## fields[RW] [](#attribute-i-fields)
Returns the value of attribute fields.

## flags[RW] [](#attribute-i-flags)
Returns the value of attribute flags.

## human[RW] [](#attribute-i-human)
Returns the value of attribute human.

## name[RW] [](#attribute-i-name)
Returns the value of attribute name.

## newline[RW] [](#attribute-i-newline)
Returns the value of attribute newline.

## type[RW] [](#attribute-i-type)
Returns the value of attribute type.


#Instance Methods
## each_comment_java_line(&block) [](#method-i-each_comment_java_line)

## each_comment_line(&block) [](#method-i-each_comment_line)

## initialize(config, flags) [](#method-i-initialize)

**@return** [NodeType] a new instance of NodeType

## needs_serialized_length?() [](#method-i-needs_serialized_length?)
Should emit serialized length of node so implementations can skip the node to
enable lazy parsing.

**@return** [Boolean] 

## semantic_fields() [](#method-i-semantic_fields)

