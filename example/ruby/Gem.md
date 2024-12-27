# Module: Gem
    

module Gem::URI


# Class Methods
## URI(uri ) [](#method-c-URI)
Returns a Gem::URI object derived from the given `uri`, which may be a
Gem::URI string or an existing Gem::URI object:

    # Returns a new Gem::URI.
    uri = Gem::URI('http://github.com/ruby/ruby')
    # => #<Gem::URI::HTTP http://github.com/ruby/ruby>
    # Returns the given Gem::URI.
    Gem::URI(uri)
    # => #<Gem::URI::HTTP http://github.com/ruby/ruby>
## activate_bin_path(name , exec_name nil, *requirements ) [](#method-c-activate_bin_path)
Find the full path to the executable for gem `name`.  If the `exec_name` is
not given, an exception will be raised, otherwise the specified executable's
path is returned.  `requirements` allows you to specify specific gem versions.

A side effect of this method is that it will activate the gem that contains
the executable.

This method should **only** be used in bin stub files.
## activated_gem_paths() [](#method-c-activated_gem_paths)
The number of paths in the +$LOAD_PATH+ from activated gems. Used to
prioritize `-I` and `ENV['RUBYLIB']` entries during `require`.
## add_to_load_path(*paths ) [](#method-c-add_to_load_path)
Add a list of paths to the $LOAD_PATH at the proper place.
## bin_path(name , exec_name nil, *requirements ) [](#method-c-bin_path)
Find the full path to the executable for gem `name`.  If the `exec_name` is
not given, an exception will be raised, otherwise the specified executable's
path is returned.  `requirements` allows you to specify specific gem versions.
## binary_mode() [](#method-c-binary_mode)
The mode needed to read a file as straight binary.
## bindir(install_dir Gem.dir) [](#method-c-bindir)
The path where gem executables are to be installed.
## cache_home() [](#method-c-cache_home)
The path to standard location of the user's cache directory.
## clear_default_specs() [](#method-c-clear_default_specs)
Clear default gem related variables. It is for test
## clear_paths() [](#method-c-clear_paths)
Reset the `dir` and `path` values.  The next time `dir` or `path` is
requested, the values will be calculated from scratch.  This is mainly used by
the unit tests to provide test isolation.
## config_file() [](#method-c-config_file)
The path to standard location of the user's .gemrc file.
## config_home() [](#method-c-config_home)
The path to standard location of the user's configuration directory.
## configuration() [](#method-c-configuration)
The standard configuration object for gems.
## configuration=(config ) [](#method-c-configuration=)
Use the given configuration object (which implements the ConfigFile protocol)
as the standard configuration object.
## data_home() [](#method-c-data_home)
The path to standard location of the user's data directory.
## default_bindir() [](#method-c-default_bindir)
The default directory for binaries
## default_cert_path() [](#method-c-default_cert_path)
The default signing certificate chain path
## default_dir() [](#method-c-default_dir)
Default home directory path to be used if an alternate value is not specified
in the environment
## default_exec_format() [](#method-c-default_exec_format)
Deduce Ruby's --program-prefix and --program-suffix from its install name
## default_ext_dir_for(base_dir ) [](#method-c-default_ext_dir_for)
Returns binary extensions dir for specified RubyGems base dir or nil if such
directory cannot be determined.

By default, the binary extensions are located side by side with their Ruby
counterparts, therefore nil is returned
## default_key_path() [](#method-c-default_key_path)
The default signing key path
## default_path() [](#method-c-default_path)
Default gem load path
## default_rubygems_dirs() [](#method-c-default_rubygems_dirs)
Paths where RubyGems' .rb files and bin files are installed
## default_sources() [](#method-c-default_sources)
An Array of the default sources that come with RubyGems
## default_spec_cache_dir() [](#method-c-default_spec_cache_dir)
Default spec directory path to be used if an alternate value is not specified
in the environment
## default_specifications_dir() [](#method-c-default_specifications_dir)
Path to specification files of default gems.
## default_user_install() [](#method-c-default_user_install)
Enables automatic installation into user directory
## deflate(data ) [](#method-c-deflate)
A Zlib::Deflate.deflate wrapper
## dir() [](#method-c-dir)
The path where gems are to be installed.
## done_installing(&hook ) [](#method-c-done_installing)
Adds a post-installs hook that will be passed a Gem::DependencyInstaller and a
list of installed specifications when Gem::DependencyInstaller#install is
complete
## dynamic_library_suffixes() [](#method-c-dynamic_library_suffixes)
Suffixes for dynamic library require-able paths.
## ensure_default_gem_subdirectories(dir Gem.dir, mode nil) [](#method-c-ensure_default_gem_subdirectories)
Quietly ensure the Gem directory `dir` contains all the proper subdirectories
for handling default gems.  If we can't create a directory due to a permission
problem, then we will silently continue.

