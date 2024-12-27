# Class: RDoc::Markup
**Inherits:** Object
    

RDoc::Markup parses plain text documents and attempts to decompose them into
their constituent parts.  Some of these parts are high-level: paragraphs,
chunks of verbatim text, list entries and the like.  Other parts happen at the
character level: a piece of bold text, a word in code font.  This markup is
similar in spirit to that used on WikiWiki webs, where folks create web pages
using a simple set of formatting rules.

RDoc::Markup and other markup formats do no output formatting, this is handled
by the RDoc::Markup::Formatter subclasses.

# Markup Formats

`RDoc` supports these markup formats:

*   `rdoc`: the `RDoc` markup format; see RDoc::MarkupReference.
*   `markdown`: The `markdown` markup format as described in the [Markdown
    Guide](https://www.markdownguide.org); see RDoc::Markdown.
*   `rd`: the `rd` markup format format; see RDoc::RD.
*   `tomdoc`: the TomDoc format as described in [TomDoc for
    Ruby](http://tomdoc.org); see RDoc::TomDoc.

You can choose a markup format using the following methods:

per project
:   If you build your documentation with rake use RDoc::Task#markup.

    If you build your documentation by hand run:

        rdoc --markup your_favorite_format --write-options

    and commit `.rdoc_options` and ship it with your packaged gem.

per file
:   At the top of the file use the `:markup:` directive to set the default
    format for the rest of the file.

per comment
:   Use the `:markup:` directive at the top of a comment you want to write in
    a different format.


# RDoc::Markup

RDoc::Markup is extensible at runtime: you can add new markup elements to be
recognized in the documents that RDoc::Markup parses.

RDoc::Markup is intended to be the basis for a family of tools which share the
common requirement that simple, plain-text should be rendered in a variety of
different output formats and media.  It is envisaged that RDoc::Markup could
be the basis for formatting RDoc style comment blocks, Wiki entries, and
online FAQs.

## Synopsis

This code converts `input_string` to HTML.  The conversion takes place in the
`convert` method, so you can use the same RDoc::Markup converter to convert
multiple input strings.

    require 'rdoc'

    h = RDoc::Markup::ToHtml.new(RDoc::Options.new)

    puts h.convert(input_string)

You can extend the RDoc::Markup parser to recognize new markup sequences, and
to add regexp handling. Here we make WikiWords significant to the parser, and
also make the sequences {word} and <no>text...</no> signify strike-through
text.  We then subclass the HTML output class to deal with these:

    require 'rdoc'

    class WikiHtml < RDoc::Markup::ToHtml
      def handle_regexp_WIKIWORD(target)
        "<font color=red>" + target.text + "</font>"
      end
    end

    markup = RDoc::Markup.new
    markup.add_word_pair("{", "}", :STRIKE)
    markup.add_html("no", :STRIKE)

    markup.add_regexp_handling(/\b([A-Z][a-z]+[A-Z]\w+)/, :WIKIWORD)

    wh = WikiHtml.new RDoc::Options.new, markup
    wh.add_tag(:STRIKE, "<strike>", "</strike>")

    puts "<body>#{wh.convert ARGF.read}</body>"

## Encoding

Where Encoding support is available, RDoc will automatically convert all
documents to the same output encoding.  The output encoding can be set via
RDoc::Options#encoding and defaults to Encoding.default_external.

# RDoc Markup Reference

See RDoc::MarkupReference.

--
Original Author
:   Dave Thomas,  dave@pragmaticprogrammer.com

License
:   Ruby license



# Class Methods
## parse(str ) [](#method-c-parse)
Parses `str` into an RDoc::Markup::Document.
# Attributes
## attribute_manager[RW] [](#attribute-i-attribute_manager)
An AttributeManager which handles inline markup.


#Instance Methods
## add_html(tag, name) [](#method-i-add_html)
Add to the sequences recognized as general markup.

## add_regexp_handling(pattern, name) [](#method-i-add_regexp_handling)
Add to other inline sequences.  For example, we could add WikiWords using
something like:

    parser.add_regexp_handling(/\b([A-Z][a-z]+[A-Z]\w+)/, :WIKIWORD)

Each wiki word will be presented to the output formatter.

## add_word_pair(start, stop, name) [](#method-i-add_word_pair)
Add to the sequences used to add formatting to an individual word (such as
**bold**).  Matching entries will generate attributes that the output
formatters can recognize by their `name`.

## convert(input, formatter) [](#method-i-convert)
We take `input`, parse it if necessary, then invoke the output `formatter`
using a Visitor to render the result.

## initialize(attribute_managernil) [](#method-i-initialize)
Take a block of text and use various heuristics to determine its structure
(paragraphs, lists, and so on).  Invoke an event handler as we identify
significant chunks.

**@return** [Markup] a new instance of Markup

