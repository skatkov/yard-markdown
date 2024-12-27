# Class: Gem::RequestSet::GemDependencyAPI
**Inherits:** Object
    

A semi-compatible DSL for the Bundler Gemfile and Isolate gem dependencies
files.

To work with both the Bundler Gemfile and Isolate formats this implementation
takes some liberties to allow compatibility with each, most notably in
#source.

A basic gem dependencies file will look like the following:

    source 'https://rubygems.org'

    gem 'rails', '3.2.14a
    gem 'devise', '~> 2.1', '>= 2.1.3'
    gem 'cancan'
    gem 'airbrake'
    gem 'pg'

RubyGems recommends saving this as gem.deps.rb over Gemfile or Isolate.

To install the gems in this Gemfile use `gem install -g` to install it and
create a lockfile.  The lockfile will ensure that when you make changes to
your gem dependencies file a minimum amount of change is made to the
dependencies of your gems.

RubyGems can activate all the gems in your dependencies file at startup using
the RUBYGEMS_GEMDEPS environment variable or through Gem.use_gemdeps. See
Gem.use_gemdeps for details and warnings.

See `gem help install` and `gem help gem_dependencies` for further details.


# Attributes
## dependencies[RW] [](#attribute-i-dependencies)
The gems required by #gem statements in the gem.deps.rb file

## git_set[RW] [](#attribute-i-git_set)
A set of gems that are loaded via the `:git` option to #gem

## requires[RW] [](#attribute-i-requires)
A Hash containing gem names and files to require from those gems.

## vendor_set[RW] [](#attribute-i-vendor_set)
A set of gems that are loaded via the `:path` option to #gem

## without_groups[RW] [](#attribute-i-without_groups)
The groups of gems to exclude from installation


#Instance Methods
## find_gemspec(name, path) [](#method-i-find_gemspec)
Finds a gemspec with the given `name` that lives at `path`.

## gem(name, *requirements) [](#method-i-gem)
:category: Gem Dependencies DSL

:call-seq:
    gem(name)
    gem(name, *requirements)
    gem(name, *requirements, options)

Specifies a gem dependency with the given `name` and `requirements`.  You may
also supply `options` following the `requirements`

`options` include:

require:
:   RubyGems does not provide any autorequire features so requires in a gem
    dependencies file are recorded but ignored.

    In bundler the require: option overrides the file to require during
    Bundler.require.  By default the name of the dependency is required in
    Bundler.  A single file or an Array of files may be given.

    To disable requiring any file give `false`:

        gem 'rake', require: false


group:
:   Place the dependencies in the given dependency group.  A single group or
    an Array of groups may be given.

    See also #group


platform:
:   Only install the dependency on the given platform.  A single platform or
    an Array of platforms may be given.

    See #platform for a list of platforms available.


path:
:   Install this dependency from an unpacked gem in the given directory.

        gem 'modified_gem', path: 'vendor/modified_gem'


git:
:   Install this dependency from a git repository:

        gem 'private_gem', git: 'git@my.company.example:private_gem.git'


gist:
:   Install this dependency from the gist ID:

        gem 'bang', gist: '1232884'


github:
:   Install this dependency from a github git repository:

        gem 'private_gem', github: 'my_company/private_gem'


submodules:
:   Set to `true` to include submodules when fetching the git repository for
    git:, gist: and github: dependencies.


ref:
:   Use the given commit name or SHA for git:, gist: and github: dependencies.


branch:
:   Use the given branch for git:, gist: and github: dependencies.


tag:
:   Use the given tag for git:, gist: and github: dependencies.


## gem_deps_file() [](#method-i-gem_deps_file)
Returns the basename of the file the dependencies were loaded from

## gem_git_reference(options) [](#method-i-gem_git_reference)
Handles the git options from `options` for git gem.

Returns reference for the git gem.

## gemspec(options{}) [](#method-i-gemspec)
:category: Gem Dependencies DSL

Loads dependencies from a gemspec file.

`options` include:

name:
:   The name portion of the gemspec file.  Defaults to searching for any
    gemspec file in the current directory.

        gemspec name: 'my_gem'


