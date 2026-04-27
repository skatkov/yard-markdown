# frozen_string_literal: true

require "test_helper"

class YARD::TestSectionAssemblyHelper < Minitest::Test
  cover YARD::Markdown::SectionAssemblyHelper

  GroupedItem = Struct.new(:group, :name, keyword_init: true)

  def test_grouped_items_orders_declared_missing_and_default_groups
    items = [
      GroupedItem.new(group: "beta", name: "b1"),
      GroupedItem.new(group: nil, name: "n1"),
      GroupedItem.new(group: "alpha", name: "a1"),
      GroupedItem.new(group: "beta", name: "b2")
    ]

    assert_equal [
      ["beta", [items[0], items[3]]],
      ["alpha", [items[2]]],
      [nil, [items[1]]]
    ], helper.grouped_items(items, ["beta"])

    assert_equal [
      ["beta", [GroupedItem.new(group: "beta", name: "b1")]],
      ["alpha", [GroupedItem.new(group: "alpha", name: "a1")]]
    ], helper.grouped_items([
      GroupedItem.new(group: "beta", name: "b1"),
      GroupedItem.new(group: "alpha", name: "a1")
    ], ["missing", "beta"])

    assert_equal [
      ["alpha", [GroupedItem.new(group: "alpha", name: "a1")]],
      ["beta", [GroupedItem.new(group: "beta", name: "b1")]],
      [nil, [GroupedItem.new(group: nil, name: "n1")]]
    ], helper.grouped_items([
      GroupedItem.new(group: "beta", name: "b1"),
      GroupedItem.new(group: "alpha", name: "a1"),
      GroupedItem.new(group: nil, name: "n1")
    ], nil)
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
    @helper ||= Class.new do
      include YARD::Markdown::SectionAssemblyHelper
    end.new
  end
end
