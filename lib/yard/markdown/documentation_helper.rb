# frozen_string_literal: true

require 'rdoc'

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
        return '' unless object.tags.empty?

        'Not documented.'
      end

      # Converts an RDoc-formatted docstring to Markdown.
      #
      # @param docstring [#to_s] Raw docstring content.
      # @return [String] Markdown-rendered docstring content.
      def rdoc_to_md(docstring)
        RDoc::Markup::ToMarkdown.new.convert(docstring).rstrip
      end
    end
  end
end