path:
:   The path the gemspec lives in.  Defaults to the current directory:

        gemspec 'my_gem', path: 'gemspecs', name: 'my_gem'


development_group:
:   The group to add development dependencies to.  By default this is
    :development.  Only one group may be specified.


## git(repository) [](#method-i-git)
:category: Gem Dependencies DSL

Block form for specifying gems from a git `repository`.

    git 'https://github.com/rails/rails.git' do
      gem 'activesupport'
      gem 'activerecord'
    end

## git_source(name, &callback) [](#method-i-git_source)
Defines a custom git source that uses `name` to expand git repositories for
use in gems built from git repositories.  You must provide a block that
accepts a git repository name for expansion.

## group(*groups) [](#method-i-group)
:category: Gem Dependencies DSL

Block form for placing a dependency in the given `groups`.

    group :development do
      gem 'debugger'
    end

    group :development, :test do
      gem 'minitest'
    end

Groups can be excluded at install time using `gem install -g --without
development`.  See `gem help install` and `gem help gem_dependencies` for
further details.

## initialize(set, path) [](#method-i-initialize)
Creates a new GemDependencyAPI that will add dependencies to the
Gem::RequestSet `set` based on the dependency API description in `path`.

**@return** [GemDependencyAPI] a new instance of GemDependencyAPI

## installing=(installing) [](#method-i-installing=)
Changes the behavior of gem dependency file loading to installing mode. In
installing mode certain restrictions are ignored such as ruby version mismatch
checks.

## load() [](#method-i-load)
Loads the gem dependency file and returns self.

## platform(*platforms) [](#method-i-platform)
:category: Gem Dependencies DSL

Block form for restricting gems to a set of platforms.

The gem dependencies platform is different from Gem::Platform.  A platform
gem.deps.rb platform matches on the ruby engine, the ruby version and whether
or not windows is allowed.

:ruby, :ruby_XY
:   Matches non-windows, non-jruby implementations where X and Y can be used
    to match releases in the 1.8, 1.9, 2.0 or 2.1 series.


:mri, :mri_XY
:   Matches non-windows C Ruby (Matz Ruby) or only the 1.8, 1.9, 2.0 or 2.1
    series.


:mingw, :mingw_XY
:   Matches 32 bit C Ruby on MinGW or only the 1.8, 1.9, 2.0 or 2.1 series.


:x64_mingw, :x64_mingw_XY
:   Matches 64 bit C Ruby on MinGW or only the 1.8, 1.9, 2.0 or 2.1 series.


:mswin, :mswin_XY
:   Matches 32 bit C Ruby on Microsoft Windows or only the 1.8, 1.9, 2.0 or
    2.1 series.


:mswin64, :mswin64_XY
:   Matches 64 bit C Ruby on Microsoft Windows or only the 1.8, 1.9, 2.0 or
    2.1 series.


:jruby, :jruby_XY
:   Matches JRuby or JRuby in 1.8 or 1.9 mode.


:maglev
:   Matches Maglev


:rbx
:   Matches non-windows Rubinius


NOTE:  There is inconsistency in what environment a platform matches.  You may
need to read the source to know the exact details.

## ruby(version, options{}) [](#method-i-ruby)
:category: Gem Dependencies DSL

Restricts this gem dependencies file to the given ruby `version`.

You may also provide `engine:` and `engine_version:` options to restrict this
gem dependencies file to a particular ruby engine and its engine version. 
This matching is performed by using the RUBY_ENGINE and RUBY_ENGINE_VERSION
constants.

**@raise** [ArgumentError] 

## source(url) [](#method-i-source)
:category: Gem Dependencies DSL

Sets `url` as a source for gems for this dependency API.  RubyGems uses the
default configured sources if no source was given.  If a source is set only
that source is used.

This method differs in behavior from Bundler:

*   The `:gemcutter`, # `:rubygems` and `:rubyforge` sources are not supported
    as they are deprecated in bundler.
*   The `prepend:` option is not supported.  If you wish to order sources then
    list them in your preferred order.

