# frozen_string_literal: true

require 'test_helper'

class YARD::TestRelationshipSectionHelper < Minitest::Test
  cover YARD::Markdown::RelationshipSectionHelper

  def test_render_section_content_trims_and_terminates_content
    assert_equal "hello\n\n", helper.render_section_content("  hello\n")
  end

  def test_render_section_content_skips_blank_content
    assert_equal '', helper.render_section_content(" \n")
  end

  def test_object_relationships_renders_inheritance_and_sorted_mixins
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
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
      helper.object_relationships(YARD::Registry.at('Salmon'))
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
end
