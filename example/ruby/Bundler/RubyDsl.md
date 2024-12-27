# Module: Bundler::RubyDsl
    




#Instance Methods
## normalize_ruby_file(filename) [](#method-i-normalize_ruby_file)
Support the various file formats found in .ruby-version files.

    3.2.2
    ruby-3.2.2

Also supports .tool-versions files for asdf. Lines not starting with "ruby"
are ignored.

    ruby 2.5.1 # comment is ignored
    ruby   2.5.1# close comment and extra spaces doesn't confuse

Intentionally does not support `3.2.1@gemset` since rvm recommends using
.ruby-gemset instead

Loads the file relative to the dirname of the Gemfile itself.

## ruby(*ruby_version) [](#method-i-ruby)

