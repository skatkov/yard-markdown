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
        regular = regular_tags.map { |tag| "- #{format_tag(tag)}" }.join("\n")
        examples = example_tags.map do |tag|
          name = tag.name.to_s.rstrip
          title = name.empty? ? "**@example**" : "**@example #{name}**"
          [title, "```ruby", tag.text.to_s.rstrip, "```"].join("\n")
        end
        [regular, examples].reject(&:empty?).join("\n\n")
      end

      # Formats a non-example YARD tag as a Markdown list item body.
      #
      # @param tag [YARD::Tags::Tag] Non-example tag being converted into list item text.
      # @return [String] Markdown representation of the tag.
      def self.format_tag(tag)
        name = tag.name.to_s
        text = tag.text.to_s
        types = Array(tag.types).map { |type| type.to_s.strip }.reject(&:empty?)
        [
          "**@#{tag.tag_name}**",
          ("`#{name}`" unless name.lstrip.empty?),
          ("[#{types.join(", ")}]" unless types.empty?),
          (text.strip unless text.lstrip.empty?)
        ].compact.join(" ")
      end
    end
  end
end
