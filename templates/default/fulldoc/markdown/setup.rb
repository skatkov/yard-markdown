# frozen_string_literal: true

require 'csv'
require 'pathname'
require 'rdoc'

include Helpers::ModuleHelper

def init
  options.objects = objects = run_verifier(options.objects).reject { |item| item.name == :root }

  options.delete(:objects)
  options.delete(:files)

  options.serializer.extension = 'md'

  objects.each do |object|
    Templates::Engine.with_serializer(object, options.serializer) { serialize(object) }
  rescue StandardError => e
    path = options.serializer.serialized_path(object)
    log.error "Exception occurred while generating '#{path}'"
    log.backtrace(e)
  end

  serialize_index(objects)
end

def serialize_index(objects)
  filepath = "#{options.serializer.basepath}/index.csv"

  CSV.open(filepath, 'wb') do |csv|
    csv << %w[name type path]

    objects.each do |object|
      next if object.name == :root

      if object.type == :class
        csv << [object.path, 'Class', options.serializer.serialized_path(object)]
      elsif object.type == :module
        csv << [object.path, 'Module', options.serializer.serialized_path(object)]
      end

      constants = constant_listing(object)
      if constants.size.positive?
        constants.each do |cnst|
          csv << [
            "#{object.path}.#{cnst.name(false)}",
            'Constant',
            (options.serializer.serialized_path(object) + '#' + aref(cnst))
          ]
        end
      end

      if (insmeths = public_instance_methods(object)).size > 0
        insmeths.each do |item|
          csv << [
            "#{object.path}.#{item.name(false)}",
            'Method',
            options.serializer.serialized_path(object) + '#' + aref(item)
          ]
        end
      end

      if (pubmeths = public_class_methods(object)).size > 0
        pubmeths.each do |item|
          csv << [
            "#{object.path}.#{item.name(false)}",
            'Method',
            options.serializer.serialized_path(object) + '#' + aref(item)
          ]
        end
      end

      next unless (attrs = attr_listing(object)).size > 0

      attrs.each do |item|
        csv << [
          "#{object.path}.#{item.name(false)}",
          'Attribute',
          options.serializer.serialized_path(object) + '#' + aref(item)
        ]
      end
    end
  end
end

def serialize(object)
  lines = []
  group_order = Array(object.groups)
  current_path = options.serializer.serialized_path(object)

  lines << heading_with_anchors("# #{object.type.to_s.capitalize} #{object.path}", object)

  append_lines(lines, object_relationships(object))
  append_lines(lines, rdoc_to_md(object.docstring))
  append_lines(lines, render_tags(object))

  constants = constant_listing(object).reject { |item| hidden_object?(item) }
  append_lines(lines, render_constants(constants, group_order)) if constants.any?

  attrs = attr_listing(object).reject { |item| hidden_object?(item) }
  append_lines(lines, render_attributes(attrs, group_order)) if attrs.any?

  class_methods = public_class_methods(object)
  append_lines(lines, render_methods('Public Class Methods', class_methods, group_order)) if class_methods.any?

  instance_methods = public_instance_methods(object)
  append_lines(lines, render_methods('Public Instance Methods', instance_methods, group_order)) if instance_methods.any?

  finalize_markdown(lines, current_path)
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

def formatted_method_heading(method_object)
  name = method_object.name(false).to_s
  signature = method_signature(method_object)
  signature = " #{signature}" if name.end_with?(']') && signature.start_with?('(')
  "#{name}#{signature}"
end

def method_signature(method_object)
  return '()' if method_object.parameters.nil? || method_object.parameters.empty?

  rendered = method_object.parameters.map do |name, default|
    default.nil? || default.empty? ? name : "#{name} = #{default}"
  end

  "(#{rendered.join(', ')})"
end

def attribute_access(attribute)
  info = attribute.attr_info || {}
  return 'RW' if info[:read] && info[:write]
  return 'R' if info[:read]
  return 'W' if info[:write]

  return 'RW' if attribute.reader? && attribute.writer?
  return 'R' if attribute.reader?

  'W'
end

def documented_text(object)
  text = rdoc_to_md(object.docstring)
  return text unless text.empty?
  return '' unless object.tags.empty?

  'Not documented.'
end

def rdoc_to_md(docstring)
  text = docstring.to_s
  return '' if text.strip.empty?

  RDoc::Markup::ToMarkdown.new.convert(text).to_s.strip
end

def render_tags(object)
  return '' if object.tags.empty?

  lines = []
  regular_tags = object.tags.reject { |tag| tag.tag_name == 'example' }
  example_tags = object.tags.select { |tag| tag.tag_name == 'example' }

  regular_tags.each do |tag|
    lines << "- #{format_tag(tag)}"
  end

  example_tags.each do |tag|
    lines << '' unless lines.empty?
    title = tag.name.to_s.strip.empty? ? '**@example**' : "**@example #{tag.name}**"
    lines << title
    lines << '```ruby'
    lines << tag.text.to_s.rstrip
    lines << '```'
  end

  lines.join("\n")
