# Module: ERB::DefMethod
    

-- ERB::DefMethod

Utility module to define eRuby script as instance method.

### Example

example.rhtml:
    <% for item in @items %>
    <b><%= item %></b>
    <% end %>

example.rb:
    require 'erb'
    class MyClass
      extend ERB::DefMethod
      def_erb_method('render()', 'example.rhtml')
      def initialize(items)
        @items = items
      end
    end
    print MyClass.new([10,20,30]).render()

result:

    <b>10</b>

    <b>20</b>

    <b>30</b>


# Class Methods
## def_erb_method(methodname , erb_or_fname ) [](#method-c-def_erb_method)
define *methodname* as instance method of current module, using ERB object or
eRuby file

