# frozen_string_literal: true

module YARD
  module Markdown
    # Renders inheritance and mixin relationship summaries.
    module RelationshipSectionHelper
      # Returns section content with the expected trailing spacing.
      #
      # @param content [Object] Section content to render.
      # @return [String] Section content followed by blank-line spacing.
      def render_section_content(content)
        text = content.to_s.strip
        return "" if text.empty?

        "#{text}\n\n"
      end

      # Returns inheritance and mixin relationships for an object.
      #
      # @param object [YARD::CodeObjects::NamespaceObject] Object being rendered.
      # @return [String] Markdown summary of the object's relationships.
      def object_relationships(object)
        lines = []

        lines << "**Inherits:** `#{object.superclass}`" if object.instance_of?(CodeObjects::ClassObject)

        [[:class, "Extended by"], [:instance, "Includes"]].each do |scope, label|
          mixins = run_verifier(object.mixins(scope)).sort_by { |item| item.path }
          next if mixins.empty?

          lines << "**#{label}:** #{mixins.map { |mixin| "`#{mixin.path}`" }.join(", ")}"
        end

        lines.join("\n")
      end
    end
  end
end
