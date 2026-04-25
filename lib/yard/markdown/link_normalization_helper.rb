# frozen_string_literal: true

require 'pathname'

module YARD
  module Markdown
    module LinkNormalizationHelper
      def finalize_markdown(content, current_path)
        output = content.instance_of?(Array) ? content.join("\n") : content.to_str
        output = output.lines.map(&:rstrip).join("\n")
        output = normalize_local_links(output, current_path)
        output = normalize_malformed_local_links(output)
        output = output.gsub(/\n{3,}/, "\n\n").strip
        "#{output}\n"
      end

      def normalize_local_links(markdown, current_path)
        current_dir = Pathname.new(current_path).dirname

        markdown.gsub(%r{\[(.+?)\]\((?!https?://|mailto:|#)([^)\n]+)\)}) do
          label = Regexp.last_match(1)
          target = Regexp.last_match(2)
          path = target.sub(/[?#].*\z/, '')
          suffix = target[path.length..] || ''
          rewritten_path = resolve_local_link_target(path, current_dir)

          if rewritten_path.nil?
            "`#{label.tr('`', '')}`"
          else
            "[#{label}](#{rewritten_path}#{suffix})"
          end
        end
      end

      def resolve_registry_object(path, current_dir)
        cleaned = path.to_s.sub(%r{\A(?:\.\./)+}, '').delete_prefix('./').delete_prefix('/')
        candidates = [path.to_s, path.to_s.tr('/', '::')]

        if constant_reference_path?(cleaned)
          current_parts = current_dir.to_s.split('/').reject { |part| part.empty? || part == '.' }
          target_parts = cleaned.split(%r{::|/})

          current_parts.length.downto(0) do |depth|
            candidates << (current_parts.first(depth) + target_parts).join('::')
          end
        end

        candidates.uniq.each do |candidate|
          obj = Registry.at(candidate)
          return obj if obj && obj.name != :root
        end

        nil
      end

      def resolve_local_link_target(path, current_dir)
        normalized = path.to_s.delete_prefix('./')
        normalized = normalized.delete_prefix('/')

        obj = resolve_registry_object(normalized, current_dir)
        if obj
          object_path = options.serializer.serialized_path(obj)
          return relative_output_path(current_dir, Pathname.new(object_path).cleanpath)
        end

        if normalized.end_with?('.html')
          normalized = normalized.sub(/\.html\z/i, '.md')
        elsif File.extname(normalized).empty?
          return nil if unresolved_identifier_target?(normalized)

          normalized = "#{normalized}.md" if normalized.include?('/')
        end

        relative_output_path(current_dir, Pathname.new(normalized).cleanpath)
      end

      def constant_reference_path?(value)
        parts = value.split(%r{::|/}).reject(&:empty?)
        return false if parts.empty?

        parts.all? { |part| part.match?(/\A[A-Z]\w*\z/) }
      end

      def unresolved_identifier_target?(path)
        cleaned = path.to_s.sub(%r{\A(?:\.\./)+}, '').delete_prefix('./')
        return false if cleaned.include?('/') || !File.extname(cleaned).empty?
        return true if cleaned.start_with?(':') || cleaned.match?(/\A\d/)

        cleaned.match?(/\A[a-z_]\w*\z/)
      end

      def relative_output_path(current_dir, target_path)
        target = target_path.to_s
        return target if target.start_with?('../')

        Pathname.new(target).relative_path_from(current_dir).to_s
      rescue StandardError
        target
      end

      def normalize_malformed_local_links(markdown)
        markdown.gsub(%r{\[([^\]]+)\]\((?!https?://|mailto:|#)([^)\n]*['"][^)\n]*)\)}, '`\1`')
      end
    end
  end
end
