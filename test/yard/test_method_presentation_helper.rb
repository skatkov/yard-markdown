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

  def test_method_signature_renders_empty_parameter_lists
    assert_equal "()", helper.method_signature(MethodObject.new(parameters: []))
  end

  def test_method_signature_renders_nil_parameter_lists
    assert_equal "()", helper.method_signature(MethodObject.new(parameters: nil))
  end

  def test_method_signature_renders_defaults
    method_object = MethodObject.new(parameters: [["name", nil], ["limit", "10"]])

    assert_equal "(name, limit = 10)", helper.method_signature(method_object)
  end

  def test_method_signature_treats_empty_defaults_as_missing
    method_object = MethodObject.new(parameters: [["name", ""]])

    assert_equal "(name)", helper.method_signature(method_object)
  end

  def test_formatted_method_heading_preserves_operator_spacing_for_index_methods
    method_object = MethodObject.new(name_value: "[]", parameters: [["index", nil]])

    assert_equal "[] (index)", helper.formatted_method_heading(method_object)
  end

  def test_formatted_method_heading_keeps_regular_method_signatures_tight
    method_object = MethodObject.new(name_value: "call", parameters: [["index", nil]])

    assert_equal "call(index)", helper.formatted_method_heading(method_object)
  end

  def test_attribute_access_prefers_attr_info_when_available
    attribute = AttributeObject.new(attr_info: {read: true, write: true}, reader_value: false, writer_value: false)

    assert_equal "RW", helper.attribute_access(attribute)
  end

  def test_attribute_access_handles_write_only_attr_info
    attribute = AttributeObject.new(attr_info: {write: true}, reader_value: false, writer_value: false)

    assert_equal "W", helper.attribute_access(attribute)
  end

  def test_attribute_access_handles_read_only_attr_info
    attribute = AttributeObject.new(attr_info: {read: true}, reader_value: false, writer_value: false)

    assert_equal "R", helper.attribute_access(attribute)
  end

  def test_attribute_access_does_not_treat_false_read_flags_as_readable
    attribute = AttributeObject.new(attr_info: {read: false, write: true}, reader_value: false, writer_value: false)

    assert_equal "W", helper.attribute_access(attribute)
  end

  def test_attribute_access_does_not_treat_false_write_flags_as_writable
    attribute = AttributeObject.new(attr_info: {read: true, write: false}, reader_value: false, writer_value: false)

    assert_equal "R", helper.attribute_access(attribute)
  end

  def test_attribute_access_prefers_write_only_attr_info_over_reader_predicates
    attribute = AttributeObject.new(attr_info: {write: true}, reader_value: true, writer_value: false)

    assert_equal "W", helper.attribute_access(attribute)
  end

  def test_attribute_access_does_not_treat_false_write_keys_as_writable
    attribute = AttributeObject.new(attr_info: {write: false}, reader_value: true, writer_value: false)

    assert_equal "R", helper.attribute_access(attribute)
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
