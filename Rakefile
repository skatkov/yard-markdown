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

def run_command_with_analysis(command, label:, chdir: ".")
  puts command

  stdout, stderr, status = Open3.capture3(command, chdir: chdir)
  combined_output = [stdout, stderr].reject(&:empty?).join("\n")
  log_path = File.join("tmp", "command-logs", "#{label.gsub(%r{[^a-zA-Z0-9_-]+}, "_")}.log")

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

def generate_markdown_docs(source, output_dir, root: ".")
  FileUtils.rm_rf(output_dir)
  FileUtils.mkdir_p(output_dir)

  command = "yardoc --no-yardopts --no-stats --quiet --format markdown --load #{Shellwords.escape(File.expand_path("lib/yard-markdown.rb"))} --output-dir #{Shellwords.escape(File.expand_path(output_dir))} #{Shellwords.escape(source)}"
  run_command_with_analysis(command, label: "yardoc_#{output_dir}", chdir: root)
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
  concurrent_ruby_repo = "#{repos_dir}/concurrent-ruby"

  desc "Checkout faraday repository"
  task :checkout_faraday do
    checkout_repo("https://github.com/lostisland/faraday.git", faraday_repo, ref: "v2.14.3")
  end

  desc "Checkout concurrent-ruby repository"
  task :checkout_concurrent_ruby do
    checkout_repo("https://github.com/ruby-concurrency/concurrent-ruby.git", concurrent_ruby_repo, ref: "v1.3.8")
  end

  desc "Generate markdown docs for faraday"
  task faraday: :checkout_faraday do
    generate_markdown_docs("lib", "tmp/real-world/faraday", root: faraday_repo)
  end

  desc "Generate markdown docs for concurrent-ruby"
  task concurrent_ruby: :checkout_concurrent_ruby do
    generate_markdown_docs("lib", "tmp/real-world/concurrent-ruby", root: concurrent_ruby_repo)
  end

  desc "Generate markdown docs for faraday and concurrent-ruby"
  task :generate do
    Rake::Task["real_world:faraday"].invoke
    Rake::Task["real_world:concurrent_ruby"].invoke
  end
end

namespace :markdown do
  desc "Validate checked-in example markdown output"
  task validate_examples: "examples:generate" do
    ["example/yard", "example/rdoc"].each do |dir|
      file_count = MarkdownValidator.new(dir).validate!
      puts "Validated #{file_count} markdown files in #{dir}"
    end
  end

  desc "Generate and validate markdown output for faraday and concurrent-ruby"
  task validate_real_world: "real_world:generate" do
    ["tmp/real-world/faraday", "tmp/real-world/concurrent-ruby"].each do |dir|
      validator = MarkdownValidator.new(dir, strict_links: false)
      file_count = validator.validate!
      puts "Validated #{file_count} markdown files in #{dir} (unresolved local links: #{validator.unresolved_links})"
    end
  end
end
