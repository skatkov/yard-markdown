# frozen_string_literal: true

require 'pathname'
require 'rdoc'

include Helpers::ModuleHelper
include YARD::Markdown::AnchorComponentHelper
include YARD::Markdown::ArefHelper
include YARD::Markdown::DocumentationHelper
include YARD::Markdown::HeadingHelper
include YARD::Markdown::LinkNormalizationHelper
include YARD::Markdown::MethodPresentationHelper
include YARD::Markdown::ObjectListingHelper
include YARD::Markdown::RelationshipSectionHelper
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
