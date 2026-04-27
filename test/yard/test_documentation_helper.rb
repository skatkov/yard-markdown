# frozen_string_literal: true

require "test_helper"

class YARD::TestDocumentationHelper < Minitest::Test
  cover YARD::Markdown::DocumentationHelper

  def test_documented_text_handles_documented_and_undocumented_objects
    YARD::Registry.clear

    assert_equal "**hello**", helper.documented_text(build_object(docstring: "*hello*"))
    assert_equal "", helper.documented_text(build_object(tags: [YARD::Tags::Tag.new("return", "", ["String"])]))
    assert_equal "Not documented.", helper.documented_text(build_object)
  end

  private

  def helper
    @helper ||= Class.new do
      include YARD::Markdown::DocumentationHelper
    end.new
  end

  def build_object(docstring: "", tags: [])
    object = YARD::CodeObjects::ClassObject.new(YARD::Registry.root, next_name)
    object.docstring = docstring
    tags.each { |tag| object.add_tag(tag) }
    object
  end

  def next_name
    self.class.instance_variable_set(:@next_name, self.class.instance_variable_get(:@next_name).to_i + 1)
    "DocumentedObject#{self.class.instance_variable_get(:@next_name)}"
  end
end
