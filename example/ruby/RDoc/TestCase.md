# Class: RDoc::TestCase
**Inherits:** Test::Unit::TestCase
    

RDoc::TestCase is an abstract TestCase to provide common setup and teardown
across all RDoc tests.  The test case uses test-unit, so all the assertions of
test-unit may be used.

The testcase provides the following:

*   A reset code-object tree
*   A reset markup preprocessor (RDoc::Markup::PreProcess)
*   The `@RM` alias of RDoc::Markup (for less typing)
*   `@pwd` containing the current working directory
*   FileUtils, pp, Tempfile, Dir.tmpdir and StringIO



#Instance Methods
## assert_directory(path) [](#method-i-assert_directory)
Asserts `path` is a directory

## assert_file(path) [](#method-i-assert_file)
Asserts `path` is a file

## blank_line() [](#method-i-blank_line)
Shortcut for RDoc::Markup::BlankLine.new

## block(*contents) [](#method-i-block)
Shortcut for RDoc::Markup::BlockQuote.new with `contents`

## comment(text, top_level@top_level, languagenil) [](#method-i-comment)
Creates an RDoc::Comment with `text` which was defined on `top_level`. By
default the comment has the 'rdoc' format.

## doc(*contents) [](#method-i-doc)
Shortcut for RDoc::Markup::Document.new with `contents`

## hard_break() [](#method-i-hard_break)
Shortcut for RDoc::Markup::HardBreak.new

## head(level, text) [](#method-i-head)
Shortcut for RDoc::Markup::Heading.new with `level` and `text`

## item(labelnil, *parts) [](#method-i-item)
Shortcut for RDoc::Markup::ListItem.new with `label` and `parts`

## list(typenil, *items) [](#method-i-list)
Shortcut for RDoc::Markup::List.new with `type` and `items`

## mu_pp(obj) [](#method-i-mu_pp)
Enables pretty-print output

## para(*a) [](#method-i-para)
Shortcut for RDoc::Markup::Paragraph.new with `contents`

## raw(*contents) [](#method-i-raw)
Shortcut for RDoc::Markup::Raw.new with `contents`

## refute_file(path) [](#method-i-refute_file)
Refutes `path` exists

## rule(weight) [](#method-i-rule)
Shortcut for RDoc::Markup::Rule.new with `weight`

## setup() [](#method-i-setup)
Abstract test-case setup

## teardown() [](#method-i-teardown)
Abstract test-case teardown

## temp_dir() [](#method-i-temp_dir)
Creates a temporary directory changes the current directory to it for the
duration of the block.

Depends upon Dir.mktmpdir

## verb(*parts) [](#method-i-verb)
Shortcut for RDoc::Markup::Verbatim.new with `parts`

## verbose_capture_output() [](#method-i-verbose_capture_output)
run capture_io with setting $VERBOSE = true

