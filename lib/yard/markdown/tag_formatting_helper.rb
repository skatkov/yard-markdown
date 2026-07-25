# frozen_string_literal: true

module YARD
  module Markdown
    # Formats YARD tags into Markdown list items and fenced examples.
    module TagFormattingHelper
      # Renders all tags for an object as Markdown.
      #
      # @param object [YARD::CodeObjects::Base] Object whose tags are being rendered.
      # @return [String] Markdown representation of the object's tags.
      def render_tags(object)
        example_tags, regular_tags = object.tags.partition { |tag| tag.tag_name == "example" }
        lines = regular_tags.map { |tag| "- #{format_tag(tag)}" }

        example_tags.each do |tag|
          lines << nil unless lines.empty?
          title = tag.name.to_s.rstrip.empty? ? "**@example**" : "**@example #{tag.name}**"
          lines << title
          lines << "```ruby"
          lines << tag.text.to_s.rstrip
          lines << "```"
        end

        lines.join("\n")
      end

      # Formats a non-example YARD tag as a Markdown list item body.
      #
      # @param tag [YARD::Tags::Tag] Non-example tag being converted into list item text.
      # @return [String] Markdown representation of the tag.
      def format_tag(tag)
        parts = ["**@#{tag.tag_name}**"]
        parts << "`#{tag.name}`" unless tag.name.to_s.lstrip.empty?

        cleaned_types = normalized_tag_types(tag.types)
        parts << "[#{cleaned_types.join(", ")}]" unless cleaned_types.empty?
        parts << tag.text.strip unless tag.text.to_s.lstrip.empty?

        parts.join(" ")
      end

      # Normalizes tag type declarations into printable strings.
      #
      # @param types [Array<Object>, nil] Raw tag types from YARD.
      # @return [Array<String>] Cleaned type strings.
      def normalized_tag_types(types)
        Array(types).map(&:to_s).map(&:strip).reject(&:empty?)
      end
    end
  end
end
