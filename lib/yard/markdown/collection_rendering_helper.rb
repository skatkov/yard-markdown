# frozen_string_literal: true

module YARD
  module Markdown
    # Renders grouped Markdown sections for constants, attributes, and methods.
    module CollectionRenderingHelper
      # Renders the constants section for an object page.
      #
      # @param constants [Array<YARD::CodeObjects::Base>] Constant objects collected for the current page.
      # @param group_order [Array<String>, nil] Preferred ordering for group headings.
      # @return [String] Markdown for the constants section.
      def render_constants(constants, group_order)
        render_collection("Constants", constants.sort_by(&:name), group_order) { |item| "`#{item.name}`" }
      end

      # Renders the attributes section for an object page.
      #
      # @param attrs [Array<YARD::CodeObjects::MethodObject>] Attributes to render.
      # @param group_order [Array<String>, nil] Preferred ordering for group headings.
      # @return [String] Markdown for the attributes section.
      def render_attributes(attrs, group_order)
        render_collection("Attributes", attrs, group_order) { |item| "`#{item.name}` [#{MethodPresentationHelper.attribute_access(item)}]" }
      end

      # Renders a method section for an object page.
      #
      # @param section_title [String] Section title to render.
      # @param methods [Array<YARD::CodeObjects::MethodObject>] Method objects collected for the current section.
      # @param group_order [Array<String>, nil] Preferred ordering for group headings.
      # @return [String] Markdown for the method section.
      def render_methods(section_title, methods, group_order)
        render_collection(section_title, methods, group_order) { |item| "`#{MethodPresentationHelper.formatted_method_heading(item)}`" }
      end

      # Renders a grouped collection with a caller-provided item label.
      #
      # @param section_title [String] Section title to render.
      # @param items [Array<YARD::CodeObjects::Base>] Objects to group and render.
      # @param group_order [Array<String>, nil] Preferred ordering for group headings.
      # @param label [Proc] Item-label renderer.
      # @yieldparam item [YARD::CodeObjects::Base] Object whose label should be rendered.
      # @return [String] Markdown for the collection section.
      def render_collection(section_title, items, group_order, &label)
        groups = SectionAssemblyHelper.grouped_items(items, group_order)
        grouped = groups.any? { |name, _items| name }
        body = groups.map do |name, group_items|
          item_heading = grouped ? "####" : "###"
          item_markdown = group_items.map { |item| render_collection_item(item_heading, item, &label) }.join("\n\n")
          [("### #{name || "General"}" if grouped), item_markdown].compact
        end

        ["## #{section_title}", body].join("\n")
      end

      private

      # Renders one collection item with documentation and tags.
      #
      # @param item_heading [String] Markdown heading prefix for the item.
      # @param item [YARD::CodeObjects::Base] Object being rendered.
      # @param label [Proc] Item-label renderer.
      # @yieldparam item [YARD::CodeObjects::Base] Object whose label should be rendered.
      # @return [String] Rendered item Markdown.
      def render_collection_item(item_heading, item, &label)
        [
          heading_with_anchors(item_heading + " " + label.call(item), item),
          documented_text(item),
          TagFormattingHelper.render_tags(item)
        ].reject(&:empty?).join("\n")
      end
    end
  end
end
