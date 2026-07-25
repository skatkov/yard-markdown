# frozen_string_literal: true

module YARD
  module Markdown
    # Renders grouped Markdown sections for constants, attributes, and methods.
    module CollectionRenderingHelper
      # Renders the constants section for an object page.
      #
      # @param constants [Array<YARD::CodeObjects::Base>] Constant objects collected for the current page.
      # @param group_order [Array<String>, nil] Preferred ordering for group headings.
      # @return [String] Markdown for the constants section.
      def render_constants(constants, group_order)
        render_collection("Constants", constants.sort_by { |item| item.name }, group_order) { |item| "`#{item.name}`" }
      end

      # Renders the attributes section for an object page.
      #
      # @param attrs [Array<YARD::CodeObjects::MethodObject>] Attributes to render.
      # @param group_order [Array<String>, nil] Preferred ordering for group headings.
      # @return [String] Markdown for the attributes section.
      def render_attributes(attrs, group_order)
        render_collection("Attributes", attrs, group_order) { |item| "`#{item.name}` [#{attribute_access(item)}]" }
      end

      # Renders a method section for an object page.
      #
      # @param section_title [String] Section title to render.
      # @param methods [Array<YARD::CodeObjects::MethodObject>] Method objects collected for the current section.
      # @param group_order [Array<String>, nil] Preferred ordering for group headings.
      # @return [String] Markdown for the method section.
      def render_methods(section_title, methods, group_order)
        render_collection(section_title, methods, group_order) { |item| "`#{formatted_method_heading(item)}`" }
      end

      # Renders a grouped collection with a caller-provided item label.
      #
      # @param section_title [String] Section title to render.
      # @param items [Array<YARD::CodeObjects::Base>] Objects to group and render.
      # @param group_order [Array<String>, nil] Preferred ordering for group headings.
      # @return [String] Markdown for the collection section.
      def render_collection(section_title, items, group_order)
        lines = ["## #{section_title}"]
        groups = grouped_items(items, group_order)
        uses_groups = groups.any? { |name, _items| !name.nil? }
        item_heading = uses_groups ? "####" : "###"

        groups.each do |group_name, group_items|
          lines << "### #{group_name || "General"}" if uses_groups

          lines << group_items.map { |item|
            item_lines = [heading_with_anchors("#{item_heading} #{yield(item)}", item)]
            append_lines(item_lines, documented_text(item), separated: false)
            append_lines(item_lines, render_tags(item), separated: false)
            item_lines.join("\n")
          }.join("\n\n")
        end

        lines.join("\n")
      end
    end
  end
end
