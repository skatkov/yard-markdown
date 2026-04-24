# frozen_string_literal: true

require 'pathname'
require 'rdoc'

include Helpers::ModuleHelper
include YARD::Markdown::AnchorComponentHelper
include YARD::Markdown::ArefHelper
include YARD::Markdown::DocumentationHelper
include YARD::Markdown::HeadingHelper
include YARD::Markdown::MethodPresentationHelper
include YARD::Markdown::ObjectListingHelper
include YARD::Markdown::SectionAssemblyHelper
include YARD::Markdown::TagFormattingHelper

def init
  sections :header,
           :relationships,
           :docstring_section,
           :tags_section,
           :constants_section,
           :attributes_section,
           :public_class_methods_section,
           :public_instance_methods_section
end

def run(opts = nil, sects = sections, start_at = 0, break_first = false, &block)
  output = super
  return output unless top_level_render?(sects, start_at, break_first)

  finalize_markdown(output, options.serializer.serialized_path(object))
end

def top_level_render?(sects, start_at, break_first)
  !break_first && start_at.zero? && sects == sections
end

def header
  render_section_content(heading_with_anchors("# #{object.type.to_s.capitalize} #{object.path}", object))
end

def relationships
  render_section_content(object_relationships(object))
end

def docstring_section
  render_section_content(rdoc_to_md(object.docstring))
end

def tags_section
  render_section_content(render_tags(object))
end

def constants_section
  constants = constant_listing(object).reject { |item| hidden_object?(item) }
  return '' unless constants.any?

  render_section_content(render_constants(constants, Array(object.groups)))
end

def attributes_section
  attrs = attr_listing(object).reject { |item| hidden_object?(item) }
  return '' unless attrs.any?

  render_section_content(render_attributes(attrs, Array(object.groups)))
end

def public_class_methods_section
  methods = public_class_methods(object)
  return '' unless methods.any?

  render_section_content(render_methods('Public Class Methods', methods, Array(object.groups)))
end

def public_instance_methods_section
  methods = public_instance_methods(object)
  return '' unless methods.any?

  render_section_content(render_methods('Public Instance Methods', methods, Array(object.groups)))
end

def render_section_content(content)
  text = content.to_s.strip
  return '' if text.empty?

  "#{text}\n\n"
end

def object_relationships(object)
  lines = []

  lines << "**Inherits:** `#{object.superclass.path}`" if object.is_a?(CodeObjects::ClassObject) && object.superclass

  [[:class, 'Extended by'], [:instance, 'Includes']].each do |scope, label|
    mixins = run_verifier(object.mixins(scope)).sort_by { |item| item.path }
    next if mixins.empty?

    lines << "**#{label}:** #{mixins.map { |mixin| "`#{mixin.path}`" }.join(', ')}"
  end

  lines.join("\n")
end

def render_constants(constants, group_order)
  lines = ['## Constants']
  grouped_constants = grouped_items(constants.sort_by { |item| item.name.to_s }, group_order)
  uses_groups = grouped_constants.any? { |name, _items| !name.nil? }

  grouped_constants.each do |group_name, items|
    if uses_groups
      lines << "### #{group_name || 'General'}"
      item_heading = '####'
    else
      item_heading = '###'
    end

    items.each_with_index do |item, index|
      lines << '' if index.positive?
      lines << heading_with_anchors("#{item_heading} `#{item.name(false)}`", item)
      append_lines(lines, documented_text(item), separated: false)
      append_lines(lines, render_tags(item), separated: false)
    end
  end

  lines.join("\n")
end

def render_attributes(attrs, group_order)
  lines = ['## Attributes']
  grouped_attrs = grouped_items(attrs, group_order)
  uses_groups = grouped_attrs.any? { |name, _items| !name.nil? }

  grouped_attrs.each do |group_name, items|
    if uses_groups
      lines << "### #{group_name || 'General'}"
      item_heading = '####'
    else
      item_heading = '###'
    end

    items.each_with_index do |item, index|
      lines << '' if index.positive?
      lines << heading_with_anchors("#{item_heading} `#{item.name(false)}` [#{attribute_access(item)}]", item)
      append_lines(lines, documented_text(item), separated: false)
      append_lines(lines, render_tags(item), separated: false)
    end
  end

  lines.join("\n")
