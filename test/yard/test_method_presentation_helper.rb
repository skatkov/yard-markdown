# frozen_string_literal: true

require "test_helper"

class YARD::TestMethodPresentationHelper < Minitest::Test
  cover YARD::Markdown::MethodPresentationHelper

  def test_method_signature_and_heading_handle_nil_defaults_and_operator_spacing
    assert_equal "()", helper.method_signature(build_method(parameters: nil))
    assert_equal "(name, limit = 10)", helper.method_signature(build_method(parameters: [["name", nil], ["limit", "10"]]))
    assert_equal "(name)", helper.method_signature(build_method(parameters: [["name", ""]]))
    assert_equal "[] (index)", helper.formatted_method_heading(build_method(name: "[]", parameters: [["index", nil]], string_name: true))
    assert_equal "call(index)", helper.formatted_method_heading(build_method(name: "call", parameters: [["index", nil]], string_name: true))
  end

  def test_attribute_access_reads_attr_info
    assert_equal "RW", helper.attribute_access(parsed_attribute("attr_accessor :speed", "Fish#speed"))
    assert_equal "R", helper.attribute_access(parsed_attribute("attr_reader :speed", "Fish#speed"))
    assert_equal "W", helper.attribute_access(parsed_attribute("attr_writer :speed", "Fish#speed="))
  end

  private

  def helper
    @helper ||= Class.new do
      include YARD::Markdown::MethodPresentationHelper
    end.new
  end

  def build_method(parameters:, name: "call", string_name: false)
    method_object = YARD::CodeObjects::MethodObject.new(namespace, name.to_sym, :instance)
    method_object.parameters = parameters
    return method_object unless string_name

    method_object.define_singleton_method(:name) do |_full = false|
      name
    end
    method_object
  end

  def parsed_attribute(source, path)
    YARD::Registry.clear
    YARD.parse_string("class Fish\n  #{source}\nend\n")
    YARD::Registry.at(path)
  end

  def namespace
    @namespace ||= YARD::CodeObjects::ClassObject.new(YARD::Registry.root, :Fish)
  end
end
