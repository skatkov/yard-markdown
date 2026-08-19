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

  def test_attribute_access_reads_attr_info
    assert_equal "RW", YARD::Markdown::MethodPresentationHelper.attribute_access(parsed_attribute("attr_accessor :speed", "Fish#speed"))
    assert_equal "R", YARD::Markdown::MethodPresentationHelper.attribute_access(parsed_attribute("attr_reader :speed", "Fish#speed"))
    assert_equal "W", YARD::Markdown::MethodPresentationHelper.attribute_access(parsed_attribute("attr_writer :speed", "Fish#speed="))
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
