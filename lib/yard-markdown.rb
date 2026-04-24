# frozen_string_literal: true

require "yard"
require_relative "yard/markdown/anchor_component_helper"
require_relative "yard/markdown/aref_helper"
require_relative "yard/markdown/tag_formatting_helper"

module YARD
  module Markdown
  end
end

YARD::Templates::Engine.register_template_path File.dirname(__FILE__) + "/../templates"
