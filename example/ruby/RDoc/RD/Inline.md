# Class: RDoc::RD::Inline
**Inherits:** Object
    

Inline keeps track of markup and labels to create proper links.


# Class Methods
## new(rdoc , reference rdoc) [](#method-c-new)
Creates a new Inline for `rdoc` and `reference`.

`rdoc` may be another Inline or a String.  If `reference` is not given it will
use the text from `rdoc`.
# Attributes
## rdoc[RW] [](#attribute-i-rdoc)
The markup of this reference in RDoc format

## reference[RW] [](#attribute-i-reference)
The text of the reference


#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## append(more) [](#method-i-append)
Appends `more` to this inline.  `more` may be a String or another Inline.

## initialize(rdoc, reference) [](#method-i-initialize)
Initializes the Inline with `rdoc` and `inline`

**@return** [Inline] a new instance of Inline

## inspect() [](#method-i-inspect)
:nodoc:

