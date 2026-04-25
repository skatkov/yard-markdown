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
        lines = ['## Constants']
        grouped_constants = grouped_items(constants.sort_by { |item| item.name }, group_order)
        uses_groups = grouped_constants.any? { |name, _items| !name.nil? }

        grouped_constants.each do |group_name, items|
          if uses_groups
            lines << "### #{group_name || 'General'}"
            item_heading = '####'
          else
            item_heading = '###'
          end

          lines << items.map { |item|
            item_lines = [heading_with_anchors("#{item_heading} `#{item.name}`", item)]
            append_lines(item_lines, documented_text(item), separated: false)
            append_lines(item_lines, render_tags(item), separated: false)
            item_lines.join("\n")
          }.join("\n\n")
        end

        lines.join("\n")
      end

      # Renders the attributes section for an object page.
      #
      # @param attrs [Array<YARD::CodeObjects::MethodObject>] Attributes to render.
      # @param group_order [Array<String>, nil] Preferred ordering for group headings.
      # @return [String] Markdown for the attributes section.
      def render_attributes(attrs, group_order)
        lines = ['## Attributes']
        grouped_attrs = grouped_items(attrs, group_order)
        uses_groups = grouped_attrs.any? { |name, _items| !name.nil? }

        grouped_attrs.each do |group_name, items|
          if uses_groups
            lines << "### #{group_name || 'General'}"
            item_heading = '####'
          else
            item_heading = '###'
          end

          lines << items.map { |item|
            item_lines = [heading_with_anchors("#{item_heading} `#{item.name}` [#{attribute_access(item)}]", item)]
            append_lines(item_lines, documented_text(item), separated: false)
            append_lines(item_lines, render_tags(item), separated: false)
            item_lines.join("\n")
          }.join("\n\n")
        end

        lines.join("\n")
      end

      # Renders a method section for an object page.
      #
      # @param section_title [String] Section title to render.
      # @param methods [Array<YARD::CodeObjects::MethodObject>] Method objects collected for the current section.
      # @param group_order [Array<String>, nil] Preferred ordering for group headings.
      # @return [String] Markdown for the method section.
      def render_methods(section_title, methods, group_order)
        lines = ["## #{section_title}"]
        grouped_methods = grouped_items(methods, group_order)
        uses_groups = grouped_methods.any? { |name, _items| !name.nil? }

        grouped_methods.each do |group_name, items|
          if uses_groups
            lines << "### #{group_name || 'General'}"
            item_heading = '####'
          else
            item_heading = '###'
          end

          lines << items.map { |item|
            item_lines = [heading_with_anchors("#{item_heading} `#{formatted_method_heading(item)}`", item)]
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
