# Class: Bundler::Dsl
**Inherits:** Object
    
**Includes:** Bundler::RubyDsl
  



# Class Methods
## evaluate(gemfile , lockfile , unlock ) [](#method-c-evaluate)
# Attributes
## dependencies[RW] [](#attribute-i-dependencies)
Returns the value of attribute dependencies.

## gemfile[RW] [](#attribute-i-gemfile)
Returns the value of attribute gemfile.

## gemspecs[RW] [](#attribute-i-gemspecs)
Returns the value of attribute gemspecs.


#Instance Methods
## check_primary_source_safety() [](#method-i-check_primary_source_safety)

## env(name) [](#method-i-env)

## eval_gemfile(gemfile, contentsnil) [](#method-i-eval_gemfile)

## gem(name, *args) [](#method-i-gem)

## gemspec(optsnil) [](#method-i-gemspec)

## git(uri, options{}, &blk) [](#method-i-git)

## git_source(name, &block) [](#method-i-git_source)

## github(repo, options{}) [](#method-i-github)

**@raise** [InvalidArgumentError] 

## group(*args, &blk) [](#method-i-group)

## initialize() [](#method-i-initialize)

**@return** [Dsl] a new instance of Dsl

## install_if(*args) [](#method-i-install_if)

## method_missing(name, *args) [](#method-i-method_missing)

**@raise** [GemfileError] 

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

## path(path, options{}, &blk) [](#method-i-path)

## platforms(*platforms) [](#method-i-platforms)

## plugin(*args) [](#method-i-plugin)

## ruby(*ruby_version) [](#method-i-ruby)

## source(source, *args, &blk) [](#method-i-source)

## to_definition(lockfile, unlock) [](#method-i-to_definition)

