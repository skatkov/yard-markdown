# frozen_string_literal: true

module YARD
  module Serializers
    class MarkdownSerializer < YARD::Serializers::FileSystemSerializer
      def initialize(opts = {})
        super(opts.merge(extension: "md"))
      end
    end
  end
end
