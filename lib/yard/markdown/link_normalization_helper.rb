# frozen_string_literal: true

module YARD
  module Markdown
    # Rewrites generated Markdown links so they point at Markdown output.
    module LinkNormalizationHelper
      # Normalizes generated Markdown before it is written to disk.
      #
      # @param content [String, Array<String>] Markdown content to finalize.
      # @param current_path [String] Output path for the current document.
      # @return [String] Normalized Markdown content with a trailing newline.
      def finalize_markdown(content, current_path)
        LinkNormalizationHelper.finish_markdown(
          normalize_local_links(LinkNormalizationHelper.normalize_lines(content), current_path)
        )
      end

      # Rewrites local Markdown links relative to the current output path.
      #
      # @param markdown [String] Markdown content to rewrite.
      # @param current_path [String] Output path for the current document.
      # @return [String] Markdown with local links normalized.
      def normalize_local_links(markdown, current_path)
        current_dir = Pathname.new(current_path).dirname

        markdown.gsub(%r{\[(.+?)\]\((?!https?://|mailto:|#)([^)\n]+)\)}) do
          normalize_local_link(Regexp.last_match, current_dir)
        end
      end

      # Resolves a local link path to a YARD registry object when possible.
      #
      # @param path [String] Link target path to resolve.
      # @param current_dir [Pathname] Directory for the current output file.
      # @return [YARD::CodeObjects::Base, nil] Matched registry object, if any.
      def self.resolve_registry_object(path, current_dir)
        registry_candidates(path, current_dir)
          .map { |candidate| Registry.at(candidate) }
          .compact
          .reject { |object| object.equal?(Registry.root) }
          .first
      end

      # Returns registry paths that may match a local target.
      #
      # @param path [String] Link target path to resolve.
      # @param current_dir [Pathname] Directory for the current output file.
      # @return [Array<String>] Candidate registry paths in lookup order.
      def self.registry_candidates(path, current_dir)
        cleaned = path.sub(%r{\A(?:(?:\.\./)+|\./)}, "")
        return [path] unless constant_reference_path?(cleaned)

        namespaced_candidates(cleaned, current_dir)
      end

      # Expands a constant target through each enclosing namespace.
      #
      # @param cleaned [String] Target without relative path prefixes.
      # @param current_dir [Pathname] Directory for the current output file.
      # @return [Array<String>] Namespaced registry candidates.
      def self.namespaced_candidates(cleaned, current_dir)
        current_parts = current_dir.to_s.split("/").reject { |part| part.empty? || part == "." }
        target_parts = cleaned.split("/")
        current_parts.length.downto(0).map { |depth| (current_parts.first(depth) + target_parts).join("::") }
      end
      private_class_method :registry_candidates, :namespaced_candidates

      # Resolves a local link target to the final relative Markdown path.
      #
      # @param path [String] Link target path to resolve.
      # @param current_dir [Pathname] Directory for the current output file.
      # @return [String, nil] Relative Markdown path, or nil when unresolved.
      def resolve_local_link_target(path, current_dir)
        normalized = path.sub(%r{\A/+}, "")
        target = registry_path(normalized, current_dir) || copied_path(normalized) || LinkNormalizationHelper.markdown_path(normalized)
        LinkNormalizationHelper.relative_output_path(current_dir, target) if target
      end

      # Returns whether a path looks like a constant reference.
      #
      # @param value [String] Link target to inspect.
      # @return [Boolean] True when the path resembles a constant name.
      def self.constant_reference_path?(value)
        parts = value.split(%r{::|/}).reject(&:empty?)
        return false if parts.empty?

        parts.all? { |part| part.match?(/\A[A-Z]\w*\z/) }
      end

      # Returns whether a path looks like an unresolved bare identifier.
      #
      # @param path [String] Link target to inspect.
      # @return [Boolean] True when the target should be treated as unresolved.
      def self.unresolved_identifier_target?(path)
        cleaned = path.sub(%r{\A(?:(?:\.\./)+|\./)}, "")
        File.extname(cleaned).empty? && !cleaned.include?("/")
      end

      # Computes a relative path from the current output directory.
      #
      # @param current_dir [Pathname] Directory for the current output file.
      # @param target_path [String, Pathname] Output path being linked to.
      # @return [String] Relative path suitable for a Markdown link.
      def self.relative_output_path(current_dir, target_path)
        target = target_path.to_s
        return target if target.start_with?("../")

        Pathname.new(target).relative_path_from(current_dir).to_s
      rescue
        target
      end

      # Converts supported content into normalized lines.
      #
      # @param content [String, Array<String>] Markdown content.
      # @return [String] Joined content without trailing line whitespace.
      def self.normalize_lines(content)
        text = content.instance_of?(Array) ? content.join("\n") : content
        text.lines.map(&:rstrip).join("\n")
      end

      # Compacts blank lines and adds the final newline.
      #
      # @param markdown [String] Normalized Markdown content.
      # @return [String] Final Markdown content.
      def self.finish_markdown(markdown)
        "#{markdown.gsub(/\n{3,}/, "\n\n").strip}\n"
      end

      # Returns the Markdown output path for a non-registry target.
      #
      # @param path [String] Local link target.
      # @return [String, nil] Markdown path, or nil for an unresolved identifier.
      def self.markdown_path(path)
        return path.sub(/\.html\z/i, ".md") if path.match?(/\.html\z/i)
        return path unless File.extname(path).empty?
        return if unresolved_identifier_target?(path)

        "#{path}.md"
      end

      private

      # Rewrites one matched local Markdown link.
      #
      # @param match [MatchData] Local link match.
      # @param current_dir [Pathname] Directory for the current output file.
      # @return [String] Rewritten link or code-formatted label.
      def normalize_local_link(match, current_dir)
        label, target = match.captures
        path, separator, suffix = target.partition(/[?#]/)
        rewritten_path = resolve_local_link_target(path, current_dir)
        return "[#{label}](#{rewritten_path}#{separator}#{suffix})" if rewritten_path

        "`#{label.tr("`", "")}`"
      end

      # Finds the serialized path for a registry object.
      #
      # @param path [String] Local link target.
      # @param current_dir [Pathname] Directory for the current output file.
      # @return [String, nil] Serialized object path, if resolved.
      def registry_path(path, current_dir)
        object = LinkNormalizationHelper.resolve_registry_object(path, current_dir)
        return unless object

        options.serializer.serialized_path(object)
      end

      # Finds a copied Markdown file by its normalized alias.
      #
      # @param path [String] Local link target.
      # @return [String, nil] Copied file path, if registered.
      def copied_path(path)
        alias_path = Pathname.new(path.sub(/\.html\z/i, "")).cleanpath.to_s
        options.copied_file_aliases[alias_path]
      end
    end
  end
end
