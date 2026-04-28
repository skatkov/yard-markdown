# frozen_string_literal: true

require "test_helper"

class YARD::TestLinkNormalizationHelper < Minitest::Test
  cover YARD::Markdown::LinkNormalizationHelper

  class Serializer
    def initialize(mapping:)
      @mapping = mapping
    end

    def serialized_path(object)
      mapping.fetch(object.path)
    end

    private

    attr_reader :mapping
  end

  class Options
    def initialize(serializer:)
      @serializer = serializer
    end

    attr_reader :serializer
  end

  def test_link_path_helpers_classify_targets_and_compute_relative_paths
    assert helper.constant_reference_path?("A")
    assert helper.constant_reference_path?("RSpec::Core")
    assert helper.constant_reference_path?("::RSpec::Core")
    assert helper.constant_reference_path?("RSpec/Core")
    refute helper.constant_reference_path?("")
    refute helper.constant_reference_path?("RSpec::core")
    refute helper.constant_reference_path?("rspec/core")

    assert helper.unresolved_identifier_target?("a")
    assert helper.unresolved_identifier_target?("memoized")
    assert helper.unresolved_identifier_target?("./memoized")
    assert helper.unresolved_identifier_target?("../memoized")
    assert helper.unresolved_identifier_target?("../../memoized")
    assert helper.unresolved_identifier_target?(":memoized")
    assert helper.unresolved_identifier_target?("1memoized")
    refute helper.unresolved_identifier_target?("Memoized")
    refute helper.unresolved_identifier_target?("path/to/file")
    refute helper.unresolved_identifier_target?("memoized.rb")

    assert_equal "../Fish.md", helper.relative_output_path(Pathname.new("docs"), Pathname.new("../Fish.md"))
    assert_equal "Fish.md", helper.relative_output_path(Pathname.new("/docs"), Pathname.new("Fish.md"))
  end

  def test_normalize_malformed_local_links_rewrites_local_targets_and_ignores_external_links
    input = ['[middle](broken"link)', '[leading]("broken)', '[trailing](broken")'].join(" ")

    assert_equal "`middle` `leading` `trailing`", helper.normalize_malformed_local_links(input)

    input = [
      '[http](http://example.com"bad)',
      '[https](https://example.com"bad)',
      '[mail](mailto:test@example.com"bad)',
      '[section](#overview"bad)'
    ].join("\n")

    assert_equal input, helper.normalize_malformed_local_links(input)
  end

  def test_resolve_registry_object_finds_current_namespace_and_relative_constants
    YARD::Registry.clear
    YARD.parse_string("module Ocean\n  class Salmon\n  end\nend\n")

    assert_equal "Ocean::Salmon", helper.resolve_registry_object("Salmon", Pathname.new("Ocean")).path
    assert_equal "Ocean::Salmon", helper.resolve_registry_object("Ocean/Salmon", Pathname.new(".")).path
    assert_equal "Ocean::Salmon", helper.resolve_registry_object("Salmon", Pathname.new("./Ocean")).path
    assert_equal "Ocean::Salmon", helper.resolve_registry_object("Salmon", Pathname.new("/Ocean")).path

    YARD::Registry.clear
    YARD.parse_string("module Ocean\n  module Deep\n  end\n  class Salmon\n  end\nend\n")

    assert_equal "Ocean::Salmon", helper.resolve_registry_object("./Salmon", Pathname.new("Ocean")).path
    assert_equal "Ocean::Salmon", helper.resolve_registry_object("../Salmon", Pathname.new("Ocean/Deep")).path
    assert_equal "Ocean::Salmon", helper.resolve_registry_object("../../Salmon", Pathname.new("Ocean/Deep/Deeper")).path
  end

  def test_resolve_registry_object_handles_direct_paths_root_and_non_constant_targets
    YARD::Registry.clear
    YARD.parse_string("class Fish\n  def swim\n  end\nend\n")

    assert_equal "Fish#swim", helper.resolve_registry_object("Fish#swim", Pathname.new(".")).path

    assert_nil helper.resolve_registry_object("", Pathname.new("."))
    assert_nil helper.resolve_registry_object("root", Pathname.new("."))

    YARD::Registry.clear
    YARD.parse_string("module Ocean\n  class Fish\n    def swim\n    end\n  end\nend\n")

    assert_nil helper.resolve_registry_object("Fish#swim", Pathname.new("Ocean"))
  end

  def test_resolve_local_link_target_prefers_registry_objects_and_rewrites_paths
    YARD::Registry.clear
    YARD.parse_string("module Ocean\n  class Salmon\n  end\nend\n")

    helper.options = Options.new(serializer: Serializer.new(mapping: {"Ocean::Salmon" => "Ocean/Salmon.md"}))

    assert_equal "Salmon.md", helper.resolve_local_link_target("Salmon", Pathname.new("Ocean"))
    assert_equal "Fish.md", helper.resolve_local_link_target("docs/../Fish.html", Pathname.new("."))
    assert_equal "Fish.txt", helper.resolve_local_link_target("docs/../Fish.txt", Pathname.new("."))
    assert_equal "../docs/Fish.md", helper.resolve_local_link_target("docs/Fish.html", Pathname.new("guides"))
    assert_equal "docs/Fish.md", helper.resolve_local_link_target("docs/Fish.HTML", Pathname.new("."))
    assert_equal "docs/Fish.md", helper.resolve_local_link_target("./docs/Fish.html", Pathname.new("."))
    assert_equal "docs/Fish.md", helper.resolve_local_link_target("//docs/Fish.html", Pathname.new("."))
    assert_nil helper.resolve_local_link_target("memoized", Pathname.new("."))
    assert_equal "docs/Fish.md", helper.resolve_local_link_target("docs/Fish", Pathname.new("."))
    assert_equal "README", helper.resolve_local_link_target("README", Pathname.new("."))
  end

  def test_normalize_local_links_handles_external_targets_suffixes_and_unresolved_labels
    input = [
      "[http](http://example.com)",
      "[https](https://example.com)",
      "[mail](mailto:test@example.com)",
      "[section](#overview)"
    ].join("\n")

    assert_equal input, helper.normalize_local_links(input, "docs/current.md")

    YARD::Registry.clear
    YARD.parse_string("class Fish\nend\n")
    helper.options = Options.new(serializer: Serializer.new(mapping: {"Fish" => "Fish.md"}))

    input = [
      "[See fish](Fish?view=full#overview)",
      "[Empty query](Fish?)",
      "[Empty fragment](Fish#)"
    ].join("\n")

    assert_equal [
      "[See fish](../Fish.md?view=full#overview)",
      "[Empty query](../Fish.md?)",
      "[Empty fragment](../Fish.md#)"
    ].join("\n"), helper.normalize_local_links(input, "docs/current.md")

    assert_equal "`bad`", helper.normalize_local_links("[`bad`](memoized)", "docs/current.md")
  end

  def test_finalize_markdown_accepts_string_input_and_normalizes_links_and_spacing
    helper.options = Options.new(serializer: Serializer.new(mapping: {}))

    assert_equal "Line 1\n", helper.finalize_markdown("Line 1", "docs/current.md")

    YARD::Registry.clear
    YARD.parse_string("class Fish\nend\n")
    helper.options = Options.new(serializer: Serializer.new(mapping: {"Fish" => "Fish.md"}))

    input = ["Line 1  ", "", "", "[Fish](Fish)", "[bad](memoized)", '[quoted](broken"link)']

    assert_equal "Line 1\n\n[Fish](../Fish.md)\n`bad`\n`quoted`\n", helper.finalize_markdown(input, "docs/current.md")

    helper.options = Options.new(serializer: Serializer.new(mapping: {}))

    input = ["", "", "Line 1", "", "", "", "Line 2", "", "", "", "Line 3", "", ""]

    assert_equal "Line 1\n\nLine 2\n\nLine 3\n", helper.finalize_markdown(input, "docs/current.md")
  end

  private

  def helper
    @helper ||= Class.new do
      include YARD::Markdown::LinkNormalizationHelper

      attr_accessor :options
    end.new
  end
end
