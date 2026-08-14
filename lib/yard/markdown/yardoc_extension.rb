# frozen_string_literal: true

module YARD
  module Markdown
    # Discovers Markdown pages before YARD generates documentation.
    module YardocExtension
      private

      # Adds Markdown pages to the files rendered by the Markdown template.
      #
      # @param checksums [Hash, nil] Previously generated file checksums.
      # @return [void]
      def run_generate(checksums)
        if options.format == :markdown
          existing = options.files.map { |file| File.expand_path(file.filename) }
          exclusions = excluded.map { |path| path.is_a?(Regexp) ? path : Regexp.new(path, Regexp::IGNORECASE) }
          output = File.expand_path(options.serializer.basepath)
          markdown_files = Dir.glob("**/*")
            .select { |file| file.match?(FILE_PATTERN) }
            .reject { |file| File.basename(file).start_with?("_") }
            .reject { |file| exclusions.any? { |pattern| pattern.match?(file) } }
            .reject { |file| File.expand_path(file).start_with?("#{output}/") }
            .reject { |file| existing.include?(File.expand_path(file)) }
          add_extra_files(markdown_files)
        end

        super
      end
    end
  end
end
