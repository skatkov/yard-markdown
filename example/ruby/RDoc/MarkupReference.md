# Class: RDoc::MarkupReference
**Inherits:** Object
    

Class RDoc::MarkupReference exists only to provide a suitable home for a
reference document for RDoc markup.

All objects defined in this class -- classes, modules, methods, aliases,
attributes, and constants -- are solely for illustrating RDoc markup, and have
no other legitimate use.

## About the Examples

*   Examples in this reference are Ruby code and comments; certain differences
    from other sources (such as C code and comments) are noted.
*   Almost all examples on this page are all RDoc-like; that is, they have no
    explicit comment markers like Ruby `#` or C `/* ... */`.
*   An example that shows rendered HTML output displays that output in a
    blockquote:

> Some stuff

> ## RDoc Sources

The sources of RDoc documentation vary according to the type of file:

*   `.rb` (Ruby code file):

    *   Markup may be found in Ruby comments: A comment that immediately
        precedes the definition of a Ruby class, module, method, alias,
        constant, or attribute becomes the documentation for that defined
        object.
    *   An RDoc directive may be found in:

        *   A trailing comment (on the same line as code); see `:nodoc:`,
            `:doc:`, and `:notnew:`.
        *   A single-line comment; see other
            [Directives](rdoc-ref:RDoc::MarkupReference@Directives).

    *   Documentation may be derived from the Ruby code itself; see
        [Documentation Derived from Ruby
        Code](rdoc-ref:RDoc::MarkupReference@Documentation+Derived+from+Ruby+C
        ode).

*   `.c` (C code file): markup is parsed from C comments. A comment that
    immediately precedes a function that implements a Ruby method, or
    otherwise immediately precedes the definition of a Ruby object, becomes
    the documentation for that object.
*   `.rdoc` (RDoc markup text file) or `.md` (RDoc markdown text file): markup
    is parsed from the entire file. The text is not associated with any code
    object, but may (depending on how the documentation is built) become a
    separate page.

An *RDoc document*:

*   A (possibly multi-line) comment in a Ruby or C file that generates RDoc
    documentation (as above).
*   The entire markup (`.rdoc`) file or markdown (`.md`) file (which is
    usually multi-line).

### Blocks

It's convenient to think of an RDoc document as a sequence of *blocks* of
various types (details at the links):

*   [Paragraph](rdoc-ref:RDoc::MarkupReference@Paragraphs): an ordinary
    paragraph.
*   [Verbatim text
    block](rdoc-ref:RDoc::MarkupReference@Verbatim+Text+Blocks): a block of
    text to be rendered literally.
*   [Code block](rdoc-ref:RDoc::MarkupReference@Code+Blocks): a verbatim text
    block containing Ruby code, to be rendered with code highlighting.
*   [Block quote](rdoc-ref:RDoc::MarkupReference@Block+Quotes): a longish
    quoted passage, to be rendered with indentation instead of quote marks.
*   [List](rdoc-ref:RDoc::MarkupReference@Lists): items for a bullet list,
    numbered list, lettered list, or labeled list.
*   [Heading](rdoc-ref:RDoc::MarkupReference@Headings): a heading.
*   [Horizontal rule](rdoc-ref:RDoc::MarkupReference@Horizontal+Rules): a line
    across the rendered page.
*   [Directive](rdoc-ref:RDoc::MarkupReference@Directives): various special
    directions for the rendering.
*   [Text Markup](rdoc-ref:RDoc:MarkupReference@Text+Markup): text to be
    rendered in a special way.

About the blocks:

*   Except for a paragraph, a block is distinguished by its indentation, or by
    unusual initial or embedded characters.
*   Any block may appear independently (that is, not nested in another block);
    some blocks may be nested, as detailed below.
*   In a multi-line block, RDoc looks for the block's natural left margin,
    which becomes the *base margin* for the block and is the initial *current
    margin* for the block.

#### Paragraphs

A paragraph consists of one or more non-empty lines of ordinary text, each
beginning at the current margin.

Note: Here, *ordinary text* means text that is *not identified* by
indentation, or by unusual initial or embedded characters. See below.

Paragraphs are separated by one or more empty lines.

