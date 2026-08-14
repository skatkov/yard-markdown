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

  def test_only_relaxes_links_in_copied_files
    Dir.mktmpdir do |dir|
      File.write(File.join(dir, "COPY.md"), "[Upstream](missing.html)\n")
      File.write(File.join(dir, "Fish.md"), "[Generated](missing.html)\n")
      validator = MarkdownValidator.new(dir, relaxed_files: ["COPY.md"])

      error = assert_raises(MarkdownValidator::ValidationError) { validator.validate! }

      assert_equal "local .html link found in Fish.md", error.message
      assert_equal 1, validator.unresolved_links
    end
  end
end
