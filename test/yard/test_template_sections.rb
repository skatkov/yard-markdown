# frozen_string_literal: true

require 'test_helper'

class YARD::TestTemplateSections < Minitest::Test
  cover YARD::Markdown::AnchorComponentHelper

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

  def test_anchor_component_escapes_non_identifier_characters
    template = Class.new do
      include YARD::Markdown::AnchorComponentHelper
    end.new

    assert_equal 'sustainable-3F', template.anchor_component('sustainable?')
  end

  def test_aref_escapes_symbol_method_names_from_yard_objects
    template = YARD::Templates::Engine.template(:default, :module, :markdown).new(
      format: :markdown,
      template: :default
    )

    YARD::Registry.clear
    YARD.parse('example_yard.rb')

    assert_equal 'method-i-sustainable-3F', template.aref(YARD::Registry.at('Salmon#sustainable?'))
  end
end
