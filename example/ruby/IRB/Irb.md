# Class: IRB::Irb
**Inherits:** Object
    



# Attributes
## context[RW] [](#attribute-i-context)
Returns the current context of this irb session

## from_binding[RW] [](#attribute-i-from_binding)
Returns the value of attribute from_binding.

## scanner[RW] [](#attribute-i-scanner)
The lexer used by this irb session


#Instance Methods
## build_statement(code) [](#method-i-build_statement)

## command?(code) [](#method-i-command?)

**@return** [Boolean] 

## configure_io() [](#method-i-configure_io)

## convert_invalid_byte_sequence(str, enc) [](#method-i-convert_invalid_byte_sequence)

## debug_break() [](#method-i-debug_break)
A hook point for `debug` command's breakpoint after :IRB_EXIT as well as its
clean-up

## debug_readline(binding) [](#method-i-debug_readline)

## each_top_level_statement() [](#method-i-each_top_level_statement)

## encode_with_invalid_byte_sequence(str, enc) [](#method-i-encode_with_invalid_byte_sequence)

## eval_input() [](#method-i-eval_input)
Evaluates input for this session.

## handle_exception(exc) [](#method-i-handle_exception)

## initialize(workspacenil, input_methodnil, from_binding:false) [](#method-i-initialize)
Creates a new irb session

**@return** [Irb] a new instance of Irb

## inspect() [](#method-i-inspect)
Outputs the local variables to this current session, including #signal_status
and #context, using IRB::Locale.

## output_value(omitfalse) [](#method-i-output_value)
:nodoc:

## read_input(prompt) [](#method-i-read_input)

## readmultiline() [](#method-i-readmultiline)

## run(confIRB.conf) [](#method-i-run)

## signal_handle() [](#method-i-signal_handle)
Handler for the signal SIGINT, see Kernel#trap for more information.

## signal_status(status) [](#method-i-signal_status)
Evaluates the given block using the given `status`.

## suspend_input_method(input_method) [](#method-i-suspend_input_method)
Evaluates the given block using the given `input_method` as the Context#io.

Used by the irb commands `source` and `irb_load`, see IRB@IRB+Sessions for
more information.

## suspend_name(pathnil, namenil) [](#method-i-suspend_name)
Evaluates the given block using the given `path` as the Context#irb_path and
`name` as the Context#irb_name.

Used by the irb command `source`, see IRB@IRB+Sessions for more information.

## suspend_workspace(workspace) [](#method-i-suspend_workspace)
Evaluates the given block using the given `workspace` as the
Context#workspace.

Used by the irb command `irb_load`, see IRB@IRB+Sessions for more information.

