# Yard::Markdown

Yard plugin to output markdown documentation.

## Goals:
- Compatible with Github Flavored Markdown
- Produce .csv index file
- Mimick html layout where it makes sense to maintain familiarity

## Usage
Install a plugin
```
gem install yard-markdown
```

Run `yardoc --format=markdown` to generate markdown documentation.

To include Ruby method implementations beneath their documentation, opt in with:

```bash
yardoc --format=markdown --embed-source
```

The prototype adds a **Source** section with a fenced Ruby code block to methods.
It uses source captured by YARD without executing it. Attribute accessors and
methods without available source have no source section. Source is omitted by
default; existing visibility filters still apply. Review implementations for
secrets or other internal details before publishing documentation with source.

Markdown files in the project tree are detected automatically, copied unchanged into the output, and listed in `index.csv`:

Markdown files whose basename starts with `_` are ignored automatically.

Use YARD's `--exclude` option to omit a separate documentation tree:

```bash
yardoc --format=markdown --exclude '\Adocs/'
```

## FAQ

### Note on RDoc support
It seems important to note, that yard claims to have support for RDoc. That support is certainly present, but output for rdoc is dramatically different. A lot of useful information seems lost in the process.

If you know how to improve that, please get in touch or submit a patch.

So in meantime, there is work going on a competing gem for RDoc and it's called [rdoc-markdown gem](https://github.com/skatkov/rdoc-markdown/).

### Note on index.csv file
This gem emits index of all markdown files in a index.csv file.

There are decent tools that offer search through structured plain-text files. But my expectation is that nobody will use CSV as an actual search index, but rather import it into something that performs this function better.

In my personal use-case, I use SQLite. All other databases seem to have a good support for CSV imports.

### Yard doesn't load plugin properly? 
so you need to load plugin through `~/.yard/config`:

```yaml
!!!yaml
load_plugins: true
autoload_plugins:
  - markdown
```

## Testing
Unit tests verify renderer behavior, index links, and anchor consistency for both YARD-style and RDoc-style sources.

Run:

```bash
bundle exec rake test
```

Regenerate local sample docs:

```bash
bundle exec rake examples:generate
```

Validate generated markdown in sample docs:

```bash
bundle exec rake markdown:validate_examples
```

There is also a real-world validation harness for repositories with substantial YARD documentation (`faraday`, `sidekiq`):

```bash
bundle exec rake markdown:validate_real_world
```

This task validates every generated Markdown file against CommonMark and GFM. Generated files must have valid local links and anchors; unresolved links and anchors in byte-identical Markdown copied from upstream are reported instead of failing validation.

GitHub Actions CI runs this task on every push/PR, so both real-world fixture gems are verified continuously.

For reproducible checks, the task clones pinned tags (`faraday` `v2.14.3`, `sidekiq` `v7.3.10`) into `tmp/real-world/repos` and honors each repository's `.yardopts` before generating output in `tmp/real-world/faraday` and `tmp/real-world/sidekiq`.
