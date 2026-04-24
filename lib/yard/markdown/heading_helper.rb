# frozen_string_literal: true

module YARD
  module Markdown
    module HeadingHelper
      include ArefHelper

      def legacy_aref(object)
        type = object.type

        return "#{object.name}-constant" if type == :constant
        return "#{object.name}-classvariable" if type == :classvariable
        return nil unless object.respond_to?(:scope)

        return "#{object.name}-class_method" if object.scope == :class

        "#{object.name}-instance_method"
      end

      def anchor_tags_for(object)
        anchors = [aref(object), legacy_aref(object)].compact
        anchors.map { |id| anchor_tag(id) }
      end

      def heading_with_anchors(heading, object)
        "#{heading} #{anchor_tags_for(object).join(' ')}"
      end

      def anchor_tag(id)
        %(<a id="#{id}"></a>)
      end
    end
  end
end
