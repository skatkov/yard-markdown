# frozen_string_literal: true

unless ENV["MUTANT"] || defined?(Mutant)
  require "simplecov"
  SimpleCov.start
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "yard-markdown"

require "minitest/autorun"
require "minitest/strict"
require "mutant/minitest/coverage"
