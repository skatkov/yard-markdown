# Class: Gem::Installer
**Inherits:** Object
  
**Extended by:** Gem::Deprecate
    
**Includes:** Gem::InstallerUninstallerUtils, Gem::UserInteraction
  

The installer installs the files contained in the .gem into the Gem.home.

Gem::Installer does the work of putting files in all the right places on the
filesystem including unpacking the gem into its gem dir, installing the
gemspec in the specifications dir, storing the cached gem in the cache dir,
and installing either wrappers or symlinks for executables.

The installer invokes pre and post install hooks.  Hooks can be added either
through a rubygems_plugin.rb file in an installed gem or via a
rubygems/defaults/#{RUBY_ENGINE}.rb or rubygems/defaults/operating_system.rb
file.  See Gem.pre_install and Gem.post_install for details.


# Class Methods
## at(path , options {}) [](#method-c-at)
Construct an installer object for the gem file located at `path`
## deprecate(name , repl , year , month ) [](#method-c-deprecate)
Simple deprecation method that deprecates `name` by wrapping it up in a dummy
method. It warns on each call to the dummy method telling the user of `repl`
(unless `repl` is :none) and the year/month that it is planned to go away.
## for_spec(spec , options {}) [](#method-c-for_spec)
Construct an installer object for an ephemeral gem (one where we don't
actually have a .gem file, just a spec)
## inherited(klass ) [](#method-c-inherited)
Changes in rubygems to lazily loading `rubygems/command` (in order to lazily
load `optparse` as a side effect) affect bundler's custom installer which uses
`Gem::Command` without requiring it (up until bundler 2.2.29). This hook is to
compensate for that missing require.

TODO: Remove when rubygems no longer supports running on bundler older than
2.2.29.
# Attributes
## exec_format[RW] [](#attribute-c-exec_format)
Defaults to use Ruby's program prefix and suffix.

## bin_dir[RW] [](#attribute-i-bin_dir)
The directory a gem's executables will be installed into

## build_args=[R] [](#attribute-i-build_args=)
Available through requiring rubygems/installer_test_case

## build_root[RW] [](#attribute-i-build_root)
:nodoc:

## env_shebang=[R] [](#attribute-i-env_shebang=)
Available through requiring rubygems/installer_test_case

## force=[R] [](#attribute-i-force=)
Available through requiring rubygems/installer_test_case

## format=[R] [](#attribute-i-format=)
Available through requiring rubygems/installer_test_case

## format_executable=[R] [](#attribute-i-format_executable=)
Available through requiring rubygems/installer_test_case

## gem_dir[RW] [](#attribute-i-gem_dir)
Lazy accessor for the spec's gem directory.

## gem_home[RW] [](#attribute-i-gem_home)
The gem repository the gem will be installed into

## ignore_dependencies=[R] [](#attribute-i-ignore_dependencies=)
Available through requiring rubygems/installer_test_case

## options[RW] [](#attribute-i-options)
The options passed when the Gem::Installer was instantiated.

## package[RW] [](#attribute-i-package)
The gem package instance.

## security_policy=[R] [](#attribute-i-security_policy=)
Available through requiring rubygems/installer_test_case

## wrappers=[R] [](#attribute-i-wrappers=)
Available through requiring rubygems/installer_test_case


#Instance Methods
## alert(statement, questionnil) [](#method-i-alert)
Displays an alert `statement`.  Asks a `question` if given.

## alert_error(statement, questionnil) [](#method-i-alert_error)
Displays an error `statement` to the error output location.  Asks a `question`
if given.

## alert_warning(statement, questionnil) [](#method-i-alert_warning)
Displays a warning `statement` to the warning output location.  Asks a
`question` if given.

## app_script_text(bin_file_name) [](#method-i-app_script_text)
Return the text for an application file.

## ask(question) [](#method-i-ask)
Asks a `question` and returns the answer.

## ask_for_password(prompt) [](#method-i-ask_for_password)
Asks for a password with a `prompt`

