# frozen_string_literal: true

require 'test_helper'

class YARD::TestSectionAssemblyHelper < Minitest::Test
  cover YARD::Markdown::SectionAssemblyHelper

  GroupedItem = Struct.new(:group, :name, keyword_init: true)

  def test_grouped_items_uses_declared_group_order_then_remaining_groups_then_nil
    items = [
      GroupedItem.new(group: 'beta', name: 'b1'),
      GroupedItem.new(group: nil, name: 'n1'),
      GroupedItem.new(group: 'alpha', name: 'a1'),
      GroupedItem.new(group: 'beta', name: 'b2')
    ]

    assert_equal [
      ['beta', [items[0], items[3]]],
      ['alpha', [items[2]]],
      [nil, [items[1]]]
    ], helper.grouped_items(items, ['beta'])
  end

  def test_grouped_items_ignores_missing_names_from_group_order
    items = [
      GroupedItem.new(group: 'beta', name: 'b1'),
      GroupedItem.new(group: 'alpha', name: 'a1')
    ]

    assert_equal [
      ['beta', [items[0]]],
      ['alpha', [items[1]]]
    ], helper.grouped_items(items, ['missing', 'beta'])
  end

  def test_grouped_items_handles_missing_group_order
    items = [
      GroupedItem.new(group: 'beta', name: 'b1'),
      GroupedItem.new(group: 'alpha', name: 'a1'),
      GroupedItem.new(group: nil, name: 'n1')
    ]

    assert_equal [
      ['alpha', [items[1]]],
      ['beta', [items[0]]],
      [nil, [items[2]]]
    ], helper.grouped_items(items, nil)
  end

  def test_append_lines_skips_blank_content
    lines = ['existing']

    helper.append_lines(lines, " \n")

    assert_equal ['existing'], lines
  end

  def test_append_lines_inserts_separator_when_requested
    lines = ['existing']

    helper.append_lines(lines, "first\nsecond")

    assert_equal ['existing', '', 'first', 'second'], lines
  end

  def test_append_lines_does_not_duplicate_existing_separator_lines
    lines = ['existing', '']

    helper.append_lines(lines, "first\nsecond")

    assert_equal ['existing', '', 'first', 'second'], lines
  end

  def test_append_lines_appends_without_separator_when_disabled
    lines = ['existing']

    helper.append_lines(lines, "first\nsecond", separated: false)

    assert_equal ['existing', 'first', 'second'], lines
  end

  def test_append_lines_handles_empty_line_arrays_without_inserting_separator
    lines = []

    helper.append_lines(lines, "first\nsecond")

    assert_equal ['first', 'second'], lines
  end

  def test_append_lines_preserves_blank_lines_in_content
    lines = []

    helper.append_lines(lines, "first\n\nsecond")

    assert_equal ['first', '', 'second'], lines
  end

  private

  def helper
    @helper ||= Class.new do
      include YARD::Markdown::SectionAssemblyHelper
    end.new
  end
end
