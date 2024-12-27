# Class: RDoc::CodeObject
**Inherits:** Object
    
**Includes:** RDoc::Generator::Markup, RDoc::Text
  

Base class for the RDoc code tree.

We contain the common stuff for contexts (which are containers) and other
elements (methods, attributes and so on)

Here's the tree of the CodeObject subclasses:

*   RDoc::Context
    *   RDoc::TopLevel
    *   RDoc::ClassModule
        *   RDoc::AnonClass (never used so far)
        *   RDoc::NormalClass
        *   RDoc::NormalModule
        *   RDoc::SingleClass
*   RDoc::MethodAttr
    *   RDoc::Attr
    *   RDoc::AnyMethod
        *   RDoc::GhostMethod
        *   RDoc::MetaMethod
*   RDoc::Alias
*   RDoc::Constant
*   RDoc::Mixin
    *   RDoc::Require
    *   RDoc::Include


# Attributes
## comment[RW] [](#attribute-i-comment)
Our comment

## document_children[RW] [](#attribute-i-document_children)
Do we document our children?

## document_self[RW] [](#attribute-i-document_self)
Do we document ourselves?

## done_documenting[RW] [](#attribute-i-done_documenting)
Are we done documenting (ie, did we come across a :enddoc:)?

## file[RW] [](#attribute-i-file)
Which file this code object was defined in

## force_documentation[RW] [](#attribute-i-force_documentation)
Force documentation of this CodeObject

## line[RW] [](#attribute-i-line)
Line in #file where this CodeObject was defined

## metadata[RW] [](#attribute-i-metadata)
Hash of arbitrary metadata for this CodeObject

## mixin_from[RW] [](#attribute-i-mixin_from)
When mixed-in to a class, this points to the Context in which it was
originally defined.

## parent[RW] [](#attribute-i-parent)
Our parent CodeObject.  The parent may be missing for classes loaded from
legacy RI data stores.

## received_nodoc[RW] [](#attribute-i-received_nodoc)
Did we ever receive a `:nodoc:` directive?

## section[RW] [](#attribute-i-section)
The section this CodeObject is in.  Sections allow grouping of constants,
attributes and methods inside a class or module.

## store[RW] [](#attribute-i-store)
The RDoc::Store for this object.

## viewer[RW] [](#attribute-i-viewer)
We are the model of the code, but we know that at some point we will be worked
on by viewers. By implementing the Viewable protocol, viewers can associated
themselves with these objects.


#Instance Methods
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

## display?() [](#method-i-display?)
Should this CodeObject be displayed in output?

A code object should be displayed if:

*   The item didn't have a nodoc or wasn't in a container that had nodoc
*   The item wasn't ignored
*   The item has documentation and was not suppressed

**@return** [Boolean] 

## documented?() [](#method-i-documented?)
Does this object have a comment with content or is #received_nodoc true?

**@return** [Boolean] 

## each_parent() [](#method-i-each_parent)
Yields each parent of this CodeObject.  See also
RDoc::ClassModule#each_ancestor

## expand_tabs(text) [](#method-i-expand_tabs)
Expands tab characters in `text` to eight spaces

## file_name() [](#method-i-file_name)
File name where this CodeObject was found.

See also RDoc::Context#in_files

## flush_left(text) [](#method-i-flush_left)
Flush `text` left based on the shortest line

## formatter() [](#method-i-formatter)
Creates an RDoc::Markup::ToHtmlCrossref formatter

## full_name=(full_name) [](#method-i-full_name=)
Sets the full_name overriding any computed full name.

Set to `nil` to clear RDoc's cached value

## ignore() [](#method-i-ignore)
Use this to ignore a CodeObject and all its children until found again
(#record_location is called).  An ignored item will not be displayed in
documentation.

See github issue #55

The ignored status is temporary in order to allow implementation details to be
hidden.  At the end of processing a file RDoc allows all classes and modules
to add new documentation to previously created classes.

If a class was ignored (via stopdoc) then reopened later with additional
documentation it should be displayed.  If a class was ignored and never
reopened it should not be displayed.  The ignore flag allows this to occur.

## ignored?() [](#method-i-ignored?)
Has this class been ignored?

See also #ignore

**@return** [Boolean] 

## initialize() [](#method-i-initialize)
Creates a new CodeObject that will document itself and its children

**@return** [CodeObject] a new instance of CodeObject

## initialize_visibility() [](#method-i-initialize_visibility)
Initializes state for visibility of this CodeObject and its children.

## markup(text) [](#method-i-markup)
Convert a string in markup format into HTML.

Requires the including class to implement #formatter

## normalize_comment(text) [](#method-i-normalize_comment)
Strips hashes, expands tabs then flushes `text` to the left

## options() [](#method-i-options)
The options instance from the store this CodeObject is attached to, or a
default options instance if the CodeObject is not attached.

This is used by Text#snippet

## parent_file_name() [](#method-i-parent_file_name)
File name of our parent

## parent_name() [](#method-i-parent_name)
Name of our parent

## parse(text, format'rdoc') [](#method-i-parse)
Normalizes `text` then builds a RDoc::Markup::Document from it

## record_location(top_level) [](#method-i-record_location)
Records the RDoc::TopLevel (file) where this code object was defined

## snippet(text, limit100) [](#method-i-snippet)
The first `limit` characters of `text` as HTML

## start_doc() [](#method-i-start_doc)
Enable capture of documentation unless documentation has been turned off by
:enddoc:

## stop_doc() [](#method-i-stop_doc)
Disable capture of documentation

## strip_hashes(text) [](#method-i-strip_hashes)
Strips leading # characters from `text`

## strip_newlines(text) [](#method-i-strip_newlines)
Strips leading and trailing n characters from `text`

## strip_stars(text) [](#method-i-strip_stars)
Strips /* */ style comments

## suppress() [](#method-i-suppress)
Use this to suppress a CodeObject and all its children until the next file it
is seen in or documentation is discovered.  A suppressed item with
documentation will be displayed while an ignored item with documentation may
not be displayed.

## suppressed?() [](#method-i-suppressed?)
Has this class been suppressed?

See also #suppress

**@return** [Boolean] 

## to_html(text) [](#method-i-to_html)
Converts ampersand, dashes, ellipsis, quotes, copyright and registered
trademark symbols in `text` to properly encoded characters.

## wrap(txt, line_len76) [](#method-i-wrap)
Wraps `txt` to `line_len`

