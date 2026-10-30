# frozen_string_literal: true

require "csv"
require "commonmarker"
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
      File.write(File.join(dir, "lib", "fish.rb"), <<~RUBY)
        # See [README](README) and [changelog](docs/CHANGELOG.html).
        class Fish
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
      assert_equal "# Readme\n\nPreserved exactly.", File.binread(File.join(output_dir, "README.md"))
      assert_equal "# Changelog\n", File.binread(File.join(output_dir, "docs", "CHANGELOG.MARKDOWN"))
      assert_includes File.read(fish_path), "[README](README.md) and [changelog](docs/CHANGELOG.MARKDOWN)"
      assert_false File.exist?(File.join(output_dir, "notes.txt"))

      index = File.binread(File.join(output_dir, "index.csv"))
      rows = CSV.parse(index, headers: true)
        .map { |row| row.to_h.values_at("name", "type", "path") }

      assert_includes rows, ["README.md", "File", "README.md"]
      assert_includes rows, ["docs/CHANGELOG.MARKDOWN", "File", "docs/CHANGELOG.MARKDOWN"]
      assert_includes rows, ["docs/README.md", "File", "docs/README.md"]
      assert_includes rows, ["Fish", "Class", "Fish.md"]

      File.utime(Time.at(1), Time.at(1), fish_path)
      fish_mtime = File.mtime(fish_path)

      stdout, stderr, status = Open3.capture3(*command, chdir: dir)

      assert_true status.success?, [stdout, stderr].reject(&:empty?).join("\n")
      assert_equal fish_mtime, File.mtime(fish_path)

      assert_equal index, File.binread(File.join(output_dir, "index.csv"))
    end
  end

  def test_yardoc_renders_and_indexes_visible_method_aliases
    Dir.mktmpdir do |dir|
      source = File.join(dir, "aliases.rb")
      output_dir = File.join(dir, "doc")
      File.write(source, <<~RUBY)
        class Dictionary
          # Checks a key.
          def key?(key); end
          alias has_key? key?
          alias_method :include?, :key?
          alias hidden key? # :nodoc:
          # :nodoc:
          alias hidden_comment key?
          # @private
          alias internal key?
          alias secret key?
          private :secret
          alias guarded key?
          protected :guarded

          def self.load(value); end
          class << self
            alias restore load
          end
        end

        module Functions
          # Runs an operation.
          def run; end
          alias execute run
          module_function :run
        end
      RUBY
      stdout, stderr, status = Open3.capture3(
        "bundle", "exec", "yardoc", "--no-stats", "--quiet", "--no-yardopts",
        "--format", "markdown", "--load", PLUGIN_PATH, "--query", "!@private",
        "--output-dir", output_dir, source, chdir: dir
      )

      assert_true status.success?, [stdout, stderr].reject(&:empty?).join("\n")

      markdown = File.read(File.join(output_dir, "Dictionary.md"))
      assert_includes markdown, <<~MARKDOWN.chomp
        ### `key?(key)` <a id="method-i-key-3F"></a> <a id="key?-instance_method"></a>
        Also known as: [`has_key?`](#method-i-has_key-3F), [`include?`](#method-i-include-3F)

        Checks a key.
      MARKDOWN
      assert_includes markdown, "### `has_key?(key)`"
      assert_includes markdown, "### `restore(value)`"
      assert_includes markdown, "Also known as: [`restore`](#method-c-restore)"
      assert_includes markdown, "Alias for: [`load`](#method-c-load)"

      rows = CSV.read(File.join(output_dir, "index.csv"), headers: true).map { |row| row.to_h.values_at("name", "type", "path") }
      assert_includes rows, ["Dictionary.has_key?", "Method", "Dictionary.md#method-i-has_key-3F"]
      assert_includes rows, ["Dictionary.restore", "Method", "Dictionary.md#method-c-restore"]
      %w[hidden hidden_comment internal secret guarded].each do |name|
        refute_includes markdown, name
        refute_includes rows.map(&:first), "Dictionary.#{name}"
      end

      refute_includes File.read(File.join(output_dir, "Functions.md")), "Also known as:"

      html = Commonmarker.to_html(markdown, options: {render: {unsafe: true}})
      markdown.scan(/\]\(#([^)]+)\)/).flatten.each do |anchor|
        assert_includes html, %(id="#{anchor}")
      end
    end
  end
end
