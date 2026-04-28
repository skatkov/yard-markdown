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
        return "" unless object.tags.empty?

        "Not documented."
      end

      # Converts an RDoc-formatted docstring to Markdown.
      #
      # @param docstring [Object] Raw docstring content.
      # @return [String] Markdown-rendered docstring content.
      def rdoc_to_md(docstring)
        fenced_code_blocks = []
        placeholder = "YARD_MARKDOWN_FENCED_CODE_BLOCK_%d"
        content = docstring.gsub(/^```[^\n]*\n.*?^```[ \t]*$/m) do |block|
          fenced_code_blocks << block
          format(placeholder, fenced_code_blocks.length - 1)
        end

        markdown = RDoc::Markup::ToMarkdown.new.convert(content).rstrip
        fenced_code_blocks.each_with_index do |block, index|
          markdown = markdown.sub(format(placeholder, index), block)
        end

        markdown
      end
    end
  end
end
