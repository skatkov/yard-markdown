# Yard::Markdown

Yard plugin to output markdown documentation.

## Motivation
Markdown has become the de-facto documentation standard. I heavily rely on Obsidian to render my storage of markdown notes. But markdown is used not just for scribbles, supported is far and wide. We can render markdown file on any device, probably even on thermometer with a screen. But also everyone knows enough markdown to be dangerous (or productive).
It's a pitty that rdoc and yard can't output a proper markdown file. I would like to change that.

## Goals:
- Compatible with Github Flavored Markdown
- Produce .csv index file
- Mimick yard html layout where it makes sense to maintain familiarity

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

## Note on RDoc support
It seems important to note, that yard claims to have support for RDoc. That support is certainly present, but output for rdoc is dramatically different. A lot of useful information seems lost in the process.

If you know how to improve that, please get in touch or submit a patch.

So in meantime, there is work going on a competing gem for RDoc and it's called [rdoc-mardown gem](https://github.com/skatkov/rdoc-markdown/tree/main/example).

## Note on index.csv file
This gem emits index of all markdown files in a index.csv file.

There are decent tools that offer search through structured plain-text files. But my expectation is that nobody will use CSV as an actual search index, but rather import it into something that performs this function better.

In my personal use-case, I use SQLite. All other databases seem to have a good support for CSV imports.

## Testing
Unit tests can't really test this gem properly. So it's semi-manual process of making changes and reviewing output.

Easiest way to test is to run `rake generate_example` and check output in `example` directory.
