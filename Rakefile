# frozen_string_literal: true

require "fileutils"

require "bundler/gem_tasks"
require "rake/testtask"

require_relative "test/support/markdown_validator"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end

task default: :test

def generate_markdown_docs(source, output_dir)
  FileUtils.rm_rf(output_dir)
  FileUtils.mkdir_p(output_dir)

  command = [
    "yardoc", "--no-stats", "--quiet", "--format", "markdown",
    "--load", File.expand_path("lib/yard-markdown.rb", __dir__),
    "--output-dir", File.expand_path(output_dir)
  ]
  command << source if source
  sh(*command)
end

def checkout_repo(url, destination, ref:)
  FileUtils.rm_rf(destination)
  FileUtils.mkdir_p(File.dirname(destination))

  sh("git", "clone", "--depth", "1", "--branch", ref, url, destination)
end

namespace :examples do
  desc "Generate basic example documentation using yard-markdown plugin"
  task generate: %i[yard rdoc]

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
  task generate: %i[faraday sidekiq]
end

namespace :markdown do
  desc "Validate generated example markdown output"
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
