# frozen_string_literal: true

module YARD
  module Markdown
    # Computes anchor ids that match the generated Markdown headings.
    module ArefHelper
      include AnchorComponentHelper

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