## ask_yes_no(question, defaultnil) [](#method-i-ask_yes_no)
Asks a yes or no `question`.  Returns true for yes, false for no.

## build_extensions() [](#method-i-build_extensions)
Builds extensions.  Valid types of extensions are extconf.rb files, configure
scripts and rakefiles or mkrf_conf files.

## check_executable_overwrite(filename) [](#method-i-check_executable_overwrite)
Checks if `filename` exists in +@bin_dir+.

If +@force+ is set `filename` is overwritten.

If `filename` exists and it is a RubyGems wrapper for a different gem, then
the user is consulted.

If `filename` exists and +@bin_dir+ is Gem.default_bindir (/usr/local) the
user is consulted.

Otherwise `filename` is overwritten.

**@raise** [Gem::InstallError] 

## check_that_user_bin_dir_is_in_path(executables) [](#method-i-check_that_user_bin_dir_is_in_path)
:nodoc:

## choose_from_list(question, list) [](#method-i-choose_from_list)
Asks the user to answer `question` with an answer from the given `list`.

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## default_spec_file() [](#method-i-default_spec_file)
The location of the default spec file for default gems.

## dir() [](#method-i-dir)
Return the target directory where the gem is to be installed. This directory
is not guaranteed to be populated.

## ensure_dependencies_met() [](#method-i-ensure_dependencies_met)
:nodoc:

## ensure_dependency(spec, dependency) [](#method-i-ensure_dependency)
Ensure that the dependency is satisfied by the current installation of gem. 
If it is not an exception is raised.

spec
:   Gem::Specification

dependency
:   Gem::Dependency


## ensure_loadable_spec() [](#method-i-ensure_loadable_spec)
Ensures the Gem::Specification written out for this gem is loadable upon
installation.

## ensure_writable_dir(dir) [](#method-i-ensure_writable_dir)
:nodoc:

**@raise** [Gem::FilePermissionError] 

## explicit_version_requirement(name) [](#method-i-explicit_version_requirement)

## extract_bin() [](#method-i-extract_bin)
Extracts only the bin/ files from the gem into the gem directory. This is used
by default gems to allow a gem-aware stub to function without the full gem
installed.

## extract_files() [](#method-i-extract_files)
Reads the file index and extracts each file into the gem directory.

Ensures that files can't be installed outside the gem directory.

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## formatted_program_filename(filename) [](#method-i-formatted_program_filename)
Prefix and suffix the program filename the same as ruby.

## gem() [](#method-i-gem)
Filename of the gem being installed.

## gemdeps_load(name) [](#method-i-gemdeps_load)

## generate_bin() [](#method-i-generate_bin)
:nodoc:

## generate_bin_script(filename, bindir) [](#method-i-generate_bin_script)
Creates the scripts to run the applications in the gem. -- The Windows script
is generated in addition to the regular one due to a bug or misfeature in the
Windows shell's pipe.  See https://blade.ruby-lang.org/ruby-talk/193379

## generate_bin_symlink(filename, bindir) [](#method-i-generate_bin_symlink)
Creates the symlinks to run the applications in the gem.  Moves the symlink if
the gem being installed has a newer version.

## generate_plugins() [](#method-i-generate_plugins)
:nodoc:

## generate_windows_script(filename, bindir) [](#method-i-generate_windows_script)
Creates windows .bat files for easy running of commands

## initialize(package, options{}) [](#method-i-initialize)
Constructs an Installer instance that will install the gem at `package` which
can either be a path or an instance of Gem::Package.  `options` is a Hash with
the following keys:

:bin_dir
:   Where to put a bin wrapper if needed.

:development
:   Whether or not development dependencies should be installed.

:env_shebang
:   Use /usr/bin/env in bin wrappers.

:force
:   Overrides all version checks and security policy checks, except for a
    signed-gems-only policy.

:format_executable
:   Format the executable the same as the Ruby executable. If your Ruby is
    ruby18, foo_exec will be installed as foo_exec18.

:ignore_dependencies
:   Don't raise if a dependency is missing.

:install_dir
:   The directory to install the gem into.

