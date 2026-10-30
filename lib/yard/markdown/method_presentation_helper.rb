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
        rendered = Array(method_object.parameters).map do |name, default|
          next name if default.to_s.empty?

          separator = name.end_with?(":") ? " " : " = "
          "#{name}#{separator}#{default}"
        end

        "(#{rendered.join(", ")})"
      end

      # Renders available method source in a Ruby code block.
      #
      # @param method_object [YARD::CodeObjects::MethodObject] Method being rendered.
      # @return [String] Source section, or an empty string when unavailable.
      def self.method_source(method_object)
        source = method_object.source.to_s
        return "" if source.empty?

        fence = "`" * [3, source.scan(/`+/).map(&:length).max.to_i + 1].max
        "\n**Source**\n\n#{fence}ruby\n#{source}\n#{fence}\n"
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
