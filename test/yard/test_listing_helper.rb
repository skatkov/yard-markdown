# frozen_string_literal: true

require 'test_helper'

class YARD::TestListingHelper < Minitest::Test
  cover YARD::Markdown::ObjectListingHelper

  DocstringObject = Struct.new(:docstring, keyword_init: true)
  ListObject = Struct.new(:scope, :name, keyword_init: true)

  def test_constant_listing_includes_constants_and_classvariables
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

    assert_equal %w[Salmon::MAX_SPEED Salmon::@@population], template.constant_listing(YARD::Registry.at('Salmon')).map(&:path)
  end

  def test_public_method_lists_filter_scope_and_hide_nodoc_members
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Salmon
        # :nodoc:
        def self.hidden
        end

        def self.spawn
        end

        # :nodoc:
        def sink
        end

        def swim
        end
      end
    RUBY

    object = YARD::Registry.at('Salmon')

    assert_equal ['Salmon.spawn'], template.public_class_methods(object).map(&:path)
    assert_equal ['Salmon#swim'], template.public_instance_methods(object).map(&:path)
  end

  def test_public_method_lists_are_sorted_by_method_name
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Salmon
        def zebra
        end

        def alpha
        end
      end
    RUBY

    assert_equal ['Salmon#alpha', 'Salmon#zebra'], template.public_instance_methods(YARD::Registry.at('Salmon')).map(&:path)
  end

  def test_public_method_lists_exclude_inherited_and_private_methods
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Fish
        def inherited_public
        end
      end

      class Salmon < Fish
        def visible_public
        end

        private

        def hidden_private
        end
      end
    RUBY

    assert_equal ['Salmon#visible_public'], template.public_instance_methods(YARD::Registry.at('Salmon')).map(&:path)
  end

  def test_public_method_lists_prune_aliases
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Salmon
        def swim
        end

        alias paddle swim
      end
    RUBY

    assert_equal ['Salmon#swim'], template.public_instance_methods(YARD::Registry.at('Salmon')).map(&:path)
  end

  def test_public_method_lists_exclude_attribute_accessors
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Salmon
        attr_accessor :speed
      end
    RUBY

    assert_equal [], template.public_instance_methods(YARD::Registry.at('Salmon')).map(&:path)
  end

  def test_hidden_object_recognizes_nodoc_after_leading_whitespace_only
    assert helper.hidden_object?(DocstringObject.new(docstring: '   :nodoc: hidden'))
    refute helper.hidden_object?(DocstringObject.new(docstring: 'details :nodoc:'))
  end

  def test_sort_listing_orders_by_scope_then_case_insensitive_name
    list = [
      ListObject.new(scope: :instance, name: 'alpha'),
      ListObject.new(scope: :class, name: 'zebra'),
      ListObject.new(scope: :class, name: 'Beta'),
      ListObject.new(scope: :class, name: 'alpha')
    ]

    assert_equal [
      ListObject.new(scope: :class, name: 'alpha'),
      ListObject.new(scope: :class, name: 'Beta'),
      ListObject.new(scope: :class, name: 'zebra'),
      ListObject.new(scope: :instance, name: 'alpha')
    ], helper.sort_listing(list)
  end

  def test_attr_listing_returns_sorted_attributes
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Salmon
        attr_accessor :beta
        attr_reader :alpha
      end
    RUBY

    assert_equal %i[alpha beta], template.attr_listing(YARD::Registry.at('Salmon')).map { |item| item.name(false) }
  end

  def test_attr_listing_includes_class_scope_attributes
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Salmon
        class << self
          attr_accessor :config
        end
      end
    RUBY

    attrs = template.attr_listing(YARD::Registry.at('Salmon'))

    assert_equal ['Salmon.config'], attrs.map(&:path)
  end

  def test_attr_listing_keeps_write_only_attributes
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Salmon
        attr_writer :captured
      end
    RUBY

    assert_equal ['Salmon#captured='], template.attr_listing(YARD::Registry.at('Salmon')).map(&:path)
  end

  def test_attr_listing_does_not_include_inherited_attributes_when_embed_mixins_are_empty
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      class Fish
        attr_reader :base_speed
      end

      class Salmon < Fish
        attr_reader :top_speed
      end
    RUBY

    assert_equal ['Salmon#top_speed'], template.attr_listing(YARD::Registry.at('Salmon')).map(&:path)
  end

  def test_attr_listing_includes_mixin_attributes_when_embed_mixins_match
    YARD::Registry.clear
    YARD.parse_string(<<~RUBY)
      module Swimmer
        attr_reader :speed
      end

      class Fish
        include Swimmer
      end
    RUBY

    template = build_template
    template.options.embed_mixins = ['Swimmer']

    assert_equal [:speed], template.attr_listing(YARD::Registry.at('Fish')).map { |item| item.name(false) }
  end

  def test_attr_listing_keeps_collecting_matching_mixins_when_embed_mixins_are_enabled
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

    template = build_template
    template.options.embed_mixins = ['Swimmer', 'Floater']

    assert_equal %i[depth speed], template.attr_listing(YARD::Registry.at('Fish')).map { |item| item.name(false) }
  end

  def test_attr_listing_skips_proxy_ancestors_when_embed_mixins_are_enabled
    YARD::Registry.clear
    YARD.parse_string("class Fish < MissingBase\n  attr_reader :speed\nend\n")

    template = build_template
    template.options.embed_mixins = ['MissingBase']

    assert_equal [], template.attr_listing(YARD::Registry.at('Fish'))
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

  def helper
    @helper ||= Class.new do
      include YARD::Markdown::ObjectListingHelper
    end.new
  end
end
