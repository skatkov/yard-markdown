# frozen_string_literal: true

require "test_helper"

class YARD::TestMetadataSectionHelper < Minitest::Test
  cover YARD::Markdown::MetadataSectionHelper

  def test_object_metadata_handles_class_and_module_variants
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
      <<~MARKDOWN.strip,
        |  |  |
        | --- | --- |
        | **Inherits** | [Fish](Fish) |
        | **Extended by** | [Alpha](Alpha), [Zebra](Zebra) |
        | **Includes** | [Alpha](Alpha), [Zebra](Zebra) |
        | **Defined in** | (stdin) |
      MARKDOWN
      helper.object_metadata(YARD::Registry.at("Salmon"))
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
      <<~MARKDOWN.strip,
        |  |  |
        | --- | --- |
        | **Inherits** | Object |
        | **Extended by** | [Zebra](Zebra) |
        | **Includes** | [Alpha](Alpha) |
        | **Defined in** | (stdin) |
      MARKDOWN
      helper.object_metadata(YARD::Registry.at("Salmon"))
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
      <<~MARKDOWN.strip,
        |  |  |
        | --- | --- |
        | **Extended by** | [Zebra](Zebra) |
        | **Includes** | [Alpha](Alpha) |
        | **Defined in** | (stdin) |
      MARKDOWN
      helper.object_metadata(YARD::Registry.at("Salmon"))
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
      <<~MARKDOWN.strip,
        |  |  |
        | --- | --- |
        | **Inherits** | [Fish](Fish) |
        | **Includes** | [Alpha](Alpha) |
        | **Defined in** | (stdin) |
      MARKDOWN
      helper.object_metadata(YARD::Registry.at("Salmon"))
    )
  end

  def test_object_metadata_honors_verifier_and_sorts_mixins_by_path
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

    filtered_helper = Object.new.extend(YARD::Markdown::MetadataSectionHelper)
    filtered_helper.define_singleton_method(:run_verifier) do |items|
      items.reject { |item| item.path == "Zebra" }
    end

    assert_equal(
      <<~MARKDOWN.strip,
        |  |  |
        | --- | --- |
        | **Inherits** | [Fish](Fish) |
        | **Extended by** | [Alpha](Alpha) |
        | **Includes** | [Alpha](Alpha) |
        | **Defined in** | (stdin) |
      MARKDOWN
      filtered_helper.object_metadata(YARD::Registry.at("Salmon"))
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

    sortable_helper = Object.new.extend(YARD::Markdown::MetadataSectionHelper)
    sortable_mixin = Struct.new(:path) do
      def <=>(other)
        other.path <=> path
      end

      def to_s
        "not-the-path"
      end
    end
    sortable_helper.define_singleton_method(:run_verifier) { |items| items.map { |item| sortable_mixin.new(item.path) } }

    assert_equal(
      <<~MARKDOWN.strip,
        |  |  |
        | --- | --- |
        | **Inherits** | [Fish](Fish) |
        | **Extended by** | Alpha, Zebra |
        | **Defined in** | (stdin) |
      MARKDOWN
      sortable_helper.object_metadata(YARD::Registry.at("Salmon"))
    )
  end

  def test_object_metadata_escapes_unique_source_files_and_handles_empty_modules
    source_less = YARD::CodeObjects::ModuleObject.new(YARD::Registry.root, :SourceLess)

    assert_equal "", helper.object_metadata(source_less)

    source_less.add_file("lib/a  b|c.rb", 1)
    source_less.add_file("lib/a  b|c.rb", 2)
    source_less.add_file("lib/line\nbreak.rb", 3)

    assert_equal <<~'MARKDOWN'.strip, helper.object_metadata(source_less)
      |  |  |
      | --- | --- |
      | **Defined in** | lib/a  b\|c.rb, lib/line break.rb |
    MARKDOWN
    assert_equal 'a\\\\b', helper.metadata_table_cell("a\\b")
    assert_equal 'a\|b\|c', helper.metadata_table_cell("a|b|c")
    assert_equal "a b c", helper.metadata_table_cell("a\nb\nc")
  end

  def test_metadata_reference_does_not_link_unresolved_or_hidden_namespaces
    proxy = YARD::CodeObjects::Proxy.new(YARD::Registry.root, "External|Base")
    hidden = YARD::CodeObjects::ModuleObject.new(YARD::Registry.root, :Hidden)
    visible = YARD::CodeObjects::ModuleObject.new(YARD::Registry.root, :Visible)
    def visible.to_s = "not-the-path"

    hidden_helper = Object.new.extend(YARD::Markdown::MetadataSectionHelper)
    hidden_helper.define_singleton_method(:run_verifier) { |_items| [] }

    assert_equal 'External\|Base', helper.metadata_reference(proxy)
    assert_equal "Hidden", hidden_helper.metadata_reference(hidden)
    assert_equal "[Visible](Visible)", helper.metadata_reference(visible)
  end

  private

  def helper
    @helper ||= Object.new.extend(YARD::Markdown::MetadataSectionHelper).tap do |object|
      object.define_singleton_method(:run_verifier) { |items| items }
    end
  end

  def parse_source(source)
    YARD::Registry.clear
    YARD.parse_string(source)
  end
end
