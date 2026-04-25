# frozen_string_literal: true

require 'pathname'
require 'rdoc'

include Helpers::ModuleHelper
include YARD::Markdown::AnchorComponentHelper
include YARD::Markdown::ArefHelper
include YARD::Markdown::CollectionRenderingHelper
include YARD::Markdown::DocumentationHelper
include YARD::Markdown::HeadingHelper
include YARD::Markdown::LinkNormalizationHelper
include YARD::Markdown::MethodPresentationHelper
include YARD::Markdown::ObjectListingHelper
include YARD::Markdown::RelationshipSectionHelper
include YARD::Markdown::SectionAssemblyHelper
include YARD::Markdown::TagFormattingHelper

# Registers the sections rendered for a namespace markdown page.
#
# @return [void]
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

# Renders the template and normalizes markdown for top-level page output.
#
# @param opts [Hash, nil] Template options passed through to the base template.
# @option opts [YARD::CodeObjects::NamespaceObject] :object Object being rendered.
# @param sects [Array<Symbol>] Section names to render.
# @param start_at [Integer] Starting index within `sects`.
# @param break_first [Boolean] Whether rendering stops after the first section.
# @yield Optional block forwarded to the base template renderer.
# @return [String] Rendered markdown output.
def run(opts = nil, sects = sections, start_at = 0, break_first = false, &block)
  output = super
  return output unless top_level_render?(sects, start_at, break_first)

  finalize_markdown(output, options.serializer.serialized_path(object))
end

# Returns whether this invocation is rendering the full top-level page.
#
# @param sects [Array<Symbol>] Section names requested for rendering.
# @param start_at [Integer] Starting index within `sects`.
# @param break_first [Boolean] Whether rendering stops after the first section.
# @return [Boolean] True when the whole page is being rendered in one pass.
def top_level_render?(sects, start_at, break_first)
  !break_first && start_at.zero? && sects == sections
end

# Renders the page heading for the current object.
#
# @return [String] Markdown heading section.
def header
  render_section_content(heading_with_anchors("# #{object.type.to_s.capitalize} #{object.path}", object))
end

# Renders inheritance and mixin relationships for the current object.
#
# @return [String] Markdown relationships section.
def relationships
  render_section_content(object_relationships(object))
end

# Renders the object's docstring as markdown.
#
# @return [String] Markdown docstring section.
def docstring_section
  render_section_content(rdoc_to_md(object.docstring))
end

# Renders the object's YARD tags.
#
# @return [String] Markdown tags section.
def tags_section
  render_section_content(render_tags(object))
end

# Renders the constants section when visible constants are present.
#
# @return [String] Markdown constants section, or an empty string.
def constants_section
  constants = constant_listing(object).reject { |item| hidden_object?(item) }
  return '' unless constants.any?

  render_section_content(render_constants(constants, Array(object.groups)))
end

# Renders the attributes section when visible attributes are present.
#
# @return [String] Markdown attributes section, or an empty string.
def attributes_section
  attrs = attr_listing(object).reject { |item| hidden_object?(item) }
  return '' unless attrs.any?

  render_section_content(render_attributes(attrs, Array(object.groups)))
end

# Renders the public class methods section when methods are present.
#
# @return [String] Markdown public class methods section, or an empty string.
def public_class_methods_section
  methods = public_class_methods(object)
  return '' unless methods.any?

  render_section_content(render_methods('Public Class Methods', methods, Array(object.groups)))
end

# Renders the public instance methods section when methods are present.
#
# @return [String] Markdown public instance methods section, or an empty string.
def public_instance_methods_section
  methods = public_instance_methods(object)
  return '' unless methods.any?

  render_section_content(render_methods('Public Instance Methods', methods, Array(object.groups)))
end
