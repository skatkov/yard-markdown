# Class: Gem::DependencyInstaller
**Inherits:** Object
  
**Extended by:** Gem::Deprecate
    
**Includes:** Gem::UserInteraction
  

Installs a gem along with all its dependencies from local and remote gems.


# Class Methods
## deprecate(name , repl , year , month ) [](#method-c-deprecate)
Simple deprecation method that deprecates `name` by wrapping it up in a dummy
method. It warns on each call to the dummy method telling the user of `repl`
(unless `repl` is :none) and the year/month that it is planned to go away.
# Attributes
## document[RW] [](#attribute-i-document)
Documentation types.  For use by the Gem.done_installing hook

## errors[RW] [](#attribute-i-errors)
Errors from SpecFetcher while searching for remote specifications

## installed_gems[RW] [](#attribute-i-installed_gems)
List of gems installed by #install in alphabetic order


#Instance Methods
## alert(statement, questionnil) [](#method-i-alert)
Displays an alert `statement`.  Asks a `question` if given.

## alert_error(statement, questionnil) [](#method-i-alert_error)
Displays an error `statement` to the error output location.  Asks a `question`
if given.

## alert_warning(statement, questionnil) [](#method-i-alert_warning)
Displays a warning `statement` to the warning output location.  Asks a
`question` if given.

## ask(question) [](#method-i-ask)
Asks a `question` and returns the answer.

## ask_for_password(prompt) [](#method-i-ask_for_password)
Asks for a password with a `prompt`

## ask_yes_no(question, defaultnil) [](#method-i-ask_yes_no)
Asks a yes or no `question`.  Returns true for yes, false for no.

## choose_from_list(question, list) [](#method-i-choose_from_list)
Asks the user to answer `question` with an answer from the given `list`.

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## consider_local?() [](#method-i-consider_local?)
Indicated, based on the requested domain, if local gems should be considered.

**@return** [Boolean] 

## consider_remote?() [](#method-i-consider_remote?)
Indicated, based on the requested domain, if remote gems should be considered.

**@return** [Boolean] 

## find_gems_with_sources(dep, best_onlyfalse) [](#method-i-find_gems_with_sources)
Returns a list of pairs of gemspecs and source_uris that match Gem::Dependency
`dep` from both local (Dir.pwd) and remote (Gem.sources) sources.  Gems are
sorted with newer gems preferred over older gems, and local gems preferred
over remote gems.

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## in_background(what) [](#method-i-in_background)
:nodoc:

## initialize(options{}) [](#method-i-initialize)
Creates a new installer instance.

Options are:
:cache_dir
:   Alternate repository path to store .gem files in.

:domain
:   :local, :remote, or :both.  :local only searches gems in the current
    directory.  :remote searches only gems in Gem::sources. :both searches
    both.

:env_shebang
:   See Gem::Installer::new.

:force
:   See Gem::Installer#install.

:format_executable
:   See Gem::Installer#initialize.

:ignore_dependencies
:   Don't install any dependencies.

:install_dir
:   See Gem::Installer#install.

:prerelease
:   Allow prerelease versions.  See #install.

:security_policy
:   See Gem::Installer::new and Gem::Security.

:user_install
:   See Gem::Installer.new

:wrappers
:   See Gem::Installer::new

:build_args
:   See Gem::Installer::new


**@return** [DependencyInstaller] a new instance of DependencyInstaller

## install(dep_or_name, versionGem::Requirement.default) [](#method-i-install)
Installs the gem `dep_or_name` and all its dependencies.  Returns an Array of
installed gem specifications.

If the `:prerelease` option is set and there is a prerelease for `dep_or_name`
the prerelease version will be installed.

Unless explicitly specified as a prerelease dependency, prerelease gems that
`dep_or_name` depend on will not be installed.

If c-1.a depends on b-1 and a-1.a and there is a gem b-1.a available then
c-1.a, b-1 and a-1.a will be installed.  b-1.a will need to be installed
separately.

## install_development_deps() [](#method-i-install_development_deps)
:nodoc:

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## resolve_dependencies(dep_or_name, version) [](#method-i-resolve_dependencies)
:nodoc:

## say(statement"") [](#method-i-say)
Displays the given `statement` on the standard output (or equivalent).

## terminate_interaction(exit_code0) [](#method-i-terminate_interaction)
Terminates the RubyGems process with the given `exit_code`

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## ui() [](#method-i-ui)
See DefaultUserInteraction::ui

## ui=(new_ui) [](#method-i-ui=)
See DefaultUserInteraction::ui=

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

## verbose(msgnil) [](#method-i-verbose)
Calls `say` with `msg` or the results of the block if really_verbose is true.

