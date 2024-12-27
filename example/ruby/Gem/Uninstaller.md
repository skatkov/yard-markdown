# Class: Gem::Uninstaller
**Inherits:** Object
    
**Includes:** Gem::InstallerUninstallerUtils, Gem::UserInteraction
  

An Uninstaller.

The uninstaller fires pre and post uninstall hooks.  Hooks can be added either
through a rubygems_plugin.rb file in an installed gem or via a
rubygems/defaults/#{RUBY_ENGINE}.rb or rubygems/defaults/operating_system.rb
file.  See Gem.pre_uninstall and Gem.post_uninstall for details.


# Attributes
## bin_dir[RW] [](#attribute-i-bin_dir)
The directory a gem's executables will be installed into

## gem_home[RW] [](#attribute-i-gem_home)
The gem repository the gem will be uninstalled from

## spec[RW] [](#attribute-i-spec)
The Gem::Specification for the gem being uninstalled, only set during
#uninstall_gem


#Instance Methods
## abort_on_dependent?() [](#method-i-abort_on_dependent?)
Should the uninstallation abort if a dependency will go unsatisfied?

See ::new.

**@return** [Boolean] 

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

## ask_if_ok(spec) [](#method-i-ask_if_ok)
Asks if it is OK to remove `spec`.  Returns true if it is OK.

## ask_yes_no(question, defaultnil) [](#method-i-ask_yes_no)
Asks a yes or no `question`.  Returns true for yes, false for no.

## choose_from_list(question, list) [](#method-i-choose_from_list)
Asks the user to answer `question` with an answer from the given `list`.

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## dependencies_ok?(spec) [](#method-i-dependencies_ok?)
Returns true if it is OK to remove `spec` or this is a forced uninstallation.

**@return** [Boolean] 

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## formatted_program_filename(filename) [](#method-i-formatted_program_filename)
Returns the formatted version of the executable `filename`

## initialize(gem, options{}) [](#method-i-initialize)
Constructs an uninstaller that will uninstall `gem`

**@return** [Uninstaller] a new instance of Uninstaller

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## path_ok?(gem_dir, spec) [](#method-i-path_ok?)
Is `spec` in `gem_dir`?

**@return** [Boolean] 

## regenerate_plugins() [](#method-i-regenerate_plugins)
Regenerates plugin wrappers after removal.

## regenerate_plugins_for(spec, plugins_dir) [](#method-i-regenerate_plugins_for)

## remove(spec) [](#method-i-remove)
spec
:   the spec of the gem to be uninstalled


**@raise** [Gem::FilePermissionError] 

## remove_all(list) [](#method-i-remove_all)
Removes all gems in `list`.

NOTE: removes uninstalled gems from `list`.

## remove_executables(spec) [](#method-i-remove_executables)
Removes installed executables and batch files (windows only) for `spec`.

## remove_plugins(spec) [](#method-i-remove_plugins)
Remove any plugin wrappers for `spec`.

## remove_plugins_for(spec, plugins_dir) [](#method-i-remove_plugins_for)

## safe_delete(&block) [](#method-i-safe_delete)

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

## uninstall() [](#method-i-uninstall)
Performs the uninstall of the gem.  This removes the spec, the Gem directory,
and the cached .gem file.

## uninstall_gem(stub) [](#method-i-uninstall_gem)
Uninstalls gem `spec`

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

## verbose(msgnil) [](#method-i-verbose)
Calls `say` with `msg` or the results of the block if really_verbose is true.

