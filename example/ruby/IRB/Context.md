# Class: IRB::Context
**Inherits:** Object
    

:nodoc:


# Attributes
## ap_name[RW] [](#attribute-i-ap_name)
A copy of the default `IRB.conf[:AP_NAME]`

## auto_indent_mode[RW] [](#attribute-i-auto_indent_mode)
Can be either the default `IRB.conf[:AUTO_INDENT]`, or the mode set by
#prompt_mode=

To disable auto-indentation in irb:

    IRB.conf[:AUTO_INDENT] = false

or

    irb_context.auto_indent_mode = false

or

    IRB.CurrentContext.auto_indent_mode = false

See IRB@Configuration for more information.

## back_trace_limit[RW] [](#attribute-i-back_trace_limit)
The limit of backtrace lines displayed as top `n` and tail `n`.

The default value is 16.

Can also be set using the `--back-trace-limit` command line option.

## command_aliases[RW] [](#attribute-i-command_aliases)
User-defined IRB command aliases

## echo[RW] [](#attribute-i-echo)
Whether to echo the return value to output or not.

Uses `IRB.conf[:ECHO]` if available, or defaults to `true`.

    puts "hello"
    # hello
    #=> nil
    IRB.CurrentContext.echo = false
    puts "omg"
    # omg

## echo_on_assignment[RW] [](#attribute-i-echo_on_assignment)
Whether to echo for assignment expressions.

If set to `false`, the value of assignment will not be shown.

If set to `true`, the value of assignment will be shown.

If set to `:truncate`, the value of assignment will be shown and truncated.

It defaults to `:truncate`.

    a = "omg"
    #=> omg

    a = "omg" * 10
    #=> omgomgomgomgomgomgomg...

    IRB.CurrentContext.echo_on_assignment = false
    a = "omg"

    IRB.CurrentContext.echo_on_assignment = true
    a = "omg" * 10
    #=> omgomgomgomgomgomgomgomgomgomg

To set the behaviour of showing on assignment in irb:

    IRB.conf[:ECHO_ON_ASSIGNMENT] = :truncate or true or false

or

    irb_context.echo_on_assignment = :truncate or true or false

or

    IRB.CurrentContext.echo_on_assignment = :truncate or true or false

## eval_history[RW] [](#attribute-i-eval_history)
The command result history limit. This method is not available until
#eval_history= was called with non-nil value (directly or via setting
`IRB.conf[:EVAL_HISTORY]` in `.irbrc`).

## extra_doc_dirs[RW] [](#attribute-i-extra_doc_dirs)
Specify the installation locations of the ri file to be displayed in the
document dialog.

## ignore_eof[RW] [](#attribute-i-ignore_eof)
Whether `^D` (`control-d`) will be ignored or not.

If set to `false`, `^D` will quit irb.

## ignore_sigint[RW] [](#attribute-i-ignore_sigint)
Whether `^C` (`control-c`) will be ignored or not.

If set to `false`, `^C` will quit irb.

If set to `true`,

*   during input:   cancel input then return to top level.
*   during execute: abandon current execution.

## inspect_mode[RW] [](#attribute-i-inspect_mode)
A copy of the default `IRB.conf[:INSPECT_MODE]`

## io[RW] [](#attribute-i-io)
The current input method.

Can be either StdioInputMethod, ReadlineInputMethod, RelineInputMethod,
FileInputMethod or other specified when the context is created. See ::new for
more # information on `input_method`.

## irb[RW] [](#attribute-i-irb)
Current irb session.

## irb_name[RW] [](#attribute-i-irb_name)
Can be either name from `IRB.conf[:IRB_NAME]`, or the number of the current
job set by JobManager, such as `irb#2`

## irb_path[RW] [](#attribute-i-irb_path)
Can be one of the following:
*   the #irb_name surrounded by parenthesis
*   the `input_method` passed to Context.new
*   the file path of the current IRB context in a binding.irb session

## last_value[RW] [](#attribute-i-last_value)
The return value of the last statement evaluated.

## load_modules[RW] [](#attribute-i-load_modules)
A copy of the default `IRB.conf[:LOAD_MODULES]`

## newline_before_multiline_output[RW] [](#attribute-i-newline_before_multiline_output)
Whether a newline is put before multiline output.

Uses `IRB.conf[:NEWLINE_BEFORE_MULTILINE_OUTPUT]` if available, or defaults to
`true`.

    "abc\ndef"
    #=>
    abc
    def
    IRB.CurrentContext.newline_before_multiline_output = false
    "abc\ndef"
    #=> abc
    def

## prompt_c[RW] [](#attribute-i-prompt_c)
IRB prompt for continuated statement. (e.g. immediately after an `if`)

See [Custom Prompts](rdoc-ref:IRB@Custom+Prompts) for more information.

## prompt_i[RW] [](#attribute-i-prompt_i)
Standard IRB prompt.

See [Custom Prompts](rdoc-ref:IRB@Custom+Prompts) for more information.

## prompt_mode[RW] [](#attribute-i-prompt_mode)
A copy of the default `IRB.conf[:PROMPT_MODE]`

## prompt_s[RW] [](#attribute-i-prompt_s)
IRB prompt for continuated strings.

See [Custom Prompts](rdoc-ref:IRB@Custom+Prompts) for more information.

