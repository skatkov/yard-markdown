# Class: RDoc::Markup::FormatterTestCase
**Inherits:** RDoc::TestCase
    

Test case for creating new RDoc::Markup formatters.  See
test/test_rdoc_markup_to_*.rb for examples.

This test case adds a variety of tests to your subclass when
#add_visitor_tests is called.  Most tests set up a scenario then call a method
you will provide to perform the assertion on the output.

Your subclass must instantiate a visitor and assign it to `@to`.

For example, test_accept_blank_line sets up a RDoc::Markup::BlockLine then
calls accept_blank_line on your visitor.  You are responsible for asserting
that the output is correct.

Example:

    class TestRDocMarkupToNewFormat < RDoc::Markup::FormatterTestCase

      add_visitor_tests

      def setup
        super

        @to = RDoc::Markup::ToNewFormat.new
      end

      def accept_blank_line
        assert_equal :junk, @to.res.join
      end

      # ...

    end


# Class Methods
## add_visitor_tests() [](#method-c-add_visitor_tests)
Call to add the visitor tests to your test case

#Instance Methods
## setup() [](#method-i-setup)
Call #setup when inheriting from this test case.

Provides the following instance variables:

+@m+
:   RDoc::Markup.new

+@RM+
:   RDoc::Markup # to reduce typing

+@bullet_list+
:   @RM::List.new :BULLET, # ...

+@label_list+
:   @RM::List.new :LABEL, # ...

+@lalpha_list+
:   @RM::List.new :LALPHA, # ...

+@note_list+
:   @RM::List.new :NOTE, # ...

+@number_list+
:   @RM::List.new :NUMBER, # ...

+@ualpha_list+
:   @RM::List.new :UALPHA, # ...


