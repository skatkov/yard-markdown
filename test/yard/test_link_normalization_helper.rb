# frozen_string_literal: true

require 'test_helper'
require 'pathname'

class YARD::TestLinkNormalizationHelper < Minitest::Test
  cover YARD::Markdown::LinkNormalizationHelper

  Serializer = Struct.new(:mapping, keyword_init: true) do
    def serialized_path(object)
      mapping.fetch(object.path)
    end
  end

  Options = Struct.new(:serializer, keyword_init: true)

  def test_constant_reference_path_recognizes_namespaced_constants
    assert helper.constant_reference_path?('A')
    assert helper.constant_reference_path?('RSpec::Core')
    assert helper.constant_reference_path?('::RSpec::Core')
    assert helper.constant_reference_path?('RSpec/Core')
    refute helper.constant_reference_path?('')
    refute helper.constant_reference_path?('RSpec::core')
    refute helper.constant_reference_path?('rspec/core')
  end

  def test_unresolved_identifier_target_recognizes_bare_local_identifiers
    assert helper.unresolved_identifier_target?('memoized')
    refute helper.unresolved_identifier_target?('Memoized')
    refute helper.unresolved_identifier_target?('path/to/file')
  end

  def test_relative_output_path_keeps_existing_parent_relative_paths
    assert_equal '../Fish.md', helper.relative_output_path(Pathname.new('docs'), Pathname.new('../Fish.md'))
  end

  def test_normalize_malformed_local_links_replaces_quoted_targets_with_code
    assert_equal '`label`', helper.normalize_malformed_local_links('[label](broken"link)')
  end

  def test_resolve_registry_object_finds_current_namespace_constants
    YARD::Registry.clear
    YARD.parse_string("module Ocean\n  class Salmon\n  end\nend\n")

    assert_equal 'Ocean::Salmon', helper.resolve_registry_object('Salmon', Pathname.new('Ocean')).path
  end

  def test_resolve_local_link_target_prefers_registry_objects
    YARD::Registry.clear
    YARD.parse_string("module Ocean\n  class Salmon\n  end\nend\n")

    helper.options = Options.new(serializer: Serializer.new(mapping: {'Ocean::Salmon' => 'Ocean/Salmon.md'}))

    assert_equal 'Salmon.md', helper.resolve_local_link_target('Salmon', Pathname.new('Ocean'))
  end

  def test_resolve_local_link_target_rewrites_html_and_relative_paths
    assert_equal 'docs/Fish.md', helper.resolve_local_link_target('docs/Fish.html', Pathname.new('.'))
  end

  def test_resolve_local_link_target_drops_unresolved_identifiers
    assert_nil helper.resolve_local_link_target('memoized', Pathname.new('.'))
  end

  def test_finalize_markdown_rewrites_local_links_and_normalizes_spacing
    YARD::Registry.clear
    YARD.parse_string("class Fish\nend\n")
    helper.options = Options.new(serializer: Serializer.new(mapping: {'Fish' => 'Fish.md'}))

    input = ["Line 1  ", '', '', '[Fish](Fish)', '[bad](memoized)']

    assert_equal "Line 1\n\n[Fish](../Fish.md)\n`bad`\n", helper.finalize_markdown(input, 'docs/current.md')
  end

  def test_finalize_markdown_accepts_string_input
    helper.options = Options.new(serializer: Serializer.new(mapping: {}))

    assert_equal "Line 1\n", helper.finalize_markdown("Line 1", 'docs/current.md')
  end

  private

  def helper
    @helper ||= Class.new do
      include YARD::Markdown::LinkNormalizationHelper
      attr_accessor :options
    end.new
  end
end
