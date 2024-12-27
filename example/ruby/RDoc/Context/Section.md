# Class: RDoc::Context::Section
**Inherits:** Object
    
**Includes:** RDoc::Generator::Markup, RDoc::Text
  

A section of documentation like:

    # :section: The title
    # The body

Sections can be referenced multiple times and will be collapsed into a single
section.


# Attributes
## comment[RW] [](#attribute-i-comment)
Section comment

## comments[RW] [](#attribute-i-comments)
Section comments

## parent[RW] [](#attribute-i-parent)
Context this Section lives in

## title[RW] [](#attribute-i-title)
Section title


#Instance Methods
## ==(other) [](#method-i-==)
Sections are equal when they have the same #title

## add_comment(comment) [](#method-i-add_comment)
Adds `comment` to this section

## aref() [](#method-i-aref)
Anchor reference for linking to this section

## aref_to(target_path) [](#method-i-aref_to)
Generates a relative URL from this object's path to `target_path`

## as_href(from_path) [](#method-i-as_href)
Generates a relative URL from `from_path` to this object's path

## cvs_url(url, full_path) [](#method-i-cvs_url)
Build a webcvs URL starting for the given `url` with `full_path` appended as
the destination path.  If `url` contains '%s' `full_path` will be will replace
the %s using sprintf on the `url`.

## description() [](#method-i-description)
Handy wrapper for marking up this object's comment

## expand_tabs(text) [](#method-i-expand_tabs)
Expands tab characters in `text` to eight spaces

## extract_comment(comment) [](#method-i-extract_comment)
Extracts the comment for this section from the original comment block. If the
first line contains :section:, strip it and use the rest. Otherwise remove
lines up to the line containing :section:, and look for those lines again at
the end and remove them. This lets us write

    # :section: The title
    # The body

## flush_left(text) [](#method-i-flush_left)
Flush `text` left based on the shortest line

## formatter() [](#method-i-formatter)
Creates an RDoc::Markup::ToHtmlCrossref formatter

## hash() [](#method-i-hash)
:nodoc:

## in_files() [](#method-i-in_files)
The files comments in this section come from

## initialize(parent, title, comment) [](#method-i-initialize)
Creates a new section with `title` and `comment`

**@return** [Section] a new instance of Section

## inspect() [](#method-i-inspect)
:nodoc:

## markup(text) [](#method-i-markup)
Convert a string in markup format into HTML.

Requires the including class to implement #formatter

## marshal_dump() [](#method-i-marshal_dump)
Serializes this Section.  The title and parsed comment are saved, but not the
section parent which must be restored manually.

## marshal_load(array) [](#method-i-marshal_load)
De-serializes this Section.  The section parent must be restored manually.

## normalize_comment(text) [](#method-i-normalize_comment)
Strips hashes, expands tabs then flushes `text` to the left

## parse() [](#method-i-parse)
Parses `comment_location` into an RDoc::Markup::Document composed of multiple
RDoc::Markup::Documents with their file set.

## plain_html() [](#method-i-plain_html)
The section's title, or 'Top Section' if the title is nil.

This is used by the table of contents template so the name is silly.

## remove_comment(comment) [](#method-i-remove_comment)
Removes a comment from this section if it is from the same file as `comment`

## snippet(text, limit100) [](#method-i-snippet)
The first `limit` characters of `text` as HTML

## strip_hashes(text) [](#method-i-strip_hashes)
Strips leading # characters from `text`

## strip_newlines(text) [](#method-i-strip_newlines)
Strips leading and trailing n characters from `text`

## strip_stars(text) [](#method-i-strip_stars)
Strips /* */ style comments

## to_html(text) [](#method-i-to_html)
Converts ampersand, dashes, ellipsis, quotes, copyright and registered
trademark symbols in `text` to properly encoded characters.

## wrap(txt, line_len76) [](#method-i-wrap)
Wraps `txt` to `line_len`

