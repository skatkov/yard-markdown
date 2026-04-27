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

  def test_attribute_access_prefers_attr_info_over_reader_writer_predicates
    assert_equal "RW", helper.attribute_access(parsed_attribute("attr_accessor :speed", "Fish#speed"))
    assert_equal "W", helper.attribute_access(build_attribute(attr_info: {read: false, write: true}, reader: false, writer: false))
    assert_equal "R", helper.attribute_access(build_attribute(attr_info: {read: true}, reader: false, writer: false))
    assert_equal "R", helper.attribute_access(build_attribute(attr_info: {read: true, write: false}, reader: false, writer: false))
    assert_equal "W", helper.attribute_access(build_attribute(attr_info: {write: true}, reader: true, writer: false))
    assert_equal "R", helper.attribute_access(build_attribute(attr_info: {write: false}, reader: true, writer: false))
  end

  def test_attribute_access_falls_back_to_reader_writer_predicates
    assert_equal "RW", helper.attribute_access(build_attribute(attr_info: nil, reader: true, writer: true))
    assert_equal "R", helper.attribute_access(build_attribute(attr_info: nil, reader: true, writer: false))
    assert_equal "W", helper.attribute_access(build_attribute(attr_info: nil, reader: false, writer: true))
    assert_equal "W", helper.attribute_access(build_attribute(attr_info: nil, reader: false, writer: false))
  end

  private

  def helper
    @helper ||= Class.new do
      include YARD::Markdown::MethodPresentationHelper
    end.new
  end

  def build_method(name: "call", parameters:, string_name: false)
    method_object = YARD::CodeObjects::MethodObject.new(namespace, name.to_sym, :instance)
    method_object.parameters = parameters
    return method_object unless string_name

    method_object.define_singleton_method(:name) do |_full = false|
      name
    end
    method_object
  end

  def build_attribute(attr_info:, reader:, writer:)
    method_object = YARD::CodeObjects::MethodObject.new(namespace, :speed, :instance)
    mod = Module.new do
      define_method(:attr_info) { attr_info }
      define_method(:reader?) { reader }
      define_method(:writer?) { writer }
    end
    method_object.singleton_class.prepend(mod)
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
