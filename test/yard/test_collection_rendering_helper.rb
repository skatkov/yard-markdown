# frozen_string_literal: true

require "test_helper"

class YARD::TestCollectionRenderingHelper < Minitest::Test
  cover YARD::Markdown::CollectionRenderingHelper

  def test_render_constants_renders_group_headings_and_tags
    YARD::Registry.clear
    YARD.parse("example_yard.rb")

    constant = YARD::Registry.at("Salmon::MAX_SPEED")
    output = helper.render_constants([constant], ["Salmon specific attributes"])

    assert_includes output, "## Constants"
    assert_includes output, "### Salmon specific attributes"
    assert_includes output, "#### `MAX_SPEED`"
    assert_match(/^## Constants\n### Salmon specific attributes\n#### `MAX_SPEED` /, output)
    assert_includes output, "**@return** [Integer] Maximum speed for a swimming salmon"
  end

  def test_render_constants_sorts_items_by_name
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Salmon
        BETA = 2
        ALPHA = 1
      end
    RUBY

    constants = [YARD::Registry.at("Salmon::BETA"), YARD::Registry.at("Salmon::ALPHA")]
    output = helper.render_constants(constants, [])

    assert output.index("### `ALPHA`") < output.index("### `BETA`")
    assert_includes output, <<~MARKDOWN.chomp
      ### `ALPHA` <a id="constant-ALPHA"></a> <a id="ALPHA-constant"></a>
      Not documented.

      ### `BETA` <a id="constant-BETA"></a> <a id="BETA-constant"></a>
    MARKDOWN
  end

  def test_renderers_honor_explicit_group_order
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Salmon
        # @!group Beta
        BETA = 2
        # @!endgroup

        # @!group Alpha
        ALPHA = 1
        # @!endgroup
      end
    RUBY

    assert helper.render_constants([YARD::Registry.at("Salmon::ALPHA"), YARD::Registry.at("Salmon::BETA")], ["Beta", "Alpha"]).index("### Beta") <
      helper.render_constants([YARD::Registry.at("Salmon::ALPHA"), YARD::Registry.at("Salmon::BETA")], ["Beta", "Alpha"]).index("### Alpha")

    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Salmon
        # @!group Beta
        attr_reader :beta
        # @!endgroup

        # @!group Alpha
        attr_reader :alpha
        # @!endgroup
      end
    RUBY

    assert helper.render_attributes([YARD::Registry.at("Salmon#alpha"), YARD::Registry.at("Salmon#beta")], ["Beta", "Alpha"]).index("### Beta") <
      helper.render_attributes([YARD::Registry.at("Salmon#alpha"), YARD::Registry.at("Salmon#beta")], ["Beta", "Alpha"]).index("### Alpha")

    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
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

    assert helper.render_methods("Public Instance Methods", [YARD::Registry.at("Salmon#alpha"), YARD::Registry.at("Salmon#beta")], ["Beta", "Alpha"]).index("### Beta") <
      helper.render_methods("Public Instance Methods", [YARD::Registry.at("Salmon#alpha"), YARD::Registry.at("Salmon#beta")], ["Beta", "Alpha"]).index("### Alpha")
  end

  def test_renderers_use_general_heading_when_mixed_with_named_groups
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
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

    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Salmon
        # @!group Named
        attr_reader :beta
        # @!endgroup

        attr_reader :alpha
      end
    RUBY

    output = helper.render_attributes([YARD::Registry.at("Salmon#alpha"), YARD::Registry.at("Salmon#beta")], ["Named"])

    assert_includes output, "### Named"
    assert_includes output, "### General"

    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Salmon
        # @!group Named
        def beta
        end
        # @!endgroup

        def alpha
        end
      end
    RUBY

    output = helper.render_methods("Public Instance Methods", [YARD::Registry.at("Salmon#alpha"), YARD::Registry.at("Salmon#beta")], ["Named"])

    assert_includes output, "### Named"
    assert_includes output, "### General"
  end

  def test_render_constants_renders_docstrings_without_extra_spacing
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
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
    refute_includes output, <<~MARKDOWN.chomp
      ### `ALPHA` <a id="constant-ALPHA"></a> <a id="ALPHA-constant"></a>

      Alpha documentation.
    MARKDOWN
  end

  def test_render_attributes_renders_access_labels_and_docs
    YARD::Registry.clear
    YARD.parse("example_yard.rb")

    attrs = [YARD::Registry.at("Salmon#farmed"), YARD::Registry.at("Salmon#wild")]
    output = helper.render_attributes(attrs, ["Salmon specific attributes"])

    assert_includes output, "## Attributes"
    assert_includes output, "### Salmon specific attributes"
    assert_includes output, "#### `farmed` [RW]"
    assert_includes output, "#### `wild` [R]"
    assert_match(/^## Attributes\n### Salmon specific attributes\n#### `farmed` \[RW\] /, output)
    refute_includes output, "### Salmon specific attributes\n\n#### `farmed` [RW]"
    assert_match(/True for farmed salmon\n\n#### `wild` \[R\]/, output)
  end

  def test_renderers_omit_group_headings_when_all_items_are_ungrouped
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Salmon
        attr_reader :alpha
      end
    RUBY

    output = helper.render_attributes([YARD::Registry.at("Salmon#alpha")], [])

    refute_includes output, "### General"
    assert_includes output, "### `alpha` [R]"

    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Salmon
        def alpha
        end
      end
    RUBY

    output = helper.render_methods("Public Instance Methods", [YARD::Registry.at("Salmon#alpha")], [])

    refute_includes output, "### General"
    assert_includes output, "### `alpha()`"
  end

  def test_render_attributes_renders_docstrings_without_extra_spacing
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
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
    refute_includes output, <<~MARKDOWN.chomp
      ### `alpha` [R] <a id="attribute-i-alpha"></a> <a id="alpha-instance_method"></a>

      Alpha documentation.
    MARKDOWN
  end

  def test_render_methods_renders_grouped_method_sections
    YARD::Registry.clear
    YARD.parse("example_yard.rb")

    methods = [YARD::Registry.at("Salmon#make_sound"), YARD::Registry.at("Salmon#sustainable?")]
    output = helper.render_methods("Public Instance Methods", methods, ["Fish overrides"])

    assert_includes output, "## Public Instance Methods"
    assert_includes output, "### Fish overrides"
    assert_includes output, "#### `make_sound()`"
    assert_includes output, "#### `sustainable?()`"
    assert_match(/^## Public Instance Methods\n### Fish overrides\n#### `make_sound\(\)` /, output)
    assert_includes output, "- **@yield** [sound] The sound produced by the salmon"
    assert_includes output, "- **@yieldparam** `sound` [String] The actual sound"
    assert_includes output, <<~MARKDOWN.chomp
      #### `make_sound()` <a id="method-i-make_sound"></a> <a id="make_sound-instance_method"></a>
      Salmon overrides generic implementation.
      - **@return** [void]
    MARKDOWN
    refute_includes output, <<~MARKDOWN.chomp
      #### `make_sound()` <a id="method-i-make_sound"></a> <a id="make_sound-instance_method"></a>
      Salmon overrides generic implementation.

      - **@return** [void]
    MARKDOWN
  end

  def test_render_methods_separates_multiple_items_within_same_group
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Salmon
        # @!group Named
        def alpha
        end

        def beta
        end
        # @!endgroup
      end
    RUBY

    methods = [YARD::Registry.at("Salmon#alpha"), YARD::Registry.at("Salmon#beta")]
    output = helper.render_methods("Public Instance Methods", methods, ["Named"])

    assert_includes output, <<~MARKDOWN.chomp
      #### `alpha()` <a id="method-i-alpha"></a> <a id="alpha-instance_method"></a>
      Not documented.

      #### `beta()` <a id="method-i-beta"></a> <a id="beta-instance_method"></a>
    MARKDOWN
  end

  private

  def helper
    @helper ||= Class.new do
      include YARD::Markdown::AnchorComponentHelper
      include YARD::Markdown::ArefHelper
      include YARD::Markdown::CollectionRenderingHelper
      include YARD::Markdown::DocumentationHelper
      include YARD::Markdown::HeadingHelper
      include YARD::Markdown::MethodPresentationHelper
      include YARD::Markdown::SectionAssemblyHelper
      include YARD::Markdown::TagFormattingHelper
    end.new
  end
end
