# Class: RDoc::Markup::ToHtmlCrossref
**Inherits:** RDoc::Markup::ToHtml
    

Subclass of the RDoc::Markup::ToHtml class that supports looking up method
names, classes, etc to create links.  RDoc::CrossReference is used to generate
those links based on the current context.


# Attributes
## context[RW] [](#attribute-i-context)
RDoc::CodeObject for generating references

## show_hash[RW] [](#attribute-i-show_hash)
Should we show '#' characters on method references?


#Instance Methods
## convert_flow(flow) [](#method-i-convert_flow)

## cross_reference(name, textnil, codetrue, rdoc_ref:false) [](#method-i-cross_reference)
Creates a link to the reference `name` if the name exists.  If `text` is given
it is used as the link text, otherwise `name` is used.

## gen_url(url, text) [](#method-i-gen_url)
Generates links for `rdoc-ref:` scheme URLs and allows RDoc::Markup::ToHtml to
handle other schemes.

## handle_regexp_CROSSREF(target) [](#method-i-handle_regexp_CROSSREF)
We're invoked when any text matches the CROSSREF pattern.  If we find the
corresponding reference, generate a link.  If the name we're looking for
contains no punctuation, we look for it up the module/class chain.  For
example, ToHtml is found, even without the `RDoc::Markup::` prefix, because we
look for it in module Markup first.

## handle_regexp_HYPERLINK(target) [](#method-i-handle_regexp_HYPERLINK)
Handles `rdoc-ref:` scheme links and allows RDoc::Markup::ToHtml to handle
other schemes.

## handle_regexp_RDOCLINK(target) [](#method-i-handle_regexp_RDOCLINK)
`target` is an rdoc-schemed link that will be converted into a hyperlink. For
the rdoc-ref scheme the cross-reference will be looked up and the given name
will be used.

All other contents are handled by [the
superclass](rdoc-ref:RDoc::Markup::ToHtml#handle_regexp_RDOCLINK)

## init_link_notation_regexp_handlings() [](#method-i-init_link_notation_regexp_handlings)
:nodoc:

## initialize(options, from_path, context, markupnil) [](#method-i-initialize)
Creates a new crossref resolver that generates links relative to `context`
which lives at `from_path` in the generated files.  '#' characters on
references are removed unless `show_hash` is true.  Only method names preceded
by '#' or '::' are linked, unless `hyperlink_all` is true.

**@raise** [ArgumentError] 

**@return** [ToHtmlCrossref] a new instance of ToHtmlCrossref

## link(name, text, codetrue, rdoc_ref:false) [](#method-i-link)
Creates an HTML link to `name` with the given `text`.

