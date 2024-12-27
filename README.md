# Yard::Markdown

Yard plugin to generate markdown documentation

## Goals:
- Compatible with Github Flavored Markdown
- Mimick yard html layout where it makes sense to maintain familiarity
- Produce .csv index file alonside markdown documentation to act as file index

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
This is a successor to [rdoc-mardown gem](https://github.com/skatkov/rdoc-markdown/tree/main/example). These docsets are used in [POSH TUI](https://poshtui.com).

## Testing
Unit tests can't really test this gem properly. So it's semi-manual process of making changes and reviewing output.

Easiest way to test is to run `rake generate_example` and check output in `example` directory.
