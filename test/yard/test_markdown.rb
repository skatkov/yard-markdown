# frozen_string_literal: true

require 'test_helper'
require 'csv'
require 'tmpdir'

require_relative '../support/markdown_validator'

class YARD::TestMarkdown < Minitest::Test
  ROOT = File.expand_path('../..', __dir__)

  def test_generates_markdown_for_yard_source
    with_generated_docs('example_yard.rb') do |output_dir|
      assert_equal true, MarkdownValidator.new(output_dir).validate!.positive?

      salmon = File.read(File.join(output_dir, 'Salmon.md'))

      assert_includes salmon, '# Class Salmon'
      assert_includes salmon, '<a id="method-i-sustainable-3F"></a>'
      assert_includes salmon, '## Public Instance Methods'
      refute_includes salmon, '#Instance Methods'
      refute_includes salmon, '[](#'

      index_rows = CSV.read(File.join(output_dir, 'index.csv'), headers: true)
      refute(index_rows.any? { |row| row['name'] == 'Fish.DEFAULT_SALMON_SPEED' })
      assert(index_rows.any? { |row| row['name'] == 'Salmon.MAX_SPEED' })
    end
  end

  def test_generates_markdown_for_rdoc_style_source
    with_generated_docs('example_rdoc.rb') do |output_dir|
      assert_equal true, MarkdownValidator.new(output_dir).validate!.positive?

      bird = File.read(File.join(output_dir, 'Bird.md'))
      refute_includes bird, '_fly_impl(_direction, _velocity)'
      assert_includes bird, '### `fly(direction, velocity)`'
    end
  end

  def test_index_links_point_to_existing_anchors
    with_generated_docs('example_yard.rb') do |output_dir|
      CSV.foreach(File.join(output_dir, 'index.csv'), headers: true) do |row|
        path = row['path']
        file_name, anchor = path.split('#', 2)
        full_path = File.join(output_dir, file_name)

        assert File.file?(full_path), "missing file for #{path}"
        next unless anchor

        content = File.read(full_path)
        assert_includes content, "<a id=\"#{anchor}\"></a>", "missing anchor #{anchor} in #{file_name}"
      end
    end
  end

  def test_protected_and_private_visibility_flags_affect_output
    with_generated_docs('test/example/visibility_example.rb', '--protected', '--private') do |output_dir|
      visibility = File.read(File.join(output_dir, 'VisibilityExample.md'))

      assert_includes visibility, '## Public Instance Methods'
      assert_includes visibility, '### `public_api()`'
      assert_includes visibility, '## Protected Instance Methods'
      assert_includes visibility, '### `protected_api()`'
      assert_includes visibility, '## Private Instance Methods'
      assert_includes visibility, '### `private_api()`'
    end
  end

  def test_no_private_flag_hides_private_tagged_objects
    with_generated_docs('test/example/visibility_example.rb', '--private', '--no-private') do |output_dir|
      visibility = File.read(File.join(output_dir, 'VisibilityExample.md'))

      assert_includes visibility, '### `private_api()`'
      refute_includes visibility, '### `private_tagged_api()`'
      refute_includes visibility, 'INTERNAL_TOKEN'

      index_rows = CSV.read(File.join(output_dir, 'index.csv'), headers: true)
      names = index_rows.map { |row| row['name'] }
      assert_includes names, 'VisibilityExample.private_api'
      refute_includes names, 'VisibilityExample.private_tagged_api'
      refute_includes names, 'VisibilityExample.INTERNAL_TOKEN'
    end
  end

  private

  def with_generated_docs(source_file, *extra_args)
    Dir.mktmpdir('yard-markdown-test') do |output_dir|
      YARD::Registry.clear

      result = YARD::CLI::Yardoc.run(
        '--no-stats',
        '--quiet',
        '--format',
        'markdown',
        '--load',
        "#{ROOT}/lib/yard-markdown.rb",
        '--output-dir',
        output_dir,
        *extra_args,
        "#{ROOT}/#{source_file}"
      )

      assert_equal true, result
      yield output_dir
    end
  end
end
