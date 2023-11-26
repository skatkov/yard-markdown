# frozen_string_literal: true

dir = File.dirname(__FILE__)
$LOAD_PATH.unshift dir unless $LOAD_PATH.include?(dir)

require "yard"
require_relative "markdown/version"

module YARD
  module Markdown
  end
end

puts "YARD::Markdown loaded"
YARD::Templates::Engine.register_template_path dir + '/../templates'
