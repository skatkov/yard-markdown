# frozen_string_literal: true

require "csv"

include YARD::Markdown::ObjectListingHelper,
  YARD::Templates::Helpers::ModuleHelper

# Prepares the markdown serializer and renders each object page.
#
# @return [void]
def init
  objects = run_verifier(options.objects).reject { |item| item.name == :root }
  files = Array(options.files).select { |file| file.filename.match?(YARD::Markdown::FILE_PATTERN) }
  options.copied_file_aliases = files.to_h do |file|
    path = Pathname.new(file.filename).cleanpath.to_s
    [path.sub(YARD::Markdown::FILE_PATTERN, ""), path]
  end

  options.delete(:objects)
  options.delete(:files)

  options.serializer.extension = "md"

  files.each { |file| options.serializer.serialize(file.filename, File.binread(file.filename)) }

  objects.each do |object|
    Templates::Engine.with_serializer(object, options.serializer) { serialize(object) }
  rescue => e
    path = options.serializer.serialized_path(object)
    log.error "Exception occurred while generating '#{path}'"
    log.backtrace(e)
  end

  serialize_index(objects, files)
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
# @param files [Array<YARD::CodeObjects::ExtraFileObject>] Markdown files included in the generated documentation.
# @return [void]
def serialize_index(objects, files)
  filepath = "#{options.serializer.basepath}/index.csv"

  CSV.open(filepath, "wb") do |csv|
    csv << %w[name type path]

    files.each { |file| csv << [file.filename, "File", file.filename] }

    objects.each do |object|
      if object.type == :class
        csv << [object.path, "Class", options.serializer.serialized_path(object)]
      elsif object.type == :module
        csv << [object.path, "Module", options.serializer.serialized_path(object)]
      end

      [
        ["Constant", YARD::Markdown::ObjectListingHelper.constant_listing(object)],
        ["Method", public_instance_methods(object)],
        ["Method", public_class_methods(object)],
        ["Attribute", attr_listing(object)]
      ].each do |type, items|
        items.each do |item|
          csv << [
            "#{object.path}.#{item.name(false)}",
            type,
            options.serializer.serialized_path(object) + "#" + YARD::Markdown::ArefHelper.aref(item)
          ]
        end
      end
    end
  end
end
