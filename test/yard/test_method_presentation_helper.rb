# frozen_string_literal: true

require "test_helper"

class YARD::TestMethodPresentationHelper < Minitest::Test
  cover YARD::Markdown::MethodPresentationHelper

  MethodObject = Struct.new(:name, :parameters, keyword_init: true)

  def test_method_signature_and_heading_handle_nil_defaults_and_operator_spacing
    assert_equal "()", YARD::Markdown::MethodPresentationHelper.method_signature(build_method(parameters: nil))
    assert_equal "(name, limit = 10)", YARD::Markdown::MethodPresentationHelper.method_signature(build_method(parameters: [["name", nil], ["limit", "10"]]))
    assert_equal "(name)", YARD::Markdown::MethodPresentationHelper.method_signature(build_method(parameters: [["name", ""]]))
    assert_equal "[] (index)", YARD::Markdown::MethodPresentationHelper.formatted_method_heading(build_method(name: "[]", parameters: [["index", nil]]))
    assert_equal "call(index)", YARD::Markdown::MethodPresentationHelper.formatted_method_heading(build_method(name: "call", parameters: [["index", nil]]))
  end

  def test_mixed_parameters_preserve_positional_defaults_and_required_keywords
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class HttpClient
        def configure(value = nil, required:, enabled: false, label: "", limit: 10, **options, &block); end
      end
    RUBY

    method_object = YARD::Registry.at("HttpClient#configure")

    assert_equal 'configure(value = nil, required:, enabled: false, label: "", limit: 10, **options, &block)', YARD::Markdown::MethodPresentationHelper.formatted_method_heading(method_object)
  end

  def test_attribute_access_reads_attr_info
    assert_equal "RW", YARD::Markdown::MethodPresentationHelper.attribute_access(parsed_attribute("attr_accessor :speed", "Fish#speed"))
    assert_equal "R", YARD::Markdown::MethodPresentationHelper.attribute_access(parsed_attribute("attr_reader :speed", "Fish#speed"))
    assert_equal "W", YARD::Markdown::MethodPresentationHelper.attribute_access(parsed_attribute("attr_writer :speed", "Fish#speed="))
  end

  def test_unavailable_source_does_not_render_an_empty_block
    method = YARD::CodeObjects::MethodObject.new(:root, :generated)

    assert_equal "", YARD::Markdown::MethodPresentationHelper.method_source(method)

    method.source = ""

    assert_equal "", YARD::Markdown::MethodPresentationHelper.method_source(method)
  end

  private

  def build_method(parameters:, name: "call")
    MethodObject.new(name: name, parameters: parameters)
  end

  def parsed_attribute(source, path)
    YARD::Registry.clear
    YARD.parse_string("class Fish\n  #{source}\nend\n")
    YARD::Registry.at(path)
  end
end
