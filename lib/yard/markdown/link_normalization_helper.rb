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
        output = content.instance_of?(Array) ? content.join("\n") : content
        output = output.lines.map(&:rstrip).join("\n")
        output = normalize_local_links(output, current_path)
        output = normalize_malformed_local_links(output)
        output = output.gsub(/\n{3,}/, "\n\n").strip
        "#{output}\n"
      end

      # Rewrites local Markdown links relative to the current output path.
      #
      # @param markdown [String] Markdown content to rewrite.
      # @param current_path [String] Output path for the current document.
      # @return [String] Markdown with local links normalized.
      def normalize_local_links(markdown, current_path)
        current_dir = Pathname.new(current_path).dirname

        markdown.gsub(%r{\[(.+?)\]\((?!https?://|mailto:|#)([^)\n]+)\)}) do
          label = Regexp.last_match(1)
          target = Regexp.last_match(2)
          path = target.sub(/[?#].*\z/, "")
          suffix = target[path.length..]
          rewritten_path = resolve_local_link_target(path, current_dir)

          if rewritten_path.nil?
            "`#{label.tr("`", "")}`"
          else
            "[#{label}](#{rewritten_path}#{suffix})"
          end
        end
      end

      # Resolves a local link path to a YARD registry object when possible.
      #
      # @param path [String] Link target path to resolve.
      # @param current_dir [Pathname] Directory for the current output file.
      # @return [YARD::CodeObjects::Base, nil] Matched registry object, if any.
      def resolve_registry_object(path, current_dir)
        cleaned = path.sub(%r{\A(?:(?:\.\./)+|\./)}, "")
        candidates = [path]

        if constant_reference_path?(cleaned)
          current_parts = current_dir.to_s.split("/").reject { |part| part.empty? || part == "." }
          target_parts = cleaned.split("/")

          current_parts.length.downto(0) do |depth|
            candidates << (current_parts.first(depth) + target_parts).join("::")
          end
        end

        candidates.each do |candidate|
          obj = Registry.at(candidate)
          next if obj.nil? || obj.equal?(Registry.root)

          return obj
        end

        nil
      end

      # Resolves a local link target to the final relative Markdown path.
      #
      # @param path [String] Link target path to resolve.
      # @param current_dir [Pathname] Directory for the current output file.
      # @return [String, nil] Relative Markdown path, or nil when unresolved.
      def resolve_local_link_target(path, current_dir)
        normalized = path.sub(%r{\A/+}, "")

        obj = resolve_registry_object(normalized, current_dir)
        if obj
          object_path = options.serializer.serialized_path(obj)
          return relative_output_path(current_dir, object_path)
        end

        if normalized.match?(/\.html\z/i)
          normalized = normalized.sub(/\.html\z/i, ".md")
        elsif File.extname(normalized).empty?
          return nil if unresolved_identifier_target?(normalized)

          normalized = "#{normalized}.md" if normalized.include?("/")
        end

        relative_output_path(current_dir, normalized)
      end

      # Returns whether a path looks like a constant reference.
      #
      # @param value [String] Link target to inspect.
      # @return [Boolean] True when the path resembles a constant name.
      def constant_reference_path?(value)
        parts = value.split(%r{::|/}).reject(&:empty?)
        return false if parts.empty?

        parts.all? { |part| part.match?(/\A[A-Z]\w*\z/) }
      end

      # Returns whether a path looks like an unresolved bare identifier.
      #
      # @param path [String] Link target to inspect.
      # @return [Boolean] True when the target should be treated as unresolved.
      def unresolved_identifier_target?(path)
        cleaned = path.sub(%r{\A(?:(?:\.\./)+|\./)}, "")
        return true if cleaned.start_with?(":") || cleaned.match?(/\A\d/)

        cleaned.match?(/\A[a-z_]\w*\z/)
      end

      # Computes a relative path from the current output directory.
      #
      # @param current_dir [Pathname] Directory for the current output file.
      # @param target_path [String, Pathname] Output path being linked to.
      # @return [String] Relative path suitable for a Markdown link.
      def relative_output_path(current_dir, target_path)
        target = target_path.to_s
        return target if target.start_with?("../")

        Pathname.new(target).relative_path_from(current_dir).to_s
      rescue
        target
      end

      # Replaces malformed local Markdown links with inline code.
      #
      # @param markdown [String] Markdown content to normalize.
      # @return [String] Markdown with malformed local links replaced.
      def normalize_malformed_local_links(markdown)
        markdown.gsub(%r{\[([^\]]+)\]\((?!https?://|mailto:|#)(?:[^)\n]*['"][^)\n]*)\)}, '`\1`')
      end
    end
  end
end
