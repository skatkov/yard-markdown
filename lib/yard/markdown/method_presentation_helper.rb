# frozen_string_literal: true

module YARD
  module Markdown
    # Formats method and attribute names for Markdown headings.
    module MethodPresentationHelper
      # Builds the display heading for a method.
      #
      # @param method_object [YARD::CodeObjects::MethodObject] Method being rendered.
      # @return [String] Method heading text.
      def self.formatted_method_heading(method_object)
        name = method_object.name
        signature = method_signature(method_object)
        signature = " #{signature}" if name.end_with?("]")
        "#{name}#{signature}"
      end

      # Returns the rendered parameter list for a method.
      #
      # @param method_object [YARD::CodeObjects::MethodObject] Method being rendered.
      # @return [String] Parenthesized method signature.
      def self.method_signature(method_object)
        seen = []
        while method_object.is_alias? && !seen.include?(method_object)
          seen << method_object
          target = alias_target(method_object)
          break unless target

          method_object = target
        end
        rendered = Array(method_object.parameters).map do |name, default|
          next name if default.to_s.empty?

          separator = name.end_with?(":") ? " " : " = "
          "#{name}#{separator}#{default}"
        end

        "(#{rendered.join(", ")})"
      end

      # Resolves an alias in its declaration scope, even when rendered as an extended method.
      #
      # @param method_object [YARD::CodeObjects::MethodObject] Alias being rendered.
      # @return [YARD::CodeObjects::MethodObject, nil] Target declaration, if available.
      def self.alias_target(method_object)
        aka, name = method_object.namespace.aliases.find { |candidate, _name| candidate == method_object }
        aka.namespace.child(name: name, scope: aka.scope)
      end

      # Returns the access marker for an attribute.
      #
      # @param attribute [YARD::CodeObjects::MethodObject] Attribute reader or writer.
      # @return [String] Access mode marker such as `R`, `W`, or `RW`.
      def self.attribute_access(attribute)
        read, write = attribute.attr_info.fetch_values(:read, :write)
        return "RW" if read && write
        return "R" if read

        "W"
      end
    end
  end
end
