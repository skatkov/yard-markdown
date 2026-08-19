# frozen_string_literal: true

module YARD
  module Markdown
    # Collects and sorts the objects shown on a rendered object page.
    module ObjectListingHelper
      # Returns the constants and class variables defined on an object.
      #
      # @param object [YARD::CodeObjects::NamespaceObject] Object being rendered.
      # @return [Array<YARD::CodeObjects::Base>] Constants and class variables.
      def self.constant_listing(object)
        constants = object.constants(included: false, inherited: false)
        constants + object.cvars
      end

      # Returns the visible public methods defined directly on an object.
      #
      # @param object [YARD::CodeObjects::NamespaceObject] Object being rendered.
      # @return [Array<YARD::CodeObjects::MethodObject>] Sorted public methods.
      def public_method_list(object)
        prune_method_listing(object.meths(inherited: false, visibility: :public))
          .reject { |item| ObjectListingHelper.hidden_object?(item) }
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
        superclasses = attribute_superclasses(object)
        attributes = superclasses.flat_map { |superclass| attributes_for(superclass) }
        ObjectListingHelper.sort_attributes(attributes)
      end

      # Sorts attributes by scope and case-insensitive name.
      #
      # @param attributes [Array<YARD::CodeObjects::MethodObject>] Attribute methods collected from eligible ancestors.
      # @return [Array<YARD::CodeObjects::MethodObject>] Sorted attributes.
      def self.sort_attributes(attributes)
        attributes.sort { |left, right| (left.scope <=> right.scope).nonzero? || left.name.to_s.casecmp(right.name.to_s) }
      end

      # Returns whether an object is explicitly hidden with `:nodoc:`.
      #
      # @param object [YARD::CodeObjects::Base] Listed object whose docstring may start with `:nodoc:`.
      # @return [Boolean] True when the object should be hidden.
      def self.hidden_object?(object)
        object.docstring.start_with?(":nodoc:")
      end

      private

      # Selects ancestors whose attributes should be embedded.
      #
      # @param object [YARD::CodeObjects::NamespaceObject] Namespace being rendered.
      # @return [Array<YARD::CodeObjects::Base>] Eligible ancestors.
      def attribute_superclasses(object)
        superclasses = object.inheritance_tree(true)
        return superclasses.first(1) if options.embed_mixins.empty?

        superclasses.select { |superclass| options.embed_mixins_match?(superclass) }
      end

      # Collects visible attributes from one ancestor.
      #
      # @param superclass [YARD::CodeObjects::Base] Ancestor containing attributes.
      # @return [Array<YARD::CodeObjects::MethodObject>] Visible attributes.
      def attributes_for(superclass)
        superclass.attributes.values.flat_map(&:values).map { |read_write|
          read, write = read_write.fetch_values(:read, :write)
          prune_method_listing([read, write].compact, false).first
        }.compact
      end
    end
  end
end
