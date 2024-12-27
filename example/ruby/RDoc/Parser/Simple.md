# Class: RDoc::Parser::Simple
**Inherits:** RDoc::Parser
    
**Includes:** RDoc::Parser::Text
  

Parse a non-source file. We basically take the whole thing as one big comment.


# Attributes
## content[RW] [](#attribute-i-content)
:nodoc:


#Instance Methods
## initialize(top_level, file_name, content, options, stats) [](#method-i-initialize)
Prepare to parse a plain file

**@return** [Simple] a new instance of Simple

## remove_coding_comment(text) [](#method-i-remove_coding_comment)
Removes the encoding magic comment from `text`

## remove_private_comment(comment) [](#method-i-remove_private_comment)
Removes private comments.

Unlike RDoc::Comment#remove_private this implementation only looks for two
dashes at the beginning of the line.  Three or more dashes are considered to
be a rule and ignored.

## scan() [](#method-i-scan)
Extract the file contents and attach them to the TopLevel as a comment

