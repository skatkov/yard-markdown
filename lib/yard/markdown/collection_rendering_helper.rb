# frozen_string_literal: true

module YARD
  module Markdown
    module CollectionRenderingHelper
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
