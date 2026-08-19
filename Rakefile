# frozen_string_literal: true

require "fileutils"
require "open3"
require "shellwords"

require "bundler/gem_tasks"
require "rake/testtask"

require_relative "test/support/markdown_validator"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end

task default: :test

COMMAND_WARNING_REGEX = /\bwarning:/i
COMMAND_ERROR_REGEX = /\b(?:error|exception|fatal|loaderror)\b/i

def run_command_with_analysis(command, label:)
  puts command

  stdout, stderr, status = Open3.capture3(command)
  combined_output = [stdout, stderr].reject(&:empty?).join("\n")
  log_path = File.join(__dir__, "tmp", "command-logs", "#{label.gsub(%r{[^a-zA-Z0-9_-]+}, "_")}.log")

  FileUtils.mkdir_p(File.dirname(log_path))
  File.write(log_path, combined_output)

  puts combined_output unless combined_output.empty?

  lines = combined_output.each_line.map(&:strip).reject(&:empty?)
  warnings = lines.grep(COMMAND_WARNING_REGEX)
  errors = lines.grep(COMMAND_ERROR_REGEX)

  puts "Output analysis for #{label}: warnings=#{warnings.size}, errors=#{errors.size}"

  return if status.success? && errors.empty?

  details = ["#{label} failed output checks (log: #{log_path})"]
  details << "exit status: #{status.exitstatus}" unless status.success?
  details << "errors: #{errors.first(5).join(" | ")}" unless errors.empty?
  raise details.join("\n")
end

def generate_markdown_docs(source, output_dir)
  FileUtils.rm_rf(output_dir)
  FileUtils.mkdir_p(output_dir)

  command = "yardoc --no-stats --quiet --format markdown --load #{Shellwords.escape(File.expand_path("lib/yard-markdown.rb", __dir__))} --output-dir #{Shellwords.escape(File.expand_path(output_dir))}"
  command += " #{Shellwords.escape(source)}" if source
  run_command_with_analysis(command, label: "yardoc_#{output_dir}")
end

def checkout_repo(url, destination, ref: nil)
  FileUtils.rm_rf(destination)
  FileUtils.mkdir_p(File.dirname(destination))

  command = "git clone --depth 1"
  command += " --branch #{Shellwords.escape(ref)}" if ref
  command += " #{Shellwords.escape(url)} #{Shellwords.escape(destination)}"
  run_command_with_analysis(command, label: "git_clone_#{destination}")
end

namespace :examples do
  desc "Generate basic example documentation using yard-markdown plugin"
  task :generate do
    Rake::Task["examples:yard"].invoke
    Rake::Task["examples:rdoc"].invoke
  end

  desc "Generate example documentation for code annotated with yard"
  task :yard do
    generate_markdown_docs("example_yard.rb", "example/yard")
  end

  desc "Generate example documentation for code annotated with rdoc"
  task :rdoc do
    generate_markdown_docs("example_rdoc.rb", "example/rdoc")
  end
end

namespace :real_world do
  repos_dir = "tmp/real-world/repos"
  faraday_repo = "#{repos_dir}/faraday"
  sidekiq_repo = "#{repos_dir}/sidekiq"

  desc "Checkout faraday repository"
  task :checkout_faraday do
    checkout_repo("https://github.com/lostisland/faraday.git", faraday_repo, ref: "v2.14.3")
  end

  desc "Checkout sidekiq repository"
  task :checkout_sidekiq do
    checkout_repo("https://github.com/sidekiq/sidekiq.git", sidekiq_repo, ref: "v7.3.10")
  end

  desc "Generate markdown docs for faraday"
  task faraday: :checkout_faraday do
    Dir.chdir(faraday_repo) { generate_markdown_docs(nil, File.expand_path("tmp/real-world/faraday", __dir__)) }
  end

  desc "Generate markdown docs for sidekiq"
  task sidekiq: :checkout_sidekiq do
    Dir.chdir(sidekiq_repo) { generate_markdown_docs(nil, File.expand_path("tmp/real-world/sidekiq", __dir__)) }
  end

  desc "Generate markdown docs for faraday and sidekiq"
  task :generate do
    Rake::Task["real_world:faraday"].invoke
    Rake::Task["real_world:sidekiq"].invoke
  end
end

namespace :markdown do
  desc "Validate checked-in example markdown output"
  task validate_examples: "examples:generate" do
    ["example/yard", "example/rdoc"].each do |dir|
      file_count = MarkdownValidator.new(dir).validate
      puts "Validated #{file_count} markdown files in #{dir}"
    end
  end

  desc "Generate and validate markdown output for faraday and sidekiq"
  task validate_real_world: "real_world:generate" do
    {
      "tmp/real-world/faraday" => "tmp/real-world/repos/faraday",
      "tmp/real-world/sidekiq" => "tmp/real-world/repos/sidekiq"
    }.each do |dir, source_dir|
      copied_files = Dir.glob("**/*", base: source_dir).grep(YARD::Markdown::FILE_PATTERN).select do |file|
        output_file = File.join(dir, file)
        File.file?(output_file) && FileUtils.compare_file(File.join(source_dir, file), output_file)
      end
      validator = MarkdownValidator.new(dir, relaxed_files: copied_files)
      file_count = validator.validate
      puts "Validated #{file_count} markdown files in #{dir} (unresolved local links: #{validator.unresolved_links})"
    end
  end
end
