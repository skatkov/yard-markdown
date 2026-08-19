# frozen_string_literal: true

module YARD
  module Markdown
    # Renders namespace metadata summaries.
    module MetadataSectionHelper
      # Returns inheritance, mixins, and source files for an object.
      #
      # @param object [YARD::CodeObjects::NamespaceObject] Object being rendered.
      # @return [String] Markdown table containing the object's metadata.
      def object_metadata(object)
        rows = inheritance_rows(MetadataSectionHelper.superclass_of(object)) +
          mixin_rows(object) + MetadataSectionHelper.file_rows(object)

        return "" if rows.empty?

        MetadataSectionHelper.format_metadata_rows(rows)
      end

      # Returns a table-safe namespace reference, linked when YARD will render it.
      #
      # @param target [YARD::CodeObjects::NamespaceObject, YARD::CodeObjects::Proxy] Referenced namespace.
      # @return [String] Markdown link or plain table-cell text.
      def metadata_reference(target)
        path, namespace = MetadataSectionHelper.reference_details(target)
        label = MetadataSectionHelper.metadata_table_cell(path)
        return label unless namespace && run_verifier([target]).any?

        "[#{label}](#{path})"
      end

      # Escapes text for a Markdown table cell.
      #
      # @param value [String] Metadata text.
      # @return [String] GFM table-safe Markdown text.
      def self.metadata_table_cell(value)
        value.gsub(/[[:blank:]]*\R[[:blank:]]*/, " ")
          .gsub(/[\\|]/) { |character| "\\#{character}" }
      end

      # Returns the superclass only for class objects.
      #
      # @param object [YARD::CodeObjects::NamespaceObject] Namespace being rendered.
      # @return [YARD::CodeObjects::Base, nil] Superclass for a class object.
      def self.superclass_of(object)
        object.superclass if object.instance_of?(CodeObjects::ClassObject)
      end

      # Reads the fields needed to render a metadata reference.
      #
      # @param target [YARD::CodeObjects::Base] Referenced object.
      # @return [Array] Target path and namespace status.
      def self.reference_details(target)
        [target.path, target.is_a?(CodeObjects::NamespaceObject)]
      end

      # Builds the source-file metadata rows.
      #
      # @param object [YARD::CodeObjects::NamespaceObject] Namespace being rendered.
      # @return [Array<Array>] Source-file rows.
      def self.file_rows(object)
        files = object.files.map(&:first).uniq
        return [] if files.empty?

        [["Defined in", files.map { |file| metadata_table_cell(file) }.join(", ")]]
      end

      # Formats metadata rows as a Markdown table.
      #
      # @param rows [Array<Array>] Metadata labels and values.
      # @return [String] Markdown metadata table.
      def self.format_metadata_rows(rows)
        (["|  |  |", "| --- | --- |"] + rows.map { |label, value| "| **#{label}** | #{value} |" }).join("\n")
      end

      private

      # Builds the inheritance metadata row.
      #
      # @param superclass [YARD::CodeObjects::Base, nil] Referenced superclass.
      # @return [Array<Array>] Inheritance row, if present.
      def inheritance_rows(superclass)
        superclass ? [["Inherits", metadata_reference(superclass)]] : []
      end

      # Builds class and instance mixin rows.
      #
      # @param object [YARD::CodeObjects::NamespaceObject] Namespace being rendered.
      # @return [Array<Array>] Visible mixin rows.
      def mixin_rows(object)
        [[:class, "Extended by"], [:instance, "Includes"]]
          .map { |scope, label| mixin_row(object, scope, label) }
          .compact
      end

      # Builds one scoped mixin row.
      #
      # @param object [YARD::CodeObjects::NamespaceObject] Namespace being rendered.
      # @param scope [Symbol] Mixin scope.
      # @param label [String] Metadata row label.
      # @return [Array, nil] Mixin row, if visible mixins exist.
      def mixin_row(object, scope, label)
        mixins = run_verifier(object.mixins(scope)).sort_by(&:path)
        return if mixins.empty?

        [label, mixins.map { |mixin| metadata_reference(mixin) }.join(", ")]
      end
    end
  end
end
