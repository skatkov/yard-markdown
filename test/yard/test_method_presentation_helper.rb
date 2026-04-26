# frozen_string_literal: true

require "test_helper"

class YARD::TestMethodPresentationHelper < Minitest::Test
  cover YARD::Markdown::MethodPresentationHelper

  MethodObject = Struct.new(:name_value, :parameters, keyword_init: true) do
    def name(_full = false)
      name_value
    end
  end

  AttributeObject = Struct.new(:attr_info, :reader_value, :writer_value, keyword_init: true) do
    def reader?
      reader_value
    end

    def writer?
      writer_value
    end
  end

  def test_method_signature_and_heading_handle_nil_defaults_and_operator_spacing
    assert_equal "()", helper.method_signature(MethodObject.new(parameters: nil))
    assert_equal "(name, limit = 10)", helper.method_signature(MethodObject.new(parameters: [["name", nil], ["limit", "10"]]))
    assert_equal "(name)", helper.method_signature(MethodObject.new(parameters: [["name", ""]]))
    assert_equal "[] (index)", helper.formatted_method_heading(MethodObject.new(name_value: "[]", parameters: [["index", nil]]))
    assert_equal "call(index)", helper.formatted_method_heading(MethodObject.new(name_value: "call", parameters: [["index", nil]]))
  end

  def test_attribute_access_prefers_attr_info_over_reader_writer_predicates
    assert_equal "RW", helper.attribute_access(AttributeObject.new(attr_info: {read: true, write: true}, reader_value: false, writer_value: false))
    assert_equal "W", helper.attribute_access(AttributeObject.new(attr_info: {read: false, write: true}, reader_value: false, writer_value: false))
    assert_equal "R", helper.attribute_access(AttributeObject.new(attr_info: {read: true}, reader_value: false, writer_value: false))
    assert_equal "R", helper.attribute_access(AttributeObject.new(attr_info: {read: true, write: false}, reader_value: false, writer_value: false))
    assert_equal "W", helper.attribute_access(AttributeObject.new(attr_info: {write: true}, reader_value: true, writer_value: false))
    assert_equal "R", helper.attribute_access(AttributeObject.new(attr_info: {write: false}, reader_value: true, writer_value: false))
  end

  def test_attribute_access_falls_back_to_reader_writer_predicates
    assert_equal "RW", helper.attribute_access(AttributeObject.new(attr_info: nil, reader_value: true, writer_value: true))
    assert_equal "R", helper.attribute_access(AttributeObject.new(attr_info: nil, reader_value: true, writer_value: false))
    assert_equal "W", helper.attribute_access(AttributeObject.new(attr_info: nil, reader_value: false, writer_value: true))
    assert_equal "W", helper.attribute_access(AttributeObject.new(attr_info: nil, reader_value: false, writer_value: false))
  end

  private

  def helper
    @helper ||= Class.new do
      include YARD::Markdown::MethodPresentationHelper
    end.new
  end
end
