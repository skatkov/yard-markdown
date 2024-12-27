# Class: Gem::Command
**Inherits:** Object
    
**Includes:** Gem::UserInteraction
  

Base class for all Gem commands.  When creating a new gem command, define
#initialize, #execute, #arguments, #defaults_str, #description and #usage (as
appropriate).  See the above mentioned methods for details.

A very good example to look at is Gem::Commands::ContentsCommand


# Class Methods
## add_common_option(*args , &handler ) [](#method-c-add_common_option)
## add_specific_extra_args(cmd , args ) [](#method-c-add_specific_extra_args)
Add a list of extra arguments for the given command.  `args` may be an array
or a string to be split on white space.
## build_args() [](#method-c-build_args)
Arguments used when building gems
## build_args=(value ) [](#method-c-build_args=)
## common_options() [](#method-c-common_options)
## extra_args() [](#method-c-extra_args)
## extra_args=(value ) [](#method-c-extra_args=)
## specific_extra_args(cmd ) [](#method-c-specific_extra_args)
Return an array of extra arguments for the command.  The extra arguments come
from the gem configuration file read at program startup.
## specific_extra_args_hash() [](#method-c-specific_extra_args_hash)
Accessor for the specific extra args hash (self initializing).
## specific_extra_args_hash=(value ) [](#method-c-specific_extra_args_hash=)
Allows resetting the hash of specific args per command.
# Attributes
## command[RW] [](#attribute-i-command)
The name of the command.

## defaults[RW] [](#attribute-i-defaults)
The default options for the command.

## options[RW] [](#attribute-i-options)
The options for the command.

## program_name[RW] [](#attribute-i-program_name)
The name of the command for command-line invocation.

## summary[RW] [](#attribute-i-summary)
A short description of the command.


#Instance Methods
## add_extra_args(args) [](#method-i-add_extra_args)
Adds extra args from ~/.gemrc

## add_option(*opts, &handler) [](#method-i-add_option)
Add a command-line option and handler to the command.

See Gem::OptionParser#make_switch for an explanation of `opts`.

`handler` will be called with two values, the value of the argument and the
options hash.

If the first argument of add_option is a Symbol, it's used to group options in
output.  See `gem help list` for an example.

## alert(statement, questionnil) [](#method-i-alert)
Displays an alert `statement`.  Asks a `question` if given.

## alert_error(statement, questionnil) [](#method-i-alert_error)
Displays an error `statement` to the error output location.  Asks a `question`
if given.

## alert_warning(statement, questionnil) [](#method-i-alert_warning)
Displays a warning `statement` to the warning output location.  Asks a
`question` if given.

## arguments() [](#method-i-arguments)
Override to provide details of the arguments a command takes.  It should
return a left-justified string, one argument per line.

For example:

    def usage
      "#{program_name} FILE [FILE ...]"
    end

    def arguments
      "FILE          name of file to find"
    end

## ask(question) [](#method-i-ask)
Asks a `question` and returns the answer.

## ask_for_password(prompt) [](#method-i-ask_for_password)
Asks for a password with a `prompt`

## ask_yes_no(question, defaultnil) [](#method-i-ask_yes_no)
Asks a yes or no `question`.  Returns true for yes, false for no.

## begins?(long, short) [](#method-i-begins?)
True if `long` begins with the characters from `short`.

**@return** [Boolean] 

## check_deprecated_options(options) [](#method-i-check_deprecated_options)

## choose_from_list(question, list) [](#method-i-choose_from_list)
Asks the user to answer `question` with an answer from the given `list`.

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## defaults_str() [](#method-i-defaults_str)
Override to display the default values of the command options. (similar to
`arguments`, but displays the default values).

For example:

    def defaults_str
      --no-gems-first --no-all
    end

## deprecate_option(name, version:nil, extra_msg:nil) [](#method-i-deprecate_option)
Mark a command-line option as deprecated, and optionally specify a deprecation
horizon.

