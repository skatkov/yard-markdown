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
      def anchor_component(value)
        value.to_s.each_char.map do |char|
          char.match?(/[A-Za-z0-9_-]/) ? char : format("-%X", char.ord)
        end.join
      end

      # Returns the primary anchor id for a documented object.
      #
      # @param object [YARD::CodeObjects::Base] Object being rendered.
      # @return [String] Anchor id for the object's heading.
      def aref(object)
        type = object.type

        return "class-#{object.path.gsub("::", "-")}" if type == :class
        return "module-#{object.path.gsub("::", "-")}" if type == :module
        return "constant-#{object.name}" if type == :constant
        return "classvariable-#{anchor_component(object.name)}" if type == :classvariable

        scope = (object.scope == :class) ? "c" : "i"

        if !object.attr_info.nil?
          "attribute-#{scope}-#{object.name}"
        else
          "method-#{scope}-#{anchor_component(object.name)}"
        end
      end
    end
  end
end
