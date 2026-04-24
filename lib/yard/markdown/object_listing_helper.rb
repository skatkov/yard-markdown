# frozen_string_literal: true

module YARD
  module Markdown
    module ObjectListingHelper
      def constant_listing(object)
        constants = object.constants(included: false, inherited: false)
        constants + object.cvars
      end

      def public_method_list(object)
        prune_method_listing(object.meths(inherited: false, visibility: :public))
          .reject { |item| hidden_object?(item) }
          .sort_by { |method_object| method_object.name }
      end

      def public_class_methods(object)
        public_method_list(object).select { |item| item.scope == :class }
      end

      def public_instance_methods(object)
        public_method_list(object).select { |item| item.scope == :instance }
      end

      def attr_listing(object)
        attrs = []

        object.inheritance_tree(true).each do |superclass|
          next if !options.embed_mixins.empty? && !options.embed_mixins_match?(superclass)

        %i[class instance].each do |scope|
          superclass.attributes.fetch(scope).each do |_name, rw|
            attr = prune_method_listing([rw.fetch(:read), rw.fetch(:write)].compact, false).first
            attrs << attr
          end
        end

          break if options.embed_mixins.empty?
        end

        sort_listing(attrs)
      end

      def sort_listing(list)
        list.sort do |left, right|
          scope_comparison = left.scope <=> right.scope
          next scope_comparison unless scope_comparison.zero?

          left.name.to_s.casecmp(right.name.to_s)
        end
      end

      def hidden_object?(object)
        object.docstring.lstrip.start_with?(':nodoc:')
      end
    end
  end
end
