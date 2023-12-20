# Yard::Markdown

Yard plugin to generate markdown documentation

## Goals:
- Compatible with Github Flavored Markdown
- Mimick yard html layout where it makes sense to maintain familiarity
- Produce .csv index file alonside markdown documentation to act as file index
- Include markdown files that are already present in source code.

## Usage
Yard doesn't load plugin by default, so you need to load plugin through `~/.yard/config`:

```yaml
!!!yaml
load_plugins: true
autoload_plugins:
  - markdown
```

Install a plugin
```
gem install yard-markdown
```

Run `yardoc --format=markdown` to generate markdown documentation.

## Backstory
Successor to rdoc-mardown gem that was authored by me. So there is a lot of similarities between two - [example](https://github.com/skatkov/rdoc-markdown/tree/main/example).

This gem is used by documentation reviewing tool called [POSH TUI](https://poshtui.com)

## Testing
Unit tests can't really test this gem properly. So it's semi-manual process of making changes and reviewing output.

  `yardoc example.rb` -> outputs everything into example/ folder.
