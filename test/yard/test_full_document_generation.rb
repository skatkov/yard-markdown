# frozen_string_literal: true

require "csv"
require "fileutils"
require "open3"
require "tmpdir"
require "test_helper"

class YARD::TestFullDocumentGeneration < Minitest::Test
  PLUGIN_PATH = File.expand_path("../../lib/yard-markdown.rb", __dir__)

  def test_yardoc_detects_copies_and_indexes_markdown_files
    Dir.mktmpdir do |dir|
      output_dir = File.join(dir, "doc")
      FileUtils.mkdir_p(File.join(dir, "lib"))
      FileUtils.mkdir_p(File.join(dir, "docs"))
      File.write(File.join(dir, "lib", "fish.rb"), "class Fish\nend\n")
      File.binwrite(File.join(dir, "README.md"), "# Readme\n\nPreserved exactly.")
      File.binwrite(File.join(dir, "docs", "CHANGELOG.MARKDOWN"), "# Changelog\n")
      File.write(File.join(dir, "notes.txt"), "Not Markdown\n")

      stdout, stderr, status = Open3.capture3(
        "bundle", "exec", "yardoc",
        "--no-stats", "--quiet", "--no-save",
        "--format", "markdown",
        "--load", PLUGIN_PATH,
        "--output-dir", output_dir,
        ".",
        chdir: dir
      )

      assert status.success?, [stdout, stderr].reject(&:empty?).join("\n")
      assert_equal "# Readme\n\nPreserved exactly.", File.binread(File.join(output_dir, "README.md"))
      assert_equal "# Changelog\n", File.binread(File.join(output_dir, "docs", "CHANGELOG.MARKDOWN"))
      refute File.exist?(File.join(output_dir, "notes.txt"))

      rows = CSV.read(File.join(output_dir, "index.csv"), headers: true)
        .map { |row| row.to_h.values_at("name", "type", "path") }

      assert_includes rows, ["README", "File", "README.md"]
      assert_includes rows, ["CHANGELOG", "File", "docs/CHANGELOG.MARKDOWN"]
      assert_includes rows, ["Fish", "Class", "Fish.md"]
    end
  end
end
