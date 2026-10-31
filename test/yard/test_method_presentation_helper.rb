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

  def test_method_and_alias_signatures_preserve_parameters_and_declaration_scope
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      module HttpClient
        def unrelated(other); end
        def configure(value = nil, required:, enabled: false, label: "", limit: 10, **options, &block); end
        def self.configure(other); end
        alias [] configure
        alias_method :fetch, :[]
        class << self
          alias restore configure
        end
        alias paddle missing
        def swim; end
        alias float swim
        alias swim float
      end
      class Client
        extend HttpClient
      end
    RUBY

    parameters = '(value = nil, required:, enabled: false, label: "", limit: 10, **options, &block)'
    {
      "configure" => "configure#{parameters}",
      "[]" => "[] #{parameters}",
      "fetch" => "fetch#{parameters}",
      "paddle" => "paddle()",
      "swim" => "swim()"
    }.each do |name, heading|
      assert_equal heading, YARD::Markdown::MethodPresentationHelper.formatted_method_heading(YARD::Registry.at("HttpClient##{name}"))
    end
    assert_equal "restore(other)", YARD::Markdown::MethodPresentationHelper.formatted_method_heading(YARD::Registry.at("HttpClient.restore"))
    extended = YARD::Registry.at("Client").meths(scope: :class, inherited: false).find { |item| item.name == :fetch }
    assert_equal "fetch#{parameters}", YARD::Markdown::MethodPresentationHelper.formatted_method_heading(extended)
  end

  def test_attribute_access_reads_attr_info
    assert_equal "RW", YARD::Markdown::MethodPresentationHelper.attribute_access(parsed_attribute("attr_accessor :speed", "Fish#speed"))
    assert_equal "R", YARD::Markdown::MethodPresentationHelper.attribute_access(parsed_attribute("attr_reader :speed", "Fish#speed"))
    assert_equal "W", YARD::Markdown::MethodPresentationHelper.attribute_access(parsed_attribute("attr_writer :speed", "Fish#speed="))
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
