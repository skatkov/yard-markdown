# frozen_string_literal: true

# https://github.com/lsegal/yard/blob/2d197a381c5d4cc5c55b2c60fff992b31c986361/docs/CodeObjects.md

require_relative "../../../../lib/yard/serializers/markdown_serializer"

def init
  # here I need to copy README.md if there is one.
  #I also need to write index.md files

  options.objects = objects = run_verifier(options.objects)

  options.delete(:objects)
  options.delete(:files)
  options.serializer = Serializers::MarkdownSerializer.new(options)

  objects.each do |object|
    begin
      serialize(object)
    rescue => e
      path = options.serializer.serialized_path(object)
      log.error "Exception occurred while generating '#{path}'"
      log.backtrace(e)
    end
  end
end

# Generate an document for the specified object. This method is used by
# most of the objects found in the Registry.
# @param [CodeObject] object to be saved to Markdown
def serialize(object)
  options.object = object

  object.format(format: 'markdown', markup: 'markdown')
end
