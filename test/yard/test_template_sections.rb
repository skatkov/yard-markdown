# frozen_string_literal: true

require "test_helper"

class YARD::TestTemplateSections < Minitest::Test
  cover YARD::Markdown::AnchorComponentHelper
  cover YARD::Markdown::ArefHelper
  cover YARD::Markdown::HeadingHelper

  def test_anchor_component_escapes_non_identifier_characters
    template = Class.new do
      include YARD::Markdown::AnchorComponentHelper
    end.new

    assert_equal "sustainable-3F", template.anchor_component("sustainable?")
  end

  def test_aref_formats_supported_yard_object_types
    YARD::Registry.clear
    YARD.parse("example_yard.rb")

    assert_equal "method-i-sustainable-3F", helper.aref(YARD::Registry.at("Salmon#sustainable?"))
    assert_equal "constant-MAX_SPEED", helper.aref(YARD::Registry.at("Salmon::MAX_SPEED"))
    assert_equal "method-c-wild_salmon", helper.aref(YARD::Registry.at("Salmon.wild_salmon"))
    assert_equal "attribute-i-farmed", helper.aref(YARD::Registry.at("Salmon#farmed"))

    YARD::Registry.clear
    YARD.parse_string("module Ocean\n  module Deep\n    class Salmon\n    end\n    module Cold\n    end\n  end\nend\n")

    assert_equal "class-Ocean-Deep-Salmon", helper.aref(YARD::Registry.at("Ocean::Deep::Salmon"))
    assert_equal "module-Ocean-Deep-Cold", helper.aref(YARD::Registry.at("Ocean::Deep::Cold"))

    YARD::Registry.clear
    YARD.parse_string("class Salmon\n  @@population = 1\nend\n")

    assert_equal "classvariable--40-40population", helper.aref(YARD::Registry.all.find { |o| o.type == :classvariable })
  end

  def test_heading_helpers_build_legacy_and_current_anchors
    YARD::Registry.clear
    YARD.parse("example_yard.rb")

    assert_equal "MAX_SPEED-constant", heading_helper.legacy_aref(YARD::Registry.at("Salmon::MAX_SPEED"))
    assert_equal "@@wild_salmon-classvariable", heading_helper.legacy_aref(YARD::Registry.at("Salmon::@@wild_salmon"))
    assert_equal "wild_salmon-class_method", heading_helper.legacy_aref(YARD::Registry.at("Salmon.wild_salmon"))
    assert_equal "sustainable?-instance_method", heading_helper.legacy_aref(YARD::Registry.at("Salmon#sustainable?"))

    assert_equal(
      '# Sustainable <a id="method-i-sustainable-3F"></a> <a id="sustainable?-instance_method"></a>',
      heading_helper.heading_with_anchors("# Sustainable", YARD::Registry.at("Salmon#sustainable?"))
    )

    assert_equal ['<a id="class-Salmon"></a>'], heading_helper.anchor_tags_for(YARD::Registry.at("Salmon"))
  end

  private

  def helper
    @helper ||= Class.new do
      include YARD::Markdown::ArefHelper
    end.new
  end

  def heading_helper
    @heading_helper ||= Class.new do
      include YARD::Markdown::HeadingHelper
    end.new
  end
end
