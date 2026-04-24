# frozen_string_literal: true

module YARD
  module Markdown
    module AnchorComponentHelper
      def anchor_component(value)
        value.to_s.each_char.map do |char|
          char.match?(/[A-Za-z0-9_-]/) ? char : format('-%X', char.ord)
        end.join
      end
    end
  end
end
