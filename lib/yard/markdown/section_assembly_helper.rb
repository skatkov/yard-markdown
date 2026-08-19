# frozen_string_literal: true

module YARD
  module Markdown
    # Assembles grouped content into ordered Markdown sections.
    module SectionAssemblyHelper
      # Returns section content with the expected trailing spacing.
      #
      # @param content [Object] Section content to render.
      # @return [String] Section content followed by blank-line spacing.
      def self.render_section_content(content)
        text = content.to_s.strip
        return "" if text.empty?

        "#{text}\n\n"
      end

      # Groups items by their YARD group and orders them for rendering.
      #
      # @param items [Array<#group>] Renderable objects that expose a YARD group name.
      # @param group_order [Array<String>, nil] Preferred ordering for named groups.
      # @return [Array<Array>] Ordered pairs of group names and grouped items.
      def self.grouped_items(items, group_order)
        groups = items.group_by(&:group)
        ordered_group_names(groups.keys, Array(group_order)).map { |name| [name, groups.fetch(name)] }
      end

      # Orders known group names by configured, alphabetical, and default order.
      #
      # @param names [Array<String, nil>] Known group names.
      # @param order [Array<String>] Preferred named-group order.
      # @return [Array<String, nil>] Ordered group names.
      def self.ordered_group_names(names, order)
        (order & names) + (names.compact - order).sort + ([nil] & names)
      end
      private_class_method :ordered_group_names
    end
  end
end
