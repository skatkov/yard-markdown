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

def generate_markdown_docs(source, output_dir)
  FileUtils.rm_rf(output_dir)
  FileUtils.mkdir_p(output_dir)

  command = "yardoc --no-stats --quiet --format markdown --load ./lib/yard-markdown.rb --output-dir #{Shellwords.escape(output_dir)} #{Shellwords.escape(source)}"
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
  rspec_repo = "#{repos_dir}/rspec-core"
  sidekiq_repo = "#{repos_dir}/sidekiq"

  desc "Checkout rspec-core repository"
  task :checkout_rspec do
    checkout_repo("https://github.com/rspec/rspec-core.git", rspec_repo, ref: "v3.13.2")
  end

  desc "Checkout sidekiq repository"
  task :checkout_sidekiq do
    checkout_repo("https://github.com/sidekiq/sidekiq.git", sidekiq_repo, ref: "v7.3.10")
  end

  desc "Generate markdown docs for rspec-core"
  task rspec: :checkout_rspec do
    generate_markdown_docs("#{rspec_repo}/lib", "tmp/real-world/rspec-core")
  end

  desc "Generate markdown docs for sidekiq"
  task sidekiq: :checkout_sidekiq do
    generate_markdown_docs("#{sidekiq_repo}/lib", "tmp/real-world/sidekiq")
  end

  desc "Generate markdown docs for rspec-core and sidekiq"
  task :generate do
    Rake::Task["real_world:rspec"].invoke
    Rake::Task["real_world:sidekiq"].invoke
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

  desc "Generate and validate markdown output for rspec-core and sidekiq"
  task validate_real_world: "real_world:generate" do
    ["tmp/real-world/rspec-core", "tmp/real-world/sidekiq"].each do |dir|
      validator = MarkdownValidator.new(dir, strict_links: false)
      file_count = validator.validate!
      puts "Validated #{file_count} markdown files in #{dir} (unresolved local links: #{validator.unresolved_links})"
    end
  end
end
