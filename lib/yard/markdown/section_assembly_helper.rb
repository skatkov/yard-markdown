# frozen_string_literal: true

module YARD
  module Markdown
    module SectionAssemblyHelper
      def grouped_items(items, group_order)
        grouped = Hash.new { |hash, key| hash[key] = [] }
        items.each { |item| grouped[item.group] << item }

        ordered = []

        Array(group_order).each do |name|
          next unless grouped.key?(name)

          ordered << [name, grouped.delete(name)]
        end

        grouped.keys.compact.sort.each do |name|
          ordered << [name, grouped.delete(name)]
        end

        ordered << [nil, grouped.delete(nil)] if grouped.key?(nil)
        ordered
      end

      def append_lines(lines, content, separated: true)
        return if content.lstrip.empty?

        lines << '' if separated && !lines.empty? && !lines.last.empty?
        lines.concat(content.split("\n"))
      end
    end
  end
end
