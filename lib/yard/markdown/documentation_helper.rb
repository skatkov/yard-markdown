# frozen_string_literal: true

require "rdoc"

module YARD
  module Markdown
    # Converts YARD docstrings into Markdown-friendly text.
    module DocumentationHelper
      # Returns the rendered documentation text for an object.
      #
      # @param object [YARD::CodeObjects::Base] Object whose docstring is being rendered.
      # @return [String] Converted documentation text or a fallback message.
      def documented_text(object)
        text = rdoc_to_md(object.docstring)
        return text unless text.empty?

        object.tags.empty? ? "Not documented." : ""
      end

      # Converts an RDoc-formatted docstring to Markdown.
      #
      # @param docstring [Object] Raw docstring content.
      # @return [String] Markdown-rendered docstring content.
      def rdoc_to_md(docstring)
        fenced_code_blocks = []
        placeholder = "YARD_MARKDOWN_FENCED_CODE_BLOCK_%d"
        content = extract_fenced_code_blocks(docstring, fenced_code_blocks, placeholder)
        markdown = RDoc::Markup::ToMarkdown.new.convert(content).rstrip
        restore_fenced_code_blocks(markdown, fenced_code_blocks, placeholder)
      end

      private

      # Replaces fenced blocks with placeholders before RDoc conversion.
      #
      # @param docstring [String] Raw documentation text.
      # @param fenced_code_blocks [Array<String>] Destination for extracted blocks.
      # @param placeholder [String] Placeholder format string.
      # @return [String] Documentation with fenced blocks replaced.
      def extract_fenced_code_blocks(docstring, fenced_code_blocks, placeholder)
        docstring.gsub(/^```[^\n]*\n.*?^```[ \t]*$/m) do |block|
          format(placeholder, fenced_code_blocks.push(block).length - 1)
        end
      end

      # Restores fenced blocks after RDoc conversion.
      #
      # @param markdown [String] Converted Markdown text.
      # @param fenced_code_blocks [Array<String>] Extracted fenced blocks.
      # @param placeholder [String] Placeholder format string.
      # @return [String] Markdown with fenced blocks restored.
      def restore_fenced_code_blocks(markdown, fenced_code_blocks, placeholder)
        fenced_code_blocks.each_with_index.reduce(markdown) do |text, (block, index)|
          text.sub(format(placeholder, index), block)
        end
      end
    end
  end
end
