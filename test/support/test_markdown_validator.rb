# frozen_string_literal: true

require "tmpdir"
require "fileutils"
require "test_helper"
require_relative "markdown_validator"

# Tests MarkdownValidator's filesystem and relaxed-link behavior.
class TestMarkdownValidator < Minitest::Test
  def teardown
    FileUtils.remove_entry(dir)
  end

  def test_validates_case_insensitive_markdown_extensions
    write_markdown("README.MARKDOWN" => "# Readme\n")

    assert_equal 1, MarkdownValidator.new(dir).validate
  end

  def test_only_relaxes_links_in_copied_files
    write_markdown("COPY.md" => "[Upstream](missing.html)\n", "Fish.md" => "[Generated](missing.html)\n")
    validator = MarkdownValidator.new(dir, relaxed_files: ["COPY.md"])

    error = assert_raises(MarkdownValidator::ValidationError) { validator.validate }

    assert_equal ["local .html link found in Fish.md", 1], [error.message, validator.unresolved_links]
  end

  private

  def dir
    @dir ||= Dir.mktmpdir
  end

  def write_markdown(files)
    files.each do |name, content|
      File.write(File.join(dir, name), content)
    end
  end
end
