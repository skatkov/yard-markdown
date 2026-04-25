# frozen_string_literal: true

module YARD
  module Markdown
    # Collects and sorts the objects shown on a rendered object page.
    module ObjectListingHelper
      # Returns the constants and class variables defined on an object.
      #
      # @param object [YARD::CodeObjects::NamespaceObject] Object being rendered.
      # @return [Array<YARD::CodeObjects::Base>] Constants and class variables.
      def constant_listing(object)
        constants = object.constants(included: false, inherited: false)
        constants + object.cvars
      end

      # Returns the visible public methods defined directly on an object.
      #
      # @param object [YARD::CodeObjects::NamespaceObject] Object being rendered.
      # @return [Array<YARD::CodeObjects::MethodObject>] Sorted public methods.
      def public_method_list(object)
        prune_method_listing(object.meths(inherited: false, visibility: :public))
          .reject { |item| hidden_object?(item) }
          .sort_by { |method_object| method_object.name }
      end

      # Returns the public class methods defined directly on an object.
      #
      # @param object [YARD::CodeObjects::NamespaceObject] Object being rendered.
      # @return [Array<YARD::CodeObjects::MethodObject>] Sorted public class methods.
      def public_class_methods(object)
        public_method_list(object).select { |item| item.scope == :class }
      end

      # Returns the public instance methods defined directly on an object.
      #
      # @param object [YARD::CodeObjects::NamespaceObject] Object being rendered.
      # @return [Array<YARD::CodeObjects::MethodObject>] Sorted public instance methods.
      def public_instance_methods(object)
        public_method_list(object).select { |item| item.scope == :instance }
      end

      # Returns the visible attribute methods for an object.
      #
      # @param object [YARD::CodeObjects::NamespaceObject] Object being rendered.
      # @return [Array<YARD::CodeObjects::MethodObject>] Sorted attribute methods.
      def attr_listing(object)
        attrs = []

        object.inheritance_tree(true).each do |superclass|
          next if !options.embed_mixins.empty? && !options.embed_mixins_match?(superclass)

          %i[class instance].each do |scope|
            superclass.attributes.fetch(scope).each do |_name, rw|
              attr = prune_method_listing([rw.fetch(:read), rw.fetch(:write)].compact, false).first
              attrs << attr if attr
            end
          end

          break if options.embed_mixins.empty?
        end

        sort_listing(attrs)
      end

      # Sorts a listing by scope and case-insensitive name.
      #
      # @param list [Array<YARD::CodeObjects::Base>] Objects to sort.
      # @return [Array<YARD::CodeObjects::Base>] Sorted objects.
      def sort_listing(list)
        list.sort do |left, right|
          scope_comparison = left.scope <=> right.scope
          next scope_comparison unless scope_comparison.zero?

          left.name.to_s.casecmp(right.name.to_s)
        end
      end

      # Returns whether an object is explicitly hidden with `:nodoc:`.
      #
      # @param object [YARD::CodeObjects::Base] Listed object whose docstring may start with `:nodoc:`.
      # @return [Boolean] True when the object should be hidden.
      def hidden_object?(object)
        object.docstring.lstrip.start_with?(':nodoc:')
      end
    end
  end
end
