# Module: IRB::Command
    

:stopdoc:


# Class Methods
## _register_with_aliases(name , command_class , *aliases ) [](#method-c-_register_with_aliases)
This API is for IRB's internal use only and may change at any time. Please do
NOT use it.
## all_commands_info() [](#method-c-all_commands_info)
## command_names() [](#method-c-command_names)
## command_override_policies() [](#method-c-command_override_policies)
## execute_as_command?(name , public_method: , private_method: ) [](#method-c-execute_as_command?)
**@return** [Boolean] 

## extract_ruby_args(*args , **kwargs ) [](#method-c-extract_ruby_args)
:nodoc:
## load_command(command ) [](#method-c-load_command)
Convert a command name to its implementation class if such command exists
## register(name , command_class ) [](#method-c-register)
Registers a command with the given name. Aliasing is intentionally not
supported at the moment.
# Attributes
## commands[RW] [](#attribute-c-commands)
Returns the value of attribute commands.


