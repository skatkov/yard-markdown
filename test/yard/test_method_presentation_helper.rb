# frozen_string_literal: true

require "test_helper"

class YARD::TestMethodPresentationHelper < Minitest::Test
  cover YARD::Markdown::MethodPresentationHelper

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

  def test_alias_signatures_use_original_parameters_in_the_same_scope
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Dictionary
        def unrelated(other); end
        def lookup(key, default = nil, required:, enabled: true); end
        def self.lookup(value); end
        alias [] lookup
        alias_method :fetch, :[]
        class << self
          alias restore lookup
        end
      end
    RUBY

    assert_equal "[] (key, default = nil, required:, enabled: true)", YARD::Markdown::MethodPresentationHelper.formatted_method_heading(YARD::Registry.at("Dictionary#[]"))
    assert_equal "fetch(key, default = nil, required:, enabled: true)", YARD::Markdown::MethodPresentationHelper.formatted_method_heading(YARD::Registry.at("Dictionary#fetch"))
    assert_equal "restore(value)", YARD::Markdown::MethodPresentationHelper.formatted_method_heading(YARD::Registry.at("Dictionary.restore"))
  end

  def test_alias_signatures_handle_missing_targets_and_cycles
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Fish
        alias paddle missing
        def swim; end
        alias float swim
        alias swim float
      end
    RUBY

    assert_equal "paddle()", YARD::Markdown::MethodPresentationHelper.formatted_method_heading(YARD::Registry.at("Fish#paddle"))
    assert_equal "swim()", YARD::Markdown::MethodPresentationHelper.formatted_method_heading(YARD::Registry.at("Fish#swim"))
  end

  private

  def build_method(parameters:, name: "call")
    YARD::Registry.clear
    object = YARD::CodeObjects::MethodObject.new(YARD::Registry.root, name)
    object.parameters = parameters
    object
  end

  def parsed_attribute(source, path)
    YARD::Registry.clear
    YARD.parse_string("class Fish\n  #{source}\nend\n")
    YARD::Registry.at(path)
  end
end
