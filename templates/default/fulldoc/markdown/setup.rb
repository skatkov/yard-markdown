# frozen_string_literal: true

require 'csv'

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

def serialize(object)
  T('module').run(options.merge(object: object))
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
  attrs = []
  object.inheritance_tree(true).each do |superclass|
    next if superclass.is_a?(CodeObjects::Proxy)
    next if !options.embed_mixins.empty? && !options.embed_mixins_match?(superclass)

    %i[class instance].each do |scope|
      superclass.attributes[scope].each do |_name, rw|
        attr = prune_method_listing([rw[:read], rw[:write]].compact, false).first
        attrs << attr if attr
      end
    end
    break if options.embed_mixins.empty?
  end
  sort_listing(attrs)
end

def sort_listing(list)
  list.sort_by { |o| [o.scope.to_s, o.name.to_s.downcase] }
end

def hidden_object?(object)
  object.docstring.to_s.strip.start_with?(':nodoc:')
end
