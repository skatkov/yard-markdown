# Class: RDoc::Stats
**Inherits:** Object
    
**Includes:** RDoc::Text
  

RDoc statistics collector which prints a summary and report of a project's
documentation totals.


# Attributes
## coverage_level[RW] [](#attribute-i-coverage_level)
Output level for the coverage report

## files_so_far[RW] [](#attribute-i-files_so_far)
Count of files parsed during parsing

## num_files[RW] [](#attribute-i-num_files)
Total number of files found


#Instance Methods
## add_alias(as) [](#method-i-add_alias)
Records the parsing of an alias `as`.

## add_attribute(attribute) [](#method-i-add_attribute)
Records the parsing of an attribute `attribute`

## add_class(klass) [](#method-i-add_class)
Records the parsing of a class `klass`

## add_constant(constant) [](#method-i-add_constant)
Records the parsing of `constant`

## add_file(file) [](#method-i-add_file)
Records the parsing of `file`

## add_method(method) [](#method-i-add_method)
Records the parsing of `method`

## add_module(mod) [](#method-i-add_module)
Records the parsing of a module `mod`

## begin_adding() [](#method-i-begin_adding)
Call this to mark the beginning of parsing for display purposes

## calculate() [](#method-i-calculate)
Calculates documentation totals and percentages for classes, modules,
constants, attributes and methods.

## doc_stats(collection) [](#method-i-doc_stats)
Returns the length and number of undocumented items in `collection`.

## done_adding() [](#method-i-done_adding)
Call this to mark the end of parsing for display purposes

## expand_tabs(text) [](#method-i-expand_tabs)
Expands tab characters in `text` to eight spaces

## flush_left(text) [](#method-i-flush_left)
Flush `text` left based on the shortest line

## fully_documented?() [](#method-i-fully_documented?)
The documentation status of this project.  `true` when 100%, `false` when less
than 100% and `nil` when unknown.

Set by calling #calculate

**@return** [Boolean] 

## great_job() [](#method-i-great_job)
A report that says you did a great job!

## initialize(store, num_files, verbosity1) [](#method-i-initialize)
Creates a new Stats that will have `num_files`.  `verbosity` defaults to 1
which will create an RDoc::Stats::Normal outputter.

**@return** [Stats] a new instance of Stats

## markup(text) [](#method-i-markup)
Convert a string in markup format into HTML.

Requires the including class to implement #formatter

## normalize_comment(text) [](#method-i-normalize_comment)
Strips hashes, expands tabs then flushes `text` to the left

## parse(text, format'rdoc') [](#method-i-parse)
Normalizes `text` then builds a RDoc::Markup::Document from it

## percent_doc() [](#method-i-percent_doc)
Calculates the percentage of items documented.

## report() [](#method-i-report)
Returns a report on which items are not documented

## report_attributes(cm) [](#method-i-report_attributes)
Returns a report on undocumented attributes in ClassModule `cm`

## report_class_module(cm) [](#method-i-report_class_module)
Returns a report on undocumented items in ClassModule `cm`

## report_constants(cm) [](#method-i-report_constants)
Returns a report on undocumented constants in ClassModule `cm`

## report_methods(cm) [](#method-i-report_methods)
Returns a report on undocumented methods in ClassModule `cm`

## snippet(text, limit100) [](#method-i-snippet)
The first `limit` characters of `text` as HTML

## strip_hashes(text) [](#method-i-strip_hashes)
Strips leading # characters from `text`

## strip_newlines(text) [](#method-i-strip_newlines)
Strips leading and trailing n characters from `text`

## strip_stars(text) [](#method-i-strip_stars)
Strips /* */ style comments

## summary() [](#method-i-summary)
Returns a summary of the collected statistics.

## to_html(text) [](#method-i-to_html)
Converts ampersand, dashes, ellipsis, quotes, copyright and registered
trademark symbols in `text` to properly encoded characters.

## undoc_params(method) [](#method-i-undoc_params)
Determines which parameters in `method` were not documented.  Returns a total
parameter count and an Array of undocumented methods.

## wrap(txt, line_len76) [](#method-i-wrap)
Wraps `txt` to `line_len`

