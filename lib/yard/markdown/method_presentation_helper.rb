# frozen_string_literal: true

module YARD
  module Markdown
    # Formats method and attribute names for Markdown headings.
    module MethodPresentationHelper
      # Builds the display heading for a method.
      #
      # @param method_object [YARD::CodeObjects::MethodObject] Method being rendered.
      # @return [String] Method heading text.
      def formatted_method_heading(method_object)
        name = method_object.name
        signature = method_signature(method_object)
        signature = " #{signature}" if name.end_with?("]")
        "#{name}#{signature}"
      end

      # Returns the rendered parameter list for a method.
      #
      # @param method_object [YARD::CodeObjects::MethodObject] Method being rendered.
      # @return [String] Parenthesized method signature.
      def method_signature(method_object)
        return "()" if method_object.parameters.nil?

        rendered = method_object.parameters.map do |name, default|
          (default.nil? || default.empty?) ? name : "#{name} = #{default}"
        end

        "(#{rendered.join(", ")})"
      end

      # Returns the access marker for an attribute.
      #
      # @param attribute [YARD::CodeObjects::MethodObject] Attribute reader or writer.
      # @return [String] Access mode marker such as `R`, `W`, or `RW`.
      def attribute_access(attribute)
        read, write = attribute.attr_info.fetch_values(:read, :write)
        return "RW" if read && write
        return "R" if read

        "W"
      end
    end
  end
end
