# Changelog
All notable changes to this project will be documented in this file.

This format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## 0.8.0

- Adding metadata section

## 0.7.2

### Changed
- Limit the packaged gem to documentation, runtime code, and templates.

### Removed
- Remove the generated RBS signature from the packaged gem.

## 0.7.1

### Fixed
- Preserve fenced code blocks in YARD docstrings so generated Markdown examples render correctly.

## 0.7.0
## Added
- Adding yard-lint and all method documentation
- Generating rbs signature based on yard tags
- Adding mutant testing into a project

## Changed
- Refactoring and simplification of teamplate, mostly driven by mutantion testing
- Improve documentation for entire project
