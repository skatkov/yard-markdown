# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end

task default: %i[test stree:write]


desc "Generate example/rdoc/ documentation using yard-markdown plugin"
task :generate_example do
  sh "yardoc --output-dir example/rdoc example_rdoc.rb"
  sh "yardoc --output-dir example/yard example_yard.rb"
end
