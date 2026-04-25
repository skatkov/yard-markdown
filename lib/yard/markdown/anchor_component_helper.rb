# frozen_string_literal: true

# Namespace for YARD extensions used by this gem.
module YARD
  # Shared helpers for rendering YARD objects as Markdown.
  module Markdown
    # Builds anchor-safe identifier fragments from arbitrary values.
    module AnchorComponentHelper
      # Encodes a value so it can be embedded safely in an HTML anchor id.
      #
      # @param value [#to_s] Raw anchor fragment to encode.
      # @return [String] Anchor-safe identifier fragment.
      def anchor_component(value)
        value.to_s.each_char.map do |char|
          char.match?(/[A-Za-z0-9_-]/) ? char : format('-%X', char.ord)
        end.join
      end
    end
  end
end
