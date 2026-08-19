# frozen_string_literal: true

module YARD
  module Markdown
    # Builds headings and legacy anchors for rendered object sections.
    module HeadingHelper
      # Returns the legacy YARD anchor for an object when one exists.
      #
      # @param object [YARD::CodeObjects::Base] Object being rendered.
      # @return [String, nil] Legacy anchor id, if supported.
      def self.legacy_aref(object)
        name = object.name

        case object.type
        when :constant
          "#{name}-constant"
        when :classvariable
          "#{name}-classvariable"
        when :method
          "#{name}-#{(object.scope == :class) ? "class" : "instance"}_method"
        end
      end

      # Returns all anchor tags that should be attached to a heading.
      #
      # @param object [YARD::CodeObjects::Base] Object being rendered.
      # @return [Array<String>] HTML anchor tags for the object.
      def anchor_tags_for(object)
        anchors = [ArefHelper.aref(object), HeadingHelper.legacy_aref(object)].compact
        anchors.map { |id| anchor_tag(id) }
      end

      # Appends the generated anchor tags to a Markdown heading.
      #
      # @param heading [String] Heading text to decorate.
      # @param object [YARD::CodeObjects::Base] Object being rendered.
      # @return [String] Heading text with embedded anchor tags.
      def heading_with_anchors(heading, object)
        "#{heading} #{anchor_tags_for(object).join(" ")}"
      end

      # Builds an HTML anchor tag for a generated id.
      #
      # @param id [String] Anchor id value.
      # @return [String] HTML anchor tag.
      def anchor_tag(id)
        %(<a id="#{id}"></a>)
      end
    end
  end
end