Example input:

    \RDoc produces HTML and command-line documentation for Ruby projects.
    \RDoc includes the rdoc and ri tools for generating and displaying
    documentation from the command-line.

    You'll love it.

Rendered HTML:
> RDoc produces HTML and command-line documentation for Ruby projects. RDoc
  includes the rdoc and ri tools for generating and displaying documentation
  from the command-line.

> You'll love it.

> A paragraph may contain nested blocks, including:

*   [Verbatim text
    blocks](rdoc-ref:RDoc::MarkupReference@Verbatim+Text+Blocks).
*   [Code blocks](rdoc-ref:RDoc::MarkupReference@Code+Blocks).
*   [Block quotes](rdoc-ref:RDoc::MarkupReference@Block+Quotes).
*   [Lists](rdoc-ref:RDoc::MarkupReference@Lists).
*   [Headings](rdoc-ref:RDoc::MarkupReference@Headings).
*   [Horizontal rules](rdoc-ref:RDoc::MarkupReference@Horizontal+Rules).
*   [Text Markup](rdoc-ref:RDoc:MarkupReference@Text+Markup).

#### Verbatim Text Blocks

Text indented farther than the current margin becomes a *verbatim text block*
(or a code block, described next). In the rendered HTML, such text:

*   Is indented.
*   Has a contrasting background color.

The verbatim text block ends at the first line beginning at the current
margin.

Example input:

    This is not verbatim text.

      This is verbatim text.
        Whitespace is honored.     # See?
          Whitespace is honored.     # See?

      This is still the same verbatim text block.

    This is not verbatim text.

Rendered HTML:
> This is not verbatim text.

      This is verbatim text.
        Whitespace is honored.     # See?
          Whitespace is honored.     # See?

      This is still the same verbatim text block.

> This is not verbatim text.

> A verbatim text block may not contain nested blocks of any kind -- it's
verbatim.

#### Code Blocks

A special case of verbatim text is the *code block*, which is merely verbatim
text that RDoc recognizes as Ruby code:

In the rendered HTML, the code block:

*   Is indented.
*   Has a contrasting background color.
*   Has syntax highlighting.

Example input:

    Consider this method:

      def foo(name = '', value = 0)
        @name = name      # Whitespace is still honored.
        @value = value
      end

Rendered HTML:
> Consider this method:

      def foo(name = '', value = 0)
        @name = name      # Whitespace is still honored.
        @value = value
      end

> Pro tip:  If your indented Ruby code does not get highlighted, it may contain
a syntax error.

A code block may not contain nested blocks of any kind -- it's verbatim.

#### Block Quotes

