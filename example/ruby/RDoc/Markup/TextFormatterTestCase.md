# Class: RDoc::Markup::TextFormatterTestCase
**Inherits:** RDoc::Markup::FormatterTestCase
    

Test case for creating new plain-text RDoc::Markup formatters.  See also
RDoc::Markup::FormatterTestCase

See test_rdoc_markup_to_rdoc.rb for a complete example.

Example:

    class TestRDocMarkupToNewTextFormat < RDoc::Markup::TextFormatterTestCase

      add_visitor_tests
      add_text_tests

      def setup
        super

        @to = RDoc::Markup::ToNewTextFormat.new
      end

      def accept_blank_line
        assert_equal :junk, @to.res.join
      end

      # ...

    end


# Class Methods
## add_text_tests() [](#method-c-add_text_tests)
Adds test cases to the calling TestCase.

