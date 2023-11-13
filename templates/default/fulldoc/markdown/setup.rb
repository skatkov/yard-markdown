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
  {
    test: 'test',
    object_docstring: object.docstring
  }
end
