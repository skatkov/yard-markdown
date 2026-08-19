# frozen_string_literal: true

module YARD
  module Markdown
    # Formats YARD tags into Markdown list items and fenced examples.
    module TagFormattingHelper
      # Renders all tags for an object as Markdown.
      #
      # @param object [YARD::CodeObjects::Base] Object whose tags are being rendered.
      # @return [String] Markdown representation of the object's tags.
      def self.render_tags(object)
        example_tags, regular_tags = object.tags.partition { |tag| tag.tag_name == "example" }
        regular = render_regular_tags(regular_tags)
        examples = render_example_tags(example_tags)
        [regular, examples].reject(&:empty?).join("\n\n")
      end

      # Formats a non-example YARD tag as a Markdown list item body.
      #
      # @param tag [YARD::Tags::Tag] Non-example tag being converted into list item text.
      # @return [String] Markdown representation of the tag.
      def self.format_tag(tag)
        name = tag.name.to_s
        text = tag.text.to_s
        [
          "**@#{tag.tag_name}**",
          ("`#{name}`" unless name.lstrip.empty?),
          formatted_tag_types(tag.types),
          (text.strip unless text.lstrip.empty?)
        ].compact.join(" ")
      end

      # Normalizes tag type declarations into printable strings.
      #
      # @param types [Array<Object>, nil] Raw tag types from YARD.
      # @return [Array<String>] Cleaned type strings.
      def self.normalized_tag_types(types)
        Array(types).map(&:to_s).map(&:strip).reject(&:empty?)
      end

      # Formats normalized types as a tag section.
      #
      # @param types [Array<Object>, nil] Raw tag types.
      # @return [String, nil] Formatted types, if present.
      def self.formatted_tag_types(types)
        cleaned_types = normalized_tag_types(types)
        "[#{cleaned_types.join(", ")}]" unless cleaned_types.empty?
      end

      # Formats one example tag as a fenced Ruby block.
      #
      # @param tag [YARD::Tags::Tag] Example tag.
      # @return [String] Example Markdown.
      def self.format_example_tag(tag)
        name = tag.name.to_s.rstrip
        title = name.empty? ? "**@example**" : "**@example #{name}**"
        [title, "```ruby", tag.text.to_s.rstrip, "```"].join("\n")
      end

      # Formats regular tags as list items.
      #
      # @param tags [Array<YARD::Tags::Tag>] Non-example tags.
      # @return [String] Tag list Markdown.
      def self.render_regular_tags(tags)
        tags.map { |tag| "- #{format_tag(tag)}" }.join("\n")
      end

      # Formats example tags as separated fenced blocks.
      #
      # @param tags [Array<YARD::Tags::Tag>] Example tags.
      # @return [Array<String>] Formatted examples.
      def self.render_example_tags(tags)
        tags.map { |tag| format_example_tag(tag) }
      end
      private_class_method :formatted_tag_types, :format_example_tag, :render_regular_tags, :render_example_tags
    end
  end
end
