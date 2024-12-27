# Class: Gem::Ext::Builder
**Inherits:** Object
    
**Includes:** Gem::UserInteraction
  



# Class Methods
## class_name() [](#method-c-class_name)
## make(dest_path , results , make_dir Dir.pwd, sitedir nil, targets ["clean", "", "install"], target_rbconfig: Gem.target_rbconfig) [](#method-c-make)
## ruby() [](#method-c-ruby)
## run(command , results , command_name nil, dir Dir.pwd, env {}) [](#method-c-run)
**@yield** [status, results] 

# Attributes
## build_args[RW] [](#attribute-i-build_args)
:nodoc:


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

## build_error(output, backtracenil) [](#method-i-build_error)
Logs the build `output`, then raises Gem::Ext::BuildError.

**@raise** [Gem::Ext::BuildError] 

## build_extension(extension, dest_path) [](#method-i-build_extension)
:nodoc:

## build_extensions() [](#method-i-build_extensions)
Builds extensions.  Valid types of extensions are extconf.rb files, configure
scripts and rakefiles or mkrf_conf files.

## builder_for(extension) [](#method-i-builder_for)
Chooses the extension builder class for `extension`

## choose_from_list(question, list) [](#method-i-choose_from_list)
Asks the user to answer `question` with an answer from the given `list`.

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## initialize(spec, build_argsspec.build_args, target_rbconfigGem.target_rbconfig) [](#method-i-initialize)
Creates a new extension builder for `spec`.  If the `spec` does not yet have
build arguments, saved, set `build_args` which is an ARGV-style array.

**@return** [Builder] a new instance of Builder

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

## write_gem_make_out(output) [](#method-i-write_gem_make_out)
Writes `output` to gem_make.out in the extension install directory.