end

def format_tag(tag)
  parts = ["**@#{tag.tag_name}**"]
  parts << "`#{tag.name}`" unless tag.name.to_s.strip.empty?

  cleaned_types = Array(tag.types).map(&:to_s).map(&:strip).reject(&:empty?)
  parts << "[#{cleaned_types.join(', ')}]" unless cleaned_types.empty?
  parts << tag.text.to_s.strip unless tag.text.to_s.strip.empty?

  parts.join(' ')
end

def aref(object)
  type = object.type

  return "class-#{anchor_component(object.path.gsub('::', '-'))}" if type == :class
  return "module-#{anchor_component(object.path.gsub('::', '-'))}" if type == :module
  return "constant-#{anchor_component(object.name(false))}" if type == :constant
  return "classvariable-#{anchor_component(object.name(false))}" if type == :classvariable

  scope = object.scope == :class ? 'c' : 'i'

  if object.respond_to?(:attr_info) && !object.attr_info.nil?
    "attribute-#{scope}-#{anchor_component(object.name(false))}"
  else
    "method-#{scope}-#{anchor_component(object.name(false))}"
  end
end

def legacy_aref(object)
  type = object.type

  return "#{object.name(false)}-constant" if type == :constant
  return "#{object.name(false)}-classvariable" if type == :classvariable
  return nil unless object.respond_to?(:scope)

  return "#{object.name(false)}-class_method" if object.scope == :class
  return "#{object.name(false)}-instance_method" if object.scope == :instance

  nil
end

def anchor_tags_for(object)
  anchors = [aref(object), legacy_aref(object)].compact.uniq
  anchors.map { |id| anchor_tag(id) }
end

def heading_with_anchors(heading, object)
  anchors = anchor_tags_for(object)
  return heading if anchors.empty?

  "#{heading} #{anchors.join(' ')}"
end

def anchor_component(value)
  value.to_s.each_char.map do |char|
    char.match?(/[A-Za-z0-9_-]/) ? char : format('-%X', char.ord)
  end.join
end

def constant_listing(object)
  constants = object.constants(included: false, inherited: false)
  constants + object.cvars
end

def public_method_list(object)
  prune_method_listing(
    object.meths(inherited: false, visibility: [:public]),
    included: false
  ).reject { |item| hidden_object?(item) }
    .sort_by { |m| m.name.to_s }
end

def public_class_methods(object)
  public_method_list(object).select { |o| o.scope == :class }
end

def public_instance_methods(object)
  public_method_list(object).select { |o| o.scope == :instance }
end

def attr_listing(object)
  @attrs = []
  object
    .inheritance_tree(true)
    .each do |superclass|
      next if superclass.is_a?(CodeObjects::Proxy)
      next if !options.embed_mixins.empty? && !options.embed_mixins_match?(superclass)

      %i[class instance].each do |scope|
        superclass.attributes[scope].each do |_name, rw|
          attr = prune_method_listing([rw[:read], rw[:write]].compact, false).first
          @attrs << attr if attr
        end
      end
      break if options.embed_mixins.empty?
    end
  sort_listing @attrs
end

def sort_listing(list)
  list.sort_by { |o| [o.scope.to_s, o.name.to_s.downcase] }
end

def grouped_items(items, group_order)
  grouped = Hash.new { |hash, key| hash[key] = [] }
  items.each { |item| grouped[item.group] << item }

  ordered = []

  Array(group_order).each do |name|
    next unless grouped.key?(name)

    ordered << [name, grouped.delete(name)]
  end

  grouped.keys.compact.sort.each do |name|
    ordered << [name, grouped.delete(name)]
  end

  ordered << [nil, grouped.delete(nil)] if grouped.key?(nil)
  ordered
end

def hidden_object?(object)
  object.docstring.to_s.strip.start_with?(':nodoc:')
end

def append_lines(lines, content, separated: true)
  return if content.to_s.strip.empty?

  lines << '' if separated && !lines.empty? && !lines.last.empty?
  lines.concat(content.to_s.split("\n"))
end

def anchor_tag(id)
  %(<a id="#{id}"></a>)
end

def finalize_markdown(lines, current_path)
  output = lines.join("\n")
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
    object = Registry.at(candidate)
    return object if object && object.name != :root
  end

  nil
end

def resolve_local_link_target(path, current_dir)
  normalized = path.to_s.delete_prefix('./')
  normalized = normalized.delete_prefix('/')

  object = resolve_registry_object(normalized, current_dir)
  if object
    object_path = options.serializer.serialized_path(object)
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
