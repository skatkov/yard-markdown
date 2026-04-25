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
    assert helper.unresolved_identifier_target?('a')
    assert helper.unresolved_identifier_target?('memoized')
    assert helper.unresolved_identifier_target?('./memoized')
    assert helper.unresolved_identifier_target?('../memoized')
    assert helper.unresolved_identifier_target?('../../memoized')
    assert helper.unresolved_identifier_target?(':memoized')
    assert helper.unresolved_identifier_target?('1memoized')
    refute helper.unresolved_identifier_target?('Memoized')
    refute helper.unresolved_identifier_target?('path/to/file')
    refute helper.unresolved_identifier_target?('memoized.rb')
  end

  def test_relative_output_path_keeps_existing_parent_relative_paths
    assert_equal '../Fish.md', helper.relative_output_path(Pathname.new('docs'), Pathname.new('../Fish.md'))
  end

  def test_relative_output_path_falls_back_to_target_when_relative_conversion_raises
    assert_equal 'Fish.md', helper.relative_output_path(Pathname.new('/docs'), Pathname.new('Fish.md'))
  end

  def test_normalize_malformed_local_links_replaces_quoted_targets_with_code
    assert_equal '`label`', helper.normalize_malformed_local_links('[label](broken"link)')
  end

  def test_normalize_malformed_local_links_replaces_all_matches_and_handles_quotes_at_edges
    input = ['[middle](broken"link)', '[leading]("broken)', '[trailing](broken")'].join(' ')

    assert_equal '`middle` `leading` `trailing`', helper.normalize_malformed_local_links(input)
  end

  def test_normalize_malformed_local_links_leaves_external_and_anchor_links_unchanged
    input = [
      '[http](http://example.com"bad)',
      '[https](https://example.com"bad)',
      '[mail](mailto:test@example.com"bad)',
      '[section](#overview"bad)'
    ].join("\n")

    assert_equal input, helper.normalize_malformed_local_links(input)
  end

  def test_resolve_registry_object_finds_current_namespace_constants
    YARD::Registry.clear
    YARD.parse_string("module Ocean\n  class Salmon\n  end\nend\n")

    assert_equal 'Ocean::Salmon', helper.resolve_registry_object('Salmon', Pathname.new('Ocean')).path
    assert_equal 'Ocean::Salmon', helper.resolve_registry_object('Ocean/Salmon', Pathname.new('.')).path
    assert_equal 'Ocean::Salmon', helper.resolve_registry_object('Salmon', Pathname.new('./Ocean')).path
    assert_equal 'Ocean::Salmon', helper.resolve_registry_object('Salmon', Pathname.new('/Ocean')).path
  end

  def test_resolve_registry_object_normalizes_relative_constant_paths
    YARD::Registry.clear
    YARD.parse_string("module Ocean\n  module Deep\n  end\n  class Salmon\n  end\nend\n")

    assert_equal 'Ocean::Salmon', helper.resolve_registry_object('./Salmon', Pathname.new('Ocean')).path
    assert_equal 'Ocean::Salmon', helper.resolve_registry_object('../Salmon', Pathname.new('Ocean/Deep')).path
    assert_equal 'Ocean::Salmon', helper.resolve_registry_object('../../Salmon', Pathname.new('Ocean/Deep/Deeper')).path
  end

  def test_resolve_registry_object_keeps_direct_registry_paths
    YARD::Registry.clear
    YARD.parse_string("class Fish\n  def swim\n  end\nend\n")

    assert_equal 'Fish#swim', helper.resolve_registry_object('Fish#swim', Pathname.new('.')).path
  end

  def test_resolve_registry_object_ignores_root_objects
    YARD::Registry.clear
    YARD.parse_string("class Fish\nend\n")

    assert_nil helper.resolve_registry_object('', Pathname.new('.'))
    assert_nil helper.resolve_registry_object('root', Pathname.new('.'))
  end

  def test_resolve_registry_object_does_not_namespace_expand_non_constant_paths
    YARD::Registry.clear
    YARD.parse_string("module Ocean\n  class Fish\n    def swim\n    end\n  end\nend\n")

    assert_nil helper.resolve_registry_object('Fish#swim', Pathname.new('Ocean'))
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

  def test_resolve_local_link_target_normalizes_dot_segments_in_paths
    assert_equal 'Fish.md', helper.resolve_local_link_target('docs/../Fish.html', Pathname.new('.'))
  end

  def test_resolve_local_link_target_normalizes_dot_segments_for_non_html_paths
    assert_equal 'Fish.txt', helper.resolve_local_link_target('docs/../Fish.txt', Pathname.new('.'))
  end

  def test_resolve_local_link_target_makes_paths_relative_to_current_dir
    assert_equal '../docs/Fish.md', helper.resolve_local_link_target('docs/Fish.html', Pathname.new('guides'))
  end

  def test_resolve_local_link_target_rewrites_html_case_insensitively
    assert_equal 'docs/Fish.md', helper.resolve_local_link_target('docs/Fish.HTML', Pathname.new('.'))
  end

  def test_resolve_local_link_target_strips_leading_dot_slash
    assert_equal 'docs/Fish.md', helper.resolve_local_link_target('./docs/Fish.html', Pathname.new('.'))
  end

  def test_resolve_local_link_target_strips_leading_slash
    assert_equal 'docs/Fish.md', helper.resolve_local_link_target('/docs/Fish.html', Pathname.new('.'))
  end

  def test_resolve_local_link_target_strips_multiple_leading_slashes
    assert_equal 'docs/Fish.md', helper.resolve_local_link_target('//docs/Fish.html', Pathname.new('.'))
  end

  def test_resolve_local_link_target_drops_unresolved_identifiers
    assert_nil helper.resolve_local_link_target('memoized', Pathname.new('.'))
  end

  def test_resolve_local_link_target_appends_markdown_extension_for_nested_extensionless_paths
    assert_equal 'docs/Fish.md', helper.resolve_local_link_target('docs/Fish', Pathname.new('.'))
  end

  def test_resolve_local_link_target_keeps_bare_non_identifier_targets_without_extension
    assert_equal 'README', helper.resolve_local_link_target('README', Pathname.new('.'))
  end

  def test_resolve_local_link_target_preserves_non_html_extensions
    assert_equal 'docs/Fish.txt', helper.resolve_local_link_target('docs/Fish.txt', Pathname.new('.'))
  end

  def test_finalize_markdown_rewrites_local_links_and_normalizes_spacing
    YARD::Registry.clear
    YARD.parse_string("class Fish\nend\n")
    helper.options = Options.new(serializer: Serializer.new(mapping: {'Fish' => 'Fish.md'}))

    input = ["Line 1  ", '', '', '[Fish](Fish)', '[bad](memoized)', '[quoted](broken"link)']

    assert_equal "Line 1\n\n[Fish](../Fish.md)\n`bad`\n`quoted`\n", helper.finalize_markdown(input, 'docs/current.md')
  end

  def test_finalize_markdown_accepts_string_input
    helper.options = Options.new(serializer: Serializer.new(mapping: {}))

    assert_equal "Line 1\n", helper.finalize_markdown("Line 1", 'docs/current.md')
  end

  def test_normalize_local_links_leaves_external_and_anchor_links_unchanged
    input = [
      '[http](http://example.com)',
      '[https](https://example.com)',
      '[mail](mailto:test@example.com)',
      '[section](#overview)'
    ].join("\n")

    assert_equal input, helper.normalize_local_links(input, 'docs/current.md')
  end

  def test_normalize_local_links_rewrites_local_targets_and_preserves_suffixes
    YARD::Registry.clear
    YARD.parse_string("class Fish\nend\n")
    helper.options = Options.new(serializer: Serializer.new(mapping: {'Fish' => 'Fish.md'}))

    input = [
      '[See fish](Fish?view=full#overview)',
      '[Empty query](Fish?)',
      '[Empty fragment](Fish#)'
    ].join("\n")

    assert_equal [
      '[See fish](../Fish.md?view=full#overview)',
      '[Empty query](../Fish.md?)',
      '[Empty fragment](../Fish.md#)'
    ].join("\n"), helper.normalize_local_links(input, 'docs/current.md')
  end

  def test_normalize_local_links_strips_backticks_from_unresolved_labels
    assert_equal '`bad`', helper.normalize_local_links('[`bad`](memoized)', 'docs/current.md')
  end

  def test_finalize_markdown_trims_edges_and_collapses_all_excess_blank_lines
    helper.options = Options.new(serializer: Serializer.new(mapping: {}))

    input = ['', '', 'Line 1', '', '', '', 'Line 2', '', '', '', 'Line 3', '', '']

    assert_equal "Line 1\n\nLine 2\n\nLine 3\n", helper.finalize_markdown(input, 'docs/current.md')
  end

  private

  def helper
    @helper ||= Class.new do
      include YARD::Markdown::LinkNormalizationHelper
      attr_accessor :options
    end.new
  end
end
