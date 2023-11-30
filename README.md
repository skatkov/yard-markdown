# Yard::Markdown

Yard theme plugin that generates markdown documentation for gems

## Goals:
- Compatible with Github Flavored Markdown
- Mimick yard html layout in markdown format as much as possible
- Produce .csv index file alonside markdown documentation to act as file index

## Usage
Add these lines:
```
gem 'yard-markdown'
```
And run `bundle install`

Run yardoc with `--format=markdown --plugin=markdown` parameters.

## Backstory
Successor to rdoc-mardown gem that was authored by me. So there is a lot of similarities between two - [example](https://github.com/skatkov/rdoc-markdown/tree/main/example).

This gem is used by documentation reviewing tool called [POSH TUI](https://poshtui.com)

## Testing
Unit tests can't really test this gem properly. So it's semi-manual process of making changes and reviewing output.

  `yardoc example.rb` -> outputs everything into example/ folder.
