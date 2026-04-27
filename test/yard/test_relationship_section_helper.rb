# frozen_string_literal: true

require "test_helper"

class YARD::TestRelationshipSectionHelper < Minitest::Test
  cover YARD::Markdown::RelationshipSectionHelper

  def test_render_section_content_normalizes_blank_string_and_non_string_input
    content = Class.new do
      def to_s
        "hello"
      end
    end.new

    assert_equal "hello\n\n", helper.render_section_content("  hello\n")
    assert_equal "", helper.render_section_content(" \n")
    assert_equal "hello\n\n", helper.render_section_content(content)
  end

  def test_object_relationships_handle_class_and_module_variants
    parse_source(<<~RUBY)
      module Zebra
      end

      module Alpha
      end

      class Fish
      end

      class Salmon < Fish
        extend Zebra
        extend Alpha
        include Zebra
        include Alpha
      end
    RUBY

    assert_equal(
      "**Inherits:** `Fish`\n**Extended by:** `Alpha`, `Zebra`\n**Includes:** `Alpha`, `Zebra`",
      helper.object_relationships(YARD::Registry.at("Salmon"))
    )

    parse_source(<<~RUBY)
      module Zebra
      end

      module Alpha
      end

      class Salmon
        extend Zebra
        include Alpha
      end
    RUBY

    assert_equal(
      "**Inherits:** `Object`\n**Extended by:** `Zebra`\n**Includes:** `Alpha`",
      helper.object_relationships(YARD::Registry.at("Salmon"))
    )

    parse_source(<<~RUBY)
      module Zebra
      end

      module Alpha
      end

      module Salmon
        extend Zebra
        include Alpha
      end
    RUBY

    assert_equal(
      "**Extended by:** `Zebra`\n**Includes:** `Alpha`",
      helper.object_relationships(YARD::Registry.at("Salmon"))
    )

    parse_source(<<~RUBY)
      module Alpha
      end

      class Fish
      end

      class Salmon < Fish
        include Alpha
      end
    RUBY

    assert_equal(
      "**Inherits:** `Fish`\n**Includes:** `Alpha`",
      helper.object_relationships(YARD::Registry.at("Salmon"))
    )
  end

  def test_object_relationships_honor_verifier_and_sort_mixins_by_path
    parse_source(<<~RUBY)
      module Zebra
      end

      module Alpha
      end

      class Fish
      end

      class Salmon < Fish
        extend Zebra
        extend Alpha
        include Zebra
        include Alpha
      end
    RUBY

    filtered_helper = Class.new do
      include YARD::Markdown::RelationshipSectionHelper

      def run_verifier(items)
        items.reject { |item| item.path == "Zebra" }
      end
    end.new

    assert_equal(
      "**Inherits:** `Fish`\n**Extended by:** `Alpha`\n**Includes:** `Alpha`",
      filtered_helper.object_relationships(YARD::Registry.at("Salmon"))
    )

    parse_source(<<~RUBY)
      module Zebra
      end

      module Alpha
      end

      class Fish
      end

      class Salmon < Fish
        extend Zebra
        extend Alpha
      end
    RUBY

    sortable_mixin_class = Struct.new(:path) do
      include Comparable

      def <=>(other)
        other.path <=> path
      end
    end

    sortable_helper = Class.new do
      include YARD::Markdown::RelationshipSectionHelper
    end.new

    sortable_helper.define_singleton_method(:run_verifier) do |items|
      items.map { |item| sortable_mixin_class.new(item.path) }
    end

    assert_equal(
      "**Inherits:** `Fish`\n**Extended by:** `Alpha`, `Zebra`",
      sortable_helper.object_relationships(YARD::Registry.at("Salmon"))
    )
  end

  private

  def helper
    @helper ||= Class.new do
      include YARD::Markdown::RelationshipSectionHelper

      def run_verifier(items)
        items
      end
    end.new
  end

  def parse_source(source)
    YARD::Registry.clear
    YARD.parse_string(source)
  end
end
