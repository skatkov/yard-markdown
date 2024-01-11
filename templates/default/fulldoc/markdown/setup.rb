# frozen_string_literal: true

# https://github.com/lsegal/yard/blob/2d197a381c5d4cc5c55b2c60fff992b31c986361/docs/CodeObjects.md

require "erb"
require "csv"

include Helpers::ModuleHelper

def init
  options.objects = objects = run_verifier(options.objects)

  options.delete(:objects)
  options.delete(:files)

  options.serializer.extension = "md"

  generate_method_list

  objects.each do |object|
    next if object.name == :root

    begin
      Templates::Engine.with_serializer(object, options.serializer) { serialize(object) }
    rescue => e
      path = options.serializer.serialized_path(object)
      log.error "Exception occurred while generating '#{path}'"
      log.backtrace(e)
    end
  end

  serialize_index(objects)
end

def serialize_index(objects)
  filepath = "#{options.serializer.basepath}/index.csv"

  CSV.open(filepath, "wb") do |csv|
    csv << %w[name type path]

    objects.each do |object|
      next if object.name == :root

      if object.type == :class
        csv << [object.name, "Class", options.serializer.serialized_path(object)]
      elsif object.type == :module
        csv << [object.name, "Module", options.serializer.serialized_path(object)]
      end

      if constant_listing.size.positive?
        constant_listing.each do |cnst|
          csv << [
            cnst.name(false),
            "Constant",
            (options.serializer.serialized_path(object) + "#" + aref(cnst)),
          ]
        end
      end

      if (insmeths = public_instance_methods(object)).size > 0
        insmeths.each do |item|
          csv << [
            item.name(false),
            "Method",
            options.serializer.serialized_path(object) + "#" + aref(item),
          ]
        end
      end

      if (pubmeths = public_class_methods(object)).size > 0
        pubmeths.each do |item|
          csv << [
            item.name(false),
            "Method",
            options.serializer.serialized_path(object) + "#" + aref(item),
          ]
        end
      end

      if (attrs = attr_listing(object)).size > 0
        attrs.each do |item|
          csv << [
            item.name(false),
            "Attribute",
            options.serializer.serialized_path(object) + "#" + aref(item),
          ]
        end
      end
    end
  end
end

def serialize(object)
  template =
    ERB.new(
      '# <%= format_object_title object %>
| | |
| -----------------:  | :-----    |
<% if CodeObjects::ClassObject === object && object.superclass %>
  | **Inherits:** | <%= object.superclass %>  |
<% end %>
<% [[:class, "Extended by"], [:instance, "Includes"]].each do |scope, name| %>
  <% if (mix = run_verifier(object.mixins(scope))).size > 0 %>
  | **<%= name %>:** | <%= mix.sort_by {|o| o.path }.join(", ") %> |
  <% end %>
<% end %>
<% unless object.root? %>
  | **Defined in:**    | <%= object.file ? object.file : "(unknown)" %>    |
<% end %>


<%= object.docstring %>


<% if constant_listing.size > 0 %>
<% groups(constant_listing, "Constants") do |list, name| %>
  # <%= name %>
  <% list.each do |cnst| %>
  ## <%= cnst.name %> = [](#<%=aref(cnst)%>)
  <%= cnst.docstring %>
  <% end %>
<% end %>

<% end %>

<% if (insmeths = public_instance_methods(object)).size > 0 %>
  # Public Instance Methods
  <% insmeths.each do |item| %>
  ## <%= item.name(false) %>(<%= item.parameters.map {|p| p.join(" ") }.join(", ")%>) [](#<%=aref(item)%>)
  <%= item.docstring %>

  <% end %>
<% end %>

<% if (pubmeths = public_class_methods(object)).size > 0 %>
  # Public Class Methods
  <% pubmeths.each do |item| %>
  ## <%= item.name(false) %>(<%= item.parameters.map {|p| p.join(" ") }.join(", ") %>) [](#<%=aref(item)%>)
  <%= item.docstring %>

  <% end %>
<% end %>
<% if (attrs = attr_listing(object)).size > 0 %>
  # Attributes
  <% attrs.each do |item|%>
  ## <%= item.name %><%= item.reader? ? "[RW]" : "[R]" %> [](#<%=aref(item)%>)
  <%= item.docstring %>

  <% end %>
<% end %>
  '.gsub(/^  /, ""),
      trim_mode: "%<>",
    )

  template.result(binding)
end

def aref(object)
  if object.type == :constant
    "constant-#{object.name(false)}"
  elsif !object.attr_info.nil?
    "attribute-#{object.scope[0]}-#{object.name(false)}"
  else
    "#{object.type}-#{object.scope[0]}-#{object.name(false)}"
  end
end

def constant_listing
  return @constants if defined?(@constants) && @constants

  @constants = object.constants(included: false, inherited: false)
  @constants += object.cvars
  @constants
end

def public_method_list(object)
  prune_method_listing(
    object.meths(inherited: false, visibility: [:public]),
    included: false,
  ).sort_by { |m| m.name.to_s }
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

def generate_method_list
  @items = prune_method_listing(Registry.all(:method), false)
  @items = @items.reject { |m| m.name.to_s =~ /=$/ && m.is_attribute? }
  @items = @items.sort_by { |m| m.name.to_s }

  # @list_title = "Method List"
  # @list_type = "method"
  # generate_list_contents
  # binding.irb
end

def sort_listing(list)
  list.sort_by { |o| [o.scope.to_s, o.name.to_s.downcase] }
end

def groups(list, type = "Method")
  groups_data = object.groups
  if groups_data
    list.each { |m| groups_data |= [m.group] if m.group && owner != m.namespace }
    others = list.select { |m| !m.group || !groups_data.include?(m.group) }
    groups_data.each do |name|
      items = list.select { |m| m.group == name }
      yield(items, name) unless items.empty?
    end
  else
    others = []
    group_data = {}
    list.each { |itm| itm.group ? (group_data[itm.group] ||= []) << itm : others << itm }
    group_data.each { |group, items| yield(items, group) unless items.empty? }
  end

  return if others.empty?
  if others.first.respond_to?(:scope)
    scopes(others) { |items, scope| yield(items, "#{scope.to_s.capitalize} #{type}") }
  else
    yield(others, type)
  end
end
