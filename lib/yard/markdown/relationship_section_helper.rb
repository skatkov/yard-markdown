# frozen_string_literal: true

module YARD
  module Markdown
    module RelationshipSectionHelper
      def render_section_content(content)
        text = content.to_s.strip
        return '' if text.empty?

        "#{text}\n\n"
      end

      def object_relationships(object)
        lines = []

        lines << "**Inherits:** `#{object.superclass.path}`" if object.is_a?(CodeObjects::ClassObject) && object.superclass

        [[:class, 'Extended by'], [:instance, 'Includes']].each do |scope, label|
          mixins = run_verifier(object.mixins(scope)).sort_by { |item| item.path }
          next if mixins.empty?

          lines << "**#{label}:** #{mixins.map { |mixin| "`#{mixin.path}`" }.join(', ')}"
        end

        lines.join("\n")
      end
    end
  end
end
