# Class: Gem::CommandManager
**Inherits:** Object
    
**Includes:** Gem::Text, Gem::UserInteraction
  

The command manager registers and installs all the individual sub-commands
supported by the gem command.

Extra commands can be provided by writing a rubygems_plugin.rb file in an
installed gem.  You should register your command against the
Gem::CommandManager instance, like this:

    # file rubygems_plugin.rb
    require 'rubygems/command_manager'

    Gem::CommandManager.instance.register_command :edit

You should put the implementation of your command in rubygems/commands.

    # file rubygems/commands/edit_command.rb
    class Gem::Commands::EditCommand < Gem::Command
      # ...
    end

See Gem::Command for instructions on writing gem commands.


# Class Methods
## instance() [](#method-c-instance)
Return the authoritative instance of the command manager.
## reset() [](#method-c-reset)
Reset the authoritative instance of the command manager.

#Instance Methods
## [](command_name) [](#method-i-[])
Returns a Command instance for `command_name`

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

## command_names() [](#method-i-command_names)
Return a sorted list of all command names as strings.

## find_alias_command(cmd_name) [](#method-i-find_alias_command)

## find_command(cmd_name) [](#method-i-find_command)

## find_command_possibilities(cmd_name) [](#method-i-find_command_possibilities)

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## initialize() [](#method-i-initialize)
Register all the subcommands supported by the gem command.

**@return** [CommandManager] a new instance of CommandManager

## instance() [](#method-i-instance)
Returns self. Allows a CommandManager instance to stand in for the class
itself.

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## process_args(args, build_argsnil) [](#method-i-process_args)

## register_command(command, objfalse) [](#method-i-register_command)
Register the Symbol `command` as a gem command.

## run(args, build_argsnil) [](#method-i-run)
Run the command specified by `args`.

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

## unregister_command(command) [](#method-i-unregister_command)
Unregister the Symbol `command` as a gem command.

## use_ui(new_ui, &block) [](#method-i-use_ui)
See DefaultUserInteraction::use_ui

## verbose(msgnil) [](#method-i-verbose)
Calls `say` with `msg` or the results of the block if really_verbose is true.

