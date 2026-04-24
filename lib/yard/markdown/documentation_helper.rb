# frozen_string_literal: true

require 'rdoc'

module YARD
  module Markdown
    module DocumentationHelper
      def documented_text(object)
        text = rdoc_to_md(object.docstring)
        return text unless text.empty?
        return '' unless object.tags.empty?

        'Not documented.'
      end

      def rdoc_to_md(docstring)
        RDoc::Markup::ToMarkdown.new.convert(docstring).rstrip
      end
    end
  end
end
