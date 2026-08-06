# frozen_string_literal: true

module YARD
  module Markdown
    # Assembles grouped content into ordered Markdown sections.
    module SectionAssemblyHelper
      # Returns section content with the expected trailing spacing.
      #
      # @param content [Object] Section content to render.
      # @return [String] Section content followed by blank-line spacing.
      def render_section_content(content)
        text = content.to_s.strip
        return "" if text.empty?

        "#{text}\n\n"
      end

      # Groups items by their YARD group and orders them for rendering.
      #
      # @param items [Array<#group>] Renderable objects that expose a YARD group name.
      # @param group_order [Array<String>, nil] Preferred ordering for named groups.
      # @return [Array<Array>] Ordered pairs of group names and grouped items.
      def grouped_items(items, group_order)
        groups = items.group_by(&:group)
        names = groups.keys
        order = Array(group_order)
        ordered_names = (order & names) + (names.compact - order).sort + ([nil] & names)

        ordered_names.map { |name| [name, groups.fetch(name)] }
      end

      # Appends non-empty content to a mutable list of lines.
      #
      # @param lines [Array<String>] Destination line buffer.
      # @param content [String] Rendered Markdown block to split into lines.
      # @param separated [Boolean] Whether to insert a blank separator line first.
      # @return [void]
      def append_lines(lines, content, separated: true)
        return if content.lstrip.empty?

        lines << "" if separated && !lines.empty? && !lines.last.empty?
        lines.concat(content.split("\n"))
      end
    end
  end
end