Note that with the current implementation, every version of the option needs
to be explicitly deprecated, so to deprecate an option defined as

    add_option('-t', '--[no-]test', 'Set test mode') do |value, options|
      # ... stuff ...
    end

you would need to explicitly add a call to `deprecate_option` for every
version of the option you want to deprecate, like

    deprecate_option('-t')
    deprecate_option('--test')
    deprecate_option('--no-test')

## deprecated?() [](#method-i-deprecated?)

**@return** [Boolean] 

## description() [](#method-i-description)
Override to display a longer description of what this command does.

## execute() [](#method-i-execute)
Override to provide command handling.

#options will be filled in with your parsed options, unparsed options will be
left in `options[:args]`.

See also: #get_all_gem_names, #get_one_gem_name, #get_one_optional_argument

**@raise** [Gem::Exception] 

## extract_gem_name_and_version(name) [](#method-i-extract_gem_name_and_version)
:nodoc:

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## get_all_gem_names() [](#method-i-get_all_gem_names)
Get all gem names from the command line.

## get_all_gem_names_and_versions() [](#method-i-get_all_gem_names_and_versions)
Get all [gem, version] from the command line.

An argument in the form gem:ver is pull apart into the gen name and version,
respectively.

## get_one_gem_name() [](#method-i-get_one_gem_name)
Get a single gem name from the command line.  Fail if there is no gem name or
if there is more than one gem name given.

## get_one_optional_argument() [](#method-i-get_one_optional_argument)
Get a single optional argument from the command line.  If more than one
argument is given, return only the first. Return nil if none are given.

## handle_options(args) [](#method-i-handle_options)
Handle the given list of arguments by parsing them and recording the results.

## handles?(args) [](#method-i-handles?)
True if the command handles the given argument list.

**@return** [Boolean] 

## initialize(command, summarynil, defaults{}) [](#method-i-initialize)
Initializes a generic gem command named `command`.  `summary` is a short
description displayed in `gem help commands`.  `defaults` are the default
options.  Defaults should be mirrored in #defaults_str, unless there are none.

When defining a new command subclass, use add_option to add command-line
switches.

Unhandled arguments (gem names, files, etc.) are left in `options[:args]`.

**@return** [Command] a new instance of Command

## invoke(*args) [](#method-i-invoke)
Invoke the command with the given list of arguments.

## invoke_with_build_args(args, build_args) [](#method-i-invoke_with_build_args)
Invoke the command with the given list of normal arguments and additional
build arguments.

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## merge_options(new_options) [](#method-i-merge_options)
Merge a set of command options with the set of default options (without
modifying the default option hash).

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## parser() [](#method-i-parser)
Create on demand parser.

## remove_option(name) [](#method-i-remove_option)
Remove previously defined command-line argument `name`.

## say(statement"") [](#method-i-say)
Displays the given `statement` on the standard output (or equivalent).

## show_help() [](#method-i-show_help)
Display the help message for the command.

## show_lookup_failure(gem_name, version, errors, suppress_suggestionsfalse, required_bynil) [](#method-i-show_lookup_failure)
Display to the user that a gem couldn't be found and reasons why --

## terminate_interaction(exit_code0) [](#method-i-terminate_interaction)
Terminates the RubyGems process with the given `exit_code`

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## ui() [](#method-i-ui)
See DefaultUserInteraction::ui

## ui=(new_ui) [](#method-i-ui=)
See DefaultUserInteraction::ui=

## usage() [](#method-i-usage)
Override to display the usage for an individual gem command.

The text "[options]" is automatically appended to the usage text.

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

## verbose(msgnil) [](#method-i-verbose)
Calls `say` with `msg` or the results of the block if really_verbose is true.

## when_invoked(&block) [](#method-i-when_invoked)
Call the given block when invoked.

Normal command invocations just executes the `execute` method of the command. 
Specifying an invocation block allows the test methods to override the normal
action of a command to determine that it has been invoked correctly.

