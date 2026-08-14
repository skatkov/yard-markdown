# frozen_string_literal: true

require "tmpdir"
require "test_helper"
require_relative "markdown_validator"

class TestMarkdownValidator < Minitest::Test
  def test_validates_case_insensitive_markdown_extensions
    Dir.mktmpdir do |dir|
      File.write(File.join(dir, "README.MARKDOWN"), "# Readme\n")

      assert_equal 1, MarkdownValidator.new(dir).validate!
    end
  end
end
