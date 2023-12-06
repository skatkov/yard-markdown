# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end

require "syntax_tree/rake_tasks"
SyntaxTree::Rake::CheckTask.new
SyntaxTree::Rake::WriteTask.new

task default: %i[test stree:write]
