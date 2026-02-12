# frozen_string_literal: true

require "fileutils"
require "shellwords"

require "bundler/gem_tasks"
require "rake/testtask"

require_relative "test/support/markdown_validator"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end

task default: %i[test stree:write]

def shell_escape(path)
  Shellwords.escape(path)
end

def generate_markdown_docs(source, output_dir)
  FileUtils.rm_rf(output_dir)
  FileUtils.mkdir_p(output_dir)

  sh "yardoc --no-stats --quiet --format markdown --load ./lib/yard-markdown.rb --output-dir #{shell_escape(output_dir)} #{shell_escape(source)}"
end

def checkout_repo(url, destination, ref: nil)
  FileUtils.rm_rf(destination)
  FileUtils.mkdir_p(File.dirname(destination))

  command = "git clone --depth 1"
  command += " --branch #{shell_escape(ref)}" if ref
  command += " #{shell_escape(url)} #{shell_escape(destination)}"
  sh command
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
  REPOS_DIR = "tmp/real-world/repos"
  RSPEC_REPO = "#{REPOS_DIR}/rspec-core"
  SIDEKIQ_REPO = "#{REPOS_DIR}/sidekiq"

  desc "Checkout rspec-core repository"
  task :checkout_rspec do
    checkout_repo("https://github.com/rspec/rspec-core.git", RSPEC_REPO, ref: "v3.13.2")
  end

  desc "Checkout sidekiq repository"
  task :checkout_sidekiq do
    checkout_repo("https://github.com/sidekiq/sidekiq.git", SIDEKIQ_REPO, ref: "v7.3.10")
  end

  desc "Generate markdown docs for rspec-core"
  task rspec: :checkout_rspec do
    generate_markdown_docs("#{RSPEC_REPO}/lib", "tmp/real-world/rspec-core")
  end

  desc "Generate markdown docs for sidekiq"
  task sidekiq: :checkout_sidekiq do
    generate_markdown_docs("#{SIDEKIQ_REPO}/lib", "tmp/real-world/sidekiq")
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
