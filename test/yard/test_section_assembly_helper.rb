# frozen_string_literal: true

require "test_helper"

class YARD::TestSectionAssemblyHelper < Minitest::Test
  cover YARD::Markdown::SectionAssemblyHelper

  def test_render_section_content_normalizes_blank_string_and_non_string_input
    content = Class.new do
      def to_s
        "hello"
      end
    end.new

    assert_equal "hello\n\n", helper.render_section_content("  hello\n")
    assert_equal "", helper.render_section_content(" \n")
    assert_equal "hello\n\n", helper.render_section_content(content)
  end

  def test_grouped_items_orders_declared_missing_and_default_groups
    parse_source(<<~RUBY)
      class Fish
        # @!group beta
        def b1
        end
        # @!endgroup

        def n1
        end

        # @!group alpha
        def a1
        end
        # @!endgroup

        # @!group beta
        def b2
        end
        # @!endgroup
      end
    RUBY

    assert_equal [
      ["beta", %w[Fish#b1 Fish#b2]],
      ["alpha", %w[Fish#a1]],
      [nil, %w[Fish#n1]]
    ], grouped_paths(methods(%w[b1 n1 a1 b2]), ["beta"])

    parse_source(<<~RUBY)
      class Fish
        # @!group beta
        def b1
        end
        # @!endgroup

        # @!group alpha
        def a1
        end
        # @!endgroup
      end
    RUBY

    assert_equal [
      ["beta", %w[Fish#b1]],
      ["alpha", %w[Fish#a1]]
    ], grouped_paths(methods(%w[b1 a1]), ["missing", "beta"])

    parse_source(<<~RUBY)
      class Fish
        # @!group beta
        def b1
        end
        # @!endgroup

        # @!group alpha
        def a1
        end
        # @!endgroup

        def n1
        end
      end
    RUBY

    assert_equal [
      ["alpha", %w[Fish#a1]],
      ["beta", %w[Fish#b1]],
      [nil, %w[Fish#n1]]
    ], grouped_paths(methods(%w[b1 a1 n1]), nil)
  end

  def test_append_lines_handles_blank_content_and_separator_rules
    lines = ["existing"]
    helper.append_lines(lines, " \n")
    assert_equal ["existing"], lines

    lines = ["existing"]
    helper.append_lines(lines, "first\nsecond")
    assert_equal ["existing", "", "first", "second"], lines

    lines = ["existing", ""]
    helper.append_lines(lines, "first\nsecond")
    assert_equal ["existing", "", "first", "second"], lines

    lines = ["existing"]
    helper.append_lines(lines, "first\nsecond", separated: false)
    assert_equal ["existing", "first", "second"], lines

    lines = []
    helper.append_lines(lines, "first\n\nsecond")
    assert_equal ["first", "", "second"], lines
  end

  private

  def helper
    @helper ||= Object.new.extend(YARD::Markdown::SectionAssemblyHelper)
  end

  def grouped_paths(items, group_order)
    helper.grouped_items(items, group_order).map { |group, grouped_items|
      [group, grouped_items.map(&:path)]
    }
  end

  def methods(names)
    names.map { |name| YARD::Registry.at("Fish##{name}") }
  end

  def parse_source(source)
    YARD::Registry.clear
    YARD.parse_string(source)
  end
end
