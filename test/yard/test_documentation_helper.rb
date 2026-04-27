# frozen_string_literal: true

require "test_helper"

class YARD::TestDocumentationHelper < Minitest::Test
  cover YARD::Markdown::DocumentationHelper

  DocumentedObject = Struct.new(:docstring, :tags, keyword_init: true)

  def test_documented_text_handles_documented_and_undocumented_objects
    assert_equal "**hello**", helper.documented_text(DocumentedObject.new(docstring: "*hello*", tags: []))
    assert_equal "", helper.documented_text(DocumentedObject.new(docstring: "", tags: [:tag]))
    assert_equal "Not documented.", helper.documented_text(DocumentedObject.new(docstring: "", tags: []))
  end

  private

  def helper
    @helper ||= Class.new do
      include YARD::Markdown::DocumentationHelper
    end.new
  end
end
