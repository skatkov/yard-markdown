# Class: RDoc::TomDoc
**Inherits:** RDoc::Markup::Parser
    

A parser for TomDoc based on TomDoc 1.0.0-rc1 (02adef9b5a)

The TomDoc specification can be found at http://tomdoc.org.

To choose TomDoc as your only default format see RDoc::Options@Saved+Options
for instructions on setting up a `.rdoc_options` file to store your project
default.

There are a few differences between this parser and the specification.  A
best-effort was made to follow the specification as closely as possible but
some choices to deviate were made.

A future version of RDoc will warn when a MUST or MUST NOT is violated and may
warn when a SHOULD or SHOULD NOT is violated.  RDoc will always try to emit
documentation even if given invalid TomDoc.

Here are some implementation choices this parser currently makes:

This parser allows rdoc-style inline markup but you should not depended on it.

This parser allows a space between the comment and the method body.

This parser does not require the default value to be described for an optional
argument.

This parser does not examine the order of sections.  An Examples section may
precede the Arguments section.

This class is documented in TomDoc format.  Since this is a subclass of the
RDoc markup parser there isn't much to see here, unfortunately.


# Class Methods
## add_post_processor() [](#method-c-add_post_processor)
Internal: Adds a post-processor which sets the RDoc section based on the
comment's status.

Returns nothing.
## parse(text ) [](#method-c-parse)
Public: Parses TomDoc from text

text - A String containing TomDoc-format text.

Examples

    RDoc::TomDoc.parse <<-TOMDOC
    This method does some things

    Returns nothing.
    TOMDOC
    # => #<RDoc::Markup::Document:0xXXX @parts=[...], @file=nil>

Returns an RDoc::Markup::Document representing the TomDoc format.
## signature(comment ) [](#method-c-signature)
Internal: Extracts the Signature section's method signature

comment - An RDoc::Comment that will be parsed and have the signature
    extracted

Returns a String containing the signature and nil if not
# Attributes
## tokens[RW] [](#attribute-i-tokens)
Internal: Token accessor


#Instance Methods
## build_heading(level) [](#method-i-build_heading)
Internal: Builds a heading from the token stream

level - The level of heading to create

Returns an RDoc::Markup::Heading

## build_paragraph(margin) [](#method-i-build_paragraph)
Internal: Builds a paragraph from the token stream

margin - Unused

Returns an RDoc::Markup::Paragraph.

## build_verbatim(margin) [](#method-i-build_verbatim)
Internal: Builds a verbatim from the token stream.  A verbatim in the Examples
section will be marked as in Ruby format.

margin - The indentation from the margin for lines that belong to this
    verbatim section.

Returns an RDoc::Markup::Verbatim

## initialize() [](#method-i-initialize)
Public: Creates a new TomDoc parser.  See also RDoc::Markup::parse

**@return** [TomDoc] a new instance of TomDoc

## parse_text(parent, indent) [](#method-i-parse_text)
Detects a section change to "Returns" and adds a heading

## tokenize(text) [](#method-i-tokenize)
Internal: Turns text into an Array of tokens

text - A String containing TomDoc-format text.

Returns self.

