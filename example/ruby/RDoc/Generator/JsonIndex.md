# Class: RDoc::Generator::JsonIndex
**Inherits:** Object
    
**Includes:** RDoc::Text
  

The JsonIndex generator is designed to complement an HTML generator and
produces a JSON search index.  This generator is derived from sdoc by Vladimir
Kolesnikov and contains verbatim code written by him.

This generator is designed to be used with a regular HTML generator:

    class RDoc::Generator::Darkfish
      def initialize options
        # ...
        @base_dir = Pathname.pwd.expand_path

        @json_index = RDoc::Generator::JsonIndex.new self, options
      end

      def generate
        # ...
        @json_index.generate
      end
    end

## Index Format

The index is output as a JSON file assigned to the global variable
`search_data`.  The structure is:

    var search_data = {
      "index": {
        "searchIndex":
          ["a", "b", ...],
        "longSearchIndex":
          ["a", "a::b", ...],
        "info": [
          ["A", "A", "A.html", "", ""],
          ["B", "A::B", "A::B.html", "", ""],
          ...
        ]
      }
    }

The same item is described across the `searchIndex`, `longSearchIndex` and
`info` fields.  The `searchIndex` field contains the item's short name, the
`longSearchIndex` field contains the full_name (when appropriate) and the
`info` field contains the item's name, full_name, path, parameters and a
snippet of the item's comment.

## LICENSE

Copyright (c) 2009 Vladimir Kolesnikov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


# Attributes
## index[RW] [](#attribute-i-index)
:nodoc:


#Instance Methods
## build_index() [](#method-i-build_index)
Builds the JSON index as a Hash.

## class_dir() [](#method-i-class_dir)
The directory classes are written to

## debug_msg(*msg) [](#method-i-debug_msg)
Output progress information if debugging is enabled

## expand_tabs(text) [](#method-i-expand_tabs)
Expands tab characters in `text` to eight spaces

## file_dir() [](#method-i-file_dir)
The directory files are written to

## flush_left(text) [](#method-i-flush_left)
Flush `text` left based on the shortest line

## generate() [](#method-i-generate)
Writes the JSON index to disk

## generate_gzipped() [](#method-i-generate_gzipped)
Compress the search_index.js file using gzip

## index_classes() [](#method-i-index_classes)
Adds classes and modules to the index

## index_methods() [](#method-i-index_methods)
Adds methods to the index

## index_pages() [](#method-i-index_pages)
Adds pages to the index

## initialize(parent_generator, options) [](#method-i-initialize)
Creates a new generator.  `parent_generator` is used to determine the
class_dir and file_dir of links in the output index.

`options` are the same options passed to the parent generator.

**@return** [JsonIndex] a new instance of JsonIndex

## markup(text) [](#method-i-markup)
Convert a string in markup format into HTML.

Requires the including class to implement #formatter

## normalize_comment(text) [](#method-i-normalize_comment)
Strips hashes, expands tabs then flushes `text` to the left

## parse(text, format'rdoc') [](#method-i-parse)
Normalizes `text` then builds a RDoc::Markup::Document from it

## reset(files, classes) [](#method-i-reset)
:nodoc:

## search_string(string) [](#method-i-search_string)
Removes whitespace and downcases `string`

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