end

def render_methods(section_title, methods, group_order)
  lines = ["## #{section_title}"]
  grouped_methods = grouped_items(methods, group_order)
  uses_groups = grouped_methods.any? { |name, _items| !name.nil? }

  grouped_methods.each do |group_name, items|
    if uses_groups
      lines << "### #{group_name || 'General'}"
      item_heading = '####'
    else
      item_heading = '###'
    end

    items.each_with_index do |item, index|
      lines << '' if index.positive?
      lines << heading_with_anchors("#{item_heading} `#{formatted_method_heading(item)}`", item)
      append_lines(lines, documented_text(item), separated: false)
      append_lines(lines, render_tags(item), separated: false)
    end
  end

  lines.join("\n")
end

def finalize_markdown(content, current_path)
  output = content.is_a?(Array) ? content.join("\n") : content.to_s
  output = output.lines.map(&:rstrip).join("\n")
  output = normalize_local_links(output, current_path)
  output = normalize_malformed_local_links(output)
  output = output.gsub(/\n{3,}/, "\n\n").strip
  "#{output}\n"
end

def normalize_local_links(markdown, current_path)
  current_dir = Pathname.new(current_path).dirname

  markdown.gsub(%r{\[(.+?)\]\((?!https?://|mailto:|#)([^)\n]+)\)}) do
    label = Regexp.last_match(1)
    target = Regexp.last_match(2)
    path = target.sub(/[?#].*\z/, '')
    suffix = target[path.length..] || ''
    rewritten_path = resolve_local_link_target(path, current_dir)

    if rewritten_path.nil?
      "`#{label.tr('`', '')}`"
    else
      "[#{label}](#{rewritten_path}#{suffix})"
    end
  end
end

def resolve_registry_object(path, current_dir)
  cleaned = path.to_s.sub(%r{\A(?:\.\./)+}, '').delete_prefix('./').delete_prefix('/')
  candidates = [path.to_s, path.to_s.tr('/', '::')]

  if constant_reference_path?(cleaned)
    current_parts = current_dir.to_s.split('/').reject { |part| part.empty? || part == '.' }
    target_parts = cleaned.split(%r{::|/})

    current_parts.length.downto(0) do |depth|
      candidates << (current_parts.first(depth) + target_parts).join('::')
    end
  end

  candidates.uniq.each do |candidate|
    obj = Registry.at(candidate)
    return obj if obj && obj.name != :root
  end

  nil
end

def resolve_local_link_target(path, current_dir)
  normalized = path.to_s.delete_prefix('./')
  normalized = normalized.delete_prefix('/')

  obj = resolve_registry_object(normalized, current_dir)
  if obj
    object_path = options.serializer.serialized_path(obj)
    return relative_output_path(current_dir, Pathname.new(object_path).cleanpath)
  end

  if normalized.end_with?('.html')
    normalized = normalized.sub(/\.html\z/i, '.md')
  elsif File.extname(normalized).empty?
    return nil if unresolved_identifier_target?(normalized)

    normalized = "#{normalized}.md" if normalized.include?('/')
  end

  relative_output_path(current_dir, Pathname.new(normalized).cleanpath)
end

def constant_reference_path?(value)
  parts = value.to_s.split(%r{::|/}).reject(&:empty?)
  return false if parts.empty?

  parts.all? { |part| part.match?(/\A[A-Z]\w*\z/) }
end

def unresolved_identifier_target?(path)
  cleaned = path.to_s.sub(%r{\A(?:\.\./)+}, '').delete_prefix('./')
  return false if cleaned.include?('/') || !File.extname(cleaned).empty?
  return true if cleaned.start_with?(':') || cleaned.match?(/\A\d/)

  cleaned.match?(/\A[a-z_]\w*\z/)
end

def relative_output_path(current_dir, target_path)
  target = target_path.to_s
  return target if target.start_with?('../')

  Pathname.new(target).relative_path_from(current_dir).to_s
rescue StandardError
  target
end

def normalize_malformed_local_links(markdown)
  markdown.gsub(%r{\[([^\]]+)\]\((?!https?://|mailto:|#)([^)\n]*['"][^)\n]*)\)}, '`\1`')
end
