# frozen_string_literal: true

require "test_helper"

class YARD::TestCollectionRenderingHelper < Minitest::Test
  cover YARD::Markdown::CollectionRenderingHelper

  def test_render_constants_handle_grouping_sorting_and_spacing
    parse_example_yard
    output = helper.render_constants([YARD::Registry.at("Salmon::MAX_SPEED")], ["Salmon specific attributes"])

    assert_match(/^## Constants\n### Salmon specific attributes\n#### `MAX_SPEED` /, output)
    assert_includes output, "**@return** [Integer] Maximum speed for a swimming salmon"

    parse_source(<<~RUBY)
      class Salmon
        BETA = 2
        ALPHA = 1
      end
    RUBY
    output = helper.render_constants([YARD::Registry.at("Salmon::BETA"), YARD::Registry.at("Salmon::ALPHA")], [])

    assert_includes output, <<~MARKDOWN.chomp
      ### `ALPHA` <a id="constant-ALPHA"></a> <a id="ALPHA-constant"></a>
      Not documented.

      ### `BETA` <a id="constant-BETA"></a> <a id="BETA-constant"></a>
    MARKDOWN

    parse_source(<<~RUBY)
      class Salmon
        # @!group Beta
        BETA = 2
        # @!endgroup

        # @!group Alpha
        ALPHA = 1
        # @!endgroup
      end
    RUBY
    output = helper.render_constants([YARD::Registry.at("Salmon::ALPHA"), YARD::Registry.at("Salmon::BETA")], ["Beta", "Alpha"])

    assert_true output.index("### Beta") < output.index("### Alpha")

    parse_source(<<~RUBY)
      class Salmon
        # @!group Named
        BETA = 2
        # @!endgroup

        ALPHA = 1
      end
    RUBY
    output = helper.render_constants([YARD::Registry.at("Salmon::ALPHA"), YARD::Registry.at("Salmon::BETA")], ["Named"])

    assert_includes output, "### Named"
    assert_includes output, "### General"

    parse_source(<<~RUBY)
      class Salmon
        # Alpha documentation.
        # @return [Integer] alpha value
        ALPHA = 1
      end
    RUBY
    output = helper.render_constants([YARD::Registry.at("Salmon::ALPHA")], [])

    assert_includes output, <<~MARKDOWN.chomp
      ## Constants
      ### `ALPHA` <a id="constant-ALPHA"></a> <a id="ALPHA-constant"></a>
      Alpha documentation.
      - **@return** [Integer] alpha value
    MARKDOWN
  end

  def test_render_attributes_handle_grouping_access_and_spacing
    parse_example_yard
    output = helper.render_attributes([YARD::Registry.at("Salmon#farmed"), YARD::Registry.at("Salmon#wild")], ["Salmon specific attributes"])

    assert_match(/^## Attributes\n### Salmon specific attributes\n#### `farmed` \[RW\] /, output)
    assert_match(/True for farmed salmon\n\n#### `wild` \[R\]/, output)

    parse_source(<<~RUBY)
      class Salmon
        attr_reader :alpha
      end
    RUBY
    output = helper.render_attributes([YARD::Registry.at("Salmon#alpha")], [])

    refute_includes output, "### General"

    parse_source(<<~RUBY)
      class Salmon
        # @!group Beta
        attr_reader :beta
        # @!endgroup

        # @!group Alpha
        attr_reader :alpha
        # @!endgroup
      end
    RUBY
    output = helper.render_attributes([YARD::Registry.at("Salmon#alpha"), YARD::Registry.at("Salmon#beta")], ["Beta", "Alpha"])

    assert_true output.index("### Beta") < output.index("### Alpha")

    parse_source(<<~RUBY)
      class Salmon
        # Alpha documentation.
        # @return [String] alpha
        attr_reader :alpha
      end
    RUBY
    output = helper.render_attributes([YARD::Registry.at("Salmon#alpha")], [])

    assert_includes output, <<~MARKDOWN.chomp
      ### `alpha` [R] <a id="attribute-i-alpha"></a> <a id="alpha-instance_method"></a>
      Alpha documentation.
      - **@return** [String] alpha
    MARKDOWN
  end

  def test_render_methods_handle_grouping_docs_and_spacing
    parse_example_yard
    output = helper.render_methods("Public Instance Methods", [YARD::Registry.at("Salmon#make_sound"), YARD::Registry.at("Salmon#sustainable?")], ["Fish overrides"])

    assert_includes output, "#### `sustainable?()`"
    assert_match(/^## Public Instance Methods\n### Fish overrides\n#### `make_sound\(\)` /, output)
    assert_includes output, "- **@yield** [sound] The sound produced by the salmon"
    assert_includes output, "- **@yieldparam** `sound` [String] The actual sound"
    assert_includes output, <<~MARKDOWN.chomp
      #### `make_sound()` <a id="method-i-make_sound"></a> <a id="make_sound-instance_method"></a>
      Salmon overrides generic implementation.
      - **@return** [void]
    MARKDOWN
    parse_source(<<~RUBY)
      class Salmon
        # @!group Named
        def alpha
        end

        def beta
        end
        # @!endgroup
      end
    RUBY
    output = helper.render_methods("Public Instance Methods", [YARD::Registry.at("Salmon#alpha"), YARD::Registry.at("Salmon#beta")], ["Named"])

    assert_includes output, <<~MARKDOWN.chomp
      #### `alpha()` <a id="method-i-alpha"></a> <a id="alpha-instance_method"></a>
      Not documented.

      #### `beta()` <a id="method-i-beta"></a> <a id="beta-instance_method"></a>
    MARKDOWN

    parse_source(<<~RUBY)
      class Salmon
        # @!group Beta
        def beta
        end
        # @!endgroup

        # @!group Alpha
        def alpha
        end
        # @!endgroup
      end
    RUBY
    output = helper.render_methods("Public Instance Methods", [YARD::Registry.at("Salmon#alpha"), YARD::Registry.at("Salmon#beta")], ["Beta", "Alpha"])

    assert_true output.index("### Beta") < output.index("### Alpha")
  end

  def test_render_methods_preserves_keyword_defaults_in_headings
    parse_source(<<~RUBY)
      class HttpClient
        # Creates an HTTP client.
        def initialize(open_timeout: nil, read_timeout: nil); end
      end
    RUBY

    output = helper.render_methods("Public Instance Methods", [YARD::Registry.at("HttpClient#initialize")], [])

    assert_includes output, <<~MARKDOWN.chomp
      ### `initialize(open_timeout: nil, read_timeout: nil)` <a id="method-i-initialize"></a> <a id="initialize-instance_method"></a>
      Creates an HTTP client.
    MARKDOWN
  end

  def test_render_methods_lists_only_rendered_aliases_between_heading_and_body
    parse_source(<<~RUBY)
      class Dictionary
        # @!group Lookup
        # Checks a key.
        def key?(key); end
        alias has_key? key?
        alias_method :include?, :key?
        alias hidden key?
        # @!endgroup

        # Loads a value.
        def self.load; end
        class << self
          alias restore load
        end
      end
    RUBY
    methods = %w[key? has_key? include?].map { |name| YARD::Registry.at("Dictionary##{name}") }
    output = helper.render_methods("Public Instance Methods", methods, ["Lookup"])

    assert_includes output, <<~MARKDOWN.chomp
      #### `key?(key)` <a id="method-i-key-3F"></a> <a id="key?-instance_method"></a>
      Also known as: [`has_key?`](#method-i-has_key-3F), [`include?`](#method-i-include-3F)

      Checks a key.
      - **@return** [Boolean]
    MARKDOWN
    assert_equal 1, output.scan("Also known as:").length
    refute_includes output, "hidden"
    assert_includes output, "### Lookup"

    methods = %w[load restore].map { |name| YARD::Registry.at("Dictionary.#{name}") }
    output = helper.render_methods("Public Class Methods", methods, [])

    assert_includes output, <<~MARKDOWN.chomp
      ### `load()` <a id="method-c-load"></a> <a id="load-class_method"></a>
      Also known as: [`restore`](#method-c-restore)

      Loads a value.
    MARKDOWN
  end

  def test_render_methods_preserves_alias_documentation_and_tags
    parse_source(<<~RUBY)
      class Fish
        # Swims upstream.
        # @return [String] direction
        def swim; end
        # Uses the same route.
        alias paddle swim
      end
    RUBY
    methods = %w[swim paddle].map { |name| YARD::Registry.at("Fish##{name}") }
    output = helper.render_methods("Public Instance Methods", methods, [])

    assert_includes output, <<~MARKDOWN.chomp
      ### `paddle()` <a id="method-i-paddle"></a> <a id="paddle-instance_method"></a>
      Swims upstream. Uses the same route.
      - **@return** [String] direction
    MARKDOWN
    refute_includes output, "Alias for:"
  end

  def test_render_methods_links_undocumented_aliases_only_to_rendered_same_scope_targets
    parse_source(<<~RUBY)
      class Fish
        def other; end
        def swim; end
        def self.swim; end
        alias paddle swim
      end
    RUBY
    target = YARD::Registry.at("Fish#swim")
    aka = YARD::Registry.at("Fish#paddle")
    other_scope = YARD::Registry.at("Fish.swim")
    other_name = YARD::Registry.at("Fish#other")
    output = helper.render_methods("Public Instance Methods", [other_scope, other_name, target, aka], [])

    assert_includes output, "Alias for: [`swim`](#method-i-swim)"

    output = helper.render_methods("Public Instance Methods", [other_scope, aka], [])

    assert_includes output, "Alias for: `swim`"
    refute_includes output, "Alias for: [`swim`]"
    refute_includes output, "Also known as:"
  end

  private

  def helper
    @helper ||= Class.new do
      include YARD::Markdown::CollectionRenderingHelper
      include YARD::Markdown::DocumentationHelper
      include YARD::Markdown::HeadingHelper
    end.new
  end

  def parse_example_yard
    YARD::Registry.clear
    YARD.parse("example_yard.rb")
  end

  def parse_source(source)
    YARD::Registry.clear
    YARD.parse_string(source)
  end
end
