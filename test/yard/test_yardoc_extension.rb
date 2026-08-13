# frozen_string_literal: true

require "fileutils"
require "tmpdir"
require "test_helper"

class YARD::TestYardocExtension < Minitest::Test
  cover YARD::Markdown::YardocExtension

  def test_discovers_markdown_files_and_deduplicates_files_yard_already_found
    Dir.mktmpdir do |dir|
      FileUtils.mkdir_p(File.join(dir, "docs"))
      FileUtils.mkdir_p(File.join(dir, "output"))
      File.write(File.join(dir, "README.md"), "# Readme\n")
      File.write(File.join(dir, "docs", "CHANGELOG.MARKDOWN"), "# Changelog\n")
      File.write(File.join(dir, "notes.txt"), "Not Markdown\n")
      File.write(File.join(dir, "output", "Generated.md"), "# Generated\n")

      yardoc = YARD::CLI::Yardoc.new
      parsed = Dir.chdir(dir) { yardoc.parse_arguments("--format", "markdown", "--output-dir", "output") }
      Dir.chdir(dir) { yardoc.run(nil) }

      assert parsed
      assert_equal ["README.md", "docs/CHANGELOG.MARKDOWN"], yardoc.options.files.map(&:filename).sort
      assert File.file?(File.join(dir, "output", "index.csv"))
    end
  end

  def test_does_not_change_other_output_formats
    Dir.mktmpdir do |dir|
      File.write(File.join(dir, "CHANGELOG.md"), "# Changelog\n")

      yardoc = YARD::CLI::Yardoc.new
      parsed = Dir.chdir(dir) { yardoc.parse_arguments("--format", "html") }
      Dir.chdir(dir) { yardoc.run(nil) }

      assert parsed
      assert_empty yardoc.options.files
    end
  end

  def test_discovers_markdown_files_under_explicit_directory_roots
    Dir.mktmpdir do |dir|
      FileUtils.mkdir_p(File.join(dir, "docs"))
      File.write(File.join(dir, "ROOT.md"), "# Root\n")
      File.write(File.join(dir, "docs", "GUIDE.md"), "# Guide\n")

      yardoc = YARD::CLI::Yardoc.new
      parsed = Dir.chdir(dir) { yardoc.parse_arguments("--format", "markdown", "docs") }
      Dir.chdir(dir) { yardoc.run(nil) }

      assert parsed
      assert_equal ["docs/GUIDE.md"], yardoc.options.files.map(&:filename)
    end
  end
end
