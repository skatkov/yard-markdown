# Class: RDoc::Markup::ToTableOfContents
**Inherits:** RDoc::Markup::Formatter
    

Extracts just the RDoc::Markup::Heading elements from a RDoc::Markup::Document
to help build a table of contents


# Class Methods
## to_toc() [](#method-c-to_toc)
Singleton for table-of-contents generation
# Attributes
## omit_headings_below[RW] [](#attribute-i-omit_headings_below)
Omits headings with a level less than the given level.

## res[RW] [](#attribute-i-res)
Output accumulator


#Instance Methods
## accept_document(document) [](#method-i-accept_document)
Adds `document` to the output, using its heading cutoff if present

## accept_heading(heading) [](#method-i-accept_heading)
Adds `heading` to the table of contents

## end_accepting() [](#method-i-end_accepting)
Returns the table of contents

## initialize() [](#method-i-initialize)
:nodoc:

**@return** [ToTableOfContents] a new instance of ToTableOfContents

## start_accepting() [](#method-i-start_accepting)
Prepares the visitor for text generation

## suppressed?(heading) [](#method-i-suppressed?)
Returns true if `heading` is below the display threshold

**@return** [Boolean] 

