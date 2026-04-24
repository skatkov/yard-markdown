# frozen_string_literal: true

require 'test_helper'

class YARD::TestTemplateSections < Minitest::Test
  cover YARD::Markdown::AnchorComponentHelper
  cover YARD::Markdown::ArefHelper

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
    template = helper

    YARD::Registry.clear
    YARD.parse('example_yard.rb')

    assert_equal 'method-i-sustainable-3F', template.aref(YARD::Registry.at('Salmon#sustainable?'))
  end

  def test_aref_formats_class_and_module_objects
    YARD::Registry.clear
    YARD.parse('example_yard.rb')

    assert_equal 'class-Salmon', helper.aref(YARD::Registry.at('Salmon'))
    assert_equal 'module-Aquatic', helper.aref(YARD::Registry.at('Aquatic'))
  end

  def test_aref_escapes_namespaced_class_paths
    YARD::Registry.clear
    YARD.parse_string("module Ocean\n  class Salmon\n  end\nend\n")

    assert_equal 'class-Ocean-Salmon', helper.aref(YARD::Registry.at('Ocean::Salmon'))
  end

  def test_aref_replaces_all_namespace_separators_for_class_paths
    YARD::Registry.clear
    YARD.parse_string("module Ocean\n  module Deep\n    class Salmon\n    end\n  end\nend\n")

    assert_equal 'class-Ocean-Deep-Salmon', helper.aref(YARD::Registry.at('Ocean::Deep::Salmon'))
  end

  def test_aref_replaces_all_namespace_separators_for_module_paths
    YARD::Registry.clear
    YARD.parse_string("module Ocean\n  module Deep\n    module Cold\n    end\n  end\nend\n")

    assert_equal 'module-Ocean-Deep-Cold', helper.aref(YARD::Registry.at('Ocean::Deep::Cold'))
  end

  def test_aref_formats_constants_and_class_methods
    YARD::Registry.clear
    YARD.parse('example_yard.rb')

    assert_equal 'constant-MAX_SPEED', helper.aref(YARD::Registry.at('Salmon::MAX_SPEED'))
    assert_equal 'method-c-wild_salmon', helper.aref(YARD::Registry.at('Salmon.wild_salmon'))
  end

  def test_aref_formats_attributes_separately_from_regular_methods
    YARD::Registry.clear
    YARD.parse('example_yard.rb')

    assert_equal 'attribute-i-farmed', helper.aref(YARD::Registry.at('Salmon#farmed'))
  end

  def test_aref_formats_classvariables_with_escaped_at_signs
    YARD::Registry.clear
    YARD.parse_string("class Salmon\n  @@population = 1\nend\n")

    assert_equal 'classvariable--40-40population', helper.aref(YARD::Registry.all.find { |o| o.type == :classvariable })
  end

  private

  def helper
    @helper ||= Class.new do
      include YARD::Markdown::ArefHelper
    end.new
  end
end
