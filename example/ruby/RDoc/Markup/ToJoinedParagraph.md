# Class: RDoc::Markup::ToJoinedParagraph
**Inherits:** RDoc::Markup::Formatter
    

Joins the parts of an RDoc::Markup::Paragraph into a single String.

This allows for easier maintenance and testing of Markdown support.

This formatter only works on Paragraph instances.  Attempting to process other
markup syntax items will not work.



#Instance Methods
## accept_paragraph(paragraph) [](#method-i-accept_paragraph)
Converts the parts of `paragraph` to a single entry.

## end_accepting() [](#method-i-end_accepting)
:nodoc:

## initialize() [](#method-i-initialize)
:nodoc:

**@return** [ToJoinedParagraph] a new instance of ToJoinedParagraph

## start_accepting() [](#method-i-start_accepting)
:nodoc:

