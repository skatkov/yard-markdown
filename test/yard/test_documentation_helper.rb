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

  def test_rdoc_to_md_preserves_fenced_code_blocks
    docstring = <<~DOC.rstrip
      Before *bold*.

      ```ruby
      Sandbox.sandboxed do |config|
        config.before(:context) { RSpec.current_example = nil }
      end
      ```

      ```
      second_block
      ```

      ```
      ```

      After.
    DOC

    expected = <<~MARKDOWN.rstrip
      Before **bold**.

      ```ruby
      Sandbox.sandboxed do |config|
        config.before(:context) { RSpec.current_example = nil }
      end
      ```

      ```
      second_block
      ```

      ```
      ```

      After.
    MARKDOWN

    assert_equal expected, helper.rdoc_to_md(docstring)
  end

  private

  def helper
    @helper ||= Object.new.extend(YARD::Markdown::DocumentationHelper)
  end

  def build_object(docstring: "", tags: [])
    YARD::Registry.clear
    object = YARD::CodeObjects::ClassObject.new(YARD::Registry.root, "DocumentedObject")
    object.docstring = docstring
    tags.each { |tag| object.add_tag(tag) }
    object
  end
end
