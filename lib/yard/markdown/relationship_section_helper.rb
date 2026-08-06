# frozen_string_literal: true

module YARD
  module Markdown
    # Renders namespace metadata summaries.
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

      # Returns inheritance, mixins, and source files for an object.
      #
      # @param object [YARD::CodeObjects::NamespaceObject] Object being rendered.
      # @return [String] Markdown table containing the object's metadata.
      def object_relationships(object)
        rows = []

        if object.instance_of?(CodeObjects::ClassObject)
          rows << ["Inherits", metadata_reference(object.superclass)]
        end

        [[:class, "Extended by"], [:instance, "Includes"]].each do |scope, label|
          mixins = run_verifier(object.mixins(scope)).sort_by { |item| item.path }
          next if mixins.empty?

          rows << [label, mixins.map { |mixin| metadata_reference(mixin) }.join(", ")]
        end

        files = object.files.map(&:first).uniq
        rows << ["Defined in", files.map { |file| metadata_table_cell(file) }.join(", ")] unless files.empty?

        return "" if rows.empty?

        ["|  |  |", "| --- | --- |", rows.map { |label, value| "| **#{label}** | #{value} |" }].join("\n")
      end

      # Returns a table-safe namespace reference, linked when YARD will render it.
      #
      # @param target [YARD::CodeObjects::NamespaceObject, YARD::CodeObjects::Proxy] Referenced namespace.
      # @return [String] Markdown link or plain table-cell text.
      def metadata_reference(target)
        label = metadata_table_cell(target.path)
        return label unless target.is_a?(CodeObjects::Base) && run_verifier([target]).any?

        "[#{label}](#{target.path})"
      end

      # Escapes text for a Markdown table cell.
      #
      # @param value [String] Metadata text.
      # @return [String] GFM table-safe Markdown text.
      def metadata_table_cell(value)
        value.gsub(/[[:blank:]]*\R[[:blank:]]*/, " ")
          .gsub(/[\\|]/) { |character| "\\#{character}" }
      end
    end
  end
end
