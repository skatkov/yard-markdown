# frozen_string_literal: true

module YARD
  module Markdown
    module MethodPresentationHelper
      def formatted_method_heading(method_object)
        name = method_object.name
        signature = method_signature(method_object)
        signature = " #{signature}" if name.end_with?(']')
        "#{name}#{signature}"
      end

      def method_signature(method_object)
        return '()' if method_object.parameters.nil?

        rendered = method_object.parameters.map do |name, default|
          default.nil? || default.empty? ? name : "#{name} = #{default}"
        end

        "(#{rendered.join(', ')})"
      end

      def attribute_access(attribute)
        info = attribute.attr_info || {}
        return 'RW' if info[:read] && info[:write]
        return 'R' if info[:read]
        return 'W' if info[:write]

        return 'RW' if attribute.reader? && attribute.writer?
        return 'R' if attribute.reader?

        'W'
      end
    end
  end
end
