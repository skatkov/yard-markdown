# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end

task default: %i[test stree:write]


namespace :examples do
  desc "Generate basic example documentation using yard-markdown plugin"
  task :generate do
    Rake::Task["examples:yard"].invoke
    Rake::Task["examples:rdoc"].invoke
  end

  desc "Generate example documentation for code annotated with yard"
  task :yard do
    sh "yardoc --output-dir example/yard example_yard.rb"
  end

  desc "Generate example documentation for code annotated with rdoc"
  task :rdoc do
    sh "yardoc --output-dir example/rdoc example_rdoc.rb"
  end
end
