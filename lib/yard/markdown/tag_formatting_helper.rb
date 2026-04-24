# frozen_string_literal: true

module YARD
  module Markdown
    module TagFormattingHelper
      def render_tags(object)
        lines = []
        regular_tags = object.tags.reject { |tag| tag.tag_name == 'example' }
        example_tags = object.tags.select { |tag| tag.tag_name == 'example' }

        regular_tags.each do |tag|
          lines << "- #{format_tag(tag)}"
        end

        example_tags.each do |tag|
          lines << nil unless lines.empty?
          title = tag.name.to_s.rstrip.empty? ? '**@example**' : "**@example #{tag.name}**"
          lines << title
          lines << '```ruby'
          lines << tag.text.to_s.rstrip
          lines << '```'
        end

        lines.join("\n")
      end

      def format_tag(tag)
        parts = ["**@#{tag.tag_name}**"]
        parts << "`#{tag.name}`" unless tag.name.to_s.lstrip.empty?

        cleaned_types = normalized_tag_types(tag.types)
        parts << "[#{cleaned_types.join(', ')}]" unless cleaned_types.empty?
        parts << tag.text.strip unless tag.text.to_s.lstrip.empty?

        parts.join(' ')
      end

      def normalized_tag_types(types)
        values = if types.instance_of?(Hash)
                   types.map { |name, value| format_hash_tag_type(name, value) }
                 else
                   Array(types)
                 end

        values.map(&:to_s).map(&:strip).reject(&:empty?)
      end

      def format_hash_tag_type(name, value)
        key = name.rstrip
        return nil if key.empty?
        return key if value.nil? || value == true || (value.respond_to?(:empty?) && value.empty?)

        "#{key}: #{value}"
      end
    end
  end
end