If `mode` is given, missing directories are created with this mode.

World-writable directories will never be created.
## ensure_gem_subdirectories(dir Gem.dir, mode nil) [](#method-c-ensure_gem_subdirectories)
Quietly ensure the Gem directory `dir` contains all the proper subdirectories.
 If we can't create a directory due to a permission problem, then we will
silently continue.

If `mode` is given, missing directories are created with this mode.

World-writable directories will never be created.
## ensure_subdirectories(dir , mode , subdirs ) [](#method-c-ensure_subdirectories)
:nodoc:
## env_requirement(gem_name ) [](#method-c-env_requirement)
## extension_api_version() [](#method-c-extension_api_version)
The extension API version of ruby.  This includes the static vs non-static
distinction as extensions cannot be shared between the two.
## find_config_file() [](#method-c-find_config_file)
Finds the user's config file
## find_default_spec(path ) [](#method-c-find_default_spec)
Find a Gem::Specification of default gem from `path`
## find_files(glob , check_load_path true) [](#method-c-find_files)
Returns a list of paths matching `glob` that can be used by a gem to pick up
features from other gems.  For example:

    Gem.find_files('rdoc/discover').each do |path| load path end

if `check_load_path` is true (the default), then find_files also searches
$LOAD_PATH for files as well as gems.

Note that find_files will return all files even if they are from different
versions of the same gem.  See also find_latest_files
## find_files_from_load_path(glob ) [](#method-c-find_files_from_load_path)
:nodoc:
## find_latest_files(glob , check_load_path true) [](#method-c-find_latest_files)
Returns a list of paths matching `glob` from the latest gems that can be used
by a gem to pick up features from other gems.  For example:

    Gem.find_latest_files('rdoc/discover').each do |path| load path end

if `check_load_path` is true (the default), then find_latest_files also
searches $LOAD_PATH for files as well as gems.

Unlike find_files, find_latest_files will return only files from the latest
version of a gem.
## find_unresolved_default_spec(path ) [](#method-c-find_unresolved_default_spec)
Find an unresolved Gem::Specification of default gem from `path`
## finish_resolve(request_set Gem::RequestSet.new) [](#method-c-finish_resolve)
## freebsd_platform?() [](#method-c-freebsd_platform?)
Is this platform FreeBSD
**@return** [Boolean] 

## host() [](#method-c-host)
Get the default RubyGems API host. This is normally `https://rubygems.org`.
## host=(host ) [](#method-c-host=)
Set the default RubyGems API host.
## install(name , version Gem::Requirement.default, *options ) [](#method-c-install)
Top level install helper method. Allows you to install gems interactively:

    % irb
    >> Gem.install "minitest"
    Fetching: minitest-5.14.0.gem (100%)
    => [#<Gem::Specification:0x1013b4528 @name="minitest", ...>]
## install_extension_in_lib() [](#method-c-install_extension_in_lib)
Install extensions into lib as well as into the extension directory.
## java_platform?() [](#method-c-java_platform?)
Is this a java platform?
**@return** [Boolean] 

## latest_rubygems_version() [](#method-c-latest_rubygems_version)
Returns the latest release version of RubyGems.
## latest_spec_for(name ) [](#method-c-latest_spec_for)
Returns the latest release-version specification for the gem `name`.
## latest_version_for(name ) [](#method-c-latest_version_for)
Returns the version of the latest release-version of gem `name`
## load_env_plugins() [](#method-c-load_env_plugins)
Find all 'rubygems_plugin' files in $LOAD_PATH and load them
## load_path_insert_index() [](#method-c-load_path_insert_index)
The index to insert activated gem paths into the $LOAD_PATH. The activated
gem's paths are inserted before site lib directory by default.
## load_plugin_files(plugins ) [](#method-c-load_plugin_files)
Load `plugins` as Ruby files
## load_plugins() [](#method-c-load_plugins)
Find rubygems plugin files in the standard location and load them
## load_safe_marshal() [](#method-c-load_safe_marshal)
## load_yaml() [](#method-c-load_yaml)
Loads YAML, preferring Psych
## location_of_caller(depth 1) [](#method-c-location_of_caller)
The file name and line number of the caller of the caller of this method.

`depth` is how many layers up the call stack it should go.

e.g.,

def a; Gem.location_of_caller; end a #=> ["x.rb", 2]  # (it'll vary depending
on file name and line number)

