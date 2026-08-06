# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "yard-markdown"
  spec.version = "0.8.0"
  spec.authors = ["Stanislav (Stas) Katkov"]
  spec.email = ["yard-markdown@skatkov.com"]

  spec.summary = "yard plugin to generate markdown documentation"
  spec.description = "yard plugin to generate markdown documentation for gems"
  spec.homepage = "https://poshtui.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/skatkov/yard-markdown"

  spec.files = Dir.glob(%w[
    CHANGELOG.md
    LICENSE.txt
    README.md
    lib/**/*
    sig/**/*
    templates/**/*
  ])
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_dependency "yard"
  # After ruby 3.4 this package is not part of standard library anymore
  spec.add_dependency "csv"
  spec.add_dependency "rdoc"
end
