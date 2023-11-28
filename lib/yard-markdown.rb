# frozen_string_literal: true

require "yard"

module YARD
  module Markdown
  end
end

YARD::Templates::Engine.register_template_path File.dirname(__FILE__) + '/../templates'
