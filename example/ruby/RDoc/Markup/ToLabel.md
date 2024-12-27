# Class: RDoc::Markup::ToLabel
**Inherits:** RDoc::Markup::Formatter
    

Creates HTML-safe labels suitable for use in id attributes.  Tidylinks are
converted to their link part and cross-reference links have the suppression
marks removed (\SomeClass is converted to SomeClass).


# Attributes
## res[RW] [](#attribute-i-res)
:nodoc:


#Instance Methods
## convert(text) [](#method-i-convert)
Converts `text` to an HTML-safe label

## handle_regexp_CROSSREF(target) [](#method-i-handle_regexp_CROSSREF)
Converts the CROSSREF `target` to plain text, removing the suppression marker,
if any

## handle_regexp_TIDYLINK(target) [](#method-i-handle_regexp_TIDYLINK)
Converts the TIDYLINK `target` to just the text part

## initialize(markupnil) [](#method-i-initialize)
Creates a new formatter that will output HTML-safe labels

**@return** [ToLabel] a new instance of ToLabel

