# Module: IRB::Notifier
    

An output formatter used internally by the lexer.


# Class Methods
## def_notifier(prefix "", output_method StdioOutputMethod.new) [](#method-c-def_notifier)
Define a new Notifier output source, returning a new CompositeNotifier with
the given `prefix` and `output_method`.

The optional `prefix` will be appended to all objects being inspected during
output, using the given `output_method` as the output source. If no
`output_method` is given, StdioOutputMethod will be used, and all expressions
will be sent directly to STDOUT without any additional formatting.

