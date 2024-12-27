# Class: Gem::Doctor
**Inherits:** Object
    
**Includes:** Gem::UserInteraction
  

Cleans up after a partially-failed uninstall or for an invalid
Gem::Specification.

If a specification was removed by hand this will remove any remaining files.

If a corrupt specification was installed this will clean up warnings by
removing the bogus specification.



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

## doctor() [](#method-i-doctor)
Cleans up uninstalled files and invalid gem specifications

## doctor_child(sub_directory, extension) [](#method-i-doctor_child)
Removes files in `sub_directory` with `extension`

## doctor_children() [](#method-i-doctor_children)
Cleans up children of this gem repository

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## gem_repository?() [](#method-i-gem_repository?)
Are we doctoring a gem repository?

**@return** [Boolean] 

## initialize(gem_repository, dry_runfalse) [](#method-i-initialize)
Creates a new Gem::Doctor that will clean up `gem_repository`.  Only one gem
repository may be cleaned at a time.

If `dry_run` is true no files or directories will be removed.

**@return** [Doctor] a new instance of Doctor

## installed_specs() [](#method-i-installed_specs)
Specs installed in this gem repository

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## min3(a, b, c) [](#method-i-min3)
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

