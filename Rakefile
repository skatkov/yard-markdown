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
  desc "Generate example/rdoc/ documentation using yard-markdown plugin"
  task :generate do
    Rake::Task["examples:yard"].invoke
    Rake::Task["examples:rdoc"].invoke
    Rake::Task["examples:ruby"].invoke
  end


  task :yard do
    sh "yardoc --output-dir example/yard example_yard.rb"
  end

  task :rdoc do
    sh "yardoc --output-dir example/rdoc example_rdoc.rb"
  end

  task :ruby do
    sh "yardoc source_ruby --output-dir example/ruby"
  end
end
