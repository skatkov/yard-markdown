# Class: RDoc::Markup::Formatter
**Inherits:** Object
    

Base class for RDoc markup formatters

Formatters are a visitor that converts an RDoc::Markup tree (from a comment)
into some kind of output.  RDoc ships with formatters for converting back to
rdoc, ANSI text, HTML, a Table of Contents and other formats.

If you'd like to write your own Formatter use RDoc::Markup::FormatterTestCase.
 If you're writing a text-output formatter use
RDoc::Markup::TextFormatterTestCase which provides extra test cases.


# Class Methods
## gen_relative_url(path , target ) [](#method-c-gen_relative_url)
Converts a target url to one that is relative to a given path

#Instance Methods
## accept_document(document) [](#method-i-accept_document)
Adds `document` to the output

## add_regexp_handling_RDOCLINK() [](#method-i-add_regexp_handling_RDOCLINK)
Adds a regexp handling for links of the form rdoc-...:

## add_regexp_handling_TIDYLINK() [](#method-i-add_regexp_handling_TIDYLINK)
Adds a regexp handling for links of the form [<text>](<url>) and
<[word>](<url>)

## add_tag(name, start, stop) [](#method-i-add_tag)
Add a new set of tags for an attribute. We allow separate start and end tags
for flexibility

## annotate(tag) [](#method-i-annotate)
Allows `tag` to be decorated with additional information.

## convert(content) [](#method-i-convert)
Marks up `content`

## convert_flow(flow) [](#method-i-convert_flow)
Converts flow items `flow`

## convert_regexp_handling(target) [](#method-i-convert_regexp_handling)
Converts added regexp handlings. See RDoc::Markup#add_regexp_handling

## convert_string(string) [](#method-i-convert_string)
Converts a string to be fancier if desired

## each_attr_tag(attr_mask, reversefalse) [](#method-i-each_attr_tag)

## ignore(*node) [](#method-i-ignore)
Use ignore in your subclass to ignore the content of a node.

    ##
    # We don't support raw nodes in ToNoRaw

    alias accept_raw ignore

## in_tt?() [](#method-i-in_tt?)
Are we currently inside tt tags?

**@return** [Boolean] 

## initialize(options, markupnil) [](#method-i-initialize)
Creates a new Formatter

**@return** [Formatter] a new instance of Formatter

## off_tags(res, item) [](#method-i-off_tags)
Turns off tags for `item` on `res`

## on_tags(res, item) [](#method-i-on_tags)
Turns on tags for `item` on `res`

## parse_url(url) [](#method-i-parse_url)
Extracts and a scheme, url and an anchor id from `url` and returns them.

## tt?(tag) [](#method-i-tt?)
Is `tag` a tt tag?

**@return** [Boolean] 

## tt_tag?(attr_mask, reversefalse) [](#method-i-tt_tag?)

**@return** [Boolean] 

