# frozen_string_literal: true

require "test_helper"

class YARD::TestDocumentationHelper < Minitest::Test
  cover YARD::Markdown::DocumentationHelper

  DocumentedObject = Struct.new(:docstring, :tags, keyword_init: true)

  def test_rdoc_to_md_returns_empty_for_blank_docstrings
    assert_equal "", helper.rdoc_to_md("  \n")
  end

  def test_rdoc_to_md_converts_basic_rdoc_markup
    assert_equal "**hello**", helper.rdoc_to_md("*hello*")
  end

  def test_documented_text_returns_rendered_docstring
    object = DocumentedObject.new(docstring: "*hello*", tags: [])

    assert_equal "**hello**", helper.documented_text(object)
  end

  def test_documented_text_returns_empty_when_only_tags_are_present
    object = DocumentedObject.new(docstring: "", tags: [:tag])

    assert_equal "", helper.documented_text(object)
  end

  def test_documented_text_marks_objects_without_docs_or_tags
    object = DocumentedObject.new(docstring: "", tags: [])

    assert_equal "Not documented.", helper.documented_text(object)
  end

  private

  def helper
    @helper ||= Class.new do
      include YARD::Markdown::DocumentationHelper
    end.new
  end
end
