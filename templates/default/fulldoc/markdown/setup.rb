# frozen_string_literal: true

def init
  options.objects = objects = run_verifier(options.objects)

  generate_assets

  options.files.each_with_index do |file, _i|
    serialize_file(file, file.title)
  end

  options.delete(:objects)
  options.delete(:files)

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
# @param [CodeObject] object to be saved to HTML
def serialize(object)
  options.object = object
  serialize_index(options) if object == '_index.md' && options.readme.nil?
  Templates::Engine.with_serializer(object, options.serializer) do
    T('layout').run(options)
  end
end

# Generate a single file with the layout template applied. This is generally
# the README file or files specified on the command-line.
#
# @param [File] file object to be saved to the output
# @param [String] title currently unused
#
# @see layout#diskfile
def serialize_file(file, title = nil)
  options.object = Registry.root
  options.file = file
  outfile = "file.#{file.name}.md"

  serialize_index(options) if file == options.readme
  Templates::Engine.with_serializer(outfile, options.serializer) do
    T('layout').run(options)
  end
  options.delete(:file)
end

# Generate the index document for the output
# @params [Hash] options contains data and flags that influence the output
def serialize_index(options)
  Templates::Engine.with_serializer('index.md', options.serializer) do
    T('layout').run(options.merge(:index => true))
  end
end

# Generates all the javascript files, stylesheet files, menu lists
# (i.e. class, method, and file) based on the the values returned from the
# layout's menu_list method, and the frameset in the documentation output
#
def generate_assets
  @object = Registry.root

  layout = Object.new.extend(T('layout'))
  binding.irb

  layout.menu_lists.each do |list|
    list_generator_method = "generate_#{list[:type]}_list"
    if respond_to?(list_generator_method)
      send(list_generator_method)
    else
      log.error "Unable to generate '#{list[:title]}' list because no method " \
                "'#{list_generator_method}' exists"
    end
  end

  generate_frameset
end
