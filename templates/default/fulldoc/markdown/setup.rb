# frozen_string_literal: true

require "csv"

# standard:disable Style/MixinUsage
include YARD::Templates::Helpers::ModuleHelper
include YARD::Markdown::ArefHelper
include YARD::Markdown::ObjectListingHelper
# standard:enable Style/MixinUsage

# Prepares the markdown serializer and renders each object page.
#
# @return [void]
def init
  options.objects = objects = run_verifier(options.objects).reject { |item| item.name == :root }

  options.delete(:objects)
  options.delete(:files)

  options.serializer.extension = "md"

  objects.each do |object|
    Templates::Engine.with_serializer(object, options.serializer) { serialize(object) }
  rescue => e
    path = options.serializer.serialized_path(object)
    log.error "Exception occurred while generating '#{path}'"
    log.backtrace(e)
  end

  serialize_index(objects)
end

# Renders the markdown template for a single namespace object.
#
# @param object [YARD::CodeObjects::NamespaceObject] Object whose page will be serialized.
# @return [String] Rendered markdown for the object.
def serialize(object)
  T("module").run(options.merge(object: object))
end

# Writes the CSV search index for all rendered objects.
#
# @param objects [Array<YARD::CodeObjects::NamespaceObject>] Verified objects included in the generated documentation.
# @return [void]
def serialize_index(objects)
  filepath = "#{options.serializer.basepath}/index.csv"

  CSV.open(filepath, "wb") do |csv|
    csv << %w[name type path]

    objects.each do |object|
      next if object.name == :root

      if object.type == :class
        csv << [object.path, "Class", options.serializer.serialized_path(object)]
      elsif object.type == :module
        csv << [object.path, "Module", options.serializer.serialized_path(object)]
      end

      [
        ["Constant", constant_listing(object)],
        ["Method", public_instance_methods(object)],
        ["Method", public_class_methods(object)],
        ["Attribute", attr_listing(object)]
      ].each do |type, items|
        items.each do |item|
          csv << [
            "#{object.path}.#{item.name(false)}",
            type,
            options.serializer.serialized_path(object) + "#" + aref(item)
          ]
        end
      end
    end
  end
end
