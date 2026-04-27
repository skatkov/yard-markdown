# frozen_string_literal: true

require "test_helper"

class YARD::TestTagFormatting < Minitest::Test
  cover YARD::Markdown::TagFormattingHelper

  def test_format_tag_normalizes_hash_and_scalar_type_values
    assert_equal "**@validates** [presence]", formatter.format_tag(tag(tag_name: "validates", types: {"  presence  " => nil}, text: ""))
    assert_equal "**@option** [limit: required]", formatter.format_tag(tag(tag_name: "option", types: {"  limit  " => "required"}, text: ""))
    assert_equal "**@option**", formatter.format_tag(tag(tag_name: "option", types: {"   " => "required"}, text: ""))
    assert_equal "**@option** [limit]", formatter.format_tag(tag(tag_name: "option", types: {"limit" => ""}, text: ""))
    assert_equal "**@option** [limit]", formatter.format_tag(tag(tag_name: "option", types: {"limit" => true}, text: ""))
    assert_equal "**@option** [limit: 10]", formatter.format_tag(tag(tag_name: "option", types: {"limit" => 10}, text: ""))
    assert_equal "**@return** [String, nil] description", formatter.format_tag(tag(tag_name: "return", types: %w[String nil], text: "description"))
    assert_equal "**@return** [String]", formatter.format_tag(tag(tag_name: "return", types: "  String  ", text: ""))
  end

  def test_format_tag_handles_tag_names_and_text
    assert_equal "**@return** description", formatter.format_tag(tag(tag_name: "return", name: "   ", text: "description"))
    assert_equal "**@param** `user`", formatter.format_tag(tag(tag_name: "param", name: "user", text: ""))
    assert_equal "**@return**", formatter.format_tag(tag(tag_name: "return", text: "   "))
    assert_equal "**@return**", formatter.format_tag(tag(tag_name: "return"))
    assert_equal "**@return** description", formatter.format_tag(tag(tag_name: "return", text: "  description  "))
  end

  def test_render_tags_renders_example_blocks_for_named_blank_and_nil_examples
    assert_equal "**@example Usage**\n```ruby\ncall_it\n```", formatter.render_tags(build_object(tags: [tag(tag_name: "example", name: "Usage", text: "call_it\n")]))
    assert_equal "**@example**\n```ruby\ncall_it\n```", formatter.render_tags(build_object(tags: [tag(tag_name: "example", name: "   ", text: "call_it\n")]))
    assert_equal "**@example**\n```ruby\n\n```", formatter.render_tags(build_object(tags: [tag(tag_name: "example")]))
  end

  def test_separates_regular_tags_from_example_blocks
    object = build_object(tags: [
      tag(tag_name: "return", types: "String", text: "description"),
      tag(tag_name: "example", text: "call_it\n")
    ])

    assert_equal "- **@return** [String] description\n\n**@example**\n```ruby\ncall_it\n```", formatter.render_tags(object)
  end

  def test_render_tags_returns_empty_string_for_objects_without_tags
    assert_equal "", formatter.render_tags(build_object)
  end

  private

  def formatter
    @formatter ||= Class.new do
      include YARD::Markdown::TagFormattingHelper
    end.new
  end

  def tag(tag_name:, text: nil, types: nil, name: nil)
    item = YARD::Tags::Tag.new(tag_name, text, nil, name)
    item.types = types unless types.nil?
    item
  end

  def build_object(tags: [])
    object = YARD::CodeObjects::ClassObject.new(YARD::Registry.root, next_name)
    tags.each { |item| object.add_tag(item) }
    object
  end

  def next_name
    self.class.instance_variable_set(:@next_name, self.class.instance_variable_get(:@next_name).to_i + 1)
    "TaggedObject#{self.class.instance_variable_get(:@next_name)}"
  end
end
