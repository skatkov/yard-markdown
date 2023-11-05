# frozen_string_literal: true

def init
  super
end

def index
  @objects_by_letter = {}
  objects = Registry.all(:class, :module).sort_by {|o| o.name.to_s }
  objects = run_verifier(objects)
  objects.each {|o| (@objects_by_letter[o.name.to_s[0, 1].upcase] ||= []) << o }
  erb(:index)
end

def layout
  @path =
    if !object || object.is_a?(String)
      nil
    elsif !object.is_a?(YARD::CodeObjects::NamespaceObject)
      object.parent.path
    else
      object.path
    end

  erb(:layout)
end

def menu_lists
  [
    {:type => 'class', :title => 'Classes', :search_title => 'Class List'},
    {:type => 'method', :title => 'Methods', :search_title => 'Method List'}
  ]
end
