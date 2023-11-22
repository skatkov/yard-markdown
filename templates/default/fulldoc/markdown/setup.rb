# frozen_string_literal: true

# https://github.com/lsegal/yard/blob/2d197a381c5d4cc5c55b2c60fff992b31c986361/docs/CodeObjects.md

require_relative "../../../../lib/yard/serializers/markdown_serializer"
require 'erb'

def init
  # here I need to copy README.md if there is one.
  #I also need to write index.md files

  options.objects = objects = run_verifier(options.objects)

  options.delete(:objects)
  options.delete(:files)

  options.serializer.extension = "md"

  generate_method_list

  objects.each do |object|
    next if object.name == :root

    begin
      Templates::Engine.with_serializer(object, options.serializer) do
        serialize(object)
      end
    rescue => e
      path = options.serializer.serialized_path(object)
      log.error "Exception occurred while generating '#{path}'"
      log.backtrace(e)
    end
  end
end

def serialize(object)
  template = ERB.new(%q{# <%= format_object_title object %>
<%= object.docstring %>


<% if constant_listing.size > 0 %>
<% groups(constant_listing, "Constants") do |list, name| %>
  # <%= name %>
  | Name | Value | Description |
  | ---- | ---- | ----------- |
  <% list.each do |cnst| %>
  |<%= cnst.name %> | <%= cnst.value %> | <%= cnst.docstring %>
  <% end %>
<% end %>
<% end %>

<% if (insmeths = public_instance_methods(object)).size > 0 %>
  # Public Instance Methods
  <% insmeths.each do |item| %>

  ## <%= item.name(false) %>(<%= item.parameters.map {|p| p.join(" ") }.join(", ") %>) [](#<%=aref(item)%>)
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
  }.gsub(/^  /, ''), trim_mode: "%<>")

  template.result(binding)
end

def aref(object)
  "#{object.type}-#{object.scope[0]}-#{object.name(false)}"
end

def constant_listing
  return @constants if defined?(@constants) && @constants
  @constants = object.constants(:included => false, :inherited => false)
  @constants += object.cvars
  @constants
end

include Helpers::ModuleHelper

def public_method_list(object)
  object.meths(:visibility => [:public]).sort_by {|m| m.name.to_s }
end

def public_class_methods(object)
  public_method_list(object).select {|o| o.scope == :class }
end

def public_instance_methods(object)
  public_method_list(object).select {|o| o.scope == :instance }
end

def generate_method_list
  @items = prune_method_listing(Registry.all(:method), false)
  @items = @items.reject {|m| m.name.to_s =~ /=$/ && m.is_attribute? }
  @items = @items.sort_by {|m| m.name.to_s }
  #@list_title = "Method List"
  #@list_type = "method"
  #generate_list_contents
  # binding.irb
end

def groups(list, type = "Method")
  groups_data = object.groups
  if groups_data
    list.each {|m| groups_data |= [m.group] if m.group && owner != m.namespace }
    others = list.select {|m| !m.group || !groups_data.include?(m.group) }
    groups_data.each do |name|
      items = list.select {|m| m.group == name }
      yield(items, name) unless items.empty?
    end
  else
    others = []
    group_data = {}
    list.each do |itm|
      if itm.group
        (group_data[itm.group] ||= []) << itm
      else
        others << itm
      end
    end
    group_data.each {|group, items| yield(items, group) unless items.empty? }
  end

  return if others.empty?
  if others.first.respond_to?(:scope)
    scopes(others) {|items, scope| yield(items, "#{scope.to_s.capitalize} #{type}") }
  else
    yield(others, type)
  end
end
