# frozen_string_literal: true

# Namespace for YARD extensions used by this gem.
module YARD
  # Shared helpers for rendering YARD objects as Markdown.
  module Markdown
    # Computes anchor ids that match the generated Markdown headings.
    module ArefHelper
      # Encodes a value so it can be embedded safely in an HTML anchor id.
      #
      # @param value [Object] Raw anchor fragment to encode.
      # @return [String] Anchor-safe identifier fragment.
      def self.anchor_component(value)
        value.to_s.each_char.map do |char|
          char.match?(/[A-Za-z0-9_-]/) ? char : format("-%X", char.ord)
        end.join
      end

      # Returns the primary anchor id for a documented object.
      #
      # @param object [YARD::CodeObjects::Base] Object being rendered.
      # @return [String] Anchor id for the object's heading.
      def self.aref(object)
        aref_for(object, object.type, object.name)
      end

      # Dispatches anchor formatting using preloaded object attributes.
      #
      # @param object [YARD::CodeObjects::Base] Object being rendered.
      # @param type [Symbol] YARD object type.
      # @param name [String, Symbol] Object name.
      # @return [String] Anchor id for the object's heading.
      def self.aref_for(object, type, name)
        case type
        when :class, :module
          "#{type}-#{object.path.gsub("::", "-")}"
        when :constant
          "constant-#{name}"
        when :classvariable
          "classvariable-#{anchor_component(name)}"
        else
          callable_aref(object, name)
        end
      end
      private_class_method :aref_for

      # Returns the anchor id for a method or attribute.
      #
      # @param object [YARD::CodeObjects::MethodObject] Method or attribute being rendered.
      # @param name [String, Symbol] Method or attribute name.
      # @return [String] Anchor id for the callable object's heading.
      def self.callable_aref(object, name)
        scope = (object.scope == :class) ? "c" : "i"
        kind, name = object.attr_info ? ["attribute", name] : ["method", anchor_component(name)]
        "#{kind}-#{scope}-#{name}"
      end
      private_class_method :callable_aref
    end
  end
end