## rc[RW] [](#attribute-i-rc)
A copy of the default `IRB.conf[:RC]`

## return_format[RW] [](#attribute-i-return_format)
The format of the return statement, set by #prompt_mode= using the `:RETURN`
of the `mode` passed to set the current #prompt_mode.

## thread[RW] [](#attribute-i-thread)
The current thread in this context.

## use_autocomplete[RW] [](#attribute-i-use_autocomplete)
Whether colorization is enabled or not.

A copy of the default `IRB.conf[:USE_AUTOCOMPLETE]`

## use_multiline[RW] [](#attribute-i-use_multiline)
Whether multiline editor mode is enabled or not.

A copy of the default `IRB.conf[:USE_MULTILINE]`

## use_singleline[RW] [](#attribute-i-use_singleline)
Whether singleline editor mode is enabled or not.

A copy of the default `IRB.conf[:USE_SINGLELINE]`

## verbose[RW] [](#attribute-i-verbose)
Whether verbose messages are displayed or not.

A copy of the default `IRB.conf[:VERBOSE]`

## with_debugger[RW] [](#attribute-i-with_debugger)
Returns the value of attribute with_debugger.

## workspace_home[RW] [](#attribute-i-workspace_home)
The toplevel workspace, see #home_workspace


#Instance Methods
## __inspect__() [](#method-i-__inspect__)

## _set_last_value() [](#method-i-_set_last_value)
Sets the return value from the last statement evaluated in this context to
#last_value. See #set_last_value

## change_workspace(*_main) [](#method-i-change_workspace)
Changes the current workspace to given object or binding.

If the optional argument is omitted, the workspace will be #home_workspace
which is inherited from `TOPLEVEL_BINDING` or the main object,
`IRB.conf[:MAIN_CONTEXT]` when irb was initialized.

See IRB::WorkSpace.new for more information.

## colorize_input(input, complete:) [](#method-i-colorize_input)

## evaluate(statement, line_no) [](#method-i-evaluate)
:nodoc:

## evaluate_expression(code, line_no) [](#method-i-evaluate_expression)
:nodoc:

## file_input?() [](#method-i-file_input?)
Whether #io uses a File for the `input_method` passed when creating the
current context, see ::new

**@return** [Boolean] 

## from_binding?() [](#method-i-from_binding?)

**@return** [Boolean] 

## history_file() [](#method-i-history_file)
A copy of the default `IRB.conf[:HISTORY_FILE]`

## history_file=(hist) [](#method-i-history_file=)
Set `IRB.conf[:HISTORY_FILE]` to the given `hist`.

## home_workspace() [](#method-i-home_workspace)
Inherited from `TOPLEVEL_BINDING`.

## initialize(irb, workspacenil, input_methodnil) [](#method-i-initialize)
Creates a new IRB context.

The optional `input_method` argument:

`nil`
:   uses stdin or Reline or Readline

`String`
:   uses a File

`other`
:   uses this as InputMethod


**@return** [Context] a new instance of Context

## inspect() [](#method-i-inspect)
:nodoc:

## inspect?() [](#method-i-inspect?)
Whether #inspect_mode is set or not, see #inspect_mode= for more detail.

**@return** [Boolean] 

## inspect_last_value() [](#method-i-inspect_last_value)
:nodoc:

## local_variables() [](#method-i-local_variables)
:nodoc:

## main() [](#method-i-main)
The top-level workspace, see WorkSpace#main

## parse_command(code) [](#method-i-parse_command)

## pop_workspace() [](#method-i-pop_workspace)
Removes the last element from the current #workspaces stack and returns it, or
`nil` if the current workspace stack is empty.

Also, see #push_workspace.

## prompt_n() [](#method-i-prompt_n)
TODO: Remove this when developing v2.0

## prompt_n=(_) [](#method-i-prompt_n=)
TODO: Remove this when developing v2.0

## prompting?() [](#method-i-prompting?)
Whether #verbose? is `true`, and `input_method` is either StdioInputMethod or
RelineInputMethod or ReadlineInputMethod, see #io for more information.

**@return** [Boolean] 

## push_workspace(*_main) [](#method-i-push_workspace)
Creates a new workspace with the given object or binding, and appends it onto
the current #workspaces stack.

See IRB::Context#change_workspace and IRB::WorkSpace.new for more information.

## replace_workspace(workspace) [](#method-i-replace_workspace)
Replace the current workspace with the given `workspace`.

## safe_method_call_on_main(method_name) [](#method-i-safe_method_call_on_main)

## save_history() [](#method-i-save_history)

## save_history=(val) [](#method-i-save_history=)

## set_last_value(value) [](#method-i-set_last_value)
Sets the return value from the last statement evaluated in this context to
#last_value.

## use_loader() [](#method-i-use_loader)
Returns whether `irb`'s own file reader method is used by `load`/`require` or
not.

This mode is globally affected (irb-wide).

## use_loader=(opt) [](#method-i-use_loader=)
Sets `IRB.conf[:USE_LOADER]`

See #use_loader for more information.

## use_tracer=(val) [](#method-i-use_tracer=)

## verbose?() [](#method-i-verbose?)
Returns whether messages are displayed or not.

**@return** [Boolean] 

## workspace() [](#method-i-workspace)
Workspace in the current context.

