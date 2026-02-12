# frozen_string_literal: true

require 'test_helper'

class YARD::TestTagFormatting < Minitest::Test
  Tag = Struct.new(:tag_name, :name, :types, :text, keyword_init: true)

  def test_formats_hash_types_without_errors
    tag = Tag.new(tag_name: 'validates', types: { 'presence' => nil }, text: '')

    assert_equal '**@validates** [presence]', formatter.send(:format_tag, tag)
  end

  def test_keeps_array_type_rendering
    tag = Tag.new(tag_name: 'return', types: %w[String nil], text: 'description')

    assert_equal '**@return** [String, nil] description', formatter.send(:format_tag, tag)
  end

  private

  def formatter
    @formatter ||= YARD::Templates::Engine.template(:default, :module, :markdown).new(
      format: :markdown,
      template: :default
    )
  end
end