You can use the characters `>>>` (unindented), followed by indented text, to
treat the text as a [block
quote](https://en.wikipedia.org/wiki/Block_quotation):

Example input:

    Here's a block quote:
    >>>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer
      commodo quam iaculis massa posuere, dictum fringilla justo pulvinar.
      Quisque turpis erat, pharetra eu dui at, sollicitudin accumsan nulla.

      Aenean congue ligula eu ligula molestie, eu pellentesque purus
      faucibus. In id leo non ligula condimentum lobortis. Duis vestibulum,
      diam in pellentesque aliquet, mi tellus placerat sapien, id euismod
      purus magna ut tortor.

Rendered HTML:

> Here's a block quote:
> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer commodo
    quam iaculis massa posuere, dictum fringilla justo pulvinar. Quisque
    turpis erat, pharetra eu dui at, sollicitudin accumsan nulla.

> Aenean congue ligula eu ligula molestie, eu pellentesque purus faucibus.
    In id leo non ligula condimentum lobortis. Duis vestibulum, diam in
    pellentesque aliquet, mi tellus placerat sapien, id euismod purus magna ut
    tortor.

> Note that, unlike verbatim text, single newlines are not honored, but that a
double newline begins a new paragraph in the block quote.

A block quote may contain nested blocks, including:

*   Other block quotes.
*   [Paragraphs](rdoc-ref:RDoc::MarkupReference@Paragraphs).
*   [Verbatim text
    blocks](rdoc-ref:RDoc::MarkupReference@Verbatim+Text+Blocks).
*   [Code blocks](rdoc-ref:RDoc::MarkupReference@Code+Blocks).
*   [Lists](rdoc-ref:RDoc::MarkupReference@Lists).
*   [Headings](rdoc-ref:RDoc::MarkupReference@Headings).
*   [Horizontal rules](rdoc-ref:RDoc::MarkupReference@Horizontal+Rules).
*   [Text Markup](rdoc-ref:RDoc:MarkupReference@Text+Markup).

#### Lists

Each type of list item is marked by a special beginning:

*   Bullet list item: Begins with a hyphen or asterisk.
*   Numbered list item: Begins with digits and a period.
*   Lettered list item: Begins with an alphabetic character and a period.
*   Labeled list item: Begins with one of:
    *   Square-bracketed text.
    *   A word followed by two colons.

A list begins with a list item and continues, even across blank lines, as long
as list items of the same type are found at the same indentation level.

A new list resets the current margin inward. Additional lines of text aligned
at that margin are part of the continuing list item.

A list item may be continued on additional lines that are aligned with the
first line.  See examples below.

A list item may contain nested blocks, including:

*   Other lists of any type.
*   [Paragraphs](rdoc-ref:RDoc::MarkupReference@Paragraphs).
*   [Verbatim text
    blocks](rdoc-ref:RDoc::MarkupReference@Verbatim+Text+Blocks).
*   [Code blocks](rdoc-ref:RDoc::MarkupReference@Code+Blocks).
*   [Block quotes](rdoc-ref:RDoc::MarkupReference@Block+Quotes).
*   [Headings](rdoc-ref:RDoc::MarkupReference@Headings).
*   [Horizontal rules](rdoc-ref:RDoc::MarkupReference@Horizontal+Rules).
*   [Text Markup](rdoc-ref:RDoc:MarkupReference@Text+Markup).

##### Bullet Lists

A bullet list item begins with a hyphen or asterisk.

Example input:

    - An item.
    - Another.
    - An item spanning
      multiple lines.

    * Yet another.
    - Last one.

Rendered HTML:
  *   An item.
  *   Another.
  *   An item spanning multiple lines.

  *   Yet another.
  *   Last one.

##### Numbered Lists

A numbered list item begins with digits and a period.

The items are automatically re-numbered.

Example input:

    100. An item.
    10. Another.
    1. An item spanning
       multiple lines.

    1. Yet another.
    1000. Last one.

Rendered HTML:
  1.  An item.
  2.  Another.
  3.  An item spanning multiple lines.

  4.  Yet another.
  5.  Last one.

##### Lettered Lists

A lettered list item begins with letters and a period.

The items are automatically "re-lettered."

Example input:

    z. An item.
    y. Another.
    x. An item spanning
       multiple lines.

    x. Yet another.
    a. Last one.

Rendered HTML:
  1.  An item.
  2.  Another.

  3.  Yet another.
  4.  Last one.

##### Labeled Lists

A labeled list item begins with one of:

*   Square-bracketed text: the label and text are on two lines.
*   A word followed by two colons: the label and text are on the same line.

Example input:

    [foo] An item.
    bat:: Another.
    [bag] An item spanning
          multiple lines.

    [bar baz] Yet another.
    bam:: Last one.

Rendered HTML:
  foo
:     An item.

  bat
:     Another.

  bag
:     An item spanning multiple lines.


  bar baz
:     Yet another.

  bam
:     Last one.


#### Headings

A heading begins with up to six equal-signs, followed by heading text.
Whitespace between those and the heading text is optional.

Examples:

    = Section 1
    == Section 1.1
    === Section 1.1.1
    === Section 1.1.2
    == Section 1.2
    = Section 2
    = Foo
    == Bar
    === Baz
    ==== Bam
    ===== Bat
    ====== Bad
    ============Still a Heading (Level 6)
    \== Not a Heading

A heading may contain only one type of nested block:

*   [Text Markup](rdoc-ref:RDoc:MarkupReference@Text+Markup).

#### Horizontal Rules

A horizontal rule consists of a line with three or more hyphens and nothing
more.

Example input:

    ---
    --- Not a horizontal rule.

    -- Also not a horizontal rule.
    ---

Rendered HTML:
> ---
> --- Not a horizontal rule.

> -- Also not a horizontal rule.
> ---

> #### Directives

##### Directives for Allowing or Suppressing Documentation

*   `# :stopdoc:`:

    *   Appears on a line by itself.
    *   Specifies that RDoc should ignore markup until next `:startdoc:`
        directive or end-of-file.

*   `# :startdoc:`:

    *   Appears on a line by itself.
    *   Specifies that RDoc should resume parsing markup.

*   `# :enddoc:`:

    *   Appears on a line by itself.
    *   Specifies that RDoc should ignore markup to end-of-file regardless of
        other directives.

*   `# :nodoc:`:

    *   Appended to a line of code that defines a class, module, method,
        alias, constant, or attribute.

    *   Specifies that the defined object should not be documented.

    *   For a method definition in C code, it the directive must be in the
        comment line immediately preceding the definition:

            /* :nodoc: */
            static VALUE
            some_method(VALUE self)
            {
                return self;
            }

        Note that this directive has *no effect at all* when placed at the
        method declaration:

            /* :nodoc: */
            rb_define_method(cMyClass, "do_something", something_func, 0);

        The above comment is just a comment and has nothing to do with RDoc.
        Therefore, `do_something` method will be reported as "undocumented"
        unless that method or function is documented elsewhere.

    *   For a constant definition in C code, this directive *can not work*
        because there is no "implementation" place for a constant.

*   `# :nodoc: all`:

    *   Appended to a line of code that defines a class or module.
    *   Specifies that the class or module should not be documented. By
        default, however, a nested class or module *will* be documented.

*   `# :doc:`:

    *   Appended to a line of code that defines a class, module, method,
        alias, constant, or attribute.
    *   Specifies the defined object should be documented, even if it
        otherwise would not be documented.

*   `# :notnew:` (aliased as `:not_new:` and `:not-new:`):

    *   Appended to a line of code that defines instance method `initialize`.
    *   Specifies that singleton method `new` should not be documented. By
        default, Ruby fakes a corresponding singleton method `new`, which RDoc
        includes in the documentation. Note that instance method `initialize`
        is private, and so by default is not documented.

For Ruby code, but not for other RDoc sources, there is a shorthand for
`:stopdoc:` and `:startdoc:`:

    # Documented.
    #--
    # Not documented.
    #++
    # Documented.

For C code, any of directives `:startdoc:`, `:stopdoc:`, and `:enddoc:` may
appear in a stand-alone comment:

    /* :startdoc: */
    /* :stopdoc: */
    /* :enddoc: */

##### Directive for Specifying RDoc Source Format

*   `# :markup: *type`*:

    *   Appears on a line by itself.
    *   Specifies the format for the RDoc input; parameter `type` is one of:
        `rdoc` (the default), `markdown`, `rd`, `tomdoc`. See [Markup
        Formats](rdoc-ref:RDoc::Markup@Markup+Formats).

##### Directives for Method Documentation

*   `# :call-seq:`:

    *   Appears on a line by itself.
    *   Specifies the calling sequence to be reported in the HTML, overriding
        the actual calling sequence in the code. See method
        #call_seq_directive.

    Note that RDoc can build the calling sequence for a Ruby-coded method, but
    not for other languages. You may want to override that by explicitly
    giving a `:call-seq:` directive if you want to include:

    *   A return type, which is not automatically inferred.
    *   Multiple calling sequences.

    For C code, the directive may appear in a stand-alone comment.

*   `# :args: *arg_names`* (aliased as `:arg:`):

    *   Appears on a line by itself.
    *   Specifies the arguments to be reported in the HTML, overriding the
        actual arguments in the code. See method #args_directive.

*   `# :yields: *arg_names`* (aliased as `:yield:`):

    *   Appears on a line by itself.
    *   Specifies the yield arguments to be reported in the HTML, overriding
        the actual yield in the code. See method #yields_directive.

##### Directives for Organizing Documentation

By default, RDoc groups:

*   Singleton methods together in alphabetical order.
*   Instance methods and their aliases together in alphabetical order.
*   Attributes and their aliases together in alphabetical order.

You can use directives to modify those behaviors.

*   `# :section: *section_title`*:

    *   Appears on a line by itself.
    *   Specifies that following methods are to be grouped into the section
        with the given *section_title*, or into the default section if no
        title is given. The directive remains in effect until another such
        directive is given, but may be temporarily overridden by directive
        `:category:`. See below.

    The comment block containing this directive:

    *   Must be separated by a blank line from the documentation for the next
        item.
    *   May have one or more lines preceding the directive. These will be
        removed, along with any trailing lines that match them. Such lines may
        be visually helpful.
    *   Lines of text that are not so removed become the descriptive text for
        the section.

    Example:

        # ----------------------------------------
        # :section: My Section
        # This is the section that I wrote.
        # See it glisten in the noon-day sun.
        # ----------------------------------------

        ##
        # Comment for some_method
        def some_method
          # ...
        end

    You can use directive `:category:` to temporarily override the current
    section.

*   `# :category: *section_title`*:

    *   Appears on a line by itself.
    *   Specifies that just one following method is to be included in the
        given section, or in the default section if no title is given.
        Subsequent methods are to be grouped into the current section.

##### Directive for Including a File

*   `# :include: *filepath`*:

    *   Appears on a line by itself.
    *   Specifies that the contents of the given file are to be included at
        this point. The file content is shifted to have the same indentation
        as the colon at the start of the directive.

        The file is searched for in the directory containing the current file,
        and then in each of the directories given with the `--include`
        command-line option.

    For C code, the directive may appear in a stand-alone comment

#### Text Markup

Text markup is metatext that affects HTML rendering:

*   Typeface: italic, bold, monofont.
*   Character conversions: copyright, trademark, certain punctuation.
*   Links.
*   Escapes: marking text as "not markup."

##### Typeface Markup

Typeface markup can specify that text is to be rendered as italic, bold, or
monofont.

Typeface markup may contain only one type of nested block:

*   More typeface markup: italic, bold, monofont.

###### Italic

Text may be marked as italic via HTML tag `<i>` or `<em>`.

Example input:

    <i>Italicized words</i> in a paragraph.

    >>>
      <i>Italicized words in a block quote</i>.

    - <i>Italicized words</i> in a list item.

    ====== <i>Italicized words</i> in a Heading

    <i>Italicized passage containing *bold* and +monofont+.</i>

Rendered HTML:
> *Italicized words* in a paragraph.

> *Italicized words in a block quote*.

  *   *Italicized words* in a list item.

> ###### *Italicized words* in a Heading

> *Italicized passage containing **bold** and `monofont`.*

> A single word may be italicized via a shorthand: prefixed and suffixed
underscores.

Example input:

    _Italic_ in a paragraph.

    >>>
      _Italic_ in a block quote.

    - _Italic_ in a list item.

    ====== _Italic_ in a Heading

Rendered HTML:
> *Italic* in a paragraph.

> *Italic* in a block quote.

  *   *Italic* in a list item.

> ###### *Italic* in a Heading

> ###### Bold

Text may be marked as bold via HTML tag `<b>`.

Example input:

    <b>Bold words</b> in a paragraph.

    >>>
      <b>Bold words</b> in a block quote.

    - <b>Bold words</b> in a list item.

    ====== <b>Bold words</b> in a Heading

    <b>Bold passage containing _italics_ and +monofont+.</b>

Rendered HTML:

> **Bold words** in a paragraph.

> **Bold words** in a block quote.

  *   **Bold words** in a list item.

> ###### **Bold words** in a Heading

> **Bold passage containing *italics* and `monofont`.**

> A single word may be made bold via a shorthand: prefixed and suffixed
asterisks.

Example input:

    *Bold* in a paragraph.

    >>>
      *Bold* in a block quote.

    - *Bold* in a list item.

    ===== *Bold* in a Heading

Rendered HTML:

> **Bold** in a paragraph.

> **Bold** in a block quote.

  *   **Bold** in a list item.

> ##### **Bold** in a Heading

> ###### Monofont

Text may be marked as monofont -- sometimes called 'typewriter font' -- via
HTML tag `<tt>` or `<code>`.

Example input:

    <tt>Monofont words</tt> in a paragraph.

    >>>
      <tt>Monofont words</tt> in a block quote.

    - <tt>Monofont words</tt> in a list item.

    ====== <tt>Monofont words</tt> in heading

    <tt>Monofont passage containing _italics_ and *bold*.</tt>

Rendered HTML:

> `Monofont words` in a paragraph.

> `Monofont words` in a block quote.

  *   `Monofont words` in a list item.

> ###### `Monofont words` in heading

> `Monofont passage containing *italics* and **bold**.`

> A single word may be made monofont by a shorthand: prefixed and suffixed
plus-signs.

Example input:

    +Monofont+ in a paragraph.

    >>>
      +Monofont+ in a block quote.

    - +Monofont+ in a list item.

    ====== +Monofont+ in a Heading

Rendered HTML:

> `Monofont` in a paragraph.

> `Monofont` in a block quote.

  *   `Monofont` in a list item.

> ###### `Monofont` in a Heading

> #### Character Conversions

Certain combinations of characters may be converted to special characters;
whether the conversion occurs depends on whether the special character is
available in the current encoding.

*   `(c)` converts to (c) (copyright character); must be lowercase.

*   `(r)` converts to (r) (registered trademark character); must be lowercase.

*   `'foo'` converts to 'foo' (smart single-quotes).

*   `"foo"` converts to "foo" (smart double-quotes).

*   `foo ... bar` converts to foo ... bar (1-character ellipsis).

*   `foo -- bar` converts to foo -- bar (1-character en-dash).

*   `foo --- bar` converts to foo --- bar (1-character em-dash).

#### Links

Certain strings in RDoc text are converted to links. Any such link may be
suppressed by prefixing a backslash. This section shows how to link to various
targets.

    *   On-page: `DummyClass` links to DummyClass.
    *   Off-page: `RDoc::Alias` links to RDoc::Alias.


    *   On-page: `DummyModule` links to DummyModule.
    *   Off-page: `RDoc` links to RDoc.


    *   On-page: `DUMMY_CONSTANT` links to DUMMY_CONSTANT.
    *   Off-page: `RDoc::Text::MARKUP_FORMAT` links to
        RDoc::Text::MARKUP_FORMAT.


    *   On-page: `::dummy_singleton_method` links to ::dummy_singleton_method.
    *   Off-page`RDoc::TokenStream::to_html` links to
        RDoc::TokenStream::to_html.

    Note: Occasionally RDoc is not linked to a method whose name has only
    special characters. Check whether the links you were expecting are
    actually there.  If not, you'll need to put in an explicit link; see
    below.

    Pro tip: The link to any method is available in the alphabetical table of
    contents at the top left of the page for the class or module.


    *   On-page: `#dummy_instance_method` links to #dummy_instance_method.
    *   Off-page: `RDoc::Alias#html_name` links to RDoc::Alias#html_name.

        See the Note and Pro Tip immediately above.


    *   On-page: `#dummy_attribute` links to #dummy_attribute.
    *   Off-page: `RDoc::Alias#name` links to RDoc::Alias#name.


    *   On-page: `#dummy_instance_alias` links to #dummy_instance_alias.
    *   Off-page: `RDoc::Alias#new_name` links to RDoc::Alias#new_name.


    *   Linked: `http://yahoo.com` links to http://yahoo.com.


    *   Linked: `https://github.com` links to https://github.com.


    *   Linked: `ftp://nosuch.site` links to ftp://nosuch.site.


    *   Linked:  `mailto:/foo@bar.com` links to mailto://foo@bar.com.


    *   link: `irc://irc.freenode.net/ruby` links to
        irc://irc.freenode.net/ruby.


    *   Link: `https://www.ruby-lang.org/images/header-ruby-logo@2x.png` is
        converted to an in-line HTML `img` tag, which displays the image in
        the HTML:

        https://www.ruby-lang.org/images/header-ruby-logo@2x.png

        Also works for `bmp`, `gif`, `jpeg`, and `jpg` files.

        Note: Works only for a fully qualified URL.


    *   Link: `RDoc::RD@LICENSE` links to RDoc::RDoc::RD@LICENSE.

    Note that spaces in the actual heading are represented by `+` characters
    in the linkable text.

    *   Link: `RDoc::Options@Saved+Options` links to
        RDoc::Options@Saved+Options.

    Punctuation and other special characters must be escaped like CGI.escape.

    Pro tip: The link to any heading is available in the alphabetical table of
    contents at the top left of the page for the class or module.


Section
:   See [Directives for Organizing
    Documentation](#class-RDoc::MarkupReference-label-Directives+for+Organizin
    g+Documentation).

    *   Link: `RDoc::Markup::ToHtml@Visitor` links to
        RDoc::Markup::ToHtml@Visitor.

    If a section and a heading share the same name, the link target is the
    section.


Single-Word Text Link
:   Use square brackets to create single-word text link:

    *   `GitHub[https://github.com]` links to [GitHub](https://github.com).


Multi-Word Text Link
:   Use square brackets and curly braces to create a multi-word text link.

    *   `{GitHub home page}[https://github.com]` links to [GitHub home
        page](https://github.com).


`rdoc-ref` Scheme
:   A link with the `rdoc-ref:` scheme links to the referenced item, if that
    item exists. The referenced item may be a class, module, method, file,
    etc.

    *   Class: `Alias[rdoc-ref:RDoc::Alias]` generates
        [Alias](rdoc-ref:RDoc::Alias).
    *   Module: `RDoc[rdoc-ref:RDoc]` generates [RDoc](rdoc-ref:RDoc).
    *   Method: `foo[rdoc-ref:RDoc::MarkupReference#dummy_instance_method]`
        generates [foo](rdoc-ref:RDoc::MarkupReference#dummy_instance_method).
    *   Constant: `bar[rdoc-ref:RDoc::MarkupReference::DUMMY_CONSTANT]`
        generates [bar](rdoc-ref:RDoc::MarkupReference::DUMMY_CONSTANT).
    *   Attribute: `baz[rdoc-ref:RDoc::MarkupReference#dummy_attribute]`
        generates [baz](rdoc-ref:RDoc::MarkupReference#dummy_attribute).
    *   Alias: `bad[rdoc-ref:RDoc::MarkupReference#dummy_instance_alias]`
        generates [bad](rdoc-ref:RDoc::MarkupReference#dummy_instance_alias).

    If the referenced item does not exist, no link is generated and entire
    `rdoc-ref:` square-bracketed clause is removed from the resulting text.

    *   `Nosuch[rdoc-ref:RDoc::Nosuch]` generates
        [Nosuch](rdoc-ref:RDoc::Nosuch).


    Simple
:       You can specify a link target using this form, where the second part
        cites the id of an HTML element.

        This link refers to the constant `DUMMY_CONSTANT` on this page:

        *   `{DUMMY_CONSTANT}[rdoc-label:DUMMY_CONSTANT]`

        Thus:

        [DUMMY_CONSTANT](#DUMMY_CONSTANT)


    With Return
:       You can specify both a link target and a local label that can be used
        as the target for a return link. These two links refer to each other:

        *   `{go to addressee}[rdoc-label:addressee:sender]`
        *   `{return to sender}[rdoc-label:sender:addressee]`

        Thus:

        [go to addressee](#addressee)

        Some text.

        [return to sender](#sender)



    *   `link:README_rdoc.html` links to link:README_rdoc.html.


`rdoc-image` Scheme
:   Use the `rdoc-image` scheme to display an image that is also a link:

        # {rdoc-image:path/to/image}[link_target]

    *   Link:
        `{rdoc-image:https://www.ruby-lang.org/images/header-ruby-logo@2x.png}
        [https://www.ruby-lang.org]` displays image
        `https://www.ruby-lang.org/images/header-ruby-logo@2x.png` as a link
        to `https://www.ruby-lang.org`.

        [rdoc-image:https://www.ruby-lang.org/images/header-ruby-logo@2x.png](
        https://www.ruby-lang.org)

    A relative path as the target also works:

    *   Link:
        `{rdoc-image:https://www.ruby-lang.org/images/header-ruby-logo@2x.png}
        [./Alias.html]` links to `./Alias.html`

        [rdoc-image:https://www.ruby-lang.org/images/header-ruby-logo@2x.png](
        ./Alias.html)


### Escaping Text

Text that would otherwise be interpreted as markup can be "escaped," so that
it is not interpreted as markup; the escape character is the backslash
(`'\\'`).

In a verbatim text block or a code block, the escape character is always
preserved:

Example input:

    This is not verbatim text.

      This is verbatim text, with an escape character \.

    This is not a code block.

      def foo
        'String with an escape character.'
      end

Rendered HTML:

> This is not verbatim text.

      This is verbatim text, with an escape character \.

> This is not a code block.

      def foo
        'This is a code block with an escape character \.'
      end

> In typeface markup (italic, bold, or monofont), an escape character is
preserved unless it is immediately followed by nested typeface markup.

Example input:

    This list is about escapes; it contains:

    - <tt>Monofont text with unescaped nested _italic_</tt>.
    - <tt>Monofont text with escaped nested \_italic_</tt>.
    - <tt>Monofont text with an escape character \</tt>.

Rendered HTML:

> This list is about escapes; it contains:

  *   `Monofont text with unescaped nested *italic`*.
  *   `Monofont text with escaped nested _italic_`.
  *   `Monofont text with an escape character \ `.

In other text-bearing blocks (paragraphs, block quotes, list items, headings):

*   A single escape character immediately followed by markup escapes the
    markup.
*   A single escape character followed by whitespace is preserved.
*   A single escape character anywhere else is ignored.
*   A double escape character is rendered as a single backslash.

    Example input:

        This list is about escapes; it contains:

        - An unescaped class name, RDoc, that will become a link.
        - An escaped class name, \RDoc, that will not become a link.
        - An escape character followed by whitespace \ .
        - An escape character \that is ignored.
        - A double escape character \\ that is rendered
          as a single backslash.

    Rendered HTML:

> This list is about escapes; it contains:

      *   An unescaped class name, RDoc, that will become a link.
      *   An escaped class name, RDoc, that will not become a link.
      *   An escape character followed by whitespace \ .
      *   An escape character that is ignored.
      *   A double escape character \ that is rendered as a single backslash.

## Documentation Derived from Ruby Code

Class
:   By default, RDoc documents:

    *   Class name.
    *   Parent class.
    *   Singleton methods.
    *   Instance methods.
    *   Aliases.
    *   Constants.
    *   Attributes.


Module
:   By default, RDoc documents:

    *   Module name.
    *   Singleton methods.
    *   Instance methods.
    *   Aliases.
    *   Constants.
    *   Attributes.


Method
:   By default, RDoc documents:

    *   Method name.
    *   Arguments.
    *   Yielded values.

    See #method.


Alias
:   By default, RDoc documents:

    *   Alias name.
    *   Aliased name.

    See #dummy_instance_alias and #dummy_instance_method.


Constant
:   By default, RDoc documents:

    *   Constant name.

    See DUMMY_CONSTANT.


Attribute
:   By default, RDoc documents:

    *   Attribute name.
    *   Attribute type (`[R]`, `[W]`, or `[RW]`)

    See #dummy_attribute.



# Class Methods
## dummy_singleton_method(foo , bar ) [](#method-c-dummy_singleton_method)
Example singleton method.
# Attributes
## dummy_attribute[RW] [](#attribute-i-dummy_attribute)
Example attribute.


#Instance Methods
## args_directive(foo, bar) [](#method-i-args_directive)
The `:args:` directive overrides the actual arguments found in the Ruby code.

Click on the calling sequence to see the code.

## call_seq_directive() [](#method-i-call_seq_directive)
:call-seq:
    call_seq_directive(foo, bar)
    Can be anything -> bar
    Also anything more -> baz or bat

The `:call-seq:` directive overrides the actual calling sequence found in the
Ruby code.

*   It can specify anything at all.
*   It can have multiple calling sequences.

This one includes `Can be anything -> foo`, which is nonsense.

Note that the "arrow" is two characters, hyphen and right angle-bracket, which
is made into a single character in the HTML.

Click on the calling sequence to see the code.

Here is the `:call-seq:` directive given for the method:

    :call-seq:
      call_seq_directive(foo, bar)
      Can be anything -> bar
      Also anything more -> baz or bat

## dummy_instance_method(foo, bar) [](#method-i-dummy_instance_method)
Example instance method.

## method(foo, bar) [](#method-i-method)
This method is documented only by RDoc, except for these comments.

Click on the calling sequence to see the code.

**@yield** ['baz'] 

## yields_directive(foo, bar) [](#method-i-yields_directive)
The `:yields:` directive overrides the actual yield found in the Ruby code.

Click on the calling sequence to see the code.

**@yield** ['baz'] 

