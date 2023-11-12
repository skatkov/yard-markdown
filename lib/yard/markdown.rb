# frozen_string_literal: true

require 'yard'
require_relative "markdown/version"
require_relative "serializers/markdown_serializer"

module YARD
  module Markdown
    YARD::Templates::Engine.register_template_path "/../../templates"
  end
end
