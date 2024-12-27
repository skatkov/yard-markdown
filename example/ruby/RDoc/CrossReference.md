# Class: RDoc::CrossReference
**Inherits:** Object
    

RDoc::CrossReference is a reusable way to create cross references for names.


# Attributes
## seen[RW] [](#attribute-i-seen)
Hash of references that have been looked-up to their replacements


#Instance Methods
## initialize(context) [](#method-i-initialize)
Allows cross-references to be created based on the given `context`
(RDoc::Context).

**@return** [CrossReference] a new instance of CrossReference

## resolve(name, text) [](#method-i-resolve)
Returns a reference to `name`.

If the reference is found and `name` is not documented `text` will be
returned.  If `name` is escaped `name` is returned.  If `name` is not found
`text` is returned.

## resolve_method(name) [](#method-i-resolve_method)
Returns a method reference to `name`.

