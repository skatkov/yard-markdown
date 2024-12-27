# Class: IRB::WorkSpace
**Inherits:** Object
    



# Attributes
## binding[RW] [](#attribute-i-binding)
The Binding of this workspace

## main[RW] [](#attribute-i-main)
The top-level workspace of this context, also available as
`IRB.conf[:__MAIN__]`


#Instance Methods
## __evaluate__() [](#method-i-__evaluate__)
Evaluate the given `statements` within the  context of this workspace.

## code_around_binding() [](#method-i-code_around_binding)

## evaluate(statements, file__FILE__, line__LINE__) [](#method-i-evaluate)
Evaluate the context of this workspace and use the Tracer library to output
the exact lines of code are being executed in chronological order.

See https://github.com/ruby/tracer for more information.

## filter_backtrace(bt) [](#method-i-filter_backtrace)
error message manipulator WARN: Rails patches this method to filter its own
backtrace. Be cautious when changing it. See:
https://github.com/rails/rails/blob/main/railties/lib/rails/commands/console/c
onsole_command.rb#L8:~:text=def,filter_backtrace

## initialize(*main) [](#method-i-initialize)
Creates a new workspace.

set self to main if specified, otherwise inherit main from TOPLEVEL_BINDING.

**@return** [WorkSpace] a new instance of WorkSpace

## load_helper_methods_to_main() [](#method-i-load_helper_methods_to_main)

## local_variable_get(name) [](#method-i-local_variable_get)

## local_variable_set(name, value) [](#method-i-local_variable_set)

