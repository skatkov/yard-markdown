# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "yard-markdown"
  spec.version = "0.9.0"
  spec.authors = ["Stanislav (Stas) Katkov"]
  spec.email = ["yard-markdown@skatkov.com"]

  spec.summary = "yard plugin to generate markdown documentation"
  spec.description = "yard plugin to generate markdown documentation for gems"
  spec.homepage = "https://poshtui.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/skatkov/yard-markdown"

  spec.files = Dir.glob(%w[
    CHANGELOG.md
    LICENSE.txt
    README.md
    lib/**/*
    templates/**/*
  ])
  spec.require_paths = ["lib"]

  spec.add_dependency "yard"
  # After ruby 3.4 this package is not part of standard library anymore
  spec.add_dependency "csv"
  spec.add_dependency "rdoc"
end
