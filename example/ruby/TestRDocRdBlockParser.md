# Class: TestRDocRdBlockParser
**Inherits:** RDoc::TestCase
    




#Instance Methods
## parse(text) [](#method-i-parse)

## setup() [](#method-i-setup)

## test_add_footnote() [](#method-i-test_add_footnote)

## test_parse_desclist() [](#method-i-test_parse_desclist)

## test_parse_enumlist() [](#method-i-test_parse_enumlist)

## test_parse_enumlist_multiline() [](#method-i-test_parse_enumlist_multiline)

## test_parse_enumlist_paragraphs() [](#method-i-test_parse_enumlist_paragraphs)

## test_parse_enumlist_verbatim() [](#method-i-test_parse_enumlist_verbatim)

## test_parse_enumlist_verbatim_continue() [](#method-i-test_parse_enumlist_verbatim_continue)

## test_parse_footnote() [](#method-i-test_parse_footnote)

## test_parse_heading() [](#method-i-test_parse_heading)
def test_parse_include_other_format
      @block_parser.include_path = [Dir.tmpdir]

      expected =
        doc(
          blank_line,
          para("include ((*worked*))"),
          blank_line,
          blank_line)

      str = <<~STR
      =begin nonrd
      <<< worked
      =end
      STR

      assert_equal(expected, @block_parser.parse str.lines.to_a)
    end

## test_parse_include() [](#method-i-test_parse_include)

## test_parse_include_subtree() [](#method-i-test_parse_include_subtree)

## test_parse_itemlist() [](#method-i-test_parse_itemlist)

## test_parse_itemlist_multiline() [](#method-i-test_parse_itemlist_multiline)

## test_parse_itemlist_nest() [](#method-i-test_parse_itemlist_nest)

## test_parse_itemlist_paragraphs() [](#method-i-test_parse_itemlist_paragraphs)

## test_parse_itemlist_verbatim() [](#method-i-test_parse_itemlist_verbatim)

## test_parse_itemlist_verbatim_continue() [](#method-i-test_parse_itemlist_verbatim_continue)

## test_parse_lists() [](#method-i-test_parse_lists)

## test_parse_lists_nest() [](#method-i-test_parse_lists_nest)

## test_parse_lists_nest_verbatim() [](#method-i-test_parse_lists_nest_verbatim)

## test_parse_lists_nest_verbatim2() [](#method-i-test_parse_lists_nest_verbatim2)

## test_parse_methodlist() [](#method-i-test_parse_methodlist)

## test_parse_methodlist_empty() [](#method-i-test_parse_methodlist_empty)

## test_parse_methodlist_paragraph() [](#method-i-test_parse_methodlist_paragraph)

## test_parse_methodlist_paragraph2() [](#method-i-test_parse_methodlist_paragraph2)

## test_parse_methodlist_paragraph_verbatim() [](#method-i-test_parse_methodlist_paragraph_verbatim)

## test_parse_textblock() [](#method-i-test_parse_textblock)

## test_parse_textblock_multi() [](#method-i-test_parse_textblock_multi)

## test_parse_verbatim() [](#method-i-test_parse_verbatim)

## test_parse_verbatim_blankline() [](#method-i-test_parse_verbatim_blankline)

## test_parse_verbatim_indent() [](#method-i-test_parse_verbatim_indent)

## test_parse_verbatim_multi() [](#method-i-test_parse_verbatim_multi)