:security_policy
:   Use the specified security policy.  See Gem::Security

:user_install
:   Indicate that the gem should be unpacked into the users personal gem
    directory.

:only_install_dir
:   Only validate dependencies against what is in the install_dir

:wrappers
:   Install wrappers if true, symlinks if false.

:build_args
:   An Array of arguments to pass to the extension builder process. If not
    set, then Gem::Command.build_args is used

:post_install_message
:   Print gem post install message if true


**@return** [Installer] a new instance of Installer

## install() [](#method-i-install)
Installs the gem and returns a loaded Gem::Specification for the installed
gem.

The gem will be installed with the following structure:

    @gem_home/
      cache/<gem-version>.gem #=> a cached copy of the installed gem
      gems/<gem-version>/... #=> extracted files
      specifications/<gem-version>.gemspec #=> the Gem::Specification

## installation_satisfies_dependency?(dependency) [](#method-i-installation_satisfies_dependency?)
True if the gems in the system satisfy `dependency`.

**@return** [Boolean] 

## installed_specs() [](#method-i-installed_specs)
Return an Array of Specifications contained within the gem_home we'll be
installing into.

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## pre_install_checks() [](#method-i-pre_install_checks)
Performs various checks before installing the gem such as the install
repository is writable and its directories exist, required Ruby and rubygems
versions are met and that dependencies are installed.

Version and dependency checks are skipped if this install is forced.

The dependent check will be skipped if the install is ignoring dependencies.

## process_options() [](#method-i-process_options)
:nodoc:

## regenerate_plugins_for(spec, plugins_dir) [](#method-i-regenerate_plugins_for)

## remove_plugins_for(spec, plugins_dir) [](#method-i-remove_plugins_for)

## run_post_build_hooks() [](#method-i-run_post_build_hooks)
:nodoc:

## run_post_install_hooks() [](#method-i-run_post_install_hooks)
:nodoc:

## run_pre_install_hooks() [](#method-i-run_pre_install_hooks)
:nodoc:

## say(statement"") [](#method-i-say)
Displays the given `statement` on the standard output (or equivalent).

## shebang(bin_file_name) [](#method-i-shebang)
Generates a #! line for `bin_file_name`'s wrapper copying arguments if
necessary.

If the :custom_shebang config is set, then it is used as a template for how to
create the shebang used for to run a gem's executables.

The template supports 4 expansions:

    $env    the path to the unix env utility
    $ruby   the path to the currently running ruby interpreter
    $exec   the path to the gem's executable
    $name   the name of the gem the executable is for

## spec() [](#method-i-spec)
Lazy accessor for the installer's spec.

## spec_file() [](#method-i-spec_file)
The location of the spec file that is installed.

## terminate_interaction(exit_code0) [](#method-i-terminate_interaction)
Terminates the RubyGems process with the given `exit_code`

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## ui() [](#method-i-ui)
See DefaultUserInteraction::ui

## ui=(new_ui) [](#method-i-ui=)
See DefaultUserInteraction::ui=

## unpack(directory) [](#method-i-unpack)
Unpacks the gem into the given directory.

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

## verbose(msgnil) [](#method-i-verbose)
Calls `say` with `msg` or the results of the block if really_verbose is true.

## verify_gem_home() [](#method-i-verify_gem_home)
:nodoc:

## verify_spec() [](#method-i-verify_spec)

## windows_stub_script(bindir, bin_file_name) [](#method-i-windows_stub_script)
return the stub script text used to launch the true Ruby script

## write_build_info_file() [](#method-i-write_build_info_file)
Writes the file containing the arguments for building this gem's extensions.

## write_cache_file() [](#method-i-write_cache_file)
Writes the .gem file to the cache directory

## write_default_spec() [](#method-i-write_default_spec)
Writes the full .gemspec specification (in Ruby) to the gem home's
specifications/default directory.

In contrast to #write_spec, this keeps file lists, so the `gem contents`
command works.

## write_spec() [](#method-i-write_spec)
Writes the .gemspec specification (in Ruby) to the gem home's specifications
directory.

