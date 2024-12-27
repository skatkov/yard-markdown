# Class: Gem::StreamUI
**Inherits:** Object
  
**Extended by:** Gem::Deprecate
    

Gem::StreamUI implements a simple stream based user interface.


# Class Methods
## deprecate(name , repl , year , month ) [](#method-c-deprecate)
Simple deprecation method that deprecates `name` by wrapping it up in a dummy
method. It warns on each call to the dummy method telling the user of `repl`
(unless `repl` is :none) and the year/month that it is planned to go away.
# Attributes
## errs[RW] [](#attribute-i-errs)
The error stream

## ins[RW] [](#attribute-i-ins)
The input stream

## outs[RW] [](#attribute-i-outs)
The output stream


#Instance Methods
## _gets_noecho() [](#method-i-_gets_noecho)

## alert(statement, questionnil) [](#method-i-alert)
Display an informational alert.  Will ask `question` if it is not nil.

## alert_error(statement, questionnil) [](#method-i-alert_error)
Display an error message in a location expected to get error messages. Will
ask `question` if it is not nil.

## alert_warning(statement, questionnil) [](#method-i-alert_warning)
Display a warning on stderr.  Will ask `question` if it is not nil.

## ask(question) [](#method-i-ask)
Ask a question.  Returns an answer if connected to a tty, nil otherwise.

## ask_for_password(question) [](#method-i-ask_for_password)
Ask for a password. Does not echo response to terminal.

## ask_yes_no(question, defaultnil) [](#method-i-ask_yes_no)
Ask a question.  Returns a true for yes, false for no.  If not connected to a
tty, raises an exception if default is nil, otherwise returns default.

## backtrace(exception) [](#method-i-backtrace)
Prints a formatted backtrace to the errors stream if backtraces are enabled.

## choose_from_list(question, list) [](#method-i-choose_from_list)
Choose from a list of options.  `question` is a prompt displayed above the
list.  `list` is a list of option strings.  Returns the pair [option_name,
option_index].

## close() [](#method-i-close)

## download_reporter(*args) [](#method-i-download_reporter)
Return a download reporter object chosen from the current verbosity

## initialize(in_stream, out_stream, err_stream$stderr, usettytrue) [](#method-i-initialize)
Creates a new StreamUI wrapping `in_stream` for user input, `out_stream` for
standard output, `err_stream` for error output.  If `usetty` is true then
special operations (like asking for passwords) will use the TTY commands to
disable character echo.

**@return** [StreamUI] a new instance of StreamUI

## progress_reporter(*args) [](#method-i-progress_reporter)
Return a progress reporter object chosen from the current verbosity.

## require_io_console() [](#method-i-require_io_console)

## say(statement"") [](#method-i-say)
Display a statement.

## terminate_interaction(status0) [](#method-i-terminate_interaction)
Terminate the application with exit code `status`, running any exit handlers
that might have been defined.

**@raise** [Gem::SystemExitException] 

## tty?() [](#method-i-tty?)
Returns true if TTY methods should be used on this StreamUI.

**@return** [Boolean] 

