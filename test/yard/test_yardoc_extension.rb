# frozen_string_literal: true

require "fileutils"
require "tmpdir"
require "test_helper"
require "commonmarker"

class YARD::TestYardocExtension < Minitest::Test
  cover YARD::Markdown::YardocExtension
  cover YARD::Markdown::MethodPresentationHelper
  cover YARD::Markdown::CollectionRenderingHelper
  cover YARD::Markdown::LinkNormalizationHelper

  def test_help_describes_the_source_option
    output = capture_subprocess_io do
      assert_raises(SystemExit) { YARD::CLI::Yardoc.new.parse_arguments("--help") }
    end.join

    assert_match(/--embed-source\s+Include method source in Markdown output\./, output)
  end

  def test_embeds_source_only_when_requested_and_preserves_code
    Dir.mktmpdir do |dir|
      File.write(File.join(dir, "fish.rb"), <<~RUBY)
        class Fish
          # Maximum speed.
          MAX_SPEED = 10

          # Current speed.
          attr_reader :speed

          # Builds a fish. See [Fish](Fish.html).
          # @return [Fish] a new fish
          def self.build
            new
          end

          # Returns Markdown text.
          def text
            <<~TEXT
        [Fish](Fish.html)\s\s


        ```
        ````
        ```
        TEXT
          end

          private

          def secret
            "never publish this"
          end
        end
      RUBY

      [[], ["--embed-source"]].each do |flags|
        YARD::Registry.clear
        yardoc = YARD::CLI::Yardoc.new
        Dir.chdir(dir) do
          yardoc.run("--no-save", "--no-stats", "--quiet", "--format", "markdown", *flags, "fish.rb")
        end
        markdown = File.read(File.join(dir, "doc", "Fish.md"))

        assert_includes markdown, "Builds a fish. See [Fish](Fish.md)."
        refute_includes markdown, "never publish this"
        if flags.empty?
          refute_includes markdown, "**Source**"
          refute_includes markdown, "def self.build"
        else
          assert_includes markdown, "- **@return** [Fish] a new fish\n\n**Source**\n\n```ruby\ndef self.build\n  new\nend\n```"
          refute_includes markdown, "def speed"
          assert_match(/^`````ruby\ndef text\n/, markdown)
          blocks = []
          Commonmarker.parse(markdown).walk do |node|
            blocks << [node.fence_info, node.string_content] if node.type == :code_block
          end
          assert_equal [
            ["ruby", "def self.build\n  new\nend\n"],
            ["ruby", "def text\n  <<~TEXT\n[Fish](Fish.html)  \n\n\n```\n````\n```\nTEXT\nend\n"]
          ], blocks
        end
      end
    end
  end

  def test_discovers_markdown_files_and_deduplicates_files_yard_already_found
    Dir.mktmpdir do |dir|
      FileUtils.mkdir_p(File.join(dir, "docs"))
      FileUtils.mkdir_p(File.join(dir, "IGNORED"))
      FileUtils.mkdir_p(File.join(dir, "output"))
      File.write(File.join(dir, "README.md"), "# Readme\n")
      File.write(File.join(dir, "docs", "CHANGELOG.MARKDOWN"), "# Changelog\n")
      File.write(File.join(dir, "docs", "_NAVIGATION.md"), "# Navigation\n")
      File.write(File.join(dir, "notes.txt"), "Not Markdown\n")
      File.write(File.join(dir, "IGNORED", "WEBSITE.md"), "# Website\n")
      File.write(File.join(dir, "output", "Generated.md"), "# Generated\n")

      yardoc = YARD::CLI::Yardoc.new
      Dir.chdir(dir) do
        yardoc.parse_arguments(
          "--no-save", "--no-stats", "--quiet", "--format", "markdown",
          "--exclude", "\\Aignored/", "--output-dir", "output"
        )
      end
      Dir.chdir(dir) { yardoc.run(nil) }

      assert_equal ["README.md", "docs/CHANGELOG.MARKDOWN"], yardoc.options.files.map(&:filename).sort
      assert_equal "md", yardoc.options.serializer.extension
      assert_true File.file?(File.join(dir, "output", "index.csv"))
    end
  end

  def test_does_not_change_other_output_formats
    Dir.mktmpdir do |dir|
      File.write(File.join(dir, "CHANGELOG.md"), "# Changelog\n")

      yardoc = YARD::CLI::Yardoc.new
      Dir.chdir(dir) { yardoc.parse_arguments("--no-save", "--no-stats", "--quiet", "--format", "html") }
      Dir.chdir(dir) { yardoc.run(nil) }

      assert_empty yardoc.options.files
      assert_equal "html", yardoc.options.serializer.extension
    end
  end

  def test_discovers_project_markdown_files_when_source_files_are_explicit
    Dir.mktmpdir do |dir|
      FileUtils.mkdir_p(File.join(dir, "lib"))
      File.write(File.join(dir, "ROOT.md"), "# Root\n")
      File.write(File.join(dir, "lib", "example.rb"), "class Example\nend\n")

      yardoc = YARD::CLI::Yardoc.new
      Dir.chdir(dir) do
        yardoc.parse_arguments("--no-save", "--no-stats", "--quiet", "--format", "markdown", "lib/**/*.rb")
      end
      Dir.chdir(dir) { yardoc.run(nil) }

      assert_equal ["ROOT.md"], yardoc.options.files.map(&:filename)
    end
  end
end
