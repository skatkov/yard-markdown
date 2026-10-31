# frozen_string_literal: true

require "csv"
require "commonmarker"
require "fileutils"
require "open3"
require "tmpdir"
require "test_helper"

class YARD::TestFullDocumentGeneration < Minitest::Test
  PLUGIN_PATH = File.expand_path("../../lib/yard-markdown.rb", __dir__)

  def test_yardoc_copies_and_indexes_markdown_files_and_method_aliases
    Dir.mktmpdir do |dir|
      output_dir = File.join(dir, "doc")
      FileUtils.mkdir_p(File.join(dir, "lib"))
      FileUtils.mkdir_p(File.join(dir, "docs"))
      File.write(File.join(dir, "lib", "fish.rb"), <<~RUBY)
        # See [README](README) and [changelog](docs/CHANGELOG.html).
        class Fish
          def swim(speed); end
          alias paddle swim
          alias hidden swim # :nodoc:
        end
      RUBY
      File.binwrite(File.join(dir, "README.md"), "# Readme\n\nPreserved exactly.")
      File.binwrite(File.join(dir, "docs", "CHANGELOG.MARKDOWN"), "# Changelog\n")
      File.binwrite(File.join(dir, "docs", "README.md"), "# Docs readme\n")
      File.write(File.join(dir, "notes.txt"), "Not Markdown\n")

      command = [
        "bundle", "exec", "yardoc",
        "--no-stats", "--quiet", "--use-cache",
        "--format", "markdown",
        "--load", PLUGIN_PATH,
        "--output-dir", output_dir,
        "."
      ]
      stdout, stderr, status = Open3.capture3(*command, chdir: dir)

      assert_true status.success?, [stdout, stderr].reject(&:empty?).join("\n")

      fish_path = File.join(output_dir, "Fish.md")
      markdown = File.read(fish_path)
      assert_equal "# Readme\n\nPreserved exactly.", File.binread(File.join(output_dir, "README.md"))
      assert_equal "# Changelog\n", File.binread(File.join(output_dir, "docs", "CHANGELOG.MARKDOWN"))
      assert_includes markdown, "[README](README.md) and [changelog](docs/CHANGELOG.MARKDOWN)"
      assert_includes markdown, "### `paddle(speed)`"
      assert_includes markdown, "Also known as: [`paddle`](#method-i-paddle)"
      assert_includes markdown, "Alias for: [`swim`](#method-i-swim)"
      refute_includes markdown, "hidden"
      assert_false File.exist?(File.join(output_dir, "notes.txt"))

      index = File.binread(File.join(output_dir, "index.csv"))
      rows = CSV.parse(index, headers: true)
        .map { |row| row.to_h.values_at("name", "type", "path") }

      assert_includes rows, ["README.md", "File", "README.md"]
      assert_includes rows, ["docs/CHANGELOG.MARKDOWN", "File", "docs/CHANGELOG.MARKDOWN"]
      assert_includes rows, ["docs/README.md", "File", "docs/README.md"]
      assert_includes rows, ["Fish", "Class", "Fish.md"]
      assert_includes rows, ["Fish.paddle", "Method", "Fish.md#method-i-paddle"]
      refute_includes rows.map(&:first), "Fish.hidden"

      html = Commonmarker.to_html(markdown, options: {render: {unsafe: true}})
      markdown.scan(/\]\(#([^)]+)\)/).flatten.each do |anchor|
        assert_includes html, %(id="#{anchor}")
      end

      File.utime(Time.at(1), Time.at(1), fish_path)
      fish_mtime = File.mtime(fish_path)

      stdout, stderr, status = Open3.capture3(*command, chdir: dir)

      assert_true status.success?, [stdout, stderr].reject(&:empty?).join("\n")
      assert_equal fish_mtime, File.mtime(fish_path)

      assert_equal index, File.binread(File.join(output_dir, "index.csv"))
    end
  end
end
