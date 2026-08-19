# frozen_string_literal: true

require "cgi"
require "commonmarker"
require_relative "../../lib/yard/markdown"

# Validates generated Markdown syntax, local links, and heading anchors.
class MarkdownValidator
  # Raised when generated Markdown is invalid.
  class ValidationError < StandardError
  end

  LOCAL_LINK_REGEX = %r{\]\((?!https?://|mailto:|#)([^)]+)\)}
  LOCAL_HTML_LINK_REGEX = %r{\]\((?!https?://|mailto:|#)[^)]+\.html(?:[?#][^)]+)?\)}
  GFM_EXTENSIONS = %i[table strikethrough autolink tagfilter tasklist].freeze

  attr_reader :unresolved_links

  def initialize(root_dir, relaxed_files: [])
    @root_dir = File.expand_path(root_dir)
    @anchors_cache = {}
    @relaxed_files = relaxed_files.map { |file| File.expand_path(file, @root_dir) }
    @unresolved_links = 0
  end

  def validate
    files = Dir[File.join(@root_dir, "**/*")].grep(YARD::Markdown::FILE_PATTERN).sort
    raise ValidationError, "No markdown files found in #{@root_dir}" if files.empty?

    files.each { |file| validate_file(file) }
    files.size
  end

  def self.github_slug(heading)
    CGI.unescapeHTML(heading.gsub(/`([^`]*)`/, '\\1').gsub(/\[([^\]]+)\]\([^)]+\)/, '\\1').gsub(/<[^>]+>/, ""))
      .downcase
      .gsub(/[^a-z0-9\- _]/, "")
      .tr(" ", "-")
      .squeeze("-")
      .gsub(/\A-+|-+\z/, "")
  end

  private

  def validate_file(file)
    content = File.read(file, encoding: Encoding::UTF_8)
    render_commonmark(content, file)
    render_gfm(content, file)
    validate_links(content, file)
  end

  def validate_links(markdown, file)
    path = relative_path(file)
    raise ValidationError, "local .html link found in #{path}" if markdown.match?(LOCAL_HTML_LINK_REGEX) && !@relaxed_files.include?(file)
    raise ValidationError, "empty anchor link found in #{path}" if markdown.include?("[](#")
    markdown.scan(LOCAL_LINK_REGEX).flatten.each do |target|
      validate_local_link(file, target)
    end
  end

  def validate_local_link(source_file, target)
    base_target = target.sub(/[?#].*\z/, "")
    target_file = if base_target.empty?
      source_file
    else
      File.expand_path(CGI.unescape(base_target), File.dirname(source_file))
    end

    return relax_or_raise(source_file, "broken local link in #{relative_path(source_file)} -> #{target.inspect}") unless within_root?(target_file) && File.file?(target_file)

    validate_anchor(source_file, target_file, target)
  end

  def validate_anchor(source_file, target_file, target)
    fragment = target[/#(.+)\z/, 1].to_s
    return if fragment.empty?
    anchor = CGI.unescape(fragment)
    return if anchors_for(target_file).include?(anchor)

    relax_or_raise(
      source_file,
      "missing anchor ##{anchor} in #{relative_path(target_file)} (from #{relative_path(source_file)})"
    )
  end

  def relax_or_raise(source_file, message)
    raise ValidationError, message unless @relaxed_files.include?(source_file)

    @unresolved_links += 1
  end

  def anchors_for(file)
    @anchors_cache[file] ||= anchors_in(File.read(file, encoding: Encoding::UTF_8))
  end

  def anchors_in(content)
    anchors = Set.new
    headings = Hash.new(0)
    content.each_line do |line|
      add_line_anchors(line, anchors, headings)
    end
    anchors
  end

  def add_line_anchors(line, anchors, headings)
    anchors.merge(line.scan(/<a\s+id="([^"]+)"/).flatten)
    add_heading_anchor(line, anchors, headings)
  end

  def add_heading_anchor(line, anchors, headings)
    slug = self.class.github_slug(line[/^\s{0,3}#+\s+(.+?)\s*$/, 1].to_s.sub(/\s+#+\s*\z/, ""))
    return if slug.empty?

    index = headings[slug]
    headings[slug] = index + 1
    anchors << [slug, index.nonzero?].compact.join("-")
  end

  def within_root?(path)
    expanded = File.expand_path(path)
    expanded == @root_dir || expanded.start_with?("#{@root_dir}/")
  end

  def render_gfm(content, file)
    options = {
      render: {github_pre_lang: true},
      extension: GFM_EXTENSIONS.each_with_object({}) { |ext, hash| hash[ext] = true }
    }

    Commonmarker.to_html(content, options: options)
  rescue => error
    raise ValidationError, "GFM render failed for #{relative_path(file)}: #{error.message}"
  end

  def render_commonmark(content, file)
    Commonmarker.to_html(content)
  rescue => error
    raise ValidationError, "CommonMark render failed for #{relative_path(file)}: #{error.message}"
  end

  def relative_path(path)
    Pathname.new(path).relative_path_from(Pathname.new(@root_dir)).to_s
  rescue
    path
  end
end
