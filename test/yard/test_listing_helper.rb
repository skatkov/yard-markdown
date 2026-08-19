# frozen_string_literal: true

require "test_helper"

class YARD::TestListingHelper < Minitest::Test
  cover YARD::Markdown::ObjectListingHelper

  def test_basic_listing_helpers_include_direct_members_and_sort_values
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      module Swimmer
        SPEED = 10
      end

      class Fish
        BASE_SPEED = 5
      end

      class Salmon < Fish
        include Swimmer
        MAX_SPEED = 20
        @@population = 1
      end
    RUBY

    assert_equal %w[Salmon::MAX_SPEED Salmon::@@population], YARD::Markdown::ObjectListingHelper.constant_listing(YARD::Registry.at("Salmon")).map(&:path)
    hidden = YARD::CodeObjects::ClassObject.new(YARD::Registry.root, :Hidden)
    hidden.docstring = "   :nodoc: hidden"
    visible = YARD::CodeObjects::ClassObject.new(YARD::Registry.root, :Visible)
    visible.docstring = "details :nodoc:"

    assert_true YARD::Markdown::ObjectListingHelper.hidden_object?(hidden)
    assert_false YARD::Markdown::ObjectListingHelper.hidden_object?(visible)
  end

  def test_public_method_lists_filter_sort_and_prune_members
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Fish
        def inherited_public
        end
      end

      class Salmon < Fish
        # :nodoc:
        def self.hidden
        end

        def self.spawn
        end

        attr_accessor :speed

        def zebra
        end

        def alpha
        end

        def swim
        end

        alias paddle swim

        # :nodoc:
        def sink
        end

        private

        def hidden_private
        end
      end
    RUBY

    object = YARD::Registry.at("Salmon")

    assert_equal ["Salmon.spawn"], template.public_class_methods(object).map(&:path)
    assert_equal ["Salmon#alpha", "Salmon#swim", "Salmon#zebra"], template.public_instance_methods(object).map(&:path)
  end

  def test_attr_listing_handles_direct_attributes_and_default_inheritance_rules
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Fish
        attr_reader :base_speed
      end

      class Salmon < Fish
        attr_accessor :beta
        attr_reader :alpha
        attr_reader :Zebra
        attr_writer :captured

        class << self
          attr_accessor :config
        end
      end
    RUBY

    assert_equal ["Salmon.config", "Salmon#alpha", "Salmon#beta", "Salmon#captured=", "Salmon#Zebra"], template.attr_listing(YARD::Registry.at("Salmon")).map(&:path)
  end

  def test_attr_listing_handles_embed_mixins_proxy_ancestors_and_pruned_entries
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      module Swimmer
        attr_reader :speed
      end

      module Floater
        attr_reader :depth
      end

      class Fish
        include Swimmer
        include Floater
      end
    RUBY

    mixin_template = build_template
    mixin_template.options.embed_mixins = ["Swimmer", "Floater"]

    assert_equal %i[depth speed], mixin_template.attr_listing(YARD::Registry.at("Fish")).map { |item| item.name(false) }

    YARD::Registry.clear
    YARD.parse_string("class Fish < MissingBase\n  attr_reader :speed\nend\n")

    mixin_template = build_template
    mixin_template.options.embed_mixins = ["MissingBase"]

    assert_equal [], mixin_template.attr_listing(YARD::Registry.at("Fish"))

    YARD::Registry.clear
    YARD.parse_string("class Fish\n  attr_reader :speed\nend\n")

    pruned_template = build_template
    def pruned_template.prune_method_listing(_list, _included = nil)
      []
    end

    assert_equal [], pruned_template.attr_listing(YARD::Registry.at("Fish"))
  end

  private

  def template
    @template ||= build_template
  end

  def build_template
    template = YARD::Templates::Engine.template(:default, :module, :markdown).new(
      format: :markdown,
      template: :default
    )
    template.options.embed_mixins = []
    template
  end
end
