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
        add_extra_files(markdown_files) if options.format == :markdown

        super
      end

      # Returns project Markdown files that YARD has not already discovered.
      #
      # @return [Array<String>] Markdown file paths to add.
      def markdown_files
        Dir.glob("**/*").grep(FILE_PATTERN)
          .reject { |file| File.basename(file).start_with?("_") }
          .reject { |file| excluded_file?(file) }
          .reject { |file| output_file?(file) }
          .reject { |file| existing_file?(file) }
      end

      # Returns whether a file matches a configured exclusion.
      #
      # @param file [String] Candidate file path.
      # @return [Boolean] True when excluded.
      def excluded_file?(file)
        excluded.any? { |path| Regexp.new(path, Regexp::IGNORECASE).match?(file) }
      end

      # Returns whether a file is inside the output directory.
      #
      # @param file [String] Candidate file path.
      # @return [Boolean] True when generated output would contain the file.
      def output_file?(file)
        output = File.expand_path(options.serializer.basepath)
        File.expand_path(file).start_with?("#{output}/")
      end

      # Returns whether YARD has already discovered a file.
      #
      # @param file [String] Candidate file path.
      # @return [Boolean] True when the file already exists in YARD options.
      def existing_file?(file)
        expanded_file = File.expand_path(file)
        options.files.any? { |existing| File.expand_path(existing.filename) == expanded_file }
      end
    end
  end
end
