# frozen_string_literal: true

require "test_helper"

class YARD::TestTagFormatting < Minitest::Test
  cover YARD::Markdown::TagFormattingHelper

  Tag = Struct.new(:tag_name, :name, :types, :text, keyword_init: true)
  ObjectWithTags = Struct.new(:tags, keyword_init: true)

  def test_strips_whitespace_from_hash_type_keys
    tag = Tag.new(tag_name: "validates", types: {"  presence  " => nil}, text: "")

    assert_equal "**@validates** [presence]", formatter.format_tag(tag)
  end

  def test_strips_whitespace_from_hash_type_keys_with_values
    tag = Tag.new(tag_name: "option", types: {"  limit  " => "required"}, text: "")

    assert_equal "**@option** [limit: required]", formatter.format_tag(tag)
  end

  def test_ignores_blank_hash_type_keys_even_when_values_are_present
    tag = Tag.new(tag_name: "option", types: {"   " => "required"}, text: "")

    assert_equal "**@option**", formatter.format_tag(tag)
  end

  def test_treats_empty_hash_type_values_as_presence_only
    tag = Tag.new(tag_name: "option", types: {"limit" => ""}, text: "")

    assert_equal "**@option** [limit]", formatter.format_tag(tag)
  end

  def test_treats_true_hash_type_values_as_presence_only
    tag = Tag.new(tag_name: "option", types: {"limit" => true}, text: "")

    assert_equal "**@option** [limit]", formatter.format_tag(tag)
  end

  def test_formats_scalar_hash_type_values_without_calling_empty
    tag = Tag.new(tag_name: "option", types: {"limit" => 10}, text: "")

    assert_equal "**@option** [limit: 10]", formatter.format_tag(tag)
  end

  def test_keeps_array_type_rendering
    tag = Tag.new(tag_name: "return", types: %w[String nil], text: "description")

    assert_equal "**@return** [String, nil] description", formatter.format_tag(tag)
  end

  def test_strips_surrounding_whitespace_from_scalar_type_values
    tag = Tag.new(tag_name: "return", types: "  String  ", text: "")

    assert_equal "**@return** [String]", formatter.format_tag(tag)
  end

  def test_does_not_render_blank_tag_names
    tag = Tag.new(tag_name: "return", name: "   ", text: "description")

    assert_equal "**@return** description", formatter.format_tag(tag)
  end

  def test_renders_non_blank_tag_names
    tag = Tag.new(tag_name: "param", name: "user", text: "")

    assert_equal "**@param** `user`", formatter.format_tag(tag)
  end

  def test_does_not_render_blank_tag_text
    tag = Tag.new(tag_name: "return", text: "   ")

    assert_equal "**@return**", formatter.format_tag(tag)
  end

  def test_handles_nil_tag_text
    tag = Tag.new(tag_name: "return")

    assert_equal "**@return**", formatter.format_tag(tag)
  end

  def test_strips_surrounding_whitespace_from_tag_text
    tag = Tag.new(tag_name: "return", text: "  description  ")

    assert_equal "**@return** description", formatter.format_tag(tag)
  end

  def test_renders_example_tags_as_ruby_code_blocks
    object = ObjectWithTags.new(tags: [Tag.new(tag_name: "example", name: "Usage", text: "call_it\n")])

    assert_equal "**@example Usage**\n```ruby\ncall_it\n```", formatter.render_tags(object)
  end

  def test_does_not_render_blank_example_names
    object = ObjectWithTags.new(tags: [Tag.new(tag_name: "example", name: "   ", text: "call_it\n")])

    assert_equal "**@example**\n```ruby\ncall_it\n```", formatter.render_tags(object)
  end

  def test_handles_nil_example_text
    object = ObjectWithTags.new(tags: [Tag.new(tag_name: "example")])

    assert_equal "**@example**\n```ruby\n\n```", formatter.render_tags(object)
  end

  def test_renders_regular_tags_as_bulleted_items
    object = ObjectWithTags.new(tags: [Tag.new(tag_name: "return", types: "String", text: "description")])

    assert_equal "- **@return** [String] description", formatter.render_tags(object)
  end

  def test_separates_regular_tags_from_example_blocks
    object = ObjectWithTags.new(tags: [
      Tag.new(tag_name: "return", types: "String", text: "description"),
      Tag.new(tag_name: "example", text: "call_it\n")
    ])

    assert_equal "- **@return** [String] description\n\n**@example**\n```ruby\ncall_it\n```", formatter.render_tags(object)
  end

  def test_render_tags_returns_empty_string_for_objects_without_tags
    assert_equal "", formatter.render_tags(ObjectWithTags.new(tags: []))
  end

  private

  def formatter
    @formatter ||= Class.new do
      include YARD::Markdown::TagFormattingHelper
    end.new
  end
end
