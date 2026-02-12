# frozen_string_literal: true

require 'test_helper'

class YARD::TestTemplateSections < Minitest::Test
  def test_markdown_module_template_defines_customizable_sections
    template = YARD::Templates::Engine.template(:default, :module, :markdown).new(
      format: :markdown,
      template: :default
    )

    assert_equal(
      %i[
        header
        relationships
        docstring_section
        tags_section
        constants_section
        attributes_section
        public_class_methods_section
        public_instance_methods_section
      ],
      template.sections.map(&:name)
    )
  end
end