def b; c; end def c; Gem.location_of_caller(2); end b #=> ["x.rb", 6]  #
(it'll vary depending on file name and line number)
## marshal_version() [](#method-c-marshal_version)
The version of the Marshal format for your Ruby.
## needs() [](#method-c-needs)
**@yield** [rs] 

## open_file(path , flags , &block ) [](#method-c-open_file)
Open a file with given flags
## open_file_with_flock(path , &block ) [](#method-c-open_file_with_flock)
Open a file with given flags, and protect access with flock
## open_file_with_lock(path , &block ) [](#method-c-open_file_with_lock)
Open a file with given flags, and protect access with a file lock
## operating_system_defaults() [](#method-c-operating_system_defaults)
Default options for gem commands for Ruby packagers.

The options here should be structured as an array of string "gem" command
names as keys and a string of the default options as values.

Example:

def self.operating_system_defaults
    {
        'install' => '--no-rdoc --no-ri --env-shebang',
        'update' => '--no-rdoc --no-ri --env-shebang'
    }

end
## path() [](#method-c-path)
## path_separator() [](#method-c-path_separator)
How String Gem paths should be split.  Overridable for esoteric platforms.
## paths() [](#method-c-paths)
Retrieve the PathSupport object that RubyGems uses to lookup files.
## paths=(env ) [](#method-c-paths=)
Initialize the filesystem paths to use from `env`. `env` is a hash-like object
(typically ENV) that is queried for 'GEM_HOME', 'GEM_PATH', and
'GEM_SPEC_CACHE' Keys for the `env` hash should be Strings, and values of the
hash should be Strings or `nil`.
## platform_defaults() [](#method-c-platform_defaults)
Default options for gem commands for Ruby implementers.

The options here should be structured as an array of string "gem" command
names as keys and a string of the default options as values.

Example:

def self.platform_defaults
    {
        'install' => '--no-rdoc --no-ri --env-shebang',
        'update' => '--no-rdoc --no-ri --env-shebang'
    }

end
## platforms() [](#method-c-platforms)
Array of platforms this RubyGems supports.
## platforms=(platforms ) [](#method-c-platforms=)
Set array of platforms this RubyGems supports (primarily for testing).
## plugin_suffix_pattern() [](#method-c-plugin_suffix_pattern)
Glob pattern for require-able plugin suffixes.
## plugin_suffix_regexp() [](#method-c-plugin_suffix_regexp)
Regexp for require-able plugin suffixes.
## plugindir(install_dir Gem.dir) [](#method-c-plugindir)
The path were rubygems plugins are to be installed.
## post_build(&hook ) [](#method-c-post_build)
Adds a post-build hook that will be passed an Gem::Installer instance when
Gem::Installer#install is called.  The hook is called after the gem has been
extracted and extensions have been built but before the executables or gemspec
has been written.  If the hook returns `false` then the gem's files will be
removed and the install will be aborted.
## post_install(&hook ) [](#method-c-post_install)
Adds a post-install hook that will be passed an Gem::Installer instance when
Gem::Installer#install is called
## post_reset(&hook ) [](#method-c-post_reset)
Adds a hook that will get run after Gem::Specification.reset is run.
## post_uninstall(&hook ) [](#method-c-post_uninstall)
Adds a post-uninstall hook that will be passed a Gem::Uninstaller instance and
the spec that was uninstalled when Gem::Uninstaller#uninstall is called
## pre_install(&hook ) [](#method-c-pre_install)
Adds a pre-install hook that will be passed an Gem::Installer instance when
Gem::Installer#install is called.  If the hook returns `false` then the
install will be aborted.
## pre_reset(&hook ) [](#method-c-pre_reset)
Adds a hook that will get run before Gem::Specification.reset is run.
## pre_uninstall(&hook ) [](#method-c-pre_uninstall)
Adds a pre-uninstall hook that will be passed an Gem::Uninstaller instance and
the spec that will be uninstalled when Gem::Uninstaller#uninstall is called
## prefix() [](#method-c-prefix)
The directory prefix this RubyGems was installed at. If your prefix is in a
standard location (ie, rubygems is installed where you'd expect it to be),
then prefix returns nil.
## read_binary(path ) [](#method-c-read_binary)
Safely read a file in binary mode on all platforms.
## refresh() [](#method-c-refresh)
Refresh available gems from disk.
## register_default_spec(spec ) [](#method-c-register_default_spec)
Register a Gem::Specification for default gem.

Two formats for the specification are supported:

*   MRI 2.0 style, where spec.files contains unprefixed require names. The
    spec's filenames will be registered as-is.
*   New style, where spec.files contains files prefixed with paths from
    spec.require_paths. The prefixes are stripped before registering the
    spec's filenames. Unprefixed files are omitted.
## ruby() [](#method-c-ruby)
The path to the running Ruby interpreter.
## ruby=(ruby ) [](#method-c-ruby=)
Allows setting path to Ruby.
## ruby_api_version() [](#method-c-ruby_api_version)
Returns a String containing the API compatibility version of Ruby
## ruby_engine() [](#method-c-ruby_engine)
## ruby_version() [](#method-c-ruby_version)
A Gem::Version for the currently running Ruby.
## rubygems_version() [](#method-c-rubygems_version)
A Gem::Version for the currently running RubyGems
## searcher=(searcher ) [](#method-c-searcher=)
Allows setting the gem path searcher.
## set_target_rbconfig(rbconfig_path ) [](#method-c-set_target_rbconfig)
## solaris_platform?() [](#method-c-solaris_platform?)
Is this platform Solaris?
**@return** [Boolean] 

## source_date_epoch() [](#method-c-source_date_epoch)
Returns the value of Gem.source_date_epoch_string, as a Time object.

This is used throughout RubyGems for enabling reproducible builds.
## source_date_epoch_string() [](#method-c-source_date_epoch_string)
If the SOURCE_DATE_EPOCH environment variable is set, returns it's value.
Otherwise, returns the time that `Gem.source_date_epoch_string` was first
called in the same format as SOURCE_DATE_EPOCH.

NOTE(@duckinator): The implementation is a tad weird because we want to:
    1. Make builds reproducible by default, by having this function always
       return the same result during a given run.
    2. Allow changing ENV['SOURCE_DATE_EPOCH'] at runtime, since multiple
       tests that set this variable will be run in a single process.

If you simplify this function and a lot of tests fail, that is likely due to
#2 above.

Details on SOURCE_DATE_EPOCH:
https://reproducible-builds.org/specs/source-date-epoch/
## sources() [](#method-c-sources)
Returns an Array of sources to fetch remote gems from. Uses default_sources if
the sources list is empty.
## sources=(new_sources ) [](#method-c-sources=)
Need to be able to set the sources without calling Gem.sources.replace since
that would cause an infinite loop.

DOC: This comment is not documentation about the method itself, it's more of a
code comment about the implementation.
## spec_cache_dir() [](#method-c-spec_cache_dir)
## state_file() [](#method-c-state_file)
The path to standard location of the user's state file.
## state_home() [](#method-c-state_home)
The path to standard location of the user's state directory.
## suffix_pattern() [](#method-c-suffix_pattern)
Glob pattern for require-able path suffixes.
## suffix_regexp() [](#method-c-suffix_regexp)
Regexp for require-able path suffixes.
## suffixes() [](#method-c-suffixes)
Suffixes for require-able paths.
## target_rbconfig() [](#method-c-target_rbconfig)
The RbConfig object for the deployment target platform.

This is usually the same as the running platform, but may be different if you
are cross-compiling.
## time(msg , width 0, display Gem.configuration.verbose) [](#method-c-time)
Prints the amount of time the supplied block takes to run using the debug UI
output.
## try_activate(path ) [](#method-c-try_activate)
Try to activate a gem containing `path`. Returns true if activation succeeded
or wasn't needed because it was already activated. Returns false if it can't
find the path in a gem.
## ui() [](#method-c-ui)
Lazily loads DefaultUserInteraction and returns the default UI.
## use_gemdeps(path nil) [](#method-c-use_gemdeps)
Looks for a gem dependency file at `path` and activates the gems in the file
if found.  If the file is not found an ArgumentError is raised.

If `path` is not given the RUBYGEMS_GEMDEPS environment variable is used, but
if no file is found no exception is raised.

If '-' is given for `path` RubyGems searches up from the current working
directory for gem dependency files (gem.deps.rb, Gemfile, Isolate) and
activates the gems in the first one found.

You can run this automatically when rubygems starts.  To enable, set the
`RUBYGEMS_GEMDEPS` environment variable to either the path of your gem
dependencies file or "-" to auto-discover in parent directories.

NOTE: Enabling automatic discovery on multiuser systems can lead to execution
of arbitrary code when used from directories outside your control.
## use_paths(home , *paths ) [](#method-c-use_paths)
Use the `home` and `paths` values for Gem.dir and Gem.path.  Used mainly by
the unit tests to provide environment isolation.
## user_dir() [](#method-c-user_dir)
Path for gems in the user's home directory
## user_home() [](#method-c-user_home)
The home directory for the user.
## vendor_dir() [](#method-c-vendor_dir)
Directory where vendor gems are installed.
## win_platform=(val ) [](#method-c-win_platform=)
Allows toggling Windows behavior.
## win_platform?() [](#method-c-win_platform?)
Is this a windows platform?
**@return** [Boolean] 

## write_binary(path , data ) [](#method-c-write_binary)
Safely write a file in binary mode on all platforms.
# Attributes
## disable_system_update_message[RW] [](#attribute-c-disable_system_update_message)
RubyGems distributors (like operating system package managers) can disable
RubyGems update by setting this to error message printed to end-users on gem
update --system instead of actual update.

## discover_gems_on_require[RW] [](#attribute-c-discover_gems_on_require)
Whether RubyGems should enhance builtin `require` to automatically check
whether the path required is present in installed gems, and automatically
activate them and add them to `$LOAD_PATH`.

## done_installing_hooks[RW] [](#attribute-c-done_installing_hooks)
The list of hooks to be run after Gem::DependencyInstaller installs a set of
gems

## gemdeps[RW] [](#attribute-c-gemdeps)
GemDependencyAPI object, which is set when .use_gemdeps is called. This
contains all the information from the Gemfile.

## loaded_specs[RW] [](#attribute-c-loaded_specs)
Hash of loaded Gem::Specification keyed by name

## post_build_hooks[RW] [](#attribute-c-post_build_hooks)
The list of hooks to be run after Gem::Installer#install extracts files and
builds extensions

## post_install_hooks[RW] [](#attribute-c-post_install_hooks)
The list of hooks to be run after Gem::Installer#install completes
installation

## post_reset_hooks[RW] [](#attribute-c-post_reset_hooks)
The list of hooks to be run after Gem::Specification.reset is run.

## post_uninstall_hooks[RW] [](#attribute-c-post_uninstall_hooks)
The list of hooks to be run after Gem::Uninstaller#uninstall completes
installation

## pre_install_hooks[RW] [](#attribute-c-pre_install_hooks)
The list of hooks to be run before Gem::Installer#install does any work

## pre_reset_hooks[RW] [](#attribute-c-pre_reset_hooks)
The list of hooks to be run before Gem::Specification.reset is run.

## pre_uninstall_hooks[RW] [](#attribute-c-pre_uninstall_hooks)
The list of hooks to be run before Gem::Uninstaller#uninstall does any work


